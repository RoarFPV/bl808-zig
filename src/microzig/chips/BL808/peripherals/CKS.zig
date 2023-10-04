const mmio = @import("microzig").mmio;

pub const Type = extern struct {
    // 0x0
    cks_config: mmio.Mmio(packed struct(u32) {
        cr_cks_clr: u1,
        cr_cks_byte_swap: u1,
        reserved2: u30,
    }),

    // 0x4
    data_in: mmio.Mmio(packed struct(u32) {
        data_in: u8,
        reserved8: u24,
    }),

    // 0x8
    cks_out: mmio.Mmio(packed struct(u32) {
        out: u16,
        reserved16: u16,
    }),
};
