import re
import os


#// 2 + 6 + 10 + 3

#// |x|x|x|x|x|x|x|x|  |x|x|x|x|x|x|x|x|   |x|x|x|x|x|x|x|x|   |x|x|x|x|x|x|x|x|
#// |0|1|2|3|4|5|6|7   |0|1|2|3|4|5|6 7     0 1 2 3|4 5|6 7     0 1 2 3 4 5 6 7

device_zig_header = """
const mmio = @import("microzig").mmio;

fn Peripheral(comptime addr: u32, comptime PType: type) *volatile PType {
    return @as(*volatile PType, @ptrFromInt(addr));
}\n\n"""

def stdzigfmtId(id):
    if ' ' in id:
        return f'@"{id}"'
    return id

def pathjoin(a,b):
    return f'{a}/{b}'

class RegField:
    def __init__(self, fullname, name, pos, bitsize, register, default=None):
        self.fullname = fullname
        self.name = name
        self.pos = pos
        self.bitsize = bitsize
        self.register = register
        self.default = default

    def to_zig(self, previousField, file):

        end = 0 if previousField is None else previousField.pos + previousField.bitsize
        padding = self.pos - end
        
        if padding > 0:
            print(f'reserved{end}: u{padding},', file=file)    

        # print(f'// {self.pos}', file=file)
        print(f'{stdzigfmtId(self.name)}: u{self.bitsize}', file=file)
        if self.default is not None:
            print(f' = {self.default},', file=file)
        else:
            print(',', file=file)


class Register:
    def __init__(self, name, offset, size):
        self.name = name
        self.offset = offset
        self.fields = []
        self.backingsize = size

    def to_zig(self, previousReg, file):
        end = 0 if previousReg is None else previousReg.offset + int(previousReg.backingsize/8)
        padding = int((self.offset - end)/4)

        if padding > 0:
            print(f'padding{end}: [{padding}]u32,', file=file)    

        print(f'// {hex(self.offset)}', file=file)
        print(f'{stdzigfmtId(self.name)}: mmio.Mmio(packed struct(u{self.backingsize}) {{', file=file)

        last = None
        for field in self.fields:
            field.to_zig(last, file)
            last = field

        end = 0 if last is None else last.pos + last.bitsize
        padding = self.backingsize - end
        
        if padding > 0:
            print(f'reserved{end}: u{padding},', file=file)    

        print('}),\n', file=file)

# peripherial
class Peripheral:
    def __init__(self, name, address):
        self.name = name
        self.registers = []
    
    def to_zig_file(self, file):
        print('const mmio = @import("microzig").mmio;\n\n', file=file)
        self.to_zig(file)

    def to_zig_imported(self, file):
        print(f'pub const {stdzigfmtId(self.name)} = @import("peripherals/{self.name}.zig").Type;', file=file)

    def to_zig(self, file):
        print(f'pub const Type =  extern struct {{', file=file)

        previousReg = None
        for item in self.registers:
            item.to_zig(previousReg, file)
            previousReg = item

        print('};\n', file=file)

class PeripheralInstance:
    def __init__(self,name, address, type):
        self.name = name
        self.address = address
        self.type = type

    def to_zig(self, file):
        print(f'pub const {stdzigfmtId(self.name)} = Peripheral({hex(self.address)}, {self.type});', file=file)

class Device:
    def __init__(self, name):
        self.name = name
        self.peripherals = []
        self.peripheral_types = {}
        self.memorymap = {}
        self.peripheral_arrays = {}

    def to_zig(self, file):
        print( device_zig_header, file=file)

        print("pub const memorymap = struct {", file=file)

        for inst in sorted(self.peripherals,key=lambda field: field.address):
            inst.to_zig(file)
            
        for perpharrykey in self.peripheral_arrays:
            perpharry = self.peripheral_arrays[perpharrykey]

            if 0 not in perpharry:
                continue

            print(f'pub const {stdzigfmtId(perpharrykey)} = &[_]{perpharry[0].type}{{',file=file)
            
            for index in sorted(perpharry.keys()):
                inst = perpharry[index]
                print(f"{inst.name}, ", file=file)

            print("};", file=file)    
                


        print("};", file=file)

        print("pub const types = struct {", file=file)
        print("pub const peripherals = struct {", file=file)

        print("pub const NotFound = u32;", file=file)

        for n, periph in self.peripheral_types.items():
            periph.to_zig_imported(file)
        
        
        print("};", file=file) # peripherals
        print("};", file=file) # types

class RegisterOffset:
    def __init__(self, fullname, name, offset):
        self.fullname = fullname
        self.name = name
        self.offset = offset


