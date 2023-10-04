const mmio = @import("microzig").mmio;

pub const Type = extern struct {
    padding0: [512]u32,
    // 0x800
    aon: mmio.Mmio(packed struct(u32) {
        resv: u8,
        reserved8: u4,
        pu_aon_dc_tbuf: u1,
        reserved13: u7,
        ldo11_rt_pulldown: u1,
        ldo11_rt_pulldown_sel: u1,
        sw_pu_ldo11_rt: u1,
        reserved23: u9,
    }),

    // 0x804
    common: mmio.Mmio(packed struct(u32) {
        tmux_aon: u3,
        pmip_dc_tp_out_en_aon: u1,
        ten_bg_sys_aon: u1,
        ten_dcdc11_0_aon: u1,
        ten_dcdc11_1_aon: u1,
        ten_dcdc18_0_aon: u1,
        ten_dcdc18_1_aon: u1,
        ten_ldo12uhs: u1,
        ten_ldo18flash: u1,
        ten_ldo15cis: u1,
        ten_ldo18io_aon: u1,
        ten_ldo28cis: u1,
        ten_rc32m: u1,
        reserved15: u1,
        ten_ldo15rf_aon: u1,
        ten_xtal_aon: u1,
        dten_xtal_aon: u1,
        ten_mbg_aon: u1,
        ten_cip_misc_aon: u1,
        ten_aon: u1,
        reserved22: u10,
    }),

    // 0x808
    misc: mmio.Mmio(packed struct(u32) {
        sw_soc_en_aon: u1,
        sw_wb_en_aon: u1,
        reserved2: u30,
    }),

    padding2060: [1]u32,
    // 0x810
    bg_sys_top: mmio.Mmio(packed struct(u32) {
        pu_bg_sys_aon: u1,
        istart_ctrl_aon: u1,
        reserved2: u30,
    }),

    // 0x814
    dcdc_top_0: mmio.Mmio(packed struct(u32) {
        dcdc11_sstart_time_aon: u2,
        reserved2: u2,
        dcdc11_stby_lp_cur_aon: u3,
        reserved7: u1,
        dcdc11_vc_clamp_vth_aon: u3,
        dcdc11_vout_sel_aon: u5,
        dcdc11_vout_trim_aon: u4,
        dcdc11_vpfm_aon: u4,
        dcdc11_zvs_td_opt_aon: u3,
        reserved27: u1,
        dcdc11_vstby_aon: u2,
        reserved30: u2,
    }),

    // 0x818
    dcdc_top_1: mmio.Mmio(packed struct(u32) {
        dcdc11_nonoverlap_td_aon: u5,
        dcdc11_ocp_out_aon: u1,
        dcdc11_ocp_rst_aon: u1,
        reserved7: u1,
        dcdc11_ocp_vth_aon: u3,
        dcdc11_osc_2m_mode_aon: u1,
        dcdc11_osc_freq_trim_aon: u4,
        dcdc11_pulldown_aon: u1,
        reserved17: u3,
        dcdc11_rc_sel_aon: u4,
        dcdc11_rdy_aon: u1,
        reserved25: u1,
        dcdc11_slope_curr_sel_aon: u5,
        reserved31: u1,
    }),

    // 0x81c
    ldo11soc_and_dctest: mmio.Mmio(packed struct(u32) {
        reserved0: u4,
        dcdc11_cfb_sel_aon: u4,
        dcdc11_chf_sel_aon: u4,
        dcdc11_comp_gm_sel_aon: u3,
        reserved15: u1,
        dcdc11_cs_delay_aon: u3,
        reserved19: u1,
        dcdc11_drv_sr_aon: u2,
        dcdc11_en_antiring_aon: u1,
        dcdc11_en_osc_inhibit_t2_aon: u1,
        dcdc11_en_slow_osc_aon: u1,
        dcdc11_en_stby_lp_aon: u1,
        dcdc11_en_stop_osc_aon: u1,
        dcdc11_force_en_cs_zvs_aon: u1,
        dcdc11_isense_trim_aon: u3,
        reserved31: u1,
    }),

    // 0x820
    @"move to 0x2000f000[23]": mmio.Mmio(packed struct(u32) {
        dcdc18_sstart_time_aon: u2,
        reserved2: u2,
        dcdc18_stby_lp_cur_aon: u3,
        reserved7: u1,
        dcdc18_vc_clamp_vth_aon: u3,
        dcdc18_vout_sel_aon: u5,
        dcdc18_vout_trim_aon: u4,
        dcdc18_vpfm_aon: u4,
        dcdc18_zvs_td_opt_aon: u3,
        reserved27: u1,
        dcdc18_vstby_aon: u2,
        reserved30: u2,
    }),

    // 0x824
    dcdc18_top_1: mmio.Mmio(packed struct(u32) {
        dcdc18_nonoverlap_td_aon: u5,
        dcdc18_ocp_out_aon: u1,
        dcdc18_ocp_rst_aon: u1,
        reserved7: u1,
        dcdc18_ocp_vth_aon: u3,
        dcdc18_osc_2m_mode_aon: u1,
        dcdc18_osc_freq_trim_aon: u4,
        dcdc18_pulldown_aon: u1,
        reserved17: u3,
        dcdc18_rc_sel_aon: u4,
        dcdc18_rdy_aon: u1,
        reserved25: u1,
        dcdc18_slope_curr_sel_aon: u5,
        reserved31: u1,
    }),

    // 0x828
    dcdc18_top_2: mmio.Mmio(packed struct(u32) {
        reserved0: u4,
        dcdc18_cfb_sel_aon: u4,
        dcdc18_chf_sel_aon: u4,
        dcdc18_comp_gm_sel_aon: u3,
        reserved15: u1,
        dcdc18_cs_delay_aon: u3,
        reserved19: u1,
        dcdc18_drv_sr_aon: u2,
        dcdc18_en_antiring_aon: u1,
        dcdc18_en_osc_inhibit_t2_aon: u1,
        dcdc18_en_slow_osc_aon: u1,
        dcdc18_en_stby_lp_aon: u1,
        dcdc18_en_stop_osc_aon: u1,
        dcdc18_force_en_cs_zvs_aon: u1,
        dcdc18_isense_trim_aon: u3,
        reserved31: u1,
    }),

    // 0x82c
    psw_irrcv: mmio.Mmio(packed struct(u32) {
        pu_psw_irrcv_aon: u1,
        reserved1: u18,
        usb20_rref_ext_en_aon: u1,
        en_por33_aon: u1,
        usb20_rref_hiz_aon: u1,
        reserved22: u2,
        usb20_rcal_code_aon: u6,
        reserved30: u2,
    }),

    padding2096: [20]u32,
    // 0x880
    rf_top_aon: mmio.Mmio(packed struct(u32) {
        pu_mbg_aon: u1,
        pu_ldo15rf_aon: u1,
        pu_sfreg_aon: u1,
        reserved3: u1,
        pu_xtal_buf_aon: u1,
        pu_xtal_aon: u1,
        reserved6: u2,
        ldo15rf_sstart_sel_aon: u1,
        ldo15rf_sstart_delay_aon: u2,
        reserved11: u1,
        ldo15rf_pulldown_aon: u1,
        ldo15rf_pulldown_sel_aon: u1,
        reserved14: u2,
        ldo15rf_vout_sel_aon: u3,
        reserved19: u5,
        ldo15rf_cc_aon: u2,
        reserved26: u2,
        ldo15rf_bypass_aon: u1,
        reserved29: u3,
    }),

    // 0x884
    xtal_cfg: mmio.Mmio(packed struct(u32) {
        xtal_bk_aon: u2,
        xtal_capcode_extra_aon: u1,
        xtal_ext_sel_aon: u1,
        xtal_buf_en_aon: u4,
        xtal_buf_hp_aon: u4,
        xtal_fast_startup_aon: u1,
        xtal_sleep_aon: u1,
        xtal_amp_ctrl_aon: u2,
        xtal_capcode_out_aon: u6,
        xtal_capcode_in_aon: u6,
        xtal_gm_boost_aon: u2,
        xtal_rdy_sel_aon: u2,
    }),

    // 0x888
    xtal_cfg2: mmio.Mmio(packed struct(u32) {
        wifi_xtal_ldo33_bypass_aon: u1,
        wifi_xtal_ldo33_sel_aon: u3,
        wifi_xtal_ldo18_sel_aon: u2,
        wifi_xtal_ldo33_pu_aon: u1,
        wifi_xtal_ldo18_pu_aon: u1,
        reserved8: u2,
        wifi_xtal_reserve: u4,
        reserved14: u2,
        wifi_xtal_ldo18_short_filter_aon: u1,
        reserved17: u13,
        xtal_buf_drv_aon: u2,
    }),

    // 0x88c
    xtal_cfg3: mmio.Mmio(packed struct(u32) {
        reserved0: u12,
        wifi_xtal_clk_inv_en_aon: u1,
        reserved13: u3,
        wifi_xtal_cml_en_aon: u1,
        wifi_xtal_cml_r_sel_aon: u2,
        reserved19: u1,
        wifi_xtal_clk_en_aon: u1,
        reserved21: u9,
        wifi_xtal_buf_drv_aon: u2,
    }),

    // 0x890
    tsen: mmio.Mmio(packed struct(u32) {
        tsen_refcode_corner: u12,
        reserved12: u4,
        tsen_refcode_rfcal: u12,
        xtal_rdy: u1,
        xtal_inn_cfg_en_aon: u1,
        xtal_rdy_int_sel_aon: u2,
    }),

    padding2196: [12]u32,
    // 0x8c4
    ldo18io: mmio.Mmio(packed struct(u32) {
        reserved0: u1,
        ldo18io_bypass_iso_aon: u1,
        ldo18io_pulldown_aon: u1,
        ldo18io_pulldown_sel_aon: u1,
        ldo18io_bm_aon: u3,
        reserved7: u1,
        ldo18io_cc_aon: u3,
        ldo18io_ocp_out_aon: u1,
        ldo18io_ocp_th_aon: u3,
        ldo18io_ocp_en_aon: u1,
        ldo18io_sstart_delay_aon: u3,
        ldo18io_sstart_en_aon: u1,
        ldo18io_vout_sel_aon: u4,
        ldo18io_vout_trim_aon: u4,
        reserved28: u4,
    }),

    padding2248: [14]u32,
    // 0x900
    acomp0_ctrl: mmio.Mmio(packed struct(u32) {
        acomp0_en: u1,
        reserved1: u3,
        acomp0_hyst_seln: u3,
        acomp0_hyst_selp: u3,
        acomp0_bias_prog: u2,
        acomp0_level_sel: u6,
        acomp0_neg_sel: u4,
        acomp0_pos_sel: u4,
        acomp0_muxen: u1,
        reserved27: u5,
    }),

    // 0x904
    acomp1_ctrl: mmio.Mmio(packed struct(u32) {
        acomp1_en: u1,
        reserved1: u3,
        acomp1_hyst_seln: u3,
        acomp1_hyst_selp: u3,
        acomp1_bias_prog: u2,
        acomp1_level_sel: u6,
        acomp1_neg_sel: u4,
        acomp1_pos_sel: u4,
        acomp1_muxen: u1,
        reserved27: u5,
    }),

    // 0x908
    acomp_ctrl: mmio.Mmio(packed struct(u32) {
        acomp1_rstn_ana: u1,
        acomp0_rstn_ana: u1,
        reserved2: u6,
        acomp1_test_en: u1,
        acomp0_test_en: u1,
        acomp1_test_sel: u2,
        acomp0_test_sel: u2,
        reserved14: u3,
        acomp1_out_raw: u1,
        reserved18: u1,
        acomp0_out_raw: u1,
        reserved20: u4,
        acomp_vref_sel: u6,
        acomp_reserved: u2,
    }),

    // 0x90c
    gpadc_reg_cmd: mmio.Mmio(packed struct(u32) {
        gpadc_global_en: u1,
        gpadc_conv_start: u1,
        gpadc_soft_rst: u1,
        gpadc_neg_sel: u5,
        gpadc_pos_sel: u5,
        gpadc_neg_gnd: u1,
        gpadc_micbias_en: u1,
        gpadc_micpga_en: u1,
        gpadc_byp_micboost: u1,
        gpadc_rcal_en: u1,
        gpadc_dwa_en: u1,
        gpadc_mic2_diff: u1,
        gpadc_mic1_diff: u1,
        gpadc_mic_pga2_gain: u2,
        gpadc_micboost_32db_en: u1,
        reserved24: u3,
        gpadc_chip_sen_pu: u1,
        gpadc_sen_sel: u3,
        gpadc_sen_test_en: u1,
    }),

    // 0x910
    gpadc_reg_config1: mmio.Mmio(packed struct(u32) {
        gpadc_cal_os_en: u1,
        gpadc_cont_conv_en: u1,
        gpadc_res_sel: u3,
        reserved5: u3,
        gpadc_vcm_sel_en: u1,
        gpadc_vcm_hyst_sel: u1,
        gpadc_lowv_det_en: u1,
        gpadc_pwm_trg_en: u1,
        gpadc_clk_ana_dly: u4,
        gpadc_clk_ana_dly_en: u1,
        gpadc_clk_ana_inv: u1,
        gpadc_clk_div_ratio: u3,
        gpadc_scan_length: u4,
        gpadc_scan_en: u1,
        gpadc_dither_en: u1,
        gpadc_v11_sel: u2,
        gpadc_v18_sel: u2,
        reserved31: u1,
    }),

    // 0x914
    gpadc_reg_config2: mmio.Mmio(packed struct(u32) {
        reserved0: u2,
        gpadc_diff_mode: u1,
        gpadc_vref_sel: u1,
        gpadc_vbat_en: u1,
        gpadc_tsext_sel: u1,
        gpadc_ts_en: u1,
        gpadc_pga_vcm: u2,
        gpadc_pga_os_cal: u4,
        gpadc_pga_en: u1,
        gpadc_pga_vcmi_en: u1,
        gpadc_chop_mode: u2,
        gpadc_bias_sel: u1,
        gpadc_test_en: u1,
        gpadc_test_sel: u3,
        gpadc_pga2_gain: u3,
        gpadc_pga1_gain: u3,
        gpadc_dly_sel: u3,
        gpadc_tsvbe_low: u1,
    }),

    // 0x918
    @"adc converation sequence 1": mmio.Mmio(packed struct(u32) {
        gpadc_scan_pos_0: u5,
        gpadc_scan_pos_1: u5,
        gpadc_scan_pos_2: u5,
        gpadc_scan_pos_3: u5,
        gpadc_scan_pos_4: u5,
        gpadc_scan_pos_5: u5,
        reserved30: u2,
    }),

    // 0x91c
    @"adc converation sequence 2": mmio.Mmio(packed struct(u32) {
        gpadc_scan_pos_6: u5,
        gpadc_scan_pos_7: u5,
        gpadc_scan_pos_8: u5,
        gpadc_scan_pos_9: u5,
        gpadc_scan_pos_10: u5,
        gpadc_scan_pos_11: u5,
        reserved30: u2,
    }),

    // 0x920
    @"adc converation sequence 3": mmio.Mmio(packed struct(u32) {
        gpadc_scan_neg_0: u5,
        gpadc_scan_neg_1: u5,
        gpadc_scan_neg_2: u5,
        gpadc_scan_neg_3: u5,
        gpadc_scan_neg_4: u5,
        gpadc_scan_neg_5: u5,
        reserved30: u2,
    }),

    // 0x924
    @"adc converation sequence 4": mmio.Mmio(packed struct(u32) {
        gpadc_scan_neg_6: u5,
        gpadc_scan_neg_7: u5,
        gpadc_scan_neg_8: u5,
        gpadc_scan_neg_9: u5,
        gpadc_scan_neg_10: u5,
        gpadc_scan_neg_11: u5,
        reserved30: u2,
    }),

    // 0x928
    gpadc_reg_status: mmio.Mmio(packed struct(u32) {
        gpadc_data_rdy: u1,
        reserved1: u15,
        gpadc_reserved: u16,
    }),

    // 0x92c
    gpadc_reg_isr: mmio.Mmio(packed struct(u32) {
        gpadc_neg_satur: u1,
        gpadc_pos_satur: u1,
        reserved2: u2,
        gpadc_neg_satur_clr: u1,
        gpadc_pos_satur_clr: u1,
        reserved6: u2,
        gpadc_neg_satur_mask: u1,
        gpadc_pos_satur_mask: u1,
        reserved10: u22,
    }),

    // 0x930
    gpadc_reg_result: mmio.Mmio(packed struct(u32) {
        gpadc_data_out: u26,
        reserved26: u6,
    }),

    // 0x934
    gpadc_reg_raw_result: mmio.Mmio(packed struct(u32) {
        gpadc_raw_data: u12,
        reserved12: u20,
    }),

    // 0x938
    gpadc_reg_define: mmio.Mmio(packed struct(u32) {
        gpadc_os_cal_data: u16,
        reserved16: u16,
    }),

    // 0x93c
    hbncore_resv0: mmio.Mmio(packed struct(u32) {
        hbncore_resv0_data: u32,
    }),

    // 0x940
    hbncore_resv1: mmio.Mmio(packed struct(u32) {
        hbncore_resv1_data: u32,
    }),
};
