
from pycparser import parse_file, c_generator, c_ast, preprocess_file, c_parser
import sys

from pcpp import Preprocessor

def translate_to_c(filename):
    """ Parse bl_reg header files
    """
    root = r'../openbouffalo/bl_mcu_sdk/drivers'
    toolchain = r'../openbouffalo/toolchain_gcc_t-head_windows/bin/'
    args = [

        f'-I{root}',
        f'-I{root}/soc/bl808/std/include/hardware',
        f'-I{root}/lhal/include',
        f'-I{root}/lhal/src/flash',
        f'-I{root}/lhal/include/arch',
        f'-I{root}/lhal/include/arch/risc-v/t-head',
        f'-I{root}/lhal/include/arch/risc-v/t-head/Core/Include/',
        f'-I{root}/lhal/include/arch/risc-v/t-head/csi_dsp/include',
        f'-I{root}/lhal/config/bl808',
        # r'--passthru-includes', r'.*stdint',
        # r'--debug', 
        #r'--passthru-unknown-exprs', 
        #r'--passthru-unfound-includes', 
        #r'--passthru-defines',
        # r'--line-directive', '',#,'//#line'  
    ]


    # result = preprocess_file(filename,'pcpp', args)

    # with open("pcpp-parsed.h", "w", encoding='utf-8') as astout:
    #     astout.write(result)

    # ast = c_parser.CParser(yacc_debug=True).parse(result, "pcpp-parsed.h", debug=True) 
    
    
    ast = parse_file(filename,use_cpp=True, cpp_path=f'{toolchain}riscv64-unknown-elf-cpp', cpp_args=args)

    # parse out the registers of the form:
    # struct name_reg
    #   union
    #       struct
    #       uint32_t
    #   ...

    with open("astout.py", "w", encoding='utf-8') as astout:
        ast.show(buf=astout)

    intsizes = { 
        'uint8_t':8,
        'uint16_t':16,
        'uint32_t':32,

        'int8_t':8,
        'int16_t':16,
        'int32_t':32,
        }

    types = {}

    print("pub const types = struct {")
    print("  pub const soc = struct {")

    for a in ast.ext:
        # print(type(a).__name__)
        if not isinstance(a, c_ast.Decl):
            continue

        if not isinstance(a.type, c_ast.Struct):
            continue

        s = a.type
        if not s.name.endswith('_reg'):
            continue

        groupname = s.name[:-4].upper()

        types[groupname] = -1

        # Root peripherial struct
        print(f"pub const {groupname} = extern struct {{")
        for d in s.decls:
            if (not isinstance(d, c_ast.Decl)):
                continue

            # Register Group
            if isinstance(d.type, c_ast.ArrayDecl):
                # Array type
                arrt = d.type
                if arrt.type.type.names[0] == 'uint8_t':
                    print(f"\t{d.name} : [{arrt.dim.value}]u8,")
            elif isinstance(d.type, c_ast.TypeDecl):
                # bl808 sdk reg structs are unions of a struct and uint32_t
                #
                # Register

                typedecl = d.type
                if isinstance(typedecl.type, c_ast.Union):
                    union = typedecl.type
                    # print("//union")
                    # print(f"//  {union.decls[0].name}")
                    # print(f"//  size:{union.decls[1].type.type.names[0]}")

                    unionSize = union.decls[1].type.type.names[0];
                    bitwidth = intsizes[unionSize]

                    print(f"\t{d.name} : mmio.Mmio(packed struct(u{bitwidth}) {{")
                    
                    if isinstance( union.decls[0].type.type, c_ast.Struct ):
                        struct = union.decls[0].type.type
                        processRegister(f"{s.name}.{d.name}", unionSize, struct)
                
                    print("\t}),")
        print("};")

        # is a register struct
        # for decl in a.decls:

    with open("types.zig", "w", encoding='utf-8') as typeout:
        for (name,address) in types.items():
            print(f"{name}: {address}", file=typeout)

    
    with open("astout-raw.c", "w", encoding='utf-8') as ast2out:
        generator = c_generator.CGenerator()
        print(generator.visit(ast), file=ast2out)


    print ("};};")

def processRegister(regname, unionSize, struct):
    # print(f"//struct : {len(struct.decls)}")
    for d in struct.decls:
        # print(f"//  .{d.name}: {type(d.type).__name__}")
        if not isinstance(d.type, c_ast.TypeDecl):
            continue
        processRegisterField(regname, unionSize, struct, d)


def processRegisterField(regname, unionSize, struct, field):
    if(field.type.type.names[0] != unionSize):
        print(f"// !!! Error: non {unionSize} type '{field.type.type.names[0]}' in field: {regname}.{field.name}")
        return

    if field.bitsize is None:
        print(f"// !!! Error: no bitfield size set in field: {regname}.{field.name}")
        return

    print(f"\t\t{field.name} : u{field.bitsize.value},")



def parseMacros(filename):
    proc = Preprocessor()
    with open(filename, "r") as input:
        proc.parse(input)

        print(proc.macros)


if __name__ == "__main__":
    if len(sys.argv) > 1:
        translate_to_c(sys.argv[1])
    else:
        parseMacros('parser.h')
        translate_to_c('parser.h')
