
import sys
import json
from pcpp import Preprocessor

class RegField:
    def __init__(self, fullname, name, pos, bitsize, register, default=None):
        self.fullname = fullname
        self.name = name
        self.pos = pos
        self.bitsize = bitsize
        self.register = register
        self.default = default

    def to_zig(self, file):
        print(f'{self.name}: u{self.bitsize}', file=file)
        if self.default is not None:
            print(f' = {self.default},\n', file=file)
        else:
            print(',\n', file=file)


class Register:
    def __init__(self, name, offset, size):
        self.name = name
        self.offset = offset
        self.fields = []
        self.backingsize = size

    def to_zig(self, file):
        print(f'{self.name} =  mmio.Mmio(packed struct(u{self.backingsize}) {{', file=file)

        for field in self.fields:
            field.to_zig(file)

        print('}),\n', file=file)

# peripherial
class Peripherial:
    def __init__(self, name, address):
        self.name = name
        self.address = address
        self.registers = []
    
    def to_zig(self, file):
        print(f'pub const {self.name} =  extern struct {{', file=file)

        for item in self.registers:
            item.to_zig(file)

        print('};\n', file=file)

class Device:
    def __init__(self, name):
        self.name = name
        self.peripherals = {}

def parseMacros(filename):
    proc = Preprocessor()
    with open(filename, "r") as f:

        proc.path = [
            '../bouffalo_drivers/soc/bl808/std/include/hardware',
            '../bouffalo_drivers/lhal/config/bl808',
            '../bouffalo_drivers/lhal/include/hardware',
        ]
        proc.parse(f)

        with open(filename + ".pcpp.h", "w") as outf:
            proc.write(outf)
        
        with open(filename + ".macros.zig", "w") as outm:
            
            peripherals = {}
            memorymap = {}

            for macro, v in proc.macros.items():
                # print(macro, file=outm)
                
                if macro.endswith('_BASE'):
                    reg = macro[:-5]
                    
                    #memory map
                    if reg.startswith('BL808_'):
                        reg = reg[6:]
                        memorymap[reg] = getuint32HexToken(v.value)
                    else:
                        # assume peripherial
                        peripherals[reg] = Peripherial(reg, getuint32HexToken(v.value))
                    

            writeDictToZigStruct('memory', memorymap, 'u32', outm)

            register = None
            regfield = None
            lastlineno = -1

            for macro, v in sorted(proc.macros.items(), key=lambda x: (x[1].source, x[1].lineno) ):

                if macro.startswith('EF_DATA_'):
                    res = ''

                res = [key for key, val in peripherals.items() if macro.startswith(key)]

                if len(res) < 1:
                    continue

                perfname = res[0]
                if not perfname in peripherals:
                    continue

                idname = macro[len(perfname)+1:]
                nametokens = idname.split('_')

                periph = peripherals[perfname]

                # print(f'perf macro: {macro}|{"_".join(nametokens[1:])} = {v.lineno}', file=outm)

                last = nametokens[-1]

                if last == 'OFFSET' or abs(v.lineno - lastlineno) > 1 or v.value[0].value == macro:
                    if v.value[0].value == macro:
                        regfield = RegField(macro, macro, -1, 1, register)
                    elif last == 'OFFSET' and regfield is None:
                        if register is not None:
                            #building a register and hit a new one?
                            periph.registers.append(register)
                            register = None
                    
                        if len(v.value) == 3:
                            regname = macro[:-len('_OFFSET')]
                            if len(regname) < 1:  # AON block case
                                regname = perfname
                            # start a new register
                            register = Register(regname, int(v.value[1].value,16), 32 )
                        
                    lastlineno = v.lineno

                    continue

                if regfield is None:
                    continue

                last = macro[len(regfield.fullname)+1:]

                if last == 'POS':
                    regfield.pos = int(v.value[1].value[:-1],10)
                    lastlineno = v.lineno
                elif last == 'LEN':
                    regfield.bitsize = int(v.value[1].value[:-1],10)
                    lastlineno = v.lineno
                elif last == 'MSK':
                    lastlineno = v.lineno
                elif last == 'UMSK':
                    lastlineno = v.lineno
                    register.fields.append(regfield)
                    regfield = None
                else:
                    print(f'error unknown macro: {macro}')


            for n, periph in peripherals.items():
                periph.to_zig(outm)

def parsename(raw, split, first, last):
    return '_'.join(split[1:-1])

def getuint32HexToken(value):
    for token in value:
        if token.type == 'CPP_INTEGER' and token.value.startswith('0x'):
            # print(f"{reg} = {token.value}\n", file=outm)
            return token.value
    return None

def writeDictToZigStruct(name, struct, valuetype, file):
    print(f'pub const {name} = struct {{\n', file = file)
    for k in sorted(struct.keys()):
        v = struct[k]
        print(f'\t{k}: {valuetype} = {v},', file=file )

    print('};\n', file = file)

            


                
            


if __name__ == "__main__":
    if len(sys.argv) > 1:
        parseMacros(sys.argv[1])
    else:
        parseMacros('parser.h')
