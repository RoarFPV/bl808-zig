const mmio = @import("microzig").mmio;

pub const Type = extern struct {
    // 0x0
    gpadc_config: mmio.Mmio(packed struct(u32) {
        gpadc_dma_en: u1,
        gpadc_fifo_clr: u1,
        gpadc_fifo_ne: u1,
        gpadc_fifo_full: u1,
        gpadc_rdy: u1,
        gpadc_fifo_overrun: u1,
        gpadc_fifo_underrun: u1,
        reserved7: u1,
        gpadc_rdy_clr: u1,
        gpadc_fifo_overrun_clr: u1,
        gpadc_fifo_underrun_clr: u1,
        reserved11: u1,
        gpadc_rdy_mask: u1,
        gpadc_fifo_overrun_mask: u1,
        gpadc_fifo_underrun_mask: u1,
        reserved15: u1,
        gpadc_fifo_data_count: u6,
        gpadc_fifo_thl: u2,
        reserved24: u8,
    }),

    // 0x4
    gpadc_dma_rdata: mmio.Mmio(packed struct(u32) {
        gpadc_dma_rdata: u26,
        reserved26: u6,
    }),

    padding8: [6]u32,
    // 0x20
    gpadc_pir_train: mmio.Mmio(packed struct(u32) {
        pir_extend: u5,
        reserved5: u3,
        pir_cnt_v: u5,
        reserved13: u3,
        pir_train: u1,
        pir_stop: u1,
        reserved18: u14,
    }),

    padding36: [7]u32,
    // 0x40
    gpdac_config: mmio.Mmio(packed struct(u32) {
        gpdac_en: u1,
        reserved1: u7,
        gpdac_mode: u3,
        reserved11: u5,
        gpdac_ch_a_sel: u4,
        gpdac_ch_b_sel: u4,
        reserved24: u8,
    }),

    // 0x44
    gpdac_dma_config: mmio.Mmio(packed struct(u32) {
        gpdac_dma_tx_en: u1,
        gpdac_dma_inv_msb: u1,
        reserved2: u2,
        gpdac_dma_format: u4,
        reserved8: u24,
    }),

    // 0x48
    gpdac_dma_wdata: mmio.Mmio(packed struct(u32) {
        gpdac_dma_wdata: u32,
    }),

    // 0x4c
    gpdac_tx_fifo_status: mmio.Mmio(packed struct(u32) {
        tx_fifo_empty: u1,
        tx_fifo_full: u1,
        tx_cs: u2,
        txfifordptr: u4,
        txfifowrptr: u2,
        reserved10: u22,
    }),
};
