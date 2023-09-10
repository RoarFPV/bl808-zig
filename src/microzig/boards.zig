const std = @import("std");
const microzig = @import("../../deps/microzig/build.zig");
const chips = @import("chips.zig");

fn root_dir() []const u8 {
    return std.fs.path.dirname(@src().file) orelse ".";
}

fn boards(comptime file: []const u8) std.build.LazyPath {
    return std.fmt.comptimePrint("{s}/boards/{s}", .{ root_dir(), file });
}

pub const pine = struct {
    pub const ox64 = .{
        .linkerscript = boards("ox64/M0.ld"),
        .board = microzig.Board{
            .name = "PINE Ox64",
            .source = boards("ox64/board.zig"),
            .chip = chips.bl808.cores.m0,
        },
    };
};

pub const sipeed = struct {
    pub const m1s = .{
        .linkerscript = boards("m1s/M0.ld"),
        .board = microzig.Board{
            .name = "Sipeed M1s Dock",
            .source = boards("m1s/board.zig"),
            .chip = chips.bl808.cores.m0,
        },
    };
};
