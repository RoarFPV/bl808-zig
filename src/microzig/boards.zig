const std = @import("std");
const microzig = @import("../../deps/microzig/build.zig");
const chips = @import("chips.zig");

fn root_dir() []const u8 {
    return std.fs.path.dirname(@src().file) orelse ".";
}

fn cpus(comptime file: []const u8) std.build.LazyPath {
    return microzigFolder("cpus", file);
}

fn boards(comptime file: []const u8) std.build.LazyPath {
    return microzigFolder("boards", file);
}

fn microzigFolder(comptime folder: []const u8, comptime file: []const u8) std.build.LazyPath {
    return .{ .path = std.fmt.comptimePrint("{s}/{s}/{s}", .{ root_dir(), folder, file }) };
}

pub const pine = struct {
    pub const ox64 = .{
        .linkerscript = cpus("M0.ld"),
        .backing = .{
            .board = .{
                .name = "PINE Ox64",
                .source = boards("pine/ox64/board.zig"),
                .chip = chips.bl808.cores.m0,
            },
        },
    };
};

pub const sipeed = struct {
    pub const m1s = .{
        .linkerscript = cpus("M0_e907.ld"),
        .backing = .{
            .board = .{
                .name = "Sipeed M1s Dock",
                .source = boards("sipeed/m1s/board.zig"),
                .chip = chips.bl808.cores.m0,
            },
        },
    };
};
