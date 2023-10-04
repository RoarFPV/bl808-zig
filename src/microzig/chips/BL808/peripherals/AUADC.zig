const mmio = @import("microzig").mmio;

pub const Type = extern struct {
    padding0: [768]u32,
    // 0xc00
    audpdm_top: mmio.Mmio(packed struct(u32) {
        audio_ckg_en: u1,
        reserved1: u1,
        adc_itf_inv_sel: u1,
        pdm_itf_inv_sel: u1,
        reserved4: u24,
        adc_rate: u4,
    }),

    // 0xc04
    audpdm_itf: mmio.Mmio(packed struct(u32) {
        adc_0_en: u1,
        reserved1: u29,
        adc_itf_en: u1,
        reserved31: u1,
    }),

    // 0xc08
    pdm_adc_0: mmio.Mmio(packed struct(u32) {
        adc_0_fir_mode: u1,
        reserved1: u31,
    }),

    // 0xc0c
    pdm_adc_1: mmio.Mmio(packed struct(u32) {
        adc_0_k1: u4,
        adc_0_k1_en: u1,
        adc_0_k2: u4,
        adc_0_k2_en: u1,
        reserved10: u22,
    }),

    // 0xc10
    pdm_dac_0: mmio.Mmio(packed struct(u32) {
        adc_pdm_h: u4,
        reserved4: u2,
        adc_pdm_l: u4,
        reserved10: u2,
        adc_0_src: u1,
        reserved13: u19,
    }),

    padding3092: [2]u32,
    // 0xc1c
    pdm_pdm_0: mmio.Mmio(packed struct(u32) {
        pdm_0_en: u1,
        reserved1: u2,
        adc_0_pdm_sel: u3,
        reserved6: u26,
    }),

    padding3104: [6]u32,
    // 0xc38
    pdm_adc_s0: mmio.Mmio(packed struct(u32) {
        adc_s0_volume: u9,
        reserved9: u23,
    }),

    padding3132: [9]u32,
    // 0xc60
    audadc_ana_cfg1: mmio.Mmio(packed struct(u32) {
        audadc_pga_chop_cksel: u1,
        audadc_pga_chop_freq: u3,
        audadc_pga_chop_en: u1,
        audadc_pga_chop_cfg: u2,
        reserved7: u1,
        audadc_pga_rhpas_sel: u2,
        reserved10: u2,
        audadc_pga_nois_ctrl: u2,
        reserved14: u2,
        audadc_ictrl_pga_aaf: u2,
        reserved18: u2,
        audadc_ictrl_pga_mic: u2,
        reserved22: u2,
        audadc_pga_lp_en: u1,
        reserved25: u3,
        audadc_ckb_en: u1,
        audadc_sel_edge: u1,
        reserved30: u2,
    }),

    // 0xc64
    audadc_ana_cfg2: mmio.Mmio(packed struct(u32) {
        audadc_dither_order: u1,
        audadc_dither_sel: u2,
        audadc_dither_ena: u1,
        audadc_quan_gain: u2,
        reserved6: u2,
        audadc_dem_en: u1,
        reserved9: u3,
        audadc_nctrl_adc2: u2,
        reserved14: u2,
        audadc_nctrl_adc1: u3,
        reserved19: u1,
        audadc_ictrl_adc: u2,
        reserved22: u2,
        audadc_sdm_lp_en: u1,
        reserved25: u3,
        audadc_reserved: u2,
        reserved30: u2,
    }),

    // 0xc68
    audadc_cmd: mmio.Mmio(packed struct(u32) {
        audadc_meas_odr_sel: u4,
        audadc_meas_filter_type: u1,
        audadc_meas_filter_en: u1,
        audadc_audio_osr_sel: u1,
        reserved7: u1,
        audadc_pga_gain: u4,
        audadc_pga_mode: u2,
        reserved14: u2,
        audadc_channel_seln: u3,
        reserved19: u1,
        audadc_channel_selp: u3,
        reserved23: u1,
        audadc_channel_en: u2,
        reserved26: u2,
        audadc_conv: u1,
        audadc_sdm_pu: u1,
        audadc_pga_pu: u1,
        reserved31: u1,
    }),

    // 0xc6c
    audadc_data: mmio.Mmio(packed struct(u32) {
        audadc_raw_data: u24,
        audadc_data_rdy: u1,
        reserved25: u4,
        audadc_soft_rst: u1,
        audadc_valid_4s_val: u1,
        audadc_valid_4s_en: u1,
    }),

    padding3184: [4]u32,
    // 0xc80
    audadc_rx_fifo_ctrl: mmio.Mmio(packed struct(u32) {
        rx_fifo_flush: u1,
        rxo_int_en: u1,
        rxu_int_en: u1,
        rxa_int_en: u1,
        rx_drq_en: u1,
        rx_data_res: u2,
        reserved7: u1,
        rx_ch_en: u1,
        reserved9: u5,
        rx_drq_cnt: u2,
        rx_trg_level: u4,
        reserved20: u4,
        rx_data_mode: u2,
        reserved26: u6,
    }),

    // 0xc84
    audadc_rx_fifo_status: mmio.Mmio(packed struct(u32) {
        reserved0: u1,
        rxo_int: u1,
        rxu_int: u1,
        reserved3: u1,
        rxa_int: u1,
        reserved5: u11,
        rxa_cnt: u4,
        reserved20: u4,
        rxa: u1,
        reserved25: u7,
    }),

    // 0xc88
    audadc_rx_fifo_data: mmio.Mmio(packed struct(u32) {
        rx_data: u32,
    }),
};
