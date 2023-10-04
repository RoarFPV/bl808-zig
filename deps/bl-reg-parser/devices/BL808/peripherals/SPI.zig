const mmio = @import("microzig").mmio;

pub const Type = extern struct {
    // 0x0
    spi_config: mmio.Mmio(packed struct(u32) {
        cr_spi_m_en: u1,
        cr_spi_s_en: u1,
        cr_spi_frame_size: u2,
        cr_spi_sclk_pol: u1,
        cr_spi_sclk_ph: u1,
        cr_spi_bit_inv: u1,
        cr_spi_byte_inv: u1,
        cr_spi_rxd_ignr_en: u1,
        cr_spi_m_cont_en: u1,
        cr_spi_s_3pin_mode: u1,
        cr_spi_deg_en: u1,
        cr_spi_deg_cnt: u4,
        reserved16: u16,
    }),

    // 0x4
    spi_int_sts: mmio.Mmio(packed struct(u32) {
        end_int: u1,
        txf_int: u1,
        rxf_int: u1,
        sto_int: u1,
        txu_int: u1,
        fer_int: u1,
        reserved6: u2,
        cr_spi_end_mask: u1,
        cr_spi_txf_mask: u1,
        cr_spi_rxf_mask: u1,
        cr_spi_sto_mask: u1,
        cr_spi_txu_mask: u1,
        cr_spi_fer_mask: u1,
        reserved14: u2,
        cr_spi_end_clr: u1,
        reserved17: u2,
        cr_spi_sto_clr: u1,
        cr_spi_txu_clr: u1,
        reserved21: u3,
        cr_spi_end_en: u1,
        cr_spi_txf_en: u1,
        cr_spi_rxf_en: u1,
        cr_spi_sto_en: u1,
        cr_spi_txu_en: u1,
        cr_spi_fer_en: u1,
        reserved30: u2,
    }),

    // 0x8
    spi_bus_busy: mmio.Mmio(packed struct(u32) {
        sts_spi_bus_busy: u1,
        reserved1: u31,
    }),

    padding12: [1]u32,
    // 0x10
    spi_prd_0: mmio.Mmio(packed struct(u32) {
        cr_spi_prd_s: u8,
        cr_spi_prd_p: u8,
        cr_spi_prd_d_ph_0: u8,
        cr_spi_prd_d_ph_1: u8,
    }),

    // 0x14
    spi_prd_1: mmio.Mmio(packed struct(u32) {
        cr_spi_prd_i: u8,
        reserved8: u24,
    }),

    // 0x18
    spi_rxd_ignr: mmio.Mmio(packed struct(u32) {
        cr_spi_rxd_ignr_p: u5,
        reserved5: u11,
        cr_spi_rxd_ignr_s: u5,
        reserved21: u11,
    }),

    // 0x1c
    spi_sto_value: mmio.Mmio(packed struct(u32) {
        cr_spi_sto_value: u12,
        reserved12: u20,
    }),

    padding32: [24]u32,
    // 0x80
    spi_fifo_config_0: mmio.Mmio(packed struct(u32) {
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
    spi_fifo_config_1: mmio.Mmio(packed struct(u32) {
        tx_fifo_cnt: u6,
        reserved6: u2,
        rx_fifo_cnt: u6,
        reserved14: u2,
        tx_fifo_th: u5,
        reserved21: u3,
        rx_fifo_th: u5,
        reserved29: u3,
    }),

    // 0x88
    spi_fifo_wdata: mmio.Mmio(packed struct(u32) {
        fifo_wdata: u32,
    }),

    // 0x8c
    spi_fifo_rdata: mmio.Mmio(packed struct(u32) {
        fifo_rdata: u32,
    }),

    padding144: [27]u32,
    // 0xfc
    backup_io_en: mmio.Mmio(packed struct(u32) {
        backup_io_en: u1,
        reserved1: u31,
    }),
};