def cleanFieldName(periphName, fieldName):
    return fieldName.lower().removeprefix(periphName.lower()+'_')

class HeaderParserSOC:
    def __init__(self, filename, regsize=32):
        self.filename = filename
        self.regsize = regsize

        with open(filename, 'r') as inputfile:
            self.lines = inputfile.readlines()

        self.state = 'init'

        self.peripherals_re = [
            re.compile("#define __(.*?)_REG_H__")
            ]
        
        self.register_header_re = re.compile("\/\* (0x[\da-fA-F]+) : (.*?) \*\/")
        self.register_declaration_re = re.compile("#define (.*?)_OFFSET\s*\((.*?)\)")

        self.register_field_bitstart_re = re.compile("#define (.*?)_POS\s*\((\d+)[uU]*\)")
        self.register_field_bitsize_re = re.compile("#define (.*?)_LEN\s*\((\d+)[uU]*\)")

        self.peripheral = None
        self.register = None
        self.register_field_names = {}

    def process(self):
        for line in self.lines:
            self.processLine(line)

        if self.state == 'registers' and self.register is not None:
            self.register.fields = sorted(self.register_field_names.values(),key=lambda field: field.pos)
            self.peripheral.registers.append(self.register)

        return self.peripheral

    def processLine(self, line):        
        if self.state == 'init':

            for regex in self.peripherals_re:
                match = regex.match(line)
                if match is None:
                    continue

                groups = match.groups()
                self.peripheral = Peripheral(groups[0], 0)
                self.state = 'registers'
                return

        elif self.state == 'registers':
            m = self.register_header_re.match(line)
            if m is not None:
                g = m.groups()
                name = cleanFieldName(self.peripheral.name, g[1])
                offset = int(g[0], 16)

                if self.register is not None:
                    self.register.fields = sorted(self.register_field_names.values(),key=lambda field: field.pos)
                    self.peripheral.registers.append(self.register)
                
                self.register = Register(name, offset, self.regsize)
                self.register_field_names = {}
                return

            # _POS
            m = self.register_field_bitstart_re.match(line)
            if m is not None:
                g = m.groups()
                name =  cleanFieldName(self.peripheral.name, g[0])
                offset = int(g[1])
                if name not in self.register_field_names:
                    field = RegField(name, name, offset, None, self.register )
                    self.register_field_names[name] = field
                else:
                    self.register_field_names[name].pos = offset
                return

            # _LEN
            m = self.register_field_bitsize_re.match(line)
            if m is not None:
                g = m.groups()
                name =  cleanFieldName(self.peripheral.name, g[0])
                bitsize = int(g[1])

                if name not in self.register_field_names:
                    field = RegField(name, name, None, bitsize, self.register )
                    self.register_field_names[name] = field
                else:
                    self.register_field_names[name].bitsize = bitsize
                return


