const mmio = @import("microzig").mmio;

pub const Type = extern struct {
    // 0x0
    cfg: mmio.Mmio(packed struct(u32) {
        en: u1,
        slv_sel_cci2: u1,
        mas_sel_cci2: u1,
        mas_hw_mode: u1,
        reg_m_cci_sclk_en: u1,
        reg_div_m_cci_sclk: u2,
        cfg_cci1_pre_read: u1,
        reg_scci_clk_inv: u1,
        reg_mcci_clk_inv: u1,
        reserved10: u22,
    }),

    // 0x4
    addr: mmio.Mmio(packed struct(u32) {
        apb_cci_addr: u32,
    }),

    // 0x8
    wdata: mmio.Mmio(packed struct(u32) {
        apb_cci_wdata: u32,
    }),

    // 0xc
    rdata: mmio.Mmio(packed struct(u32) {
        apb_cci_rdata: u32,
    }),

    // 0x10
    ctl: mmio.Mmio(packed struct(u32) {
        write_flag: u1,
        read_flag: u1,
        ahb_state: u2,
        reserved4: u28,
    }),

    padding20: [463]u32,
    // 0x750
    audio_pll_cfg0: mmio.Mmio(packed struct(u32) {
        aupll_sdm_rstb: u1,
        aupll_postdiv_rstb: u1,
        aupll_fbdv_rstb: u1,
        aupll_refdiv_rstb: u1,
        pu_aupll_postdiv: u1,
        pu_aupll_fbdv: u1,
        pu_aupll_clamp_op: u1,
        pu_aupll_pfd: u1,
        pu_aupll_cp: u1,
        pu_aupll_sfreg: u1,
        pu_aupll: u1,
        pu_aupll_clktree: u1,
        reserved12: u20,
    }),

    // 0x754
    audio_pll_cfg1: mmio.Mmio(packed struct(u32) {
        aupll_postdiv: u7,
        reserved7: u1,
        aupll_refdiv_ratio: u4,
        reserved12: u4,
        aupll_refclk_sel: u2,
        reserved18: u2,
        aupll_vg11_sel: u2,
        reserved22: u2,
        aupll_vg13_sel: u2,
        reserved26: u6,
    }),

    // 0x758
    audio_pll_cfg2: mmio.Mmio(packed struct(u32) {
        aupll_sel_cp_bias: u1,
        reserved1: u3,
        aupll_icp_5u: u2,
        aupll_icp_1u: u2,
        aupll_int_frac_sw: u1,
        aupll_cp_startup_en: u1,
        aupll_cp_opamp_en: u1,
        reserved11: u21,
    }),

    // 0x75c
    audio_pll_cfg3: mmio.Mmio(packed struct(u32) {
        aupll_c4_en: u1,
        reserved1: u3,
        aupll_r4: u2,
        reserved6: u2,
        aupll_r4_short: u1,
        reserved9: u3,
        aupll_c3: u2,
        aupll_cz: u2,
        aupll_rz: u3,
        reserved19: u13,
    }),

    // 0x760
    audio_pll_cfg4: mmio.Mmio(packed struct(u32) {
        aupll_sel_sample_clk: u2,
        reserved2: u2,
        aupll_sel_fb_clk: u2,
        reserved6: u2,
        aupll_sdmclk_sel: u1,
        reserved9: u23,
    }),

    // 0x764
    audio_pll_cfg5: mmio.Mmio(packed struct(u32) {
        aupll_vco_speed: u3,
        reserved3: u29,
    }),

    // 0x768
    audio_pll_cfg6: mmio.Mmio(packed struct(u32) {
        aupll_sdmin: u19,
        reserved19: u5,
        aupll_sdm_bypass: u1,
        reserved25: u7,
    }),

    // 0x76c
    audio_pll_cfg7: mmio.Mmio(packed struct(u32) {
        aupll_sdm_order_sel: u1,
        reserved1: u15,
        aupll_sdm_sig_dith_sel: u2,
        reserved18: u14,
    }),

    // 0x770
    audio_pll_cfg8: mmio.Mmio(packed struct(u32) {
        aupll_en_div1: u1,
        aupll_en_div2: u1,
        aupll_en_div2p5: u1,
        aupll_en_div3: u1,
        aupll_en_div4: u1,
        aupll_en_div5: u1,
        aupll_en_div6: u1,
        aupll_en_div10: u1,
        aupll_en_div15: u1,
        aupll_sel_div1_div2: u1,
        reserved10: u22,
    }),

    // 0x774
    audio_pll_cfg9: mmio.Mmio(packed struct(u32) {
        aupll_dc_tp_out_en: u1,
        ten_aupll: u1,
        ten_aupll_sfreg: u1,
        reserved3: u1,
        dten_aupll_fin: u1,
        dten_aupll_fref: u1,
        dten_aupll_fsdm: u1,
        dten_aupll_div15: u1,
        dten_aupll_div5: u1,
        dten_aupll_postdiv_clk: u1,
        dtest_aupll_pulldown: u1,
        reserved11: u21,
    }),

    // 0x778
    audio_pll_cfg10: mmio.Mmio(packed struct(u32) {
        aupll_ssc_en: u1,
        reserved1: u3,
        aupll_ssc_cnt: u8,
        aupll_ssc_gain: u3,
        reserved15: u1,
        aupll_ssc_start_gate_en: u1,
        reserved17: u3,
        aupll_ssc_start: u1,
        reserved21: u11,
    }),

    // 0x77c
    audio_pll_cfg11: mmio.Mmio(packed struct(u32) {
        aupll_resv: u16,
        reserved16: u7,
        aupll_dl_ctrl_15: u1,
        aupll_dl_ctrl_10: u1,
        aupll_dl_ctrl_6: u1,
        aupll_dl_ctrl_5: u1,
        aupll_dl_ctrl_4: u1,
        aupll_dl_ctrl_3: u1,
        aupll_dl_ctrl_2p5: u1,
        aupll_dl_ctrl_2: u1,
        aupll_dl_ctrl_1: u1,
    }),

    padding1920: [20]u32,
    // 0x7d0
    cpu_pll_cfg0: mmio.Mmio(packed struct(u32) {
        cpupll_sdm_rstb: u1,
        cpupll_postdiv_rstb: u1,
        cpupll_fbdv_rstb: u1,
        cpupll_refdiv_rstb: u1,
        pu_cpupll_postdiv: u1,
        pu_cpupll_fbdv: u1,
        pu_cpupll_clamp_op: u1,
        pu_cpupll_pfd: u1,
        pu_cpupll_cp: u1,
        pu_cpupll_sfreg: u1,
        pu_cpupll: u1,
        pu_cpupll_clktree: u1,
        reserved12: u20,
    }),

    // 0x7d4
    cpu_pll_cfg1: mmio.Mmio(packed struct(u32) {
        cpupll_postdiv: u7,
        reserved7: u1,
        cpupll_refdiv_ratio: u4,
        reserved12: u4,
        cpupll_refclk_sel: u2,
        reserved18: u2,
        cpupll_vg11_sel: u2,
        reserved22: u2,
        cpupll_vg13_sel: u2,
        reserved26: u6,
    }),

    // 0x7d8
    cpu_pll_cfg2: mmio.Mmio(packed struct(u32) {
        cpupll_sel_cp_bias: u1,
        reserved1: u3,
        cpupll_icp_5u: u2,
        cpupll_icp_1u: u2,
        cpupll_int_frac_sw: u1,
        cpupll_cp_startup_en: u1,
        cpupll_cp_opamp_en: u1,
        reserved11: u21,
    }),

    // 0x7dc
    cpu_pll_cfg3: mmio.Mmio(packed struct(u32) {
        cpupll_c4_en: u1,
        reserved1: u3,
        cpupll_r4: u2,
        reserved6: u2,
        cpupll_r4_short: u1,
        reserved9: u3,
        cpupll_c3: u2,
        cpupll_cz: u2,
        cpupll_rz: u3,
        reserved19: u13,
    }),

    // 0x7e0
    cpu_pll_cfg4: mmio.Mmio(packed struct(u32) {
        cpupll_sel_sample_clk: u2,
        reserved2: u2,
        cpupll_sel_fb_clk: u2,
        reserved6: u2,
        cpupll_sdmclk_sel: u1,
        reserved9: u23,
    }),

    // 0x7e4
    cpu_pll_cfg5: mmio.Mmio(packed struct(u32) {
        cpupll_vco_speed: u3,
        reserved3: u29,
    }),

    // 0x7e8
    cpu_pll_cfg6: mmio.Mmio(packed struct(u32) {
        cpupll_sdmin: u19,
        reserved19: u5,
        cpupll_sdm_bypass: u1,
        reserved25: u7,
    }),

    // 0x7ec
    cpu_pll_cfg7: mmio.Mmio(packed struct(u32) {
        cpupll_sdm_order_sel: u1,
        reserved1: u15,
        cpupll_sdm_sig_dith_sel: u2,
        reserved18: u14,
    }),

    // 0x7f0
    cpu_pll_cfg8: mmio.Mmio(packed struct(u32) {
        cpupll_en_div1: u1,
        cpupll_en_div2: u1,
        cpupll_en_div2p5: u1,
        cpupll_en_div3: u1,
        cpupll_en_div4: u1,
        cpupll_en_div5: u1,
        cpupll_en_div6: u1,
        cpupll_en_div10: u1,
        cpupll_en_div15: u1,
        cpupll_sel_div1_div2: u1,
        reserved10: u22,
    }),

    // 0x7f4
    cpu_pll_cfg9: mmio.Mmio(packed struct(u32) {
        cpupll_dc_tp_out_en: u1,
        ten_cpupll: u1,
        ten_cpupll_sfreg: u1,
        reserved3: u1,
        dten_cpupll_fin: u1,
        dten_cpupll_fref: u1,
        dten_cpupll_fsdm: u1,
        dten_cpupll_div15: u1,
        dten_cpupll_div5: u1,
        dten_cpupll_postdiv_clk: u1,
        dtest_cpupll_pulldown: u1,
        reserved11: u21,
    }),

    // 0x7f8
    cpu_pll_cfg10: mmio.Mmio(packed struct(u32) {
        cpupll_ssc_en: u1,
        reserved1: u3,
        cpupll_ssc_cnt: u8,
        cpupll_ssc_gain: u3,
        reserved15: u1,
        cpupll_ssc_start_gate_en: u1,
        reserved17: u3,
        cpupll_ssc_start: u1,
        reserved21: u11,
    }),

    // 0x7fc
    cpu_pll_cfg11: mmio.Mmio(packed struct(u32) {
        cpupll_resv: u16,
        reserved16: u7,
        cpupll_dl_ctrl_15: u1,
        cpupll_dl_ctrl_10: u1,
        cpupll_dl_ctrl_6: u1,
        cpupll_dl_ctrl_5: u1,
        cpupll_dl_ctrl_4: u1,
        cpupll_dl_ctrl_3: u1,
        cpupll_dl_ctrl_2p5: u1,
        cpupll_dl_ctrl_2: u1,
        cpupll_dl_ctrl_1: u1,
    }),
};
