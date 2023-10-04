const mmio = @import("microzig").mmio;

pub const Type = extern struct {
    // 0x0
    uhs_basic: mmio.Mmio(packed struct(u32) {
        reg_init_en: u1,
        reg_af_en: u1,
        reg_config_req: u1,
        reg_config_gnt: u1,
        reserved4: u4,
        reg_mode_reg: u8,
        reg_addrmb_msk: u8,
        reserved24: u4,
        reg_linear_bnd_b: u4,
    }),

    // 0x4
    uhs_cmd: mmio.Mmio(packed struct(u32) {
        reg_glbr_pulse: u1,
        reg_srfi_pulse: u1,
        reg_srfo_pulse: u1,
        reg_regw_pulse: u1,
        reg_regr_pulse: u1,
        reserved5: u3,
        sts_glbr_done: u1,
        sts_srfi_done: u1,
        sts_srfo_done: u1,
        sts_regw_done: u1,
        sts_regr_done: u1,
        sts_init_done: u1,
        reserved14: u10,
        sts_config_read: u8,
    }),

    // 0x8
    uhs_fifo_thre: mmio.Mmio(packed struct(u32) {
        reg_mask_w_fifo_cnt: u16,
        reg_mask_r_fifo_rem: u16,
    }),

    // 0xc
    uhs_manual: mmio.Mmio(packed struct(u32) {
        reg_force_ceb_low: u1,
        reg_force_ceb_high: u1,
        reg_psram_resetb: u1,
        reg_x16_mode: u1,
        reg_wrap2incr_en: u1,
        reserved5: u11,
        reg_pck_s_div: u3,
        reserved19: u5,
        reg_pck_t_div: u8,
    }),

    // 0x10
    uhs_auto_fresh_1: mmio.Mmio(packed struct(u32) {
        reg_win_cycle: u28,
        reserved28: u4,
    }),

    // 0x14
    uhs_auto_fresh_2: mmio.Mmio(packed struct(u32) {
        reg_refi_cycle: u16,
        reg_win_ref_cnt: u13,
        reserved29: u3,
    }),

    // 0x18
    uhs_auto_fresh_3: mmio.Mmio(packed struct(u32) {
        reg_auto_ref_thre: u12,
        reserved12: u4,
        auto_refresh_level: u12,
        reserved28: u4,
    }),

    // 0x1c
    uhs_auto_fresh_4: mmio.Mmio(packed struct(u32) {
        reg_bust_cycle: u7,
        reserved7: u25,
    }),

    // 0x20
    uhs_psram_configure: mmio.Mmio(packed struct(u32) {
        reg_uhs_latency: u3,
        reserved3: u1,
        reg_uhs_drive_st: u4,
        reg_uhs_bl_16: u1,
        reg_uhs_bl_32: u1,
        reg_uhs_bl_64: u1,
        reserved11: u21,
    }),

    // 0x24
    uhs_psram_status: mmio.Mmio(packed struct(u32) {
        sts_uhs_latency: u3,
        reserved3: u1,
        sts_uhs_drive_st: u4,
        sts_uhs_bl_16: u1,
        sts_uhs_bl_32: u1,
        sts_uhs_bl_64: u1,
        reserved11: u21,
    }),

    padding40: [2]u32,
    // 0x30
    uhs_timing_ctrl: mmio.Mmio(packed struct(u32) {
        reg_trc_cycle: u8,
        reg_tcphr_cycle: u8,
        reg_tcphw_cycle: u8,
        reg_trfc_cycle: u8,
    }),

    // 0x34
    uhs_rsvd_reg: mmio.Mmio(packed struct(u32) {
        reg_mr0_7: u1,
        reg_mr2_2_0: u3,
        reg_mr2_7_6: u2,
        reserved6: u26,
    }),

    padding56: [34]u32,
    // 0xc0
    uhs_dbg_sel: mmio.Mmio(packed struct(u32) {
        reg_psram_dbg_en: u1,
        reserved1: u3,
        reg_psram_dbg_sel: u4,
        reserved8: u24,
    }),

    padding196: [11]u32,
    // 0xf0
    uhs_dummy_reg: mmio.Mmio(packed struct(u32) {
        reg_psram_dummy_reg: u32,
    }),

    padding244: [3]u32,
    // 0x100
    phy_cfg_00: mmio.Mmio(packed struct(u32) {
        dqs_rdy: u1,
        reserved1: u7,
        ck_sr: u2,
        reserved10: u5,
        clk0_polarity: u1,
        ck_dly_drv: u4,
        cen_sr: u2,
        reserved22: u6,
        cen_dly_drv: u4,
    }),

    // 0x104
    phy_cfg_04: mmio.Mmio(packed struct(u32) {
        reserved0: u4,
        dm1_sr: u2,
        reserved6: u6,
        dm1_dly_drv: u4,
        reserved16: u4,
        dm0_sr: u2,
        reserved22: u6,
        dm0_dly_drv: u4,
    }),

    // 0x108
    phy_cfg_08: mmio.Mmio(packed struct(u32) {
        dq1_sr: u2,
        reserved2: u6,
        dq1_dly_rx: u4,
        dq1_dly_drv: u4,
        dq0_sr: u2,
        reserved18: u6,
        dq0_dly_rx: u4,
        dq0_dly_drv: u4,
    }),

    // 0x10c
    phy_cfg_0c: mmio.Mmio(packed struct(u32) {
        dq3_sr: u2,
        reserved2: u6,
        dq3_dly_rx: u4,
        dq3_dly_drv: u4,
        dq2_sr: u2,
        reserved18: u6,
        dq2_dly_rx: u4,
        dq2_dly_drv: u4,
    }),

    // 0x110
    phy_cfg_10: mmio.Mmio(packed struct(u32) {
        dq5_sr: u2,
        reserved2: u6,
        dq5_dly_rx: u4,
        dq5_dly_drv: u4,
        dq4_sr: u2,
        reserved18: u6,
        dq4_dly_rx: u4,
        dq4_dly_drv: u4,
    }),

    // 0x114
    phy_cfg_14: mmio.Mmio(packed struct(u32) {
        dq7_sr: u2,
        reserved2: u6,
        dq7_dly_rx: u4,
        dq7_dly_drv: u4,
        dq6_sr: u2,
        reserved18: u6,
        dq6_dly_rx: u4,
        dq6_dly_drv: u4,
    }),

    // 0x118
    phy_cfg_18: mmio.Mmio(packed struct(u32) {
        dq9_sr: u2,
        reserved2: u6,
        dq9_dly_rx: u4,
        dq9_dly_drv: u4,
        dq8_sr: u2,
        reserved18: u6,
        dq8_dly_rx: u4,
        dq8_dly_drv: u4,
    }),

    // 0x11c
    phy_cfg_1c: mmio.Mmio(packed struct(u32) {
        dq11_sr: u2,
        reserved2: u6,
        dq11_dly_rx: u4,
        dq11_dly_drv: u4,
        dq10_sr: u2,
        reserved18: u6,
        dq10_dly_rx: u4,
        dq10_dly_drv: u4,
    }),

    // 0x120
    phy_cfg_20: mmio.Mmio(packed struct(u32) {
        dq13_sr: u2,
        reserved2: u6,
        dq13_dly_rx: u4,
        dq13_dly_drv: u4,
        dq12_sr: u2,
        reserved18: u6,
        dq12_dly_rx: u4,
        dq12_dly_drv: u4,
    }),

    // 0x124
    phy_cfg_24: mmio.Mmio(packed struct(u32) {
        dq15_sr: u2,
        reserved2: u6,
        dq15_dly_rx: u4,
        dq15_dly_drv: u4,
        dq14_sr: u2,
        reserved18: u6,
        dq14_dly_rx: u4,
        dq14_dly_drv: u4,
    }),

    // 0x128
    phy_cfg_28: mmio.Mmio(packed struct(u32) {
        reserved0: u8,
        dqs0n_dly_rx: u4,
        dqs0_sr: u2,
        dqs0_sel: u2,
        reserved16: u4,
        dqs0_dly_rx: u4,
        dqs0_dly_drv: u4,
        dqs0_diff_dly_rx: u4,
    }),

    // 0x12c
    phy_cfg_2c: mmio.Mmio(packed struct(u32) {
        ipp5un_lpddr: u1,
        en_rx_fe: u1,
        en_bias: u1,
        reserved3: u5,
        dqs1n_dly_rx: u4,
        dqs1_sr: u2,
        dqs1_sel: u2,
        reserved16: u4,
        dqs1_dly_rx: u4,
        dqs1_dly_drv: u4,
        dqs1_diff_dly_rx: u4,
    }),

    // 0x130
    phy_cfg_30: mmio.Mmio(packed struct(u32) {
        phy_wl_dq_dig: u3,
        reserved3: u1,
        phy_wl_dq_ana: u3,
        reserved7: u1,
        phy_wl_dig: u3,
        reserved11: u1,
        phy_wl_ana: u3,
        reserved15: u1,
        phy_rl_dig: u4,
        phy_rl_ana: u3,
        reserved23: u1,
        oe_timer: u2,
        vref_mode: u1,
        oe_ctrl_hw: u1,
        odt_sel: u4,
    }),

    // 0x134
    phy_cfg_34: mmio.Mmio(packed struct(u32) {
        reg_timer_dqs_start: u8,
        reg_timer_dqs_array_stop: u8,
        reg_timer_array_write: u8,
        reg_timer_array_read: u8,
    }),

    // 0x138
    phy_cfg_38: mmio.Mmio(packed struct(u32) {
        reg_timer_auto_refresh: u8,
        reg_timer_reg_write: u8,
        reg_timer_reg_read: u8,
        reg_timer_dqs_stop: u8,
    }),

    // 0x13c
    phy_cfg_3c: mmio.Mmio(packed struct(u32) {
        reg_timer_self_refresh1_in: u8,
        reg_timer_self_refresh1_exit: u8,
        reg_timer_global_rst: u14,
        reserved30: u2,
    }),

    // 0x140
    phy_cfg_40: mmio.Mmio(packed struct(u32) {
        vref_sel: u4,
        vref_dq_sel: u4,
        reg_uhs_dmy0: u8,
        reg_uhs_dmy1: u8,
        reg_uhs_phy_ten: u1,
        soc_en_aon: u1,
        ten_uhs_phy: u1,
        ten_uhs_phy_dig: u1,
        reserved28: u1,
        tx_clktree_gate_hw: u1,
        uhs_dc_tp_out_en: u1,
        uhs_phy_dqs_diff: u1,
    }),

    // 0x144
    phy_cfg_44: mmio.Mmio(packed struct(u32) {
        reg_timer_array_read_busy: u8,
        reg_timer_array_write_busy: u8,
        reg_timer_reg_read_busy: u8,
        reg_timer_reg_write_busy: u8,
    }),

    // 0x148
    phy_cfg_48: mmio.Mmio(packed struct(u32) {
        tmux: u3,
        chip_en_33: u1,
        tmux_uhs_phy_dig: u3,
        reserved7: u1,
        psram_type: u2,
        reserved10: u1,
        pu_uhs_pw1p8: u1,
        reg_test_div_sel: u3,
        en_rx_fe_hw: u1,
        reg_test_mux_sel: u3,
        force_fsm: u1,
        en_rx_fe_dly: u4,
        reserved24: u8,
    }),

    // 0x14c
    phy_cfg_4c: mmio.Mmio(packed struct(u32) {
        tout_uhs_phy_dig: u16,
        odt_sel_dly: u4,
        odt_sel_hw: u1,
        reserved21: u11,
    }),

    // 0x150
    phy_cfg_50: mmio.Mmio(packed struct(u32) {
        dq_oe_up_p_reg: u3,
        reserved3: u1,
        dq_oe_up_n_reg: u3,
        reserved7: u1,
        dq_oe_mid_p_reg: u3,
        reserved11: u1,
        dq_oe_mid_n_reg: u3,
        reserved15: u1,
        dq_oe_dn_p_reg: u3,
        reserved19: u1,
        dq_oe_dn_n_reg: u3,
        reserved23: u1,
        phy_wl_cen_ana: u3,
        reserved27: u5,
    }),
};