class HeaderParserLHAL:
    def __init__(self, filename, regsize=32):
        self.filename = filename
        self.regsize = regsize

        with open(filename, 'r') as inputfile:
            self.lines = inputfile.readlines()

        self.state = 'init'

        self.peripherals_re = [
            re.compile("#define __HARDWARE_(.*?)(_REG_H__|_H__)"), 
            re.compile("#define __(.*?)_REG_H__")
            ]
        
        self.register_offsets_marker_re = re.compile("\/\* Register offsets \*\*")
        self.register_declaration_re = re.compile("#define (.*?)_OFFSET\s*\((.*?)\)\s*\/\* (.*?) \*\/")
        self.register_declaration_nc_re = re.compile("#define (.*?)_OFFSET\s*\((.*?)\)(.*?)")
        self.registers_marker_re = re.compile("\/\* Register Bitfield definitions \*\*")
        self.register_header_re = re.compile("^\/\* (0x[\da-fA-F]+) : (.*?) \*\/")

        self.register_field_1bit_re = re.compile("#define (.*?) \(1\s*<<\s*(\d+)[uU]\)")
        self.register_field_bitstart_re = re.compile("#define (.*?)_SHIFT\s*\((\d+)[uU]*\)")
        self.register_field_bitsize_re = re.compile("#define (.*?)_(?:MASK|MSK)\s*\((0x[\da-fA-F]+)|(\d+)\s*<<\s*(.*?)")

        self.register_field_names = {}
        self.register_offsets = {}
        self.register_offsets_to_names = {}
        self.peripheral = None
        self.register = None

    def process(self):
        for line in self.lines:
            self.processLine(line)

        if self.state == 'registers' and self.register is not None:
            self.register.fields = sorted(self.register_field_names.values(),key=lambda field: field.pos)
            self.peripheral.registers.append(self.register)

        return self.peripheral

    def processLine(self, line):
        if self.state == 'init':

            for regex in self.peripherals_re:
                match = regex.match(line)
                if match is None:
                    continue

                groups = match.groups()
                self.peripheral = Peripheral(groups[0], 0)
                self.state = 'offsets_marker'
                return
            
        elif self.state == 'offsets_marker':
            if self.register_offsets_marker_re.match(line) is None:
                return

            self.state = 'offsets'
            self.register_offsets = {}
            self.register_offsets_to_names = {}
        
        elif self.state == 'offsets':
            if self.registers_marker_re.match(line) is not None:
                self.state = 'registers'
                return
            
            if self.register_header_re.match(line) is not None:
                self.state = 'registers'
                self.processLine(line)
                return


            m = self.register_declaration_re.match(line)
            if m is None:
                m = self.register_declaration_nc_re.match(line)
                if m is None:
                    return

            g = m.groups()
            fullname = cleanFieldName(self.peripheral.name, g[0])
            offset = int(g[1],16)

            name = g[2] if len(g) > 2 else None

            if name is None or len(name) < 1 or ' ' in name:
                name = fullname

            if name in self.register_offsets:
                print(f"Error: duplicate register offset macro for: {self.peripheral.name}.{name}")
                return

            self.register_offsets[name] = RegisterOffset(fullname, name, offset)
            self.register_offsets_to_names[offset] = name


        elif self.state == 'registers':
            m = self.register_header_re.match(line)
            if m is not None:
                g = m.groups()
                name = g[1]
                offset = int(g[0], 16)

                if offset in self.register_offsets_to_names:
                    name = self.register_offsets_to_names[offset]

                if self.register is not None:
                    self.register.fields = sorted(self.register_field_names.values(),key=lambda field: field.pos)
                    self.peripheral.registers.append(self.register)

                self.register = Register(name, offset, self.regsize)

                if name not in self.register_offsets:
                    print(f"Error: no register offset definined for register: {self.peripheral.name}.{name}")
                else:
                    regoffset = self.register_offsets[name]
                    if regoffset.offset != self.register.offset:
                        print(f"Error:  {self.peripheral.name}.{name} offset: {offset} does not match _OFFSET macro value: {regoffset.offset}")

                self.register_field_names = {}
                return

            # shift
            m = self.register_field_bitstart_re.match(line)
            if m is not None:
                g = m.groups()
                name =cleanFieldName(self.peripheral.name, g[0])
                offset = int(g[1])
                if name not in self.register_field_names:
                    field = RegField(name, name, offset, None, self.register )
                    self.register_field_names[name] = field
                else:
                    self.register_field_names[name].pos = offset
                return

            # mask
            m = self.register_field_bitsize_re.match(line)
            if m is not None:
                g = m.groups()
                name = cleanFieldName(self.peripheral.name, g[0])
                offset = int(g[1],16)

                bitsize = bin(offset).count("1")

                if name not in self.register_field_names:
                    field = RegField(name, name, None, bitsize, self.register )
                    self.register_field_names[name] = field
                else:
                    self.register_field_names[name].bitsize = bitsize
                return

            m = self.register_field_1bit_re.match(line)
            if m is not None:
                g = m.groups()
                name = cleanFieldName(self.peripheral.name, g[0])
                offset = int(g[1])
                if name not in self.register_field_names:
                    field = RegField(name, name, offset, 1, self.register )
                    self.register_field_names[name] = field
                else:
                    self.register_field_names[name].pos = offset
                return
 

class HeaderParserBASE:
    def __init__(self, filename, regsize=32):
        self.filename = filename
        self.regsize = regsize

        with open(filename, 'r') as inputfile:
            self.lines = inputfile.readlines()

        self.state = 'base'

        self.register_declaration_re = re.compile("#define (.*?)_BASE\s*\(\(uint32_t\)(.*?)\)")


        self.peripherals = {}

    def process(self):
        for line in self.lines:
            self.processLine(line)

        return self.peripherals

    def processLine(self, line):        
        if self.state == 'base':
            m = self.register_declaration_re.match(line)
            if m is not None:
                g = m.groups()
                name = g[0]
                address = int(g[1], 16)

                self.peripherals[name] = address
                return

def runcommand(command, echo=True):
    if echo:
        print(command)
    return  os.system(command)

# pre-process command
# zig cc -C -E -dD -DBL808 -DARCH_RISCV -DCPU_M0 ../bouffalo_drivers/lhal/include/hardware/acomp_reg.h

