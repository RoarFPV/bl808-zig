const mmio = @import("microzig").mmio;

pub const Type = extern struct {
    padding0: [16]u32,
    // 0x40
    gpdac_config: mmio.Mmio(packed struct(u32) {
        gpip_gpdac_en: u1,
        reserved1: u7,
        gpip_gpdac_mode: u3,
        reserved11: u5,
        gpip_gpdac_ch_a_sel: u4,
        gpip_gpdac_ch_b_sel: u4,
        reserved24: u8,
    }),

    // 0x44
    gpdac_dma_config: mmio.Mmio(packed struct(u32) {
        gpip_gpdac_dma_tx_en: u1,
        gpip_gpdac_dma_inv_msb: u1,
        reserved2: u2,
        gpip_gpdac_dma_format: u2,
        reserved6: u26,
    }),

    // 0x48
    gpdac_dma_wdata: mmio.Mmio(packed struct(u32) {
        gpip_gpdac_dma_wdata: u32,
    }),

    // 0x4c
    gpdac_tx_fifo_status: mmio.Mmio(packed struct(u32) {
        gpip_tx_fifo_empty: u1,
        gpip_tx_fifo_full: u1,
        gpip_tx_cs: u2,
        gpip_txfifordptr: u3,
        reserved7: u1,
        gpip_txfifowrptr: u2,
        reserved10: u22,
    }),

    padding80: [174]u32,
    // 0x308
    gpdac_ctrl: mmio.Mmio(packed struct(u32) {
        glb_gpdaca_rstn_ana: u1,
        glb_gpdacb_rstn_ana: u1,
        reserved2: u5,
        glb_gpdac_test_en: u1,
        glb_gpdac_ref_sel: u1,
        glb_gpdac_test_sel: u3,
        glb_gpdac_ana_clk_sel: u1,
        glb_gpdac_dat_cha_sel: u1,
        glb_gpdac_dat_chb_sel: u1,
        reserved15: u9,
        glb_gpdac_reserved: u8,
    }),

    // 0x30c
    gpdac_actrl: mmio.Mmio(packed struct(u32) {
        glb_gpdac_a_en: u1,
        glb_gpdac_ioa_en: u1,
        reserved2: u16,
        glb_gpdac_a_rng: u2,
        glb_gpdac_a_outmux: u3,
        reserved23: u9,
    }),

    // 0x310
    gpdac_bctrl: mmio.Mmio(packed struct(u32) {
        glb_gpdac_b_en: u1,
        glb_gpdac_iob_en: u1,
        reserved2: u16,
        glb_gpdac_b_rng: u2,
        glb_gpdac_b_outmux: u3,
        reserved23: u9,
    }),

    // 0x314
    gpdac_data: mmio.Mmio(packed struct(u32) {
        glb_gpdac_b_data: u10,
        reserved10: u6,
        glb_gpdac_a_data: u10,
        reserved26: u6,
    }),
};
