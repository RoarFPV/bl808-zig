// shame less copy from espressif-esp project ( a huge help!)
const std = @import("std");
const root = @import("root");
const microzig = @import("microzig");

pub const StatusRegister = enum(u8) {
    // machine information
    mvendorid,
    marchid,
    mimpid,
    mhartid,

    // machine trap setup
    mstatus,
    misa,
    mtvec,
};

pub inline fn setStatusBit(comptime reg: StatusRegister, bits: u32) void {
    asm volatile ("csrrs zero, " ++ @tagName(reg) ++ ", %[value]"
        :
        : [value] "r" (bits),
    );
}

pub inline fn clearStatusBit(comptime reg: StatusRegister, bits: u32) void {
    asm volatile ("csrrc zero, " ++ @tagName(reg) ++ ", %[value]"
        :
        : [value] "r" (bits),
    );
}

pub inline fn disable_interrupts() void {
    clearStatusBit(.mstatus, 0x08);
}

pub inline fn enable_interrupts() void {
    setStatusBit(.mstatus, 0x08);
}
pub fn wfi() void {
    asm volatile ("wfi");
}

pub fn wfe() void {
    asm volatile ("csrs 0x810, 0x1");
    wfi();
    asm volatile ("csrs 0x810, 0x1");
}

pub fn pmp_open_all_space() void {
    // Config entry0 addr to all 1s to make the range cover all space
    asm volatile ("li x6, 0xffffffff" ::: "x6");
    asm volatile ("csrw pmpaddr0, x6");
    // Config entry0 cfg to make it NAPOT address mode, and R/W/X okay
    asm volatile ("li x6, 0x7f" ::: "x6");
    asm volatile ("csrw pmpcfg0, x6");
}

pub fn switch_m2u_mode() void {
    asm volatile ("la x6, 1f    " ::: "x6");
    asm volatile ("csrw mepc, x6");
    asm volatile ("mret");
    asm volatile ("1:");
}

// riscv_xlen < 64
pub const STORE = "sw";
pub const LOAD = "lw";
pub const LOG_REGBYTES = 2;
pub const REGBYTES = (1 << LOG_REGBYTES);

pub const startup_logic = struct {
    extern fn microzig_main() noreturn;

    // it looks odd to just use a u8 here, but in C it's common to use a
    // char when linking these values from the linkerscript. What's
    // important is the addresses of these values.
    extern var microzig_data_start: u8;
    extern var microzig_data_end: u8;
    extern var microzig_bss_start: u8;
    extern var microzig_bss_end: u8;
    extern const microzig_data_load_start: u8;

    export fn _start() linksection("microzig_flash_start") callconv(.C) noreturn {
        microzig.cpu.disable_interrupts();
        asm volatile ("mv sp, %[eos]"
            :
            : [eos] "r" (@as(u32, microzig.config.end_of_stack)),
        );
        asm volatile ("la gp, __global_pointer$");
        microzig.cpu.setStatusBit(.mtvec, microzig.config.end_of_stack);
        root.initialize_system_memories();
        microzig_main();
    }
};

export fn _rv32_trap() callconv(.C) noreturn {
    while (true) {}
}

const vector_table = [_]fn () callconv(.C) noreturn{
    _rv32_trap,
    _rv32_trap,
    _rv32_trap,
    _rv32_trap,
    _rv32_trap,
    _rv32_trap,
    _rv32_trap,
    _rv32_trap,
    _rv32_trap,
    _rv32_trap,
    _rv32_trap,
    _rv32_trap,
    _rv32_trap,
    _rv32_trap,
    _rv32_trap,
    _rv32_trap,
    _rv32_trap,
    _rv32_trap,
    _rv32_trap,
    _rv32_trap,
    _rv32_trap,
};

