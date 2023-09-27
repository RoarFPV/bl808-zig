const std = @import("std");
const microzig = @import("../../deps/microzig/build.zig");
const LazyPath = std.build.LazyPath;

fn root_dir() []const u8 {
    return std.fs.path.dirname(@src().file) orelse ".";
}

const chip_path = LazyPath{ .path = std.fmt.comptimePrint("{s}/chips/bl808.zig", .{root_dir()}) };
const cpu_path = LazyPath{ .path = std.fmt.comptimePrint("{s}/cpus/riscv32.zig", .{root_dir()}) };

const hal_path = LazyPath{ .path = std.fmt.comptimePrint("{s}/hal.zig", .{root_dir()}) };
const json_register_schema_path = LazyPath{ .path = std.fmt.comptimePrint("{s}/chips/bl808.json", .{root_dir()}) };

pub const riscv = struct {
    const Cpu = std.Target.Cpu;
    const target = std.Target.riscv;

    pub const rv32imafcp = Cpu.Model{
        .name = "sifive_e24",
        .llvm_name = "rv32imafcp",
        .features = target.featureSet(&[_]target.Feature{
            .@"32bit",
            .a,
            .c,
            .f,
            .m,
            //.p,
        }),
    };

    pub const rv32emc = Cpu.Model{
        .name = "generic_rv32",
        .llvm_name = "rv32emc",
        .features = target.featureSet(&[_]target.Feature{
            .@"32bit",
            .e,
            .m,
            .c,
        }),
    };

    pub const rv64imafcv = Cpu.Model{
        .name = "generic_rv64",
        .llvm_name = "rv64imafcv",
        .features = target.featureSet(&[_]target.Feature{
            .@"64bit",
            .m,
            .a,
            .f,
            .c,
            .v,
        }),
    };
};

pub const bl808 = struct {

    //     __EM_SIZE = DEFINED(btble_controller_init) ? 32K : 0K;

    // MEMORY
    // {
    //     fw_header_memory  (rx)  : ORIGIN = 0x58000000 - 0x1000, LENGTH = 4K
    //     xip_memory  (rx)  : ORIGIN = 0x58000000, LENGTH = 32M
    //     ram_psram  (wxa)  : ORIGIN = 0x50000000, LENGTH = 64M
    //     itcm_memory (rx)  : ORIGIN = 0x62020000, LENGTH = 20K
    //     dtcm_memory (rx)  : ORIGIN = 0x62025000, LENGTH = 4K
    //     nocache_ram_memory (!rx) : ORIGIN = 0x22026000, LENGTH = 16K
    //     ram_memory  (!rx) : ORIGIN = 0x6202A000, LENGTH = 24K
    //     ram_wifi  (wxa)   : ORIGIN = 0x22030000, LENGTH = 160K - __EM_SIZE
    //     xram_memory  (!rx) : ORIGIN = 0x40000000, LENGTH = 16K
    // }

    pub const fw_header_memory = .{ .custom = .{ .name = "fw_header_memory", .executable = true, .readable = true, .writeable = false } };
    pub const xip_memory = .{ .custom = .{ .name = "xip_memory", .executable = true, .readable = true, .writeable = false } };

    pub const Memory = .{
        .{ .kind = fw_header_memory, .offset = 0x58000000 - 0x1000, .length = 4 * 1024 },

        .{ .kind = .flash, .offset = 0x58000000, .length = 32 * 1024 * 1024 },
        .{ .kind = xip_memory, .offset = 0x58000000, .length = 32 * 1024 * 1024 },
        .{ .kind = .ram, .offset = 0x62030000, .length = 160 * 1024 },
        .{ .kind = .ram, .offset = 0x62020000, .length = 20 * 1024 }, // itcm_memory
        .{ .kind = .ram, .offset = 0x62025000, .length = 4 * 1024 }, // dtcm_memory
        .{ .kind = .ram, .offset = 0x22026000, .length = 16 * 1024 }, // nocache_ram_memory
        .{ .kind = .ram, .offset = 0x6202A000, .length = 24 * 1024 }, // ram_memory
        .{ .kind = .ram, .offset = 0x22030000, .length = 160 * 1024 }, // ram_wifi
        .{ .kind = .ram, .offset = 0x40000000, .length = 16 * 1024 }, // xram_memory
    };

    pub const cpus = struct {
        pub const thead = struct {
            // - T-Head C906
            // - RV64IMAFCV
            // - https://xrvm.com/cpu-details?id=4056751997003636736
            // - https://github.com/T-head-Semi/openc906 ????
            pub const c906 = microzig.Cpu{
                .name = "c906",
                .source = cpu_path,
                .target = std.zig.CrossTarget{
                    .cpu_arch = .riscv64,
                    .cpu_model = .{ .explicit = &riscv.rv64imafcv },
                    .os_tag = .freestanding,
                    .abi = .none,
                },
            };

            // - T-Head E907
            // - RV32IMAFCP
            pub const e907 = microzig.Cpu{
                .name = "e907",
                .source = cpu_path,
                .target = std.zig.CrossTarget{
                    .cpu_arch = .riscv32,
                    .cpu_model = .{ .explicit = &riscv.rv32imafcp },
                    .os_tag = .freestanding,
                    .abi = .none,
                },
            };

            // - T-Head E902
            // - RV32EMC
            pub const e902 = microzig.Cpu{
                .name = "e902",
                .source = cpu_path,
                .target = std.zig.CrossTarget{
                    .cpu_arch = .riscv32,
                    .cpu_model = .{ .explicit = &riscv.rv32emc },
                    .os_tag = .freestanding,
                    .abi = .none,
                },
            };
        };
    };

    pub const cores = struct {
        // # DO
        // - T-Head C906
        // - RV64IMAFCV
        // - https://xrvm.com/cpu-details?id=4056751997003636736
        // - https://github.com/T-head-Semi/openc906 ????
        pub const d0 = microzig.Chip{
            .name = "D0",
            .source = .{ .path = chip_path },
            .hal = .{ .path = hal_path },
            .cpu = cpus.thead.c906,
            .memory_regions = &Memory,
            .json_register_schema = .{
                .path = json_register_schema_path,
            },
        };

        // # M0:
        // - T-Head E907
        // - RV32IMAFCP
        pub const m0 = microzig.Chip{
            .name = "M0",
            .source = chip_path,
            .hal = hal_path,
            .cpu = cpus.thead.e907,
            .memory_regions = &Memory,
            .json_register_schema = json_register_schema_path,
        };

        // # LP:
        // - T-Head E902
        // - RV32EMC
        pub const lp = microzig.Chip{
            .name = "LP",
            .source = chip_path,
            .hal = hal_path,
            .cpu = cpus.thead.e902,
            .memory_regions = &Memory,
            .json_register_schema = json_register_schema_path,
        };
    };
};
