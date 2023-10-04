const mmio = @import("microzig").mmio;

pub const Type = extern struct {
    // 0x0
    config: mmio.Mmio(packed struct(u32) {
        rg_dvpas_enable: u1,
        rg_dvpas_hs_inv: u1,
        rg_dvpas_vs_inv: u1,
        rg_dvpas_da_order: u1,
        reserved4: u12,
        rg_dvpas_fifo_th: u11,
        reserved27: u5,
    }),

    // 0x4
    pix_data_ctrl: mmio.Mmio(packed struct(u32) {
        reg_pix_data_ctrl: u12,
        reserved12: u4,
        reg_pix_data_sht_bit: u4,
        reg_pix_data_sht_dir: u1,
        reserved21: u10,
        reg_isp_dtsrc_src: u1,
    }),

    // 0x8
    dvp2bus_src_sel_1: mmio.Mmio(packed struct(u32) {
        rg_d2b_dvp_sel_a: u6,
        reserved6: u1,
        rg_d2x_id_sel_a: u1,
        rg_d2b_dvp_sel_b: u6,
        reserved14: u1,
        rg_d2x_id_sel_b: u1,
        rg_d2b_dvp_sel_c: u6,
        reserved22: u1,
        rg_d2x_id_sel_c: u1,
        rg_d2b_dvp_sel_d: u6,
        reserved30: u1,
        rg_d2x_id_sel_d: u1,
    }),

    padding12: [2]u32,
    // 0x14
    dvp2bus_src_sel_2: mmio.Mmio(packed struct(u32) {
        rg_d2b_dvp_sel_e: u6,
        reserved6: u1,
        rg_d2x_id_sel_e: u1,
        rg_d2b_dvp_sel_f: u6,
        reserved14: u1,
        rg_d2x_id_sel_f: u1,
        rg_d2b_dvp_sel_g: u6,
        reserved22: u1,
        rg_d2x_id_sel_g: u1,
        rg_d2b_dvp_sel_h: u6,
        reserved30: u1,
        rg_d2x_id_sel_h: u1,
    }),

    padding24: [82]u32,
    // 0x160
    y2rA_config_0: mmio.Mmio(packed struct(u32) {
        rg_y2ra_pre_0: u9,
        reserved9: u7,
        rg_y2ra_pos_0: u9,
        reserved25: u2,
        rg_y2ra_en: u1,
        rg_y2ra_sel: u4,
    }),

    // 0x164
    y2rA_config_1: mmio.Mmio(packed struct(u32) {
        rg_y2ra_pre_1: u9,
        reserved9: u7,
        rg_y2ra_pos_1: u9,
        reserved25: u7,
    }),

    // 0x168
    y2rA_config_2: mmio.Mmio(packed struct(u32) {
        rg_y2ra_pre_2: u9,
        reserved9: u7,
        rg_y2ra_pos_2: u9,
        reserved25: u7,
    }),

    // 0x16c
    y2rA_config_3: mmio.Mmio(packed struct(u32) {
        rg_y2ra_mtx_00: u12,
        reserved12: u4,
        rg_y2ra_mtx_01: u12,
        reserved28: u4,
    }),

    // 0x170
    y2rA_config_4: mmio.Mmio(packed struct(u32) {
        rg_y2ra_mtx_02: u12,
        reserved12: u4,
        rg_y2ra_mtx_10: u12,
        reserved28: u4,
    }),

    // 0x174
    y2rA_config_5: mmio.Mmio(packed struct(u32) {
        rg_y2ra_mtx_11: u12,
        reserved12: u4,
        rg_y2ra_mtx_12: u12,
        reserved28: u4,
    }),

    // 0x178
    y2rA_config_6: mmio.Mmio(packed struct(u32) {
        rg_y2ra_mtx_20: u12,
        reserved12: u4,
        rg_y2ra_mtx_21: u12,
        reserved28: u4,
    }),

    // 0x17c
    y2rA_config_7: mmio.Mmio(packed struct(u32) {
        rg_y2ra_mtx_22: u12,
        reserved12: u20,
    }),

    // 0x14
    dvp2bus_src_sel_2: mmio.Mmio(packed struct(u32) {
        reg_yuv_idgen_rst: u1,
        reg_yuv_idgen_edge: u1,
        reserved2: u14,
        reg_yuv_idgen_cnt_incr: u16,
    }),
};
