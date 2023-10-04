const mmio = @import("microzig").mmio;

pub const Type = extern struct {
    // 0x0
    i2s_config: mmio.Mmio(packed struct(u32) {
        cr_i2s_m_en: u1,
        cr_i2s_s_en: u1,
        cr_i2s_txd_en: u1,
        cr_i2s_rxd_en: u1,
        cr_mono_mode: u1,
        cr_mute_mode: u1,
        cr_fs_1t_mode: u1,
        cr_fs_ch_cnt: u2,
        reserved9: u3,
        cr_frame_size: u2,
        cr_data_size: u2,
        cr_i2s_mode: u2,
        cr_endian: u1,
        cr_mono_rx_ch: u1,
        cr_ofs_cnt: u5,
        cr_ofs_en: u1,
        reserved26: u6,
    }),

    // 0x4
    i2s_int_sts: mmio.Mmio(packed struct(u32) {
        txf_int: u1,
        rxf_int: u1,
        fer_int: u1,
        reserved3: u5,
        cr_i2s_txf_mask: u1,
        cr_i2s_rxf_mask: u1,
        cr_i2s_fer_mask: u1,
        reserved11: u13,
        cr_i2s_txf_en: u1,
        cr_i2s_rxf_en: u1,
        cr_i2s_fer_en: u1,
        reserved27: u5,
    }),

    padding8: [2]u32,
    // 0x10
    i2s_bclk_config: mmio.Mmio(packed struct(u32) {
        cr_bclk_div_l: u12,
        reserved12: u4,
        cr_bclk_div_h: u12,
        reserved28: u4,
    }),

    padding20: [27]u32,
    // 0x80
    i2s_fifo_config_0: mmio.Mmio(packed struct(u32) {
        dma_tx_en: u1,
        dma_rx_en: u1,
        tx_fifo_clr: u1,
        rx_fifo_clr: u1,
        tx_fifo_overflow: u1,
        tx_fifo_underflow: u1,
        rx_fifo_overflow: u1,
        rx_fifo_underflow: u1,
        cr_fifo_lr_merge: u1,
        cr_fifo_lr_exchg: u1,
        cr_fifo_24b_lj: u1,
        reserved11: u21,
    }),

    // 0x84
    i2s_fifo_config_1: mmio.Mmio(packed struct(u32) {
        tx_fifo_cnt: u5,
        reserved5: u3,
        rx_fifo_cnt: u5,
        reserved13: u3,
        tx_fifo_th: u4,
        reserved20: u4,
        rx_fifo_th: u4,
        reserved28: u4,
    }),

    // 0x88
    i2s_fifo_wdata: mmio.Mmio(packed struct(u32) {
        fifo_wdata: u32,
    }),

    // 0x8c
    i2s_fifo_rdata: mmio.Mmio(packed struct(u32) {
        fifo_rdata: u32,
    }),

    padding144: [27]u32,
    // 0xfc
    i2s_io_config: mmio.Mmio(packed struct(u32) {
        cr_i2s_txd_inv: u1,
        cr_i2s_rxd_inv: u1,
        cr_i2s_fs_inv: u1,
        cr_i2s_bclk_inv: u1,
        cr_deg_cnt: u3,
        cr_deg_en: u1,
        reserved8: u24,
    }),
};
