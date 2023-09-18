const std = @import("std");
const microzig = @import("microzig");
//const hal = microzig.hal;
const cpu = microzig.cpu;
const bl808 = microzig.chip;
const regs = microzig.chip.peripherals;

pub fn main() !void {
    while (true) {
        std.mem.doNotOptimizeAway(true);

        var a = bl808.bl_fw_header.magiccode;

        while (a > 0) {
            std.mem.doNotOptimizeAway(true);
            a -= 1;
        }
    }
}
