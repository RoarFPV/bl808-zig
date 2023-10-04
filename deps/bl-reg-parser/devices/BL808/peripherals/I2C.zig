const mmio = @import("microzig").mmio;

pub const Type = extern struct {
    // 0x0
    i2c_config: mmio.Mmio(packed struct(u32) {
        cr_i2c_m_en: u1,
        cr_i2c_pkt_dir: u1,
        cr_i2c_deg_en: u1,
        cr_i2c_scl_sync_en: u1,
        cr_i2c_sub_addr_en: u1,
        cr_i2c_sub_addr_bc: u2,
        cr_i2c_10b_addr_en: u1,
        cr_i2c_slv_addr: u10,
        reserved18: u2,
        cr_i2c_pkt_len: u8,
        cr_i2c_deg_cnt: u4,
    }),

    // 0x4
    i2c_int_sts: mmio.Mmio(packed struct(u32) {
        end_int: u1,
        txf_int: u1,
        rxf_int: u1,
        nak_int: u1,
        arb_int: u1,
        fer_int: u1,
        reserved6: u2,
        cr_i2c_end_mask: u1,
        cr_i2c_txf_mask: u1,
        cr_i2c_rxf_mask: u1,
        cr_i2c_nak_mask: u1,
        cr_i2c_arb_mask: u1,
        cr_i2c_fer_mask: u1,
        reserved14: u2,
        cr_i2c_end_clr: u1,
        reserved17: u2,
        cr_i2c_nak_clr: u1,
        cr_i2c_arb_clr: u1,
        reserved21: u3,
        cr_i2c_end_en: u1,
        cr_i2c_txf_en: u1,
        cr_i2c_rxf_en: u1,
        cr_i2c_nak_en: u1,
        cr_i2c_arb_en: u1,
        cr_i2c_fer_en: u1,
        reserved30: u2,
    }),

    // 0x8
    i2c_sub_addr: mmio.Mmio(packed struct(u32) {
        cr_i2c_sub_addr_b0: u8,
        cr_i2c_sub_addr_b1: u8,
        cr_i2c_sub_addr_b2: u8,
        cr_i2c_sub_addr_b3: u8,
    }),

    // 0xc
    i2c_bus_busy: mmio.Mmio(packed struct(u32) {
        sts_i2c_bus_busy: u1,
        cr_i2c_bus_busy_clr: u1,
        reserved2: u30,
    }),

    // 0x10
    i2c_prd_start: mmio.Mmio(packed struct(u32) {
        cr_i2c_prd_s_ph_0: u8,
        cr_i2c_prd_s_ph_1: u8,
        cr_i2c_prd_s_ph_2: u8,
        cr_i2c_prd_s_ph_3: u8,
    }),

    // 0x14
    i2c_prd_stop: mmio.Mmio(packed struct(u32) {
        cr_i2c_prd_p_ph_0: u8,
        cr_i2c_prd_p_ph_1: u8,
        cr_i2c_prd_p_ph_2: u8,
        cr_i2c_prd_p_ph_3: u8,
    }),

    // 0x18
    i2c_prd_data: mmio.Mmio(packed struct(u32) {
        cr_i2c_prd_d_ph_0: u8,
        cr_i2c_prd_d_ph_1: u8,
        cr_i2c_prd_d_ph_2: u8,
        cr_i2c_prd_d_ph_3: u8,
    }),

    padding28: [25]u32,
    // 0x80
    i2c_fifo_config_0: mmio.Mmio(packed struct(u32) {
        dma_tx_en: u1,
        dma_rx_en: u1,
        tx_fifo_clr: u1,
        rx_fifo_clr: u1,
        tx_fifo_overflow: u1,
        tx_fifo_underflow: u1,
        rx_fifo_overflow: u1,
        rx_fifo_underflow: u1,
        reserved8: u24,
    }),

    // 0x84
    i2c_fifo_config_1: mmio.Mmio(packed struct(u32) {
        tx_fifo_cnt: u2,
        reserved2: u6,
        rx_fifo_cnt: u2,
        reserved10: u6,
        tx_fifo_th: u1,
        reserved17: u7,
        rx_fifo_th: u1,
        reserved25: u7,
    }),

    // 0x88
    i2c_fifo_wdata: mmio.Mmio(packed struct(u32) {
        fifo_wdata: u32,
    }),

    // 0x8c
    i2c_fifo_rdata: mmio.Mmio(packed struct(u32) {
        fifo_rdata: u32,
    }),
};
