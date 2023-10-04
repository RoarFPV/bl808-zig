const mmio = @import("microzig").mmio;

pub const Type = extern struct {
    // 0x0
    gpadc_config: mmio.Mmio(packed struct(u32) {
        gpip_gpadc_dma_en: u1,
        gpip_gpadc_fifo_clr: u1,
        gpip_gpadc_fifo_ne: u1,
        gpip_gpadc_fifo_full: u1,
        gpip_gpadc_rdy: u1,
        gpip_gpadc_fifo_overrun: u1,
        gpip_gpadc_fifo_underrun: u1,
        reserved7: u1,
        gpip_gpadc_rdy_clr: u1,
        gpip_gpadc_fifo_overrun_clr: u1,
        gpip_gpadc_fifo_underrun_clr: u1,
        reserved11: u1,
        gpip_gpadc_rdy_mask: u1,
        gpip_gpadc_fifo_overrun_mask: u1,
        gpip_gpadc_fifo_underrun_mask: u1,
        reserved15: u1,
        gpip_gpadc_fifo_data_count: u6,
        gpip_gpadc_fifo_thl: u2,
        reserved24: u8,
    }),

    // 0x4
    gpadc_dma_rdata: mmio.Mmio(packed struct(u32) {
        gpip_gpadc_dma_rdata: u26,
        reserved26: u6,
    }),

    padding8: [6]u32,
    // 0x20
    gpadc_pir_train: mmio.Mmio(packed struct(u32) {
        gpip_pir_extend: u5,
        reserved5: u3,
        gpip_pir_cnt_v: u5,
        reserved13: u3,
        gpip_pir_train: u1,
        gpip_pir_stop: u1,
        reserved18: u14,
    }),

    padding36: [570]u32,
    // 0x90c
    gpadc_reg_cmd: mmio.Mmio(packed struct(u32) {
        aon_gpadc_global_en: u1,
        aon_gpadc_conv_start: u1,
        aon_gpadc_soft_rst: u1,
        aon_gpadc_neg_sel: u5,
        aon_gpadc_pos_sel: u5,
        aon_gpadc_neg_gnd: u1,
        aon_gpadc_micbias_en: u1,
        aon_gpadc_micpga_en: u1,
        aon_gpadc_byp_micboost: u1,
        aon_gpadc_rcal_en: u1,
        aon_gpadc_dwa_en: u1,
        aon_gpadc_mic2_diff: u1,
        aon_gpadc_mic1_diff: u1,
        aon_gpadc_mic_pga2_gain: u2,
        aon_gpadc_micboost_32db_en: u1,
        reserved24: u3,
        aon_gpadc_chip_sen_pu: u1,
        aon_gpadc_sen_sel: u3,
        aon_gpadc_sen_test_en: u1,
    }),

    // 0x910
    gpadc_reg_config1: mmio.Mmio(packed struct(u32) {
        aon_gpadc_cal_os_en: u1,
        aon_gpadc_cont_conv_en: u1,
        aon_gpadc_res_sel: u3,
        reserved5: u3,
        aon_gpadc_vcm_sel_en: u1,
        aon_gpadc_vcm_hyst_sel: u1,
        aon_gpadc_lowv_det_en: u1,
        aon_gpadc_pwm_trg_en: u1,
        aon_gpadc_clk_ana_dly: u4,
        aon_gpadc_clk_ana_dly_en: u1,
        aon_gpadc_clk_ana_inv: u1,
        aon_gpadc_clk_div_ratio: u3,
        aon_gpadc_scan_length: u4,
        aon_gpadc_scan_en: u1,
        aon_gpadc_dither_en: u1,
        aon_gpadc_v11_sel: u2,
        aon_gpadc_v18_sel: u2,
        reserved31: u1,
    }),

    // 0x914
    gpadc_reg_config2: mmio.Mmio(packed struct(u32) {
        reserved0: u2,
        aon_gpadc_diff_mode: u1,
        aon_gpadc_vref_sel: u1,
        aon_gpadc_vbat_en: u1,
        aon_gpadc_tsext_sel: u1,
        aon_gpadc_ts_en: u1,
        aon_gpadc_pga_vcm: u2,
        aon_gpadc_pga_os_cal: u4,
        aon_gpadc_pga_en: u1,
        aon_gpadc_pga_vcmi_en: u1,
        aon_gpadc_chop_mode: u2,
        aon_gpadc_bias_sel: u1,
        aon_gpadc_test_en: u1,
        aon_gpadc_test_sel: u3,
        aon_gpadc_pga2_gain: u3,
        aon_gpadc_pga1_gain: u3,
        aon_gpadc_dly_sel: u3,
        aon_gpadc_tsvbe_low: u1,
    }),

    // 0x918
    aon_gpadc_reg_scn_pos1: mmio.Mmio(packed struct(u32) {
        aon_gpadc_scan_pos_0: u5,
        aon_gpadc_scan_pos_1: u5,
        aon_gpadc_scan_pos_2: u5,
        aon_gpadc_scan_pos_3: u5,
        aon_gpadc_scan_pos_4: u5,
        aon_gpadc_scan_pos_5: u5,
        reserved30: u2,
    }),

    // 0x91c
    aon_gpadc_reg_scn_pos2: mmio.Mmio(packed struct(u32) {
        aon_gpadc_scan_pos_6: u5,
        aon_gpadc_scan_pos_7: u5,
        aon_gpadc_scan_pos_8: u5,
        aon_gpadc_scan_pos_9: u5,
        aon_gpadc_scan_pos_10: u5,
        aon_gpadc_scan_pos_11: u5,
        reserved30: u2,
    }),

    // 0x920
    aon_gpadc_reg_scn_neg1: mmio.Mmio(packed struct(u32) {
        aon_gpadc_scan_neg_0: u5,
        aon_gpadc_scan_neg_1: u5,
        aon_gpadc_scan_neg_2: u5,
        aon_gpadc_scan_neg_3: u5,
        aon_gpadc_scan_neg_4: u5,
        aon_gpadc_scan_neg_5: u5,
        reserved30: u2,
    }),

    // 0x924
    aon_gpadc_reg_scn_neg2: mmio.Mmio(packed struct(u32) {
        aon_gpadc_scan_neg_6: u5,
        aon_gpadc_scan_neg_7: u5,
        aon_gpadc_scan_neg_8: u5,
        aon_gpadc_scan_neg_9: u5,
        aon_gpadc_scan_neg_10: u5,
        aon_gpadc_scan_neg_11: u5,
        reserved30: u2,
    }),

    // 0x928
    gpadc_reg_status: mmio.Mmio(packed struct(u32) {
        aon_gpadc_data_rdy: u1,
        reserved1: u15,
        aon_gpadc_reserved: u16,
    }),

    // 0x92c
    gpadc_reg_isr: mmio.Mmio(packed struct(u32) {
        aon_gpadc_neg_satur: u1,
        aon_gpadc_pos_satur: u1,
        reserved2: u2,
        aon_gpadc_neg_satur_clr: u1,
        aon_gpadc_pos_satur_clr: u1,
        reserved6: u2,
        aon_gpadc_neg_satur_mask: u1,
        aon_gpadc_pos_satur_mask: u1,
        reserved10: u22,
    }),

    // 0x930
    gpadc_reg_result: mmio.Mmio(packed struct(u32) {
        aon_gpadc_data_out: u26,
        reserved26: u6,
    }),

    // 0x934
    gpadc_reg_raw_result: mmio.Mmio(packed struct(u32) {
        aon_gpadc_raw_data: u12,
        reserved12: u20,
    }),

    // 0x938
    gpadc_reg_define: mmio.Mmio(packed struct(u32) {
        aon_gpadc_os_cal_data: u16,
        reserved16: u16,
    }),
};
