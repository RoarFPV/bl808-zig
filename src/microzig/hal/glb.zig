const std = @import("std");
const microzig = @import("microzig");

const cpu = microzig.cpu;
const bl808 = microzig.chip;
const regs = microzig.chip.peripherals;

const GLB = regs.GLB;