# defines = -DBL808 -DARCH_RISCV -DCPU_M0
# 
def preprocessHeader(path, defines, headertype, outputdir):        
    folder, filename = os.path.split(path)
    name, ext = os.path.splitext(filename)
    pppath = pathjoin(outputdir, 'zigcc')
    ensurepath(pppath)
    outname = pathjoin(pppath, f"{name}.{headertype}.cc{ext}")

    return outname if runcommand(f"zig cc -CC -C -E -dD {defines} {path} > {outname}") == 0 else None

def parse_peripheral_header( headerpath, defines, headertype, outpath):

    ppfile = preprocessHeader(headerpath, defines, headertype, outpath )
    if ppfile is None:
        print(f"Error: preprocessing file: {ppfile} not found")
        return

    if headertype == 'lhal':
        lhal = HeaderParserLHAL(ppfile, 32)
        return lhal.process()

    if headertype == 'soc':
        lhal = HeaderParserSOC(ppfile, 32)
        return lhal.process()

    if headertype == 'base':
        lhal = HeaderParserBASE(ppfile, 32)
        return lhal.process()

def ensurepath(path):
    if not os.path.exists(path):
        os.mkdir(path)

def process_periph_header(device, peripheralsPath, headerfullpath, headertype):

    try:
        peripheral = parse_peripheral_header(
            headerfullpath,
            f'-D{device.name} -DARCH_RISCV -DCPU_M0', 
            headertype,
            peripheralsPath )

        if peripheral is None:
            print(f"Error: unabled to process header: {headerfullpath}")
            return

        if isinstance(peripheral, Peripheral):
            #peripheral.name = f"{peripheral.name}_{headertype}"
            if peripheral.name in device.peripheral_types:
                print(f"duplicate peripherial: {peripheral.name}, {headertype}")
                return

            device.peripheral_types[peripheral.name] = peripheral        
            zigfile =  pathjoin(peripheralsPath, peripheral.name + f".zig")

            print(f"writing peripheral type: {zigfile}")
            with open(zigfile, "w") as outm:
                peripheral.to_zig_file(outm)

            runcommand(f'zig fmt {zigfile}')
        elif headertype == 'base' and isinstance(peripheral, dict):
            for name, address in peripheral.items():
                if name in device.memorymap:
                    if device.memorymap[name] != address:
                        print(f"Error: Skipping duplicate peripheral instance: {name} @ {address}")
                    continue

                m = re.match("^(.*?)(\d+)$", name)
                pid = -1
                if m is not None:
                    g = m.groups()
                    pinstname = ptype = g[0] # type of peripheral
                    pid = int(g[1]) # instance count
                else:
                    ptype = name


                if ptype not in device.peripheral_types:
                    # an instance of the peripheral type
                    ptype = "NotFound"

                instance = PeripheralInstance(name, address, f"types.peripherals.{ptype}")
                device.peripherals.append(instance)

                if pid > -1:
                    if pinstname in device.peripheral_arrays:
                        device.peripheral_arrays[pinstname][pid] = instance
                    else: 
                        device.peripheral_arrays[pinstname] = { pid: instance }

                device.memorymap[name] = address
    except Exception as e:
        import traceback
        print(f"{headerfullpath} Error: {e}")
        traceback.print_exception(e)
        
    finally:
        pass


def run():
    outpath = "devices"
    ensurepath(outpath)

    for device in devices:
        devicepath = pathjoin(outpath, device.name)
        ensurepath(devicepath)
        peripheralsPath = pathjoin(devicepath, 'peripherals')

        ensurepath(peripheralsPath)

        for headertype, includedata in includes.items():
            if 'paths' in includedata:
                for includepath in includedata['paths']:
                    for header in os.listdir(includepath):
                        ext = os.path.splitext(header)[1]
                        if  ext != '.h':
                            continue

                        headerfullpath = pathjoin(includepath, header )

                        process_periph_header(device, peripheralsPath, headerfullpath, headertype)
            if 'files' in includedata:
                for header in includedata['files']:
                    process_periph_header(device, peripheralsPath, header, headertype)

        devicefile = f"{devicepath}/{device.name}.zig"
        print(f"writing: {devicefile}")
        with open(devicefile, "w") as outm:
            device.to_zig(outm)         

        runcommand(f'zig fmt {devicefile}')

devices = [Device('BL808')]

includes = {
    'lhal': {'paths':['../bouffalo_drivers/lhal/include/hardware']},
    'soc': {'paths':['../bouffalo_drivers/soc/bl808/std/include/hardware']},
    'base': {'files': [
        '../bouffalo_drivers/soc/bl808/std/include/hardware/bl808.h',
        '../bouffalo_drivers/lhal/config/bl808/bl808_memorymap.h'
        ]}
}

if __name__ == "__main__":
    run()
