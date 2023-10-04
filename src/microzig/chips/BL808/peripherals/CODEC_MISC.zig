const mmio = @import("microzig").mmio;

pub const Type = extern struct {
    // 0x0
    codec_bus_ctrl: mmio.Mmio(packed struct(u32) {
        rg_pclk_force_on: u16,
        reserved16: u16,
    }),

    // 0x4
    codec_qos_ctrl: mmio.Mmio(packed struct(u32) {
        reg_jenc_awqos: u1,
        reg_jenc_arqos: u1,
        reg_jdec_awqos: u1,
        reg_jdec_arqos: u1,
        reg_vdo0_awqos: u1,
        reg_vdo0_arqos: u1,
        reg_vdo1_awqos: u1,
        reg_vdo1_arqos: u1,
        reg_ref_awqos: u1,
        reg_ref_arqos: u1,
        reg_cnn_awqos: u1,
        reg_cnn_arqos: u1,
        reserved12: u20,
    }),

    // 0x8
    codec_bus_thre: mmio.Mmio(packed struct(u32) {
        reg_x_wthre_blai2sysram: u2,
        reg_x_wthre_blai2ext: u2,
        reg_x_wthre_vdo2pb: u2,
        reg_x_wthre_vdo2pa: u2,
        reg_x_wthre_vdo2sysram: u2,
        reserved10: u22,
    }),

    padding12: [1]u32,
    // 0x10
    codec_bus_dec_err: mmio.Mmio(packed struct(u32) {
        reg_dec_err_clr: u1,
        reg_dec_err_latch_last: u1,
        reserved2: u6,
        codec_hs_dec_err_lat: u1,
        codec_hs_dec_err_write: u1,
        reserved10: u2,
        codec_hs_dec_err_src: u2,
        reserved14: u2,
        codec_hs_dec_err_id: u1,
        reserved17: u15,
    }),

    // 0x14
    codec_bus_dec_err_addr: mmio.Mmio(packed struct(u32) {
        codec_hs_dec_err_addr: u32,
    }),

    padding24: [2]u32,
    // 0x20
    blai_lmtr_rd: mmio.Mmio(packed struct(u32) {
        reg_blai_rcmd_cnt: u16,
        reserved16: u15,
        reg_blai_rcmd_mode: u1,
    }),

    // 0x24
    blai_lmtr_wr: mmio.Mmio(packed struct(u32) {
        reg_blai_wcmd_cnt: u16,
        reserved16: u15,
        reg_blai_wcmd_mode: u1,
    }),

    // 0x28
    id_selection: mmio.Mmio(packed struct(u32) {
        rg_jenc_id_sel: u1,
        reserved1: u31,
    }),

    padding44: [52]u32,
    // 0xfc
    dummy: mmio.Mmio(packed struct(u32) {
        dummy_reg: u32,
    }),
};
