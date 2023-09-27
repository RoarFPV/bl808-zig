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
    const boards = @import("src/microzig/boards.zig");

    const board = boards.sipeed.m1s;

    var exe = microzig.addEmbeddedExecutable(b, .{
        .name = "firmware.elf",
        .source_file = .{ .path = "src/main.zig" },
        .backing = board.backing,
        .optimize = optimize,
        .linkerscript_source_file = board.linkerscript,
    });

    const fw_objcopy = b.addObjCopy(exe.inner.getEmittedBin(), .{
        .format = .bin,
    });

    const fw_bin = fw_objcopy.getOutput();

    const install_fw_bin = b.addInstallFile(fw_bin, "bin/firmware.bin");

    b.getInstallStep().dependOn(&install_fw_bin.step);

    exe.installArtifact(b);

    // post process commands
    //  # firmware.bin must be delete if it exists or this will fail
    //  - riscv64-unknown-elf-objcopy -Obinary ./zig-out/bin/firmware.elf ./zig-out/bin/firmware.bin
    //
    //  - deps/openbouffalo/bl_mcu_sdk/tools/bflb_tools/bflb_fw_post_proc/bflb_fw_post_proc --chipname=bl808 --imgfile=zig-out/bin/firmware.bin --brdcfgdir=deps/openbouffalo/OBLFR/bsp/ox64/config

    // #Debugging:
    //  - setup env
    //    - ```source deps/openbouffalo/setup-env.sh
    //  - openocd: M0
    //    - ``` openocd -f deps/openocd/tigard.cfg -f deps/openocd/tgt_e907.cfg ```
    //  - GDB:
    //    - ``` riscv64-unknown-elf-gdb -x deps/openocd/gdbinit/bl808.init ```

}

fn root() []const u8 {
    return comptime (std.fs.path.dirname(@src().file) orelse ".") ++ "/";
}
