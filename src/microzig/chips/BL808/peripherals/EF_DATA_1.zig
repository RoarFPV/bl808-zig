const mmio = @import("microzig").mmio;

pub const Type = extern struct {
    padding0: [32]u32,
    // 0x80
    ef_key_slot_4_w0: mmio.Mmio(packed struct(u32) {
        ef_key_slot_4_w0: u32,
    }),

    // 0x84
    ef_key_slot_4_w1: mmio.Mmio(packed struct(u32) {
        ef_key_slot_4_w1: u32,
    }),

    // 0x88
    ef_key_slot_4_w2: mmio.Mmio(packed struct(u32) {
        ef_key_slot_4_w2: u32,
    }),

    // 0x8c
    ef_key_slot_4_w3: mmio.Mmio(packed struct(u32) {
        ef_key_slot_4_w3: u32,
    }),

    // 0x90
    ef_key_slot_5_w0: mmio.Mmio(packed struct(u32) {
        ef_key_slot_5_w0: u32,
    }),

    // 0x94
    ef_key_slot_5_w1: mmio.Mmio(packed struct(u32) {
        ef_key_slot_5_w1: u32,
    }),

    // 0x98
    ef_key_slot_5_w2: mmio.Mmio(packed struct(u32) {
        ef_key_slot_5_w2: u32,
    }),

    // 0x9c
    ef_key_slot_5_w3: mmio.Mmio(packed struct(u32) {
        ef_key_slot_5_w3: u32,
    }),

    // 0xa0
    ef_key_slot_6_w0: mmio.Mmio(packed struct(u32) {
        ef_key_slot_6_w0: u32,
    }),

    // 0xa4
    ef_key_slot_6_w1: mmio.Mmio(packed struct(u32) {
        ef_key_slot_6_w1: u32,
    }),

    // 0xa8
    ef_key_slot_6_w2: mmio.Mmio(packed struct(u32) {
        ef_key_slot_6_w2: u32,
    }),

    // 0xac
    ef_key_slot_6_w3: mmio.Mmio(packed struct(u32) {
        ef_key_slot_6_w3: u32,
    }),

    // 0xb0
    ef_key_slot_7_w0: mmio.Mmio(packed struct(u32) {
        ef_key_slot_7_w0: u32,
    }),

    // 0xb4
    ef_key_slot_7_w1: mmio.Mmio(packed struct(u32) {
        ef_key_slot_7_w1: u32,
    }),

    // 0xb8
    ef_key_slot_7_w2: mmio.Mmio(packed struct(u32) {
        ef_key_slot_7_w2: u32,
    }),

    // 0xbc
    ef_key_slot_7_w3: mmio.Mmio(packed struct(u32) {
        ef_key_slot_7_w3: u32,
    }),

    // 0xc0
    ef_key_slot_8_w0: mmio.Mmio(packed struct(u32) {
        ef_key_slot_8_w0: u32,
    }),

    // 0xc4
    ef_key_slot_8_w1: mmio.Mmio(packed struct(u32) {
        ef_key_slot_8_w1: u32,
    }),

    // 0xc8
    ef_key_slot_8_w2: mmio.Mmio(packed struct(u32) {
        ef_key_slot_8_w2: u32,
    }),

    // 0xcc
    ef_key_slot_8_w3: mmio.Mmio(packed struct(u32) {
        ef_key_slot_8_w3: u32,
    }),

    // 0xd0
    ef_key_slot_9_w0: mmio.Mmio(packed struct(u32) {
        ef_key_slot_9_w0: u32,
    }),

    // 0xd4
    ef_key_slot_9_w1: mmio.Mmio(packed struct(u32) {
        ef_key_slot_9_w1: u32,
    }),

    // 0xd8
    ef_key_slot_9_w2: mmio.Mmio(packed struct(u32) {
        ef_key_slot_9_w2: u32,
    }),

    // 0xdc
    ef_key_slot_9_w3: mmio.Mmio(packed struct(u32) {
        ef_key_slot_9_w3: u32,
    }),

    // 0xe0
    ef_key_slot_10_w0: mmio.Mmio(packed struct(u32) {
        ef_key_slot_10_w0: u32,
    }),

    // 0xe4
    ef_key_slot_10_w1: mmio.Mmio(packed struct(u32) {
        ef_key_slot_10_w1: u32,
    }),

    // 0xe8
    ef_key_slot_10_w2: mmio.Mmio(packed struct(u32) {
        ef_key_slot_10_w2: u32,
    }),

    // 0xec
    ef_key_slot_10_w3: mmio.Mmio(packed struct(u32) {
        ef_key_slot_10_w3: u32,
    }),

    // 0xf0
    ef_dat_1_rsvd_0: mmio.Mmio(packed struct(u32) {
        ef_dat_1_rsvd_0: u32,
    }),

    // 0xf4
    ef_dat_1_rsvd_1: mmio.Mmio(packed struct(u32) {
        ef_dat_1_rsvd_1: u32,
    }),

    // 0xf8
    ef_dat_1_rsvd_2: mmio.Mmio(packed struct(u32) {
        ef_dat_1_rsvd_2: u32,
    }),

    // 0xfc
    lock: mmio.Mmio(packed struct(u32) {
        wr_lock_rsvd_1: u15,
        wr_lock_key_slot_4: u1,
        wr_lock_key_slot_5: u1,
        wr_lock_key_slot_6: u1,
        wr_lock_key_slot_7: u1,
        wr_lock_key_slot_8: u1,
        wr_lock_key_slot_9: u1,
        wr_lock_key_slot_10: u1,
        wr_lock_dat_1_rsvd_0: u1,
        wr_lock_dat_1_rsvd_1: u1,
        wr_lock_dat_1_rsvd_2: u1,
        rd_lock_key_slot_4: u1,
        rd_lock_key_slot_5: u1,
        rd_lock_key_slot_6: u1,
        rd_lock_key_slot_7: u1,
        rd_lock_key_slot_8: u1,
        rd_lock_key_slot_9: u1,
        rd_lock_key_slot_10: u1,
    }),
};
