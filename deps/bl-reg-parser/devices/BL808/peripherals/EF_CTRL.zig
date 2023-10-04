const mmio = @import("microzig").mmio;

pub const Type = extern struct {
    padding0: [515]u32,
    // 0x80c
    ef_if_0_manual: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    padding2064: [60]u32,
    // 0x900
    ef_if_ctrl_1: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    // 0x904
    ef_if_1_manual: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    // 0x908
    ef_if_1_status: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),
};
