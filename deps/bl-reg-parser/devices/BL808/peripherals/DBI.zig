const mmio = @import("microzig").mmio;

pub const Type = extern struct {
    // 0x0
    dbi_config: mmio.Mmio(packed struct(u32) {
        cr_dbi_en: u1,
        cr_dbi_sel: u2,
        reserved3: u1,
        cr_dbi_cmd_en: u1,
        cr_dbi_dat_en: u1,
        cr_dbi_dat_wr: u1,
        cr_dbi_dat_tp: u1,
        cr_dbi_dat_bc: u8,
        cr_dbi_scl_pol: u1,
        cr_dbi_scl_ph: u1,
        cr_dbi_cont_en: u1,
        cr_dbi_dmy_en: u1,
        cr_dbi_dmy_cnt: u4,
        cr_dbi_cs_stretch: u1,
        reserved25: u6,
        sts_dbi_bus_busy: u1,
    }),

    // 0x4
    qspi_config: mmio.Mmio(packed struct(u32) {
        cr_qspi_cmd_4b: u1,
        cr_qspi_adr_4b: u1,
        cr_qspi_dat_4b: u1,
        reserved3: u1,
        cr_qspi_adr_bc: u2,
        reserved6: u26,
    }),

    // 0x8
    dbi_pix_cnt: mmio.Mmio(packed struct(u32) {
        cr_dbi_pix_cnt: u24,
        reserved24: u7,
        cr_dbi_pix_format: u1,
    }),

    // 0xc
    dbi_prd: mmio.Mmio(packed struct(u32) {
        cr_dbi_prd_s: u8,
        cr_dbi_prd_i: u8,
        cr_dbi_prd_d_ph_0: u8,
        cr_dbi_prd_d_ph_1: u8,
    }),

    // 0x10
    dbi_cmd: mmio.Mmio(packed struct(u32) {
        cr_dbi_cmd: u8,
        reserved8: u24,
    }),

    // 0x14
    dbi_qspi_adr: mmio.Mmio(packed struct(u32) {
        cr_qspi_adr: u32,
    }),

    // 0x18
    dbi_rdata_0: mmio.Mmio(packed struct(u32) {
        sts_dbi_rdata_0: u32,
    }),

    // 0x1c
    dbi_rdata_1: mmio.Mmio(packed struct(u32) {
        sts_dbi_rdata_1: u32,
    }),

    padding32: [4]u32,
    // 0x30
    dbi_int_sts: mmio.Mmio(packed struct(u32) {
        end_int: u1,
        txf_int: u1,
        fer_int: u1,
        reserved3: u5,
        cr_dbi_end_mask: u1,
        cr_dbi_txf_mask: u1,
        cr_dbi_fer_mask: u1,
        reserved11: u5,
        cr_dbi_end_clr: u1,
        reserved17: u7,
        cr_dbi_end_en: u1,
        cr_dbi_txf_en: u1,
        cr_dbi_fer_en: u1,
        reserved27: u5,
    }),

    padding52: [11]u32,
    // 0x60
    dbi_yuv_rgb_config_0: mmio.Mmio(packed struct(u32) {
        cr_y2r_pre_0: u9,
        reserved9: u1,
        cr_y2r_pre_1: u9,
        reserved19: u1,
        cr_y2r_pre_2: u9,
        reserved29: u2,
        cr_y2r_en: u1,
    }),

    // 0x64
    dbi_yuv_rgb_config_1: mmio.Mmio(packed struct(u32) {
        cr_y2r_pos_0: u9,
        reserved9: u1,
        cr_y2r_pos_1: u9,
        reserved19: u1,
        cr_y2r_pos_2: u9,
        reserved29: u3,
    }),

    // 0x68
    dbi_yuv_rgb_config_2: mmio.Mmio(packed struct(u32) {
        cr_y2r_mtx_00: u12,
        cr_y2r_mtx_01: u12,
        cr_y2r_mtx_02_l: u8,
    }),

    // 0x6c
    dbi_yuv_rgb_config_3: mmio.Mmio(packed struct(u32) {
        cr_y2r_mtx_02_u: u4,
        cr_y2r_mtx_10: u12,
        cr_y2r_mtx_11: u12,
        cr_y2r_mtx_12_l: u4,
    }),

    // 0x70
    dbi_yuv_rgb_config_4: mmio.Mmio(packed struct(u32) {
        cr_y2r_mtx_12_u: u8,
        cr_y2r_mtx_20: u12,
        cr_y2r_mtx_21: u12,
    }),

    // 0x74
    dbi_yuv_rgb_config_5: mmio.Mmio(packed struct(u32) {
        cr_y2r_mtx_22: u12,
        reserved12: u20,
    }),

    padding120: [2]u32,
    // 0x80
    dbi_fifo_config_0: mmio.Mmio(packed struct(u32) {
        dma_tx_en: u1,
        reserved1: u1,
        tx_fifo_clr: u1,
        reserved3: u1,
        tx_fifo_overflow: u1,
        tx_fifo_underflow: u1,
        reserved6: u22,
        fifo_yuv_mode: u1,
        fifo_format: u3,
    }),

    // 0x84
    dbi_fifo_config_1: mmio.Mmio(packed struct(u32) {
        tx_fifo_cnt: u4,
        reserved4: u12,
        tx_fifo_th: u3,
        reserved19: u13,
    }),

    // 0x88
    dbi_fifo_wdata: mmio.Mmio(packed struct(u32) {
        fifo_wdata: u32,
    }),
};
