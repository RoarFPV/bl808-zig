const std = @import("std");
const Builder = std.build.Builder;
const Pkg = std.build.Pkg;
const comptimePrint = std.fmt.comptimePrint;
const LazyPath = std.build.LazyPath;
const microzig = @import("deps/microzig/build.zig");

// this build script is mostly for testing and verification of this
// package. In an attempt to modularize -- designing for a case where a
// project requires multiple HALs, it accepts microzig as a param
pub fn build(b: *Builder) !void {
    const optimize = b.standardOptimizeOption(.{});
    const chips = @import("src/microzig/chips.zig");
    _ = chips;
    const boards = @import("src/microzig/boards.zig");

    const board = boards.sipeed.m1s;

    var exe = microzig.addEmbeddedExecutable(b, .{
        .name = "firmware.elf",
        .source_file = .{ .path = "src/main.zig" },
        .backing = .{ .board = board.board },
        .optimize = optimize,
        .linkerscript_source_file = .{ .path = board.linkerscript },
    });
    exe.installArtifact(b);
}

fn root() []const u8 {
    return comptime (std.fs.path.dirname(@src().file) orelse ".") ++ "/";
}