pub const MSTATUS_UIE = 0x00000001;
pub const MSTATUS_SIE = 0x00000002;
pub const MSTATUS_HIE = 0x00000004;
pub const MSTATUS_MIE = 0x00000008;
pub const MSTATUS_UPIE = 0x00000010;
pub const MSTATUS_SPIE = 0x00000020;
pub const MSTATUS_HPIE = 0x00000040;
pub const MSTATUS_MPIE = 0x00000080;
pub const MSTATUS_SPP = 0x00000100;
pub const MSTATUS_MPP = 0x00001800;
pub const MSTATUS_FS = 0x00006000;
pub const MSTATUS_XS = 0x00018000;
pub const MSTATUS_MPRV = 0x00020000;
pub const MSTATUS_PUM = 0x00040000;
pub const MSTATUS_MXR = 0x00080000;
pub const MSTATUS_VM = 0x1F000000;
pub const MSTATUS32_SD = 0x80000000;
pub const MSTATUS64_SD = 0x8000000000000000;
pub const SSTATUS_UIE = 0x00000001;
pub const SSTATUS_SIE = 0x00000002;
pub const SSTATUS_UPIE = 0x00000010;
pub const SSTATUS_SPIE = 0x00000020;
pub const SSTATUS_SPP = 0x00000100;
pub const SSTATUS_FS = 0x00006000;
pub const SSTATUS_XS = 0x00018000;
pub const SSTATUS_PUM = 0x00040000;
pub const SSTATUS32_SD = 0x80000000;
pub const SSTATUS64_SD = 0x8000000000000000;
pub const DCSR_XDEBUGVER = 3 << 30;
pub const DCSR_NDRESET = 1 << 29;
pub const DCSR_FULLRESET = 1 << 28;
pub const DCSR_EBREAKM = 1 << 15;
pub const DCSR_EBREAKH = 1 << 14;
pub const DCSR_EBREAKS = 1 << 13;
pub const DCSR_EBREAKU = 1 << 12;
pub const DCSR_STOPCYCLE = 1 << 10;
pub const DCSR_STOPTIME = 1 << 9;
pub const DCSR_CAUSE = 7 << 6;
pub const DCSR_DEBUGINT = 1 << 5;
pub const DCSR_HALT = 1 << 3;
pub const DCSR_STEP = 1 << 2;
pub const DCSR_PRV = 3 << 0;
pub const DCSR_CAUSE_NONE = 0;
pub const DCSR_CAUSE_SWBP = 1;
pub const DCSR_CAUSE_HWBP = 2;
pub const DCSR_CAUSE_DEBUGINT = 3;
pub const DCSR_CAUSE_STEP = 4;
pub const DCSR_CAUSE_HALT = 5;
pub inline fn MCONTROL_TYPE(xlen: anytype) @TypeOf(0xf << (xlen - 4)) {
    return 0xf << (xlen - 4);
}
pub inline fn MCONTROL_DMODE(xlen: anytype) @TypeOf(1 << (xlen - 5)) {
    return 1 << (xlen - 5);
}
pub inline fn MCONTROL_MASKMAX(xlen: anytype) @TypeOf(0x3f << (xlen - 11)) {
    return @as(c_ulonglong, 0x3f) << (xlen - 11);
}
pub const MCONTROL_SELECT = 1 << 19;
pub const MCONTROL_TIMING = 1 << 18;
pub const MCONTROL_ACTION = 0x3f << 12;
pub const MCONTROL_CHAIN = 1 << 11;
pub const MCONTROL_MATCH = 0xf << 7;
pub const MCONTROL_M = 1 << 6;
pub const MCONTROL_H = 1 << 5;
pub const MCONTROL_S = 1 << 4;
pub const MCONTROL_U = 1 << 3;
pub const MCONTROL_EXECUTE = 1 << 2;
pub const MCONTROL_STORE = 1 << 1;
pub const MCONTROL_LOAD = 1 << 0;
pub const MCONTROL_TYPE_NONE = 0;
pub const MCONTROL_TYPE_MATCH = 2;
pub const MCONTROL_ACTION_DEBUG_EXCEPTION = 0;
pub const MCONTROL_ACTION_DEBUG_MODE = 1;
pub const MCONTROL_ACTION_TRACE_START = 2;
pub const MCONTROL_ACTION_TRACE_STOP = 3;
pub const MCONTROL_ACTION_TRACE_EMIT = 4;
pub const MCONTROL_MATCH_EQUAL = 0;
pub const MCONTROL_MATCH_NAPOT = 1;
pub const MCONTROL_MATCH_GE = 2;
pub const MCONTROL_MATCH_LT = 3;
pub const MCONTROL_MATCH_MASK_LOW = 4;
pub const MCONTROL_MATCH_MASK_HIGH = 5;
pub const MIP_SSIP = 1 << IRQ_S_SOFT;
pub const MIP_HSIP = 1 << IRQ_H_SOFT;
pub const MIP_MSIP = 1 << IRQ_M_SOFT;
pub const MIP_STIP = 1 << IRQ_S_TIMER;
pub const MIP_HTIP = 1 << IRQ_H_TIMER;
pub const MIP_MTIP = 1 << IRQ_M_TIMER;
pub const MIP_SEIP = 1 << IRQ_S_EXT;
pub const MIP_HEIP = 1 << IRQ_H_EXT;
pub const MIP_MEIP = 1 << IRQ_M_EXT;
pub const MIE_SSIE = MIP_SSIP;
pub const MIE_HSIE = MIP_HSIP;
pub const MIE_MSIE = MIP_MSIP;
pub const MIE_STIE = MIP_STIP;
pub const MIE_HTIE = MIP_HTIP;
pub const MIE_MTIE = MIP_MTIP;
pub const MIE_SEIE = MIP_SEIP;
pub const MIE_HEIE = MIP_HEIP;
pub const MIE_MEIE = MIP_MEIP;
pub const SIP_SSIP = MIP_SSIP;
pub const SIP_STIP = MIP_STIP;
pub const PRV_U = 0;
pub const PRV_S = 1;
pub const PRV_H = 2;
pub const PRV_M = 3;
pub const VM_MBARE = 0;
pub const VM_MBB = 1;
pub const VM_MBBID = 2;
pub const VM_SV32 = 8;
pub const VM_SV39 = 9;
pub const VM_SV48 = 10;
pub const IRQ_S_SOFT = 1;
pub const IRQ_H_SOFT = 2;
pub const IRQ_M_SOFT = 3;
pub const IRQ_S_TIMER = 5;
pub const IRQ_H_TIMER = 6;
pub const IRQ_M_TIMER = 7;
pub const IRQ_S_EXT = 9;
pub const IRQ_H_EXT = 10;
pub const IRQ_M_EXT = 11;
pub const IRQ_COP = 12;
pub const IRQ_HOST = 13;
pub const DEFAULT_RSTVEC = 0x00001000;
pub const DEFAULT_NMIVEC = 0x00001004;
pub const DEFAULT_MTVEC = 0x00001010;
pub const CONFIG_STRING_ADDR = 0x0000100C;
pub const EXT_IO_BASE = 0x40000000;
pub const DRAM_BASE = 0x80000000;
pub const PTE_V = 0x001;
pub const PTE_R = 0x002;
pub const PTE_W = 0x004;
pub const PTE_X = 0x008;
pub const PTE_U = 0x010;
pub const PTE_G = 0x020;
pub const PTE_A = 0x040;
pub const PTE_D = 0x080;
pub const PTE_SOFT = 0x300;
pub const PTE_PPN_SHIFT = 10;
pub inline fn PTE_TABLE(PTE: anytype) @TypeOf((PTE & (((PTE_V | PTE_R) | PTE_W) | PTE_X)) == PTE_V) {
    return (PTE & (((PTE_V | PTE_R) | PTE_W) | PTE_X)) == PTE_V;
}
pub const MSTATUS_SD = MSTATUS32_SD;
pub const SSTATUS_SD = SSTATUS32_SD;
pub const RISCV_PGLEVEL_BITS = 10;
pub const RISCV_PGSHIFT = 12;
pub const RISCV_PGSIZE = 1 << RISCV_PGSHIFT;
pub const RISCV_ENCODING_H = "";
pub const MATCH_BEQ = 0x63;
pub const MASK_BEQ = 0x707f;
pub const MATCH_BNE = 0x1063;
pub const MASK_BNE = 0x707f;
pub const MATCH_BLT = 0x4063;
pub const MASK_BLT = 0x707f;
pub const MATCH_BGE = 0x5063;
pub const MASK_BGE = 0x707f;
pub const MATCH_BLTU = 0x6063;
pub const MASK_BLTU = 0x707f;
pub const MATCH_BGEU = 0x7063;
pub const MASK_BGEU = 0x707f;
pub const MATCH_JALR = 0x67;
pub const MASK_JALR = 0x707f;
pub const MATCH_JAL = 0x6f;
pub const MASK_JAL = 0x7f;
pub const MATCH_LUI = 0x37;
pub const MASK_LUI = 0x7f;
pub const MATCH_AUIPC = 0x17;
pub const MASK_AUIPC = 0x7f;
pub const MATCH_ADDI = 0x13;
pub const MASK_ADDI = 0x707f;
pub const MATCH_SLLI = 0x1013;
pub const MASK_SLLI = 0xfc00707f;
pub const MATCH_SLTI = 0x2013;
pub const MASK_SLTI = 0x707f;
pub const MATCH_SLTIU = 0x3013;
pub const MASK_SLTIU = 0x707f;
pub const MATCH_XORI = 0x4013;
pub const MASK_XORI = 0x707f;
pub const MATCH_SRLI = 0x5013;
pub const MASK_SRLI = 0xfc00707f;
pub const MATCH_SRAI = 0x40005013;
pub const MASK_SRAI = 0xfc00707f;
pub const MATCH_ORI = 0x6013;
pub const MASK_ORI = 0x707f;
pub const MATCH_ANDI = 0x7013;
pub const MASK_ANDI = 0x707f;
pub const MATCH_ADD = 0x33;
pub const MASK_ADD = 0xfe00707f;
pub const MATCH_SUB = 0x40000033;
pub const MASK_SUB = 0xfe00707f;
pub const MATCH_SLL = 0x1033;
pub const MASK_SLL = 0xfe00707f;
pub const MATCH_SLT = 0x2033;
pub const MASK_SLT = 0xfe00707f;
pub const MATCH_SLTU = 0x3033;
pub const MASK_SLTU = 0xfe00707f;
pub const MATCH_XOR = 0x4033;
pub const MASK_XOR = 0xfe00707f;
pub const MATCH_SRL = 0x5033;
pub const MASK_SRL = 0xfe00707f;
pub const MATCH_SRA = 0x40005033;
pub const MASK_SRA = 0xfe00707f;
pub const MATCH_OR = 0x6033;
pub const MASK_OR = 0xfe00707f;
pub const MATCH_AND = 0x7033;
pub const MASK_AND = 0xfe00707f;
pub const MATCH_ADDIW = 0x1b;
pub const MASK_ADDIW = 0x707f;
pub const MATCH_SLLIW = 0x101b;
pub const MASK_SLLIW = 0xfe00707f;
pub const MATCH_SRLIW = 0x501b;
pub const MASK_SRLIW = 0xfe00707f;
pub const MATCH_SRAIW = 0x4000501b;
pub const MASK_SRAIW = 0xfe00707f;
pub const MATCH_ADDW = 0x3b;
pub const MASK_ADDW = 0xfe00707f;
pub const MATCH_SUBW = 0x4000003b;
pub const MASK_SUBW = 0xfe00707f;
pub const MATCH_SLLW = 0x103b;
pub const MASK_SLLW = 0xfe00707f;
pub const MATCH_SRLW = 0x503b;
pub const MASK_SRLW = 0xfe00707f;
pub const MATCH_SRAW = 0x4000503b;
pub const MASK_SRAW = 0xfe00707f;
pub const MATCH_LB = 0x3;
pub const MASK_LB = 0x707f;
pub const MATCH_LH = 0x1003;
pub const MASK_LH = 0x707f;
pub const MATCH_LW = 0x2003;
pub const MASK_LW = 0x707f;
pub const MATCH_LD = 0x3003;
pub const MASK_LD = 0x707f;
pub const MATCH_LBU = 0x4003;
pub const MASK_LBU = 0x707f;
pub const MATCH_LHU = 0x5003;
pub const MASK_LHU = 0x707f;
pub const MATCH_LWU = 0x6003;
pub const MASK_LWU = 0x707f;
pub const MATCH_SB = 0x23;
pub const MASK_SB = 0x707f;
pub const MATCH_SH = 0x1023;
pub const MASK_SH = 0x707f;
pub const MATCH_SW = 0x2023;
pub const MASK_SW = 0x707f;
pub const MATCH_SD = 0x3023;
pub const MASK_SD = 0x707f;
pub const MATCH_FENCE = 0xf;
pub const MASK_FENCE = 0x707f;
pub const MATCH_FENCE_I = 0x100f;
pub const MASK_FENCE_I = 0x707f;
pub const MATCH_MUL = 0x2000033;
pub const MASK_MUL = 0xfe00707f;
pub const MATCH_MULH = 0x2001033;
pub const MASK_MULH = 0xfe00707f;
pub const MATCH_MULHSU = 0x2002033;
pub const MASK_MULHSU = 0xfe00707f;
pub const MATCH_MULHU = 0x2003033;
pub const MASK_MULHU = 0xfe00707f;
pub const MATCH_DIV = 0x2004033;
pub const MASK_DIV = 0xfe00707f;
pub const MATCH_DIVU = 0x2005033;
pub const MASK_DIVU = 0xfe00707f;
pub const MATCH_REM = 0x2006033;
pub const MASK_REM = 0xfe00707f;
pub const MATCH_REMU = 0x2007033;
pub const MASK_REMU = 0xfe00707f;
pub const MATCH_MULW = 0x200003b;
pub const MASK_MULW = 0xfe00707f;
pub const MATCH_DIVW = 0x200403b;
pub const MASK_DIVW = 0xfe00707f;
pub const MATCH_DIVUW = 0x200503b;
pub const MASK_DIVUW = 0xfe00707f;
pub const MATCH_REMW = 0x200603b;
pub const MASK_REMW = 0xfe00707f;
pub const MATCH_REMUW = 0x200703b;
pub const MASK_REMUW = 0xfe00707f;
pub const MATCH_AMOADD_W = 0x202f;
pub const MASK_AMOADD_W = 0xf800707f;
pub const MATCH_AMOXOR_W = 0x2000202f;
pub const MASK_AMOXOR_W = 0xf800707f;
pub const MATCH_AMOOR_W = 0x4000202f;
pub const MASK_AMOOR_W = 0xf800707f;
pub const MATCH_AMOAND_W = 0x6000202f;
pub const MASK_AMOAND_W = 0xf800707f;
pub const MATCH_AMOMIN_W = 0x8000202f;
pub const MASK_AMOMIN_W = 0xf800707f;
pub const MATCH_AMOMAX_W = 0xa000202f;
pub const MASK_AMOMAX_W = 0xf800707f;
pub const MATCH_AMOMINU_W = 0xc000202f;
pub const MASK_AMOMINU_W = 0xf800707f;
pub const MATCH_AMOMAXU_W = 0xe000202f;
pub const MASK_AMOMAXU_W = 0xf800707f;
pub const MATCH_AMOSWAP_W = 0x800202f;
pub const MASK_AMOSWAP_W = 0xf800707f;
pub const MATCH_LR_W = 0x1000202f;
pub const MASK_LR_W = 0xf9f0707f;
pub const MATCH_SC_W = 0x1800202f;
pub const MASK_SC_W = 0xf800707f;
pub const MATCH_AMOADD_D = 0x302f;
pub const MASK_AMOADD_D = 0xf800707f;
pub const MATCH_AMOXOR_D = 0x2000302f;
pub const MASK_AMOXOR_D = 0xf800707f;
pub const MATCH_AMOOR_D = 0x4000302f;
pub const MASK_AMOOR_D = 0xf800707f;
pub const MATCH_AMOAND_D = 0x6000302f;
pub const MASK_AMOAND_D = 0xf800707f;
pub const MATCH_AMOMIN_D = 0x8000302f;
pub const MASK_AMOMIN_D = 0xf800707f;
pub const MATCH_AMOMAX_D = 0xa000302f;
pub const MASK_AMOMAX_D = 0xf800707f;
pub const MATCH_AMOMINU_D = 0xc000302f;
pub const MASK_AMOMINU_D = 0xf800707f;
pub const MATCH_AMOMAXU_D = 0xe000302f;
pub const MASK_AMOMAXU_D = 0xf800707f;
pub const MATCH_AMOSWAP_D = 0x800302f;
pub const MASK_AMOSWAP_D = 0xf800707f;
pub const MATCH_LR_D = 0x1000302f;
pub const MASK_LR_D = 0xf9f0707f;
pub const MATCH_SC_D = 0x1800302f;
pub const MASK_SC_D = 0xf800707f;
pub const MATCH_ECALL = 0x73;
pub const MASK_ECALL = 0xffffffff;
pub const MATCH_EBREAK = 0x100073;
pub const MASK_EBREAK = 0xffffffff;
pub const MATCH_URET = 0x200073;
pub const MASK_URET = 0xffffffff;
pub const MATCH_SRET = 0x10200073;
pub const MASK_SRET = 0xffffffff;
pub const MATCH_HRET = 0x20200073;
pub const MASK_HRET = 0xffffffff;
pub const MATCH_MRET = 0x30200073;
pub const MASK_MRET = 0xffffffff;
pub const MATCH_DRET = 0x7b200073;
pub const MASK_DRET = 0xffffffff;
pub const MATCH_SFENCE_VM = 0x10400073;
pub const MASK_SFENCE_VM = 0xfff07fff;
pub const MATCH_WFI = 0x10500073;
pub const MASK_WFI = 0xffffffff;
pub const MATCH_CSRRW = 0x1073;
pub const MASK_CSRRW = 0x707f;
pub const MATCH_CSRRS = 0x2073;
pub const MASK_CSRRS = 0x707f;
pub const MATCH_CSRRC = 0x3073;
pub const MASK_CSRRC = 0x707f;
pub const MATCH_CSRRWI = 0x5073;
pub const MASK_CSRRWI = 0x707f;
pub const MATCH_CSRRSI = 0x6073;
pub const MASK_CSRRSI = 0x707f;
pub const MATCH_CSRRCI = 0x7073;
pub const MASK_CSRRCI = 0x707f;
pub const MATCH_FADD_S = 0x53;
pub const MASK_FADD_S = 0xfe00007f;
pub const MATCH_FSUB_S = 0x8000053;
pub const MASK_FSUB_S = 0xfe00007f;
pub const MATCH_FMUL_S = 0x10000053;
pub const MASK_FMUL_S = 0xfe00007f;
pub const MATCH_FDIV_S = 0x18000053;
pub const MASK_FDIV_S = 0xfe00007f;
pub const MATCH_FSGNJ_S = 0x20000053;
pub const MASK_FSGNJ_S = 0xfe00707f;
pub const MATCH_FSGNJN_S = 0x20001053;
pub const MASK_FSGNJN_S = 0xfe00707f;
pub const MATCH_FSGNJX_S = 0x20002053;
pub const MASK_FSGNJX_S = 0xfe00707f;
pub const MATCH_FMIN_S = 0x28000053;
pub const MASK_FMIN_S = 0xfe00707f;
pub const MATCH_FMAX_S = 0x28001053;
pub const MASK_FMAX_S = 0xfe00707f;
pub const MATCH_FSQRT_S = 0x58000053;
pub const MASK_FSQRT_S = 0xfff0007f;
pub const MATCH_FADD_D = 0x2000053;
pub const MASK_FADD_D = 0xfe00007f;
pub const MATCH_FSUB_D = 0xa000053;
pub const MASK_FSUB_D = 0xfe00007f;
pub const MATCH_FMUL_D = 0x12000053;
pub const MASK_FMUL_D = 0xfe00007f;
pub const MATCH_FDIV_D = 0x1a000053;
pub const MASK_FDIV_D = 0xfe00007f;
pub const MATCH_FSGNJ_D = 0x22000053;
pub const MASK_FSGNJ_D = 0xfe00707f;
pub const MATCH_FSGNJN_D = 0x22001053;
pub const MASK_FSGNJN_D = 0xfe00707f;
pub const MATCH_FSGNJX_D = 0x22002053;
pub const MASK_FSGNJX_D = 0xfe00707f;
pub const MATCH_FMIN_D = 0x2a000053;
pub const MASK_FMIN_D = 0xfe00707f;
pub const MATCH_FMAX_D = 0x2a001053;
pub const MASK_FMAX_D = 0xfe00707f;
pub const MATCH_FCVT_S_D = 0x40100053;
pub const MASK_FCVT_S_D = 0xfff0007f;
pub const MATCH_FCVT_D_S = 0x42000053;
pub const MASK_FCVT_D_S = 0xfff0007f;
pub const MATCH_FSQRT_D = 0x5a000053;
pub const MASK_FSQRT_D = 0xfff0007f;
pub const MATCH_FLE_S = 0xa0000053;
pub const MASK_FLE_S = 0xfe00707f;
pub const MATCH_FLT_S = 0xa0001053;
pub const MASK_FLT_S = 0xfe00707f;
pub const MATCH_FEQ_S = 0xa0002053;
pub const MASK_FEQ_S = 0xfe00707f;
pub const MATCH_FLE_D = 0xa2000053;
pub const MASK_FLE_D = 0xfe00707f;
pub const MATCH_FLT_D = 0xa2001053;
pub const MASK_FLT_D = 0xfe00707f;
pub const MATCH_FEQ_D = 0xa2002053;
pub const MASK_FEQ_D = 0xfe00707f;
pub const MATCH_FCVT_W_S = 0xc0000053;
pub const MASK_FCVT_W_S = 0xfff0007f;
pub const MATCH_FCVT_WU_S = 0xc0100053;
pub const MASK_FCVT_WU_S = 0xfff0007f;
pub const MATCH_FCVT_L_S = 0xc0200053;
pub const MASK_FCVT_L_S = 0xfff0007f;
pub const MATCH_FCVT_LU_S = 0xc0300053;
pub const MASK_FCVT_LU_S = 0xfff0007f;
pub const MATCH_FMV_X_S = 0xe0000053;
pub const MASK_FMV_X_S = 0xfff0707f;
pub const MATCH_FCLASS_S = 0xe0001053;
pub const MASK_FCLASS_S = 0xfff0707f;
pub const MATCH_FCVT_W_D = 0xc2000053;
pub const MASK_FCVT_W_D = 0xfff0007f;
pub const MATCH_FCVT_WU_D = 0xc2100053;
pub const MASK_FCVT_WU_D = 0xfff0007f;
pub const MATCH_FCVT_L_D = 0xc2200053;
pub const MASK_FCVT_L_D = 0xfff0007f;
pub const MATCH_FCVT_LU_D = 0xc2300053;
pub const MASK_FCVT_LU_D = 0xfff0007f;
pub const MATCH_FMV_X_D = 0xe2000053;
pub const MASK_FMV_X_D = 0xfff0707f;
pub const MATCH_FCLASS_D = 0xe2001053;
pub const MASK_FCLASS_D = 0xfff0707f;
pub const MATCH_FCVT_S_W = 0xd0000053;
pub const MASK_FCVT_S_W = 0xfff0007f;
pub const MATCH_FCVT_S_WU = 0xd0100053;
pub const MASK_FCVT_S_WU = 0xfff0007f;
pub const MATCH_FCVT_S_L = 0xd0200053;
pub const MASK_FCVT_S_L = 0xfff0007f;
pub const MATCH_FCVT_S_LU = 0xd0300053;
pub const MASK_FCVT_S_LU = 0xfff0007f;
pub const MATCH_FMV_S_X = 0xf0000053;
pub const MASK_FMV_S_X = 0xfff0707f;
pub const MATCH_FCVT_D_W = 0xd2000053;
pub const MASK_FCVT_D_W = 0xfff0007f;
pub const MATCH_FCVT_D_WU = 0xd2100053;
pub const MASK_FCVT_D_WU = 0xfff0007f;
pub const MATCH_FCVT_D_L = 0xd2200053;
pub const MASK_FCVT_D_L = 0xfff0007f;
pub const MATCH_FCVT_D_LU = 0xd2300053;
pub const MASK_FCVT_D_LU = 0xfff0007f;
pub const MATCH_FMV_D_X = 0xf2000053;
pub const MASK_FMV_D_X = 0xfff0707f;
pub const MATCH_FLW = 0x2007;
pub const MASK_FLW = 0x707f;
pub const MATCH_FLD = 0x3007;
pub const MASK_FLD = 0x707f;
pub const MATCH_FSW = 0x2027;
pub const MASK_FSW = 0x707f;
pub const MATCH_FSD = 0x3027;
pub const MASK_FSD = 0x707f;
pub const MATCH_FMADD_S = 0x43;
pub const MASK_FMADD_S = 0x600007f;
pub const MATCH_FMSUB_S = 0x47;
pub const MASK_FMSUB_S = 0x600007f;
pub const MATCH_FNMSUB_S = 0x4b;
pub const MASK_FNMSUB_S = 0x600007f;
pub const MATCH_FNMADD_S = 0x4f;
pub const MASK_FNMADD_S = 0x600007f;
pub const MATCH_FMADD_D = 0x2000043;
pub const MASK_FMADD_D = 0x600007f;
pub const MATCH_FMSUB_D = 0x2000047;
pub const MASK_FMSUB_D = 0x600007f;
pub const MATCH_FNMSUB_D = 0x200004b;
pub const MASK_FNMSUB_D = 0x600007f;
pub const MATCH_FNMADD_D = 0x200004f;
pub const MASK_FNMADD_D = 0x600007f;
pub const MATCH_C_NOP = 0x1;
pub const MASK_C_NOP = 0xffff;
pub const MATCH_C_ADDI16SP = 0x6101;
pub const MASK_C_ADDI16SP = 0xef83;
pub const MATCH_C_JR = 0x8002;
pub const MASK_C_JR = 0xf07f;
pub const MATCH_C_JALR = 0x9002;
pub const MASK_C_JALR = 0xf07f;
pub const MATCH_C_EBREAK = 0x9002;
pub const MASK_C_EBREAK = 0xffff;
pub const MATCH_C_LD = 0x6000;
pub const MASK_C_LD = 0xe003;
pub const MATCH_C_SD = 0xe000;
pub const MASK_C_SD = 0xe003;
pub const MATCH_C_ADDIW = 0x2001;
pub const MASK_C_ADDIW = 0xe003;
pub const MATCH_C_LDSP = 0x6002;
pub const MASK_C_LDSP = 0xe003;
pub const MATCH_C_SDSP = 0xe002;
pub const MASK_C_SDSP = 0xe003;
pub const MATCH_C_ADDI4SPN = 0x0;
pub const MASK_C_ADDI4SPN = 0xe003;
pub const MATCH_C_FLD = 0x2000;
pub const MASK_C_FLD = 0xe003;
pub const MATCH_C_LW = 0x4000;
pub const MASK_C_LW = 0xe003;
pub const MATCH_C_FLW = 0x6000;
pub const MASK_C_FLW = 0xe003;
pub const MATCH_C_FSD = 0xa000;
pub const MASK_C_FSD = 0xe003;
pub const MATCH_C_SW = 0xc000;
pub const MASK_C_SW = 0xe003;
pub const MATCH_C_FSW = 0xe000;
pub const MASK_C_FSW = 0xe003;
pub const MATCH_C_ADDI = 0x1;
pub const MASK_C_ADDI = 0xe003;
pub const MATCH_C_JAL = 0x2001;
pub const MASK_C_JAL = 0xe003;
pub const MATCH_C_LI = 0x4001;
pub const MASK_C_LI = 0xe003;
pub const MATCH_C_LUI = 0x6001;
pub const MASK_C_LUI = 0xe003;
pub const MATCH_C_SRLI = 0x8001;
pub const MASK_C_SRLI = 0xec03;
pub const MATCH_C_SRAI = 0x8401;
pub const MASK_C_SRAI = 0xec03;
pub const MATCH_C_ANDI = 0x8801;
pub const MASK_C_ANDI = 0xec03;
pub const MATCH_C_SUB = 0x8c01;
pub const MASK_C_SUB = 0xfc63;
pub const MATCH_C_XOR = 0x8c21;
pub const MASK_C_XOR = 0xfc63;
pub const MATCH_C_OR = 0x8c41;
pub const MASK_C_OR = 0xfc63;
pub const MATCH_C_AND = 0x8c61;
pub const MASK_C_AND = 0xfc63;
pub const MATCH_C_SUBW = 0x9c01;
pub const MASK_C_SUBW = 0xfc63;
pub const MATCH_C_ADDW = 0x9c21;
pub const MASK_C_ADDW = 0xfc63;
pub const MATCH_C_J = 0xa001;
pub const MASK_C_J = 0xe003;
pub const MATCH_C_BEQZ = 0xc001;
pub const MASK_C_BEQZ = 0xe003;
pub const MATCH_C_BNEZ = 0xe001;
pub const MASK_C_BNEZ = 0xe003;
pub const MATCH_C_SLLI = 0x2;
pub const MASK_C_SLLI = 0xe003;
pub const MATCH_C_FLDSP = 0x2002;
pub const MASK_C_FLDSP = 0xe003;
pub const MATCH_C_LWSP = 0x4002;
pub const MASK_C_LWSP = 0xe003;
pub const MATCH_C_FLWSP = 0x6002;
pub const MASK_C_FLWSP = 0xe003;
pub const MATCH_C_MV = 0x8002;
pub const MASK_C_MV = 0xf003;
pub const MATCH_C_ADD = 0x9002;
pub const MASK_C_ADD = 0xf003;
pub const MATCH_C_FSDSP = 0xa002;
pub const MASK_C_FSDSP = 0xe003;
pub const MATCH_C_SWSP = 0xc002;
pub const MASK_C_SWSP = 0xe003;
pub const MATCH_C_FSWSP = 0xe002;
pub const MASK_C_FSWSP = 0xe003;
pub const MATCH_CUSTOM0 = 0xb;
pub const MASK_CUSTOM0 = 0x707f;
pub const MATCH_CUSTOM0_RS1 = 0x200b;
pub const MASK_CUSTOM0_RS1 = 0x707f;
pub const MATCH_CUSTOM0_RS1_RS2 = 0x300b;
pub const MASK_CUSTOM0_RS1_RS2 = 0x707f;
pub const MATCH_CUSTOM0_RD = 0x400b;
pub const MASK_CUSTOM0_RD = 0x707f;
pub const MATCH_CUSTOM0_RD_RS1 = 0x600b;
pub const MASK_CUSTOM0_RD_RS1 = 0x707f;
pub const MATCH_CUSTOM0_RD_RS1_RS2 = 0x700b;
pub const MASK_CUSTOM0_RD_RS1_RS2 = 0x707f;
pub const MATCH_CUSTOM1 = 0x2b;
pub const MASK_CUSTOM1 = 0x707f;
pub const MATCH_CUSTOM1_RS1 = 0x202b;
pub const MASK_CUSTOM1_RS1 = 0x707f;
pub const MATCH_CUSTOM1_RS1_RS2 = 0x302b;
pub const MASK_CUSTOM1_RS1_RS2 = 0x707f;
pub const MATCH_CUSTOM1_RD = 0x402b;
pub const MASK_CUSTOM1_RD = 0x707f;
pub const MATCH_CUSTOM1_RD_RS1 = 0x602b;
pub const MASK_CUSTOM1_RD_RS1 = 0x707f;
pub const MATCH_CUSTOM1_RD_RS1_RS2 = 0x702b;
pub const MASK_CUSTOM1_RD_RS1_RS2 = 0x707f;
pub const MATCH_CUSTOM2 = 0x5b;
pub const MASK_CUSTOM2 = 0x707f;
pub const MATCH_CUSTOM2_RS1 = 0x205b;
pub const MASK_CUSTOM2_RS1 = 0x707f;
pub const MATCH_CUSTOM2_RS1_RS2 = 0x305b;
pub const MASK_CUSTOM2_RS1_RS2 = 0x707f;
pub const MATCH_CUSTOM2_RD = 0x405b;
pub const MASK_CUSTOM2_RD = 0x707f;
pub const MATCH_CUSTOM2_RD_RS1 = 0x605b;
pub const MASK_CUSTOM2_RD_RS1 = 0x707f;
pub const MATCH_CUSTOM2_RD_RS1_RS2 = 0x705b;
pub const MASK_CUSTOM2_RD_RS1_RS2 = 0x707f;
pub const MATCH_CUSTOM3 = 0x7b;
pub const MASK_CUSTOM3 = 0x707f;
pub const MATCH_CUSTOM3_RS1 = 0x207b;
pub const MASK_CUSTOM3_RS1 = 0x707f;
pub const MATCH_CUSTOM3_RS1_RS2 = 0x307b;
pub const MASK_CUSTOM3_RS1_RS2 = 0x707f;
pub const MATCH_CUSTOM3_RD = 0x407b;
pub const MASK_CUSTOM3_RD = 0x707f;
pub const MATCH_CUSTOM3_RD_RS1 = 0x607b;
pub const MASK_CUSTOM3_RD_RS1 = 0x707f;
pub const MATCH_CUSTOM3_RD_RS1_RS2 = 0x707b;
pub const MASK_CUSTOM3_RD_RS1_RS2 = 0x707f;
pub const CSR_FFLAGS = 0x1;
pub const CSR_FRM = 0x2;
pub const CSR_FCSR = 0x3;
pub const CSR_CYCLE = 0xc00;
pub const CSR_TIME = 0xc01;
pub const CSR_INSTRET = 0xc02;
pub const CSR_HPMCOUNTER3 = 0xc03;
pub const CSR_HPMCOUNTER4 = 0xc04;
pub const CSR_HPMCOUNTER5 = 0xc05;
pub const CSR_HPMCOUNTER6 = 0xc06;
pub const CSR_HPMCOUNTER7 = 0xc07;
pub const CSR_HPMCOUNTER8 = 0xc08;
pub const CSR_HPMCOUNTER9 = 0xc09;
pub const CSR_HPMCOUNTER10 = 0xc0a;
pub const CSR_HPMCOUNTER11 = 0xc0b;
pub const CSR_HPMCOUNTER12 = 0xc0c;
pub const CSR_HPMCOUNTER13 = 0xc0d;
pub const CSR_HPMCOUNTER14 = 0xc0e;
pub const CSR_HPMCOUNTER15 = 0xc0f;
pub const CSR_HPMCOUNTER16 = 0xc10;
pub const CSR_HPMCOUNTER17 = 0xc11;
pub const CSR_HPMCOUNTER18 = 0xc12;
pub const CSR_HPMCOUNTER19 = 0xc13;
pub const CSR_HPMCOUNTER20 = 0xc14;
pub const CSR_HPMCOUNTER21 = 0xc15;
pub const CSR_HPMCOUNTER22 = 0xc16;
pub const CSR_HPMCOUNTER23 = 0xc17;
pub const CSR_HPMCOUNTER24 = 0xc18;
pub const CSR_HPMCOUNTER25 = 0xc19;
pub const CSR_HPMCOUNTER26 = 0xc1a;
pub const CSR_HPMCOUNTER27 = 0xc1b;
pub const CSR_HPMCOUNTER28 = 0xc1c;
pub const CSR_HPMCOUNTER29 = 0xc1d;
pub const CSR_HPMCOUNTER30 = 0xc1e;
pub const CSR_HPMCOUNTER31 = 0xc1f;
pub const CSR_SSTATUS = 0x100;
pub const CSR_SIE = 0x104;
pub const CSR_STVEC = 0x105;
pub const CSR_SSCRATCH = 0x140;
pub const CSR_SEPC = 0x141;
pub const CSR_SCAUSE = 0x142;
pub const CSR_SBADADDR = 0x143;
pub const CSR_SIP = 0x144;
pub const CSR_SPTBR = 0x180;
pub const CSR_MSTATUS = 0x300;
pub const CSR_MISA = 0x301;
pub const CSR_MEDELEG = 0x302;
pub const CSR_MIDELEG = 0x303;
pub const CSR_MIE = 0x304;
pub const CSR_MTVEC = 0x305;
pub const CSR_MCOUNTEREN = 0x306;
pub const CSR_MSCRATCH = 0x340;
pub const CSR_MEPC = 0x341;
pub const CSR_MCAUSE = 0x342;
pub const CSR_MBADADDR = 0x343;
pub const CSR_MIP = 0x344;
pub const CSR_TSELECT = 0x7a0;
pub const CSR_TDATA1 = 0x7a1;
pub const CSR_TDATA2 = 0x7a2;
pub const CSR_TDATA3 = 0x7a3;
pub const CSR_DCSR = 0x7b0;
pub const CSR_DPC = 0x7b1;
pub const CSR_DSCRATCH = 0x7b2;
pub const CSR_MCYCLE = 0xb00;
pub const CSR_MINSTRET = 0xb02;
pub const CSR_MHPMCOUNTER3 = 0xb03;
pub const CSR_MHPMCOUNTER4 = 0xb04;
pub const CSR_MHPMCOUNTER5 = 0xb05;
pub const CSR_MHPMCOUNTER6 = 0xb06;
pub const CSR_MHPMCOUNTER7 = 0xb07;
pub const CSR_MHPMCOUNTER8 = 0xb08;
pub const CSR_MHPMCOUNTER9 = 0xb09;
pub const CSR_MHPMCOUNTER10 = 0xb0a;
pub const CSR_MHPMCOUNTER11 = 0xb0b;
pub const CSR_MHPMCOUNTER12 = 0xb0c;
pub const CSR_MHPMCOUNTER13 = 0xb0d;
pub const CSR_MHPMCOUNTER14 = 0xb0e;
pub const CSR_MHPMCOUNTER15 = 0xb0f;
pub const CSR_MHPMCOUNTER16 = 0xb10;
pub const CSR_MHPMCOUNTER17 = 0xb11;
pub const CSR_MHPMCOUNTER18 = 0xb12;
pub const CSR_MHPMCOUNTER19 = 0xb13;
pub const CSR_MHPMCOUNTER20 = 0xb14;
pub const CSR_MHPMCOUNTER21 = 0xb15;
pub const CSR_MHPMCOUNTER22 = 0xb16;
pub const CSR_MHPMCOUNTER23 = 0xb17;
pub const CSR_MHPMCOUNTER24 = 0xb18;
pub const CSR_MHPMCOUNTER25 = 0xb19;
pub const CSR_MHPMCOUNTER26 = 0xb1a;
pub const CSR_MHPMCOUNTER27 = 0xb1b;
pub const CSR_MHPMCOUNTER28 = 0xb1c;
pub const CSR_MHPMCOUNTER29 = 0xb1d;
pub const CSR_MHPMCOUNTER30 = 0xb1e;
pub const CSR_MHPMCOUNTER31 = 0xb1f;
pub const CSR_MUCOUNTEREN = 0x320;
pub const CSR_MSCOUNTEREN = 0x321;
pub const CSR_MHPMEVENT3 = 0x323;
pub const CSR_MHPMEVENT4 = 0x324;
pub const CSR_MHPMEVENT5 = 0x325;
pub const CSR_MHPMEVENT6 = 0x326;
pub const CSR_MHPMEVENT7 = 0x327;
pub const CSR_MHPMEVENT8 = 0x328;
pub const CSR_MHPMEVENT9 = 0x329;
pub const CSR_MHPMEVENT10 = 0x32a;
pub const CSR_MHPMEVENT11 = 0x32b;
pub const CSR_MHPMEVENT12 = 0x32c;
pub const CSR_MHPMEVENT13 = 0x32d;
pub const CSR_MHPMEVENT14 = 0x32e;
pub const CSR_MHPMEVENT15 = 0x32f;
pub const CSR_MHPMEVENT16 = 0x330;
pub const CSR_MHPMEVENT17 = 0x331;
pub const CSR_MHPMEVENT18 = 0x332;
pub const CSR_MHPMEVENT19 = 0x333;
pub const CSR_MHPMEVENT20 = 0x334;
pub const CSR_MHPMEVENT21 = 0x335;
pub const CSR_MHPMEVENT22 = 0x336;
pub const CSR_MHPMEVENT23 = 0x337;
pub const CSR_MHPMEVENT24 = 0x338;
pub const CSR_MHPMEVENT25 = 0x339;
pub const CSR_MHPMEVENT26 = 0x33a;
pub const CSR_MHPMEVENT27 = 0x33b;
pub const CSR_MHPMEVENT28 = 0x33c;
pub const CSR_MHPMEVENT29 = 0x33d;
pub const CSR_MHPMEVENT30 = 0x33e;
pub const CSR_MHPMEVENT31 = 0x33f;
pub const CSR_MVENDORID = 0xf11;
pub const CSR_MARCHID = 0xf12;
pub const CSR_MIMPID = 0xf13;
pub const CSR_MHARTID = 0xf14;
pub const CSR_CYCLEH = 0xc80;
pub const CSR_TIMEH = 0xc81;
pub const CSR_INSTRETH = 0xc82;
pub const CSR_HPMCOUNTER3H = 0xc83;
pub const CSR_HPMCOUNTER4H = 0xc84;
pub const CSR_HPMCOUNTER5H = 0xc85;
pub const CSR_HPMCOUNTER6H = 0xc86;
pub const CSR_HPMCOUNTER7H = 0xc87;
pub const CSR_HPMCOUNTER8H = 0xc88;
pub const CSR_HPMCOUNTER9H = 0xc89;
pub const CSR_HPMCOUNTER10H = 0xc8a;
pub const CSR_HPMCOUNTER11H = 0xc8b;
pub const CSR_HPMCOUNTER12H = 0xc8c;
pub const CSR_HPMCOUNTER13H = 0xc8d;
pub const CSR_HPMCOUNTER14H = 0xc8e;
pub const CSR_HPMCOUNTER15H = 0xc8f;
pub const CSR_HPMCOUNTER16H = 0xc90;
pub const CSR_HPMCOUNTER17H = 0xc91;
pub const CSR_HPMCOUNTER18H = 0xc92;
pub const CSR_HPMCOUNTER19H = 0xc93;
pub const CSR_HPMCOUNTER20H = 0xc94;
pub const CSR_HPMCOUNTER21H = 0xc95;
pub const CSR_HPMCOUNTER22H = 0xc96;
pub const CSR_HPMCOUNTER23H = 0xc97;
pub const CSR_HPMCOUNTER24H = 0xc98;
pub const CSR_HPMCOUNTER25H = 0xc99;
pub const CSR_HPMCOUNTER26H = 0xc9a;
pub const CSR_HPMCOUNTER27H = 0xc9b;
pub const CSR_HPMCOUNTER28H = 0xc9c;
pub const CSR_HPMCOUNTER29H = 0xc9d;
pub const CSR_HPMCOUNTER30H = 0xc9e;
pub const CSR_HPMCOUNTER31H = 0xc9f;
pub const CSR_MCYCLEH = 0xb80;
pub const CSR_MINSTRETH = 0xb82;
pub const CSR_MHPMCOUNTER3H = 0xb83;
pub const CSR_MHPMCOUNTER4H = 0xb84;
pub const CSR_MHPMCOUNTER5H = 0xb85;
pub const CSR_MHPMCOUNTER6H = 0xb86;
pub const CSR_MHPMCOUNTER7H = 0xb87;
pub const CSR_MHPMCOUNTER8H = 0xb88;
pub const CSR_MHPMCOUNTER9H = 0xb89;
pub const CSR_MHPMCOUNTER10H = 0xb8a;
pub const CSR_MHPMCOUNTER11H = 0xb8b;
pub const CSR_MHPMCOUNTER12H = 0xb8c;
pub const CSR_MHPMCOUNTER13H = 0xb8d;
pub const CSR_MHPMCOUNTER14H = 0xb8e;
pub const CSR_MHPMCOUNTER15H = 0xb8f;
pub const CSR_MHPMCOUNTER16H = 0xb90;
pub const CSR_MHPMCOUNTER17H = 0xb91;
pub const CSR_MHPMCOUNTER18H = 0xb92;
pub const CSR_MHPMCOUNTER19H = 0xb93;
pub const CSR_MHPMCOUNTER20H = 0xb94;
pub const CSR_MHPMCOUNTER21H = 0xb95;
pub const CSR_MHPMCOUNTER22H = 0xb96;
pub const CSR_MHPMCOUNTER23H = 0xb97;
pub const CSR_MHPMCOUNTER24H = 0xb98;
pub const CSR_MHPMCOUNTER25H = 0xb99;
pub const CSR_MHPMCOUNTER26H = 0xb9a;
pub const CSR_MHPMCOUNTER27H = 0xb9b;
pub const CSR_MHPMCOUNTER28H = 0xb9c;
pub const CSR_MHPMCOUNTER29H = 0xb9d;
pub const CSR_MHPMCOUNTER30H = 0xb9e;
pub const CSR_MHPMCOUNTER31H = 0xb9f;
pub const CSR_MTVT = 0x307;
pub const CSR_MNXTI = 0x345;
pub const CSR_MCOUNTINHIBIT = 0x320;
pub const CSR_MNVEC = 0x7C3;
pub const CSR_MTVT2 = 0x7EC;
pub const CSR_JALMNXTI = 0x7ED;
pub const CSR_PUSHMCAUSE = 0x7EE;
pub const CSR_PUSHMEPC = 0x7EF;
pub const CSR_PUSHMSUBM = 0x7EB;
pub const CSR_WFE = 0x810;
pub const CSR_SLEEPVALUE = 0x811;
pub const CSR_TXEVT = 0x812;
pub const CSR_MMISC_CTL = 0x7d0;
pub const CSR_MSUBM = 0x7c4;
pub const CAUSE_MISALIGNED_FETCH = 0x0;
pub const CAUSE_FAULT_FETCH = 0x1;
pub const CAUSE_ILLEGAL_INSTRUCTION = 0x2;
pub const CAUSE_BREAKPOINT = 0x3;
pub const CAUSE_MISALIGNED_LOAD = 0x4;
pub const CAUSE_FAULT_LOAD = 0x5;
pub const CAUSE_MISALIGNED_STORE = 0x6;
pub const CAUSE_FAULT_STORE = 0x7;
pub const CAUSE_USER_ECALL = 0x8;
pub const CAUSE_SUPERVISOR_ECALL = 0x9;
pub const CAUSE_HYPERVISOR_ECALL = 0xa;
pub const CAUSE_MACHINE_ECALL = 0xb;
