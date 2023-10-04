const mmio = @import("microzig").mmio;

pub const Type = extern struct {
    // 0x0
    irtx_config: mmio.Mmio(packed struct(u32) {
        cr_irtx_en: u1,
        cr_irtx_out_inv: u1,
        cr_irtx_mod_en: u1,
        cr_irtx_swm_en: u1,
        cr_irtx_data_en: u1,
        cr_irtx_logic0_hl_inv: u1,
        cr_irtx_logic1_hl_inv: u1,
        reserved7: u1,
        cr_irtx_head_en: u1,
        cr_irtx_head_hl_inv: u1,
        cr_irtx_tail_en: u1,
        cr_irtx_tail_hl_inv: u1,
        cr_irtx_frm_en: u1,
        cr_irtx_frm_cont_en: u1,
        cr_irtx_frm_frame_size: u2,
        cr_irtx_data_num: u7,
        reserved23: u9,
    }),

    // 0x4
    irtx_int_sts: mmio.Mmio(packed struct(u32) {
        irtx_end_int: u1,
        irtx_frdy_int: u1,
        irtx_fer_int: u1,
        reserved3: u5,
        cr_irtx_end_mask: u1,
        cr_irtx_frdy_mask: u1,
        cr_irtx_fer_mask: u1,
        reserved11: u5,
        cr_irtx_end_clr: u1,
        reserved17: u7,
        cr_irtx_end_en: u1,
        cr_irtx_frdy_en: u1,
        cr_irtx_fer_en: u1,
        reserved27: u5,
    }),

    padding8: [2]u32,
    // 0x10
    irtx_pulse_width: mmio.Mmio(packed struct(u32) {
        cr_irtx_pw_unit: u12,
        reserved12: u4,
        cr_irtx_mod_ph0_w: u8,
        cr_irtx_mod_ph1_w: u8,
    }),

    // 0x14
    irtx_pw_0: mmio.Mmio(packed struct(u32) {
        cr_irtx_logic0_ph0_w: u8,
        cr_irtx_logic0_ph1_w: u8,
        cr_irtx_logic1_ph0_w: u8,
        cr_irtx_logic1_ph1_w: u8,
    }),

    // 0x18
    irtx_pw_1: mmio.Mmio(packed struct(u32) {
        cr_irtx_head_ph0_w: u8,
        cr_irtx_head_ph1_w: u8,
        cr_irtx_tail_ph0_w: u8,
        cr_irtx_tail_ph1_w: u8,
    }),

    padding28: [9]u32,
    // 0x40
    irrx_config: mmio.Mmio(packed struct(u32) {
        cr_irrx_en: u1,
        cr_irrx_in_inv: u1,
        cr_irrx_mode: u2,
        cr_irrx_deg_en: u1,
        reserved5: u3,
        cr_irrx_deg_cnt: u4,
        reserved12: u20,
    }),

    // 0x44
    irrx_int_sts: mmio.Mmio(packed struct(u32) {
        irrx_end_int: u1,
        irrx_frdy_int: u1,
        irrx_fer_int: u1,
        reserved3: u5,
        cr_irrx_end_mask: u1,
        cr_irrx_frdy_mask: u1,
        cr_irrx_fer_mask: u1,
        reserved11: u5,
        cr_irrx_end_clr: u1,
        reserved17: u7,
        cr_irrx_end_en: u1,
        cr_irrx_frdy_en: u1,
        cr_irrx_fer_en: u1,
        reserved27: u5,
    }),

    // 0x48
    irrx_pw_config: mmio.Mmio(packed struct(u32) {
        cr_irrx_data_th: u16,
        cr_irrx_end_th: u16,
    }),

    padding76: [1]u32,
    // 0x50
    irrx_data_count: mmio.Mmio(packed struct(u32) {
        sts_irrx_data_cnt: u7,
        reserved7: u25,
    }),

    // 0x54
    irrx_data_word0: mmio.Mmio(packed struct(u32) {
        sts_irrx_data_word0: u32,
    }),

    // 0x58
    irrx_data_word1: mmio.Mmio(packed struct(u32) {
        sts_irrx_data_word1: u32,
    }),

    padding92: [9]u32,
    // 0x80
    ir_fifo_config_0: mmio.Mmio(packed struct(u32) {
        irtx_dma_en: u1,
        reserved1: u1,
        tx_fifo_clr: u1,
        rx_fifo_clr: u1,
        tx_fifo_overflow: u1,
        tx_fifo_underflow: u1,
        rx_fifo_overflow: u1,
        rx_fifo_underflow: u1,
        reserved8: u24,
    }),

    // 0x84
    ir_fifo_config_1: mmio.Mmio(packed struct(u32) {
        tx_fifo_cnt: u3,
        reserved3: u5,
        rx_fifo_cnt: u7,
        reserved15: u1,
        tx_fifo_th: u2,
        reserved18: u6,
        rx_fifo_th: u6,
        reserved30: u2,
    }),

    // 0x88
    ir_fifo_wdata: mmio.Mmio(packed struct(u32) {
        tx_fifo_wdata: u32,
    }),

    // 0x8c
    ir_fifo_rdata: mmio.Mmio(packed struct(u32) {
        rx_fifo_rdata: u16,
        reserved16: u16,
    }),
};
