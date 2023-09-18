const std = @import("std");

pub const aon = @import("hal/aon.zig");
pub const glb = @import("hal/glb.zig");

pub fn init() void {
    aon.xtal.powerOn();
}
