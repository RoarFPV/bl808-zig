const mmio = @import("microzig").mmio;

pub const Type = extern struct {
    // 0x0
    configure: mmio.Mmio(packed struct(u32) {
        reg_vendor_sel: u3,
        reserved3: u1,
        reg_ap_mr: u3,
        reserved7: u1,
        reg_wb_reg_sel: u3,
        reserved11: u1,
        reg_config_w_pusle: u1,
        reg_config_r_pusle: u1,
        sts_config_w_done: u1,
        sts_config_r_done: u1,
        reg_config_req: u1,
        reg_config_gnt: u1,
        reg_x16_mode: u1,
        reg_wb_hyper3: u1,
        reg_pck_s_div: u3,
        reg_clkn_free: u1,
        reserved24: u4,
        reg_linear_bnd_b: u4,
    }),

    // 0x4
    manual_control: mmio.Mmio(packed struct(u32) {
        reg_wc_sw: u7,
        reserved7: u1,
        reg_wc_sw_en: u1,
        reg_state_hold_tick: u1,
        reg_dqs_latch_inv: u1,
        reg_wb_bl2_mask: u1,
        reg_force_ceb_low: u1,
        reg_force_ceb_high: u1,
        reg_psram_resetb: u1,
        reg_ck_edge_nali: u1,
        sts_config_read: u16,
    }),

    // 0x8
    fifo_thres_control: mmio.Mmio(packed struct(u32) {
        reg_mask_w_fifo_cnt: u16,
        reg_mask_r_fifo_rem: u16,
    }),

    // 0xc
    manual_control2: mmio.Mmio(packed struct(u32) {
        reg_hold_cycle_sw: u7,
        reg_hc_sw_en: u1,
        reg_dqs_rel_val: u7,
        reserved15: u1,
        reg_pwrap_sw_sht_b: u4,
        reserved20: u3,
        reg_pwrap_sw_en: u1,
        reg_addr_mask: u8,
    }),

    // 0x10
    winbond_psram_configure: mmio.Mmio(packed struct(u32) {
        reg_wb_latency: u4,
        reg_wb_drive_st: u3,
        reg_wb_hybrid_en: u1,
        reg_wb_burst_length: u3,
        reserved11: u1,
        reg_wb_fix_latency: u1,
        reg_wb_dpd_dis: u1,
        reserved14: u2,
        reg_wb_pasr: u5,
        reserved21: u3,
        reg_wb_hybrid_slp: u1,
        reg_wb_linear_dis: u1,
        reserved26: u3,
        reg_wb_ipd: u1,
        reg_wb_mclk_type: u1,
        reg_wb_sw_rst: u1,
    }),

    // 0x14
    winbond_psram_status: mmio.Mmio(packed struct(u32) {
        sts_wb_latency: u4,
        sts_wb_drive_st: u3,
        sts_wb_hybrid_en: u1,
        sts_wb_burst_length: u3,
        reserved11: u1,
        sts_wb_fix_latency: u1,
        sts_wb_dpd_dis: u1,
        reserved14: u2,
        sts_wb_pasr: u5,
        reserved21: u3,
        sts_wb_hybrid_slp: u1,
        reserved25: u5,
        sts_wb_mclk_type: u1,
        reserved31: u1,
    }),

    // 0x18
    winbond_psram_configure2: mmio.Mmio(packed struct(u32) {
        reg_wb_zq_code: u4,
        reserved4: u28,
    }),

    padding28: [1]u32,
    // 0x20
    apmemory_psram_configure: mmio.Mmio(packed struct(u32) {
        reg_ap_burst_length: u2,
        reserved2: u2,
        reg_ap_burst_type: u1,
        reg_ap_rbx: u1,
        reg_ap_dpd: u1,
        reg_ap_sleep: u1,
        reg_ap_pasr: u3,
        reserved11: u1,
        reg_ap_w_latency_code: u3,
        reserved15: u1,
        reg_ap_drive_st: u2,
        reg_ap_rf: u2,
        reg_ap_r_latency_code: u3,
        reserved23: u1,
        reg_ap_r_latency_type: u1,
        reg_ap_linear_dis: u1,
        reserved26: u2,
        reg_glb_reset_pulse: u1,
        reserved29: u3,
    }),

    // 0x24
    apmemory_psram_status: mmio.Mmio(packed struct(u32) {
        sts_ap_burst_length: u2,
        reserved2: u2,
        sts_ap_burst_type: u1,
        sts_ap_rbx: u1,
        sts_ap_x16_mode: u1,
        reserved7: u1,
        sts_ap_pasr: u3,
        reserved11: u1,
        sts_ap_w_latency_code: u3,
        reserved15: u1,
        sts_ap_drive_st: u2,
        sts_ap_rf: u2,
        sts_ap_r_latency_code: u3,
        reserved23: u1,
        sts_ap_r_latency_type: u1,
        reserved25: u7,
    }),

    padding40: [2]u32,
    // 0x30
    manual_control3: mmio.Mmio(packed struct(u32) {
        reg_adq_rel_val: u7,
        reserved7: u1,
        reg_wrap2incr_en: u1,
        reserved9: u23,
    }),

    padding52: [19]u32,
    // 0x80
    intf_delay_ctrl0: mmio.Mmio(packed struct(u32) {
        reg_delay_sel_o_dqs_oen0: u8,
        reg_delay_sel_o_ceb: u8,
        reg_delay_sel_o_clk_n: u8,
        reg_delay_sel_o_clk: u8,
    }),

    // 0x84
    intf_delay_ctrl1: mmio.Mmio(packed struct(u32) {
        reg_delay_sel_o_adq1: u8,
        reg_delay_sel_o_adq0: u8,
        reg_delay_sel_o_adq_oen0: u8,
        reg_delay_sel_o_dqs0: u8,
    }),

    // 0x88
    intf_delay_ctrl2: mmio.Mmio(packed struct(u32) {
        reg_delay_sel_o_adq5: u8,
        reg_delay_sel_o_adq4: u8,
        reg_delay_sel_o_adq3: u8,
        reg_delay_sel_o_adq2: u8,
    }),

    // 0x8c
    intf_delay_ctrl3: mmio.Mmio(packed struct(u32) {
        reg_delay_sel_i_adq1: u8,
        reg_delay_sel_i_adq0: u8,
        reg_delay_sel_o_adq7: u8,
        reg_delay_sel_o_adq6: u8,
    }),

    // 0x90
    intf_delay_ctrl4: mmio.Mmio(packed struct(u32) {
        reg_delay_sel_i_adq5: u8,
        reg_delay_sel_i_adq4: u8,
        reg_delay_sel_i_adq3: u8,
        reg_delay_sel_i_adq2: u8,
    }),

    // 0x94
    intf_delay_ctrl5: mmio.Mmio(packed struct(u32) {
        reg_delay_sel_i_dqs0: u16,
        reg_delay_sel_i_adq7: u8,
        reg_delay_sel_i_adq6: u8,
    }),

    // 0x98
    intf_delay_ctrl6: mmio.Mmio(packed struct(u32) {
        reg_delay_sel_o_adq9: u8,
        reg_delay_sel_o_adq8: u8,
        reg_delay_sel_o_adq_oen1: u8,
        reg_delay_sel_o_dqs1: u8,
    }),

    // 0x9c
    intf_delay_ctrl7: mmio.Mmio(packed struct(u32) {
        reg_delay_sel_o_adq13: u8,
        reg_delay_sel_o_adq12: u8,
        reg_delay_sel_o_adq11: u8,
        reg_delay_sel_o_adq10: u8,
    }),

    // 0xa0
    intf_delay_ctrl8: mmio.Mmio(packed struct(u32) {
        reg_delay_sel_i_adq9: u8,
        reg_delay_sel_i_adq8: u8,
        reg_delay_sel_o_adq15: u8,
        reg_delay_sel_o_adq14: u8,
    }),

    // 0xa4
    intf_delay_ctrl9: mmio.Mmio(packed struct(u32) {
        reg_delay_sel_i_adq13: u8,
        reg_delay_sel_i_adq12: u8,
        reg_delay_sel_i_adq11: u8,
        reg_delay_sel_i_adq10: u8,
    }),

    // 0xa8
    intf_delay_ctrla: mmio.Mmio(packed struct(u32) {
        reg_delay_sel_i_dqs1: u16,
        reg_delay_sel_i_adq15: u8,
        reg_delay_sel_i_adq14: u8,
    }),

    // 0xac
    intf_delay_ctrlb: mmio.Mmio(packed struct(u32) {
        reg_delay_sel_o_dqs_mask: u8,
        reg_delay_sel_o_dqs_oen1: u8,
        reserved16: u16,
    }),

    padding176: [4]u32,
    // 0xc0
    dbg_sel: mmio.Mmio(packed struct(u32) {
        reg_psram_dbg_en: u1,
        reserved1: u3,
        reg_psram_dbg_sel: u4,
        reserved8: u24,
    }),

    padding196: [11]u32,
    // 0xf0
    dummy_reg: mmio.Mmio(packed struct(u32) {
        reg_psram_dummy_reg: u32,
    }),

    // 0xf4
    timeout_reg: mmio.Mmio(packed struct(u32) {
        reg_timeout_en: u1,
        reg_timeout_clr: u1,
        sts_timeout: u1,
        reserved3: u13,
        reg_timeout_cnt: u12,
        reserved28: u4,
    }),

    padding248: [2]u32,
    // 0x100
    rough_delay_ctrl0: mmio.Mmio(packed struct(u32) {
        reg_rough_sel_o_dqs_oen0: u8,
        reg_rough_sel_o_ceb: u8,
        reg_rough_sel_o_clk_n: u8,
        reg_rough_sel_o_clk: u8,
    }),

    // 0x104
    rough_delay_ctrl1: mmio.Mmio(packed struct(u32) {
        reg_rough_sel_o_adq1: u8,
        reg_rough_sel_o_adq0: u8,
        reg_rough_sel_o_adq_oen0: u8,
        reg_rough_sel_o_dqs0: u8,
    }),

    // 0x108
    rough_delay_ctrl2: mmio.Mmio(packed struct(u32) {
        reg_rough_sel_o_adq5: u8,
        reg_rough_sel_o_adq4: u8,
        reg_rough_sel_o_adq3: u8,
        reg_rough_sel_o_adq2: u8,
    }),

    // 0x10c
    rough_delay_ctrl3: mmio.Mmio(packed struct(u32) {
        reg_rough_sel_i_adq1: u8,
        reg_rough_sel_i_adq0: u8,
        reg_rough_sel_o_adq7: u8,
        reg_rough_sel_o_adq6: u8,
    }),

    // 0x110
    rough_delay_ctrl4: mmio.Mmio(packed struct(u32) {
        reg_rough_sel_i_adq5: u8,
        reg_rough_sel_i_adq4: u8,
        reg_rough_sel_i_adq3: u8,
        reg_rough_sel_i_adq2: u8,
    }),

    // 0x114
    rough_delay_ctrl5: mmio.Mmio(packed struct(u32) {
        reg_rough_sel_i_dqs0: u16,
        reg_rough_sel_i_adq7: u8,
        reg_rough_sel_i_adq6: u8,
    }),

    // 0x118
    rough_delay_ctrl6: mmio.Mmio(packed struct(u32) {
        reg_rough_sel_o_adq9: u8,
        reg_rough_sel_o_adq8: u8,
        reg_rough_sel_o_adq_oen1: u8,
        reg_rough_sel_o_dqs1: u8,
    }),

    // 0x11c
    rough_delay_ctrl7: mmio.Mmio(packed struct(u32) {
        reg_rough_sel_o_adq13: u8,
        reg_rough_sel_o_adq12: u8,
        reg_rough_sel_o_adq11: u8,
        reg_rough_sel_o_adq10: u8,
    }),

    // 0x120
    rough_delay_ctrl8: mmio.Mmio(packed struct(u32) {
        reg_rough_sel_i_adq9: u8,
        reg_rough_sel_i_adq8: u8,
        reg_rough_sel_o_adq15: u8,
        reg_rough_sel_o_adq14: u8,
    }),

    // 0x124
    rough_delay_ctrl9: mmio.Mmio(packed struct(u32) {
        reg_rough_sel_i_adq13: u8,
        reg_rough_sel_i_adq12: u8,
        reg_rough_sel_i_adq11: u8,
        reg_rough_sel_i_adq10: u8,
    }),

    // 0x128
    rough_delay_ctrla: mmio.Mmio(packed struct(u32) {
        reg_rough_sel_i_dqs1: u16,
        reg_rough_sel_i_adq15: u8,
        reg_rough_sel_i_adq14: u8,
    }),

    // 0x12c
    rough_delay_ctrlb: mmio.Mmio(packed struct(u32) {
        reg_rough_sel_o_dqs_mask: u8,
        reg_rough_sel_o_dqs_oen1: u8,
        reserved16: u16,
    }),
};
