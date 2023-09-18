const std = @import("std");
const microzig = @import("microzig");

const cpu = microzig.cpu;
const bl808 = microzig.chip;
const regs = microzig.chip.peripherals;

const PDS = regs.PDS;

pub const M0 = struct {
    pub fn enable() void {
        //return PDS.
    }
};
