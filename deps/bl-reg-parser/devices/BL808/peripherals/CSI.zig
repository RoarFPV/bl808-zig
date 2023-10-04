const mmio = @import("microzig").mmio;

pub const Type = extern struct {
    // 0x0
    mipi_config: mmio.Mmio(packed struct(u32) {
        cr_csi_en: u1,
        cr_lane_num: u1,
        reserved2: u1,
        cr_lane_inv: u1,
        cr_data_bit_inv: u1,
        cr_sync_sp_en: u1,
        cr_unpack_en: u1,
        reserved7: u5,
        cr_vc_dvp0: u2,
        cr_vc_dvp1: u2,
        reserved16: u16,
    }),

    padding4: [3]u32,
    // 0x10
    csi_int_status: mmio.Mmio(packed struct(u32) {
        int_status: u6,
        reserved6: u26,
    }),

    // 0x14
    csi_int_mask: mmio.Mmio(packed struct(u32) {
        int_mask: u6,
        reserved6: u26,
    }),

    // 0x18
    csi_int_clear: mmio.Mmio(packed struct(u32) {
        int_clear: u6,
        reserved6: u26,
    }),

    // 0x1c
    csi_int_enable: mmio.Mmio(packed struct(u32) {
        int_enable: u6,
        reserved6: u26,
    }),

    // 0x20
    gnr_buf_status: mmio.Mmio(packed struct(u32) {
        st_gnr_fifo_cnt: u4,
        reserved4: u28,
    }),

    // 0x24
    gnr_buf_rdata: mmio.Mmio(packed struct(u32) {
        gnr_buf_rdata: u32,
    }),

    padding40: [22]u32,
    // 0x80
    dphy_config_0: mmio.Mmio(packed struct(u32) {
        dl0_enable: u1,
        dl1_enable: u1,
        cl_enable: u1,
        reserved3: u1,
        dl0_stopstate: u1,
        dl1_stopstate: u1,
        cl_stopstate: u1,
        reserved7: u1,
        dl0_ulpsactivenot: u1,
        dl1_ulpsactivenot: u1,
        cl_ulpsactivenot: u1,
        reserved11: u1,
        dl0_forcerxmode: u1,
        dl1_forcerxmode: u1,
        cl_rxclkactivehs: u1,
        cl_rxulpsclknot: u1,
        reserved16: u15,
        reset_n: u1,
    }),

    // 0x84
    dphy_config_1: mmio.Mmio(packed struct(u32) {
        reg_time_ck_settle: u8,
        reg_time_ck_term_en: u8,
        reg_time_hs_settle: u8,
        reg_time_hs_term_en: u8,
    }),

    // 0x88
    dphy_config_2: mmio.Mmio(packed struct(u32) {
        reg_ana_lprxen_clk: u1,
        reg_ana_hsrxen_clk: u1,
        reg_ana_hsrx_stop_state: u2,
        reg_ana_hsrx_sync_en: u2,
        reg_ana_lprxen: u2,
        reg_ana_hsrxen: u2,
        reg_ana_term_en: u5,
        reg_ana_test_en: u1,
        reg_pt_lock_counter: u4,
        reg_pt_prbs_or_jitt: u1,
        reg_pt_lp_mode: u1,
        reg_pt_en: u1,
        reg_pt_lock: u1,
        reg_pt_pass: u1,
        reserved25: u7,
    }),

    // 0x8c
    dphy_config_3: mmio.Mmio(packed struct(u32) {
        reg_csi_ana_1: u16,
        reg_csi_ana_0: u16,
    }),

    // 0x90
    dphy_config_4: mmio.Mmio(packed struct(u32) {
        reg_csi_dc_tp_out_en: u1,
        reserved1: u3,
        reg_csi_pw_avdd1815: u1,
        reserved5: u27,
    }),

    // 0x94
    dphy_config_5: mmio.Mmio(packed struct(u32) {
        reg_csi_byte_clk_inv: u1,
        reg_csi_ddr_clk_inv: u1,
        reserved2: u30,
    }),

    padding152: [25]u32,
    // 0xfc
    dummy_reg: mmio.Mmio(packed struct(u32) {
        dummy_reg: u32,
    }),
};
