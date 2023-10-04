const mmio = @import("microzig").mmio;

pub const Type = extern struct {
    // 0x0
    se_sha_0_ctrl: mmio.Mmio(packed struct(u32) {
        se_sha_0_busy: u1,
        se_sha_0_trig_1t: u1,
        se_sha_0_mode: u3,
        se_sha_0_en: u1,
        se_sha_0_hash_sel: u1,
        reserved7: u1,
        se_sha_0_int: u1,
        se_sha_0_int_clr_1t: u1,
        se_sha_0_int_set_1t: u1,
        se_sha_0_int_mask: u1,
        se_sha_0_mode_ext: u2,
        reserved14: u1,
        se_sha_0_link_mode: u1,
        se_sha_0_msg_len: u16,
    }),

    // 0x4
    se_sha_0_msa: mmio.Mmio(packed struct(u32) {
        se_sha_0_msa: u32,
    }),

    // 0x8
    se_sha_0_status: mmio.Mmio(packed struct(u32) {
        se_sha_0_status: u32,
    }),

    // 0xc
    se_sha_0_endian: mmio.Mmio(packed struct(u32) {
        se_sha_0_dout_endian: u1,
        reserved1: u31,
    }),

    // 0x10
    se_sha_0_hash_l_0: mmio.Mmio(packed struct(u32) {
        se_sha_0_hash_l_0: u32,
    }),

    // 0x14
    se_sha_0_hash_l_1: mmio.Mmio(packed struct(u32) {
        se_sha_0_hash_l_1: u32,
    }),

    // 0x18
    se_sha_0_hash_l_2: mmio.Mmio(packed struct(u32) {
        se_sha_0_hash_l_2: u32,
    }),

    // 0x1c
    se_sha_0_hash_l_3: mmio.Mmio(packed struct(u32) {
        se_sha_0_hash_l_3: u32,
    }),

    // 0x20
    se_sha_0_hash_l_4: mmio.Mmio(packed struct(u32) {
        se_sha_0_hash_l_4: u32,
    }),

    // 0x24
    se_sha_0_hash_l_5: mmio.Mmio(packed struct(u32) {
        se_sha_0_hash_l_5: u32,
    }),

    // 0x28
    se_sha_0_hash_l_6: mmio.Mmio(packed struct(u32) {
        se_sha_0_hash_l_6: u32,
    }),

    // 0x2c
    se_sha_0_hash_l_7: mmio.Mmio(packed struct(u32) {
        se_sha_0_hash_l_7: u32,
    }),

    // 0x30
    se_sha_0_hash_h_0: mmio.Mmio(packed struct(u32) {
        se_sha_0_hash_h_0: u32,
    }),

    // 0x34
    se_sha_0_hash_h_1: mmio.Mmio(packed struct(u32) {
        se_sha_0_hash_h_1: u32,
    }),

    // 0x38
    se_sha_0_hash_h_2: mmio.Mmio(packed struct(u32) {
        se_sha_0_hash_h_2: u32,
    }),

    // 0x3c
    se_sha_0_hash_h_3: mmio.Mmio(packed struct(u32) {
        se_sha_0_hash_h_3: u32,
    }),

    // 0x40
    se_sha_0_hash_h_4: mmio.Mmio(packed struct(u32) {
        se_sha_0_hash_h_4: u32,
    }),

    // 0x44
    se_sha_0_hash_h_5: mmio.Mmio(packed struct(u32) {
        se_sha_0_hash_h_5: u32,
    }),

    // 0x48
    se_sha_0_hash_h_6: mmio.Mmio(packed struct(u32) {
        se_sha_0_hash_h_6: u32,
    }),

    // 0x4c
    se_sha_0_hash_h_7: mmio.Mmio(packed struct(u32) {
        se_sha_0_hash_h_7: u32,
    }),

    // 0x50
    se_sha_0_link: mmio.Mmio(packed struct(u32) {
        se_sha_0_lca: u32,
    }),

    padding84: [42]u32,
    // 0xfc
    se_sha_0_ctrl_prot: mmio.Mmio(packed struct(u32) {
        reserved0: u1,
        se_sha_id0_en: u1,
        se_sha_id1_en: u1,
        reserved3: u29,
    }),

    // 0x100
    se_aes_0_ctrl: mmio.Mmio(packed struct(u32) {
        se_aes_0_busy: u1,
        se_aes_0_trig_1t: u1,
        se_aes_0_en: u1,
        se_aes_0_mode: u2,
        se_aes_0_dec_en: u1,
        se_aes_0_dec_key_sel: u1,
        se_aes_0_hw_key_en: u1,
        se_aes_0_int: u1,
        se_aes_0_int_clr_1t: u1,
        se_aes_0_int_set_1t: u1,
        se_aes_0_int_mask: u1,
        se_aes_0_block_mode: u2,
        se_aes_0_iv_sel: u1,
        se_aes_0_link_mode: u1,
        se_aes_0_msg_len: u16,
    }),

    // 0x104
    se_aes_0_msa: mmio.Mmio(packed struct(u32) {
        se_aes_0_msa: u32,
    }),

    // 0x108
    se_aes_0_mda: mmio.Mmio(packed struct(u32) {
        se_aes_0_mda: u32,
    }),

    // 0x10c
    se_aes_0_status: mmio.Mmio(packed struct(u32) {
        se_aes_0_status: u32,
    }),

    // 0x110
    se_aes_0_iv_0: mmio.Mmio(packed struct(u32) {
        se_aes_0_iv_0: u32,
    }),

    // 0x114
    se_aes_0_iv_1: mmio.Mmio(packed struct(u32) {
        se_aes_0_iv_1: u32,
    }),

    // 0x118
    se_aes_0_iv_2: mmio.Mmio(packed struct(u32) {
        se_aes_0_iv_2: u32,
    }),

    // 0x11c
    se_aes_0_iv_3: mmio.Mmio(packed struct(u32) {
        se_aes_0_iv_3: u32,
    }),

    // 0x120
    se_aes_0_key_0: mmio.Mmio(packed struct(u32) {
        se_aes_0_key_0: u32,
    }),

    // 0x124
    se_aes_0_key_1: mmio.Mmio(packed struct(u32) {
        se_aes_0_key_1: u32,
    }),

    // 0x128
    se_aes_0_key_2: mmio.Mmio(packed struct(u32) {
        se_aes_0_key_2: u32,
    }),

    // 0x12c
    se_aes_0_key_3: mmio.Mmio(packed struct(u32) {
        se_aes_0_key_3: u32,
    }),

    // 0x130
    se_aes_0_key_4: mmio.Mmio(packed struct(u32) {
        se_aes_0_key_4: u32,
    }),

    // 0x134
    se_aes_0_key_5: mmio.Mmio(packed struct(u32) {
        se_aes_0_key_5: u32,
    }),

    // 0x138
    se_aes_0_key_6: mmio.Mmio(packed struct(u32) {
        se_aes_0_key_6: u32,
    }),

    // 0x13c
    se_aes_0_key_7: mmio.Mmio(packed struct(u32) {
        se_aes_0_key_7: u32,
    }),

    // 0x140
    se_aes_0_key_sel: mmio.Mmio(packed struct(u32) {
        se_aes_0_key_sel: u2,
        reserved2: u30,
    }),

    // 0x144
    se_aes_1_key_sel: mmio.Mmio(packed struct(u32) {
        se_aes_1_key_sel: u2,
        reserved2: u30,
    }),

    // 0x148
    se_aes_0_endian: mmio.Mmio(packed struct(u32) {
        se_aes_0_dout_endian: u1,
        se_aes_0_din_endian: u1,
        se_aes_0_key_endian: u1,
        se_aes_0_iv_endian: u1,
        se_aes_0_twk_endian: u1,
        reserved5: u25,
        se_aes_0_ctr_len: u2,
    }),

    // 0x14c
    se_aes_sboot: mmio.Mmio(packed struct(u32) {
        se_aes_0_sboot_key_sel: u1,
        reserved1: u14,
        se_aes_0_xts_mode: u1,
        se_aes_0_uni_len: u16,
    }),

    // 0x150
    se_aes_0_link: mmio.Mmio(packed struct(u32) {
        se_aes_0_lca: u32,
    }),

    padding340: [42]u32,
    // 0x1fc
    se_aes_0_ctrl_prot: mmio.Mmio(packed struct(u32) {
        reserved0: u1,
        se_aes_id0_en: u1,
        se_aes_id1_en: u1,
        reserved3: u29,
    }),

    // 0x200
    se_trng_0_ctrl_0: mmio.Mmio(packed struct(u32) {
        se_trng_0_busy: u1,
        se_trng_0_trig_1t: u1,
        se_trng_0_en: u1,
        se_trng_0_dout_clr_1t: u1,
        se_trng_0_ht_error: u1,
        reserved5: u3,
        se_trng_0_int: u1,
        se_trng_0_int_clr_1t: u1,
        se_trng_0_int_set_1t: u1,
        se_trng_0_int_mask: u1,
        reserved12: u1,
        se_trng_0_manual_fun_sel: u1,
        se_trng_0_manual_reseed: u1,
        se_trng_0_manual_en: u1,
        reserved16: u16,
    }),

    // 0x204
    se_trng_0_status: mmio.Mmio(packed struct(u32) {
        se_trng_0_status: u32,
    }),

    // 0x208
    se_trng_0_dout_0: mmio.Mmio(packed struct(u32) {
        se_trng_0_dout_0: u32,
    }),

    // 0x20c
    se_trng_0_dout_1: mmio.Mmio(packed struct(u32) {
        se_trng_0_dout_1: u32,
    }),

    // 0x210
    se_trng_0_dout_2: mmio.Mmio(packed struct(u32) {
        se_trng_0_dout_2: u32,
    }),

    // 0x214
    se_trng_0_dout_3: mmio.Mmio(packed struct(u32) {
        se_trng_0_dout_3: u32,
    }),

    // 0x218
    se_trng_0_dout_4: mmio.Mmio(packed struct(u32) {
        se_trng_0_dout_4: u32,
    }),

    // 0x21c
    se_trng_0_dout_5: mmio.Mmio(packed struct(u32) {
        se_trng_0_dout_5: u32,
    }),

    // 0x220
    se_trng_0_dout_6: mmio.Mmio(packed struct(u32) {
        se_trng_0_dout_6: u32,
    }),

    // 0x224
    se_trng_0_dout_7: mmio.Mmio(packed struct(u32) {
        se_trng_0_dout_7: u32,
    }),

    // 0x228
    se_trng_0_test: mmio.Mmio(packed struct(u32) {
        se_trng_0_test_en: u1,
        se_trng_0_cp_test_en: u1,
        se_trng_0_cp_bypass: u1,
        se_trng_0_ht_dis: u1,
        se_trng_0_ht_alarm_n: u8,
        reserved12: u20,
    }),

    // 0x22c
    se_trng_0_ctrl_1: mmio.Mmio(packed struct(u32) {
        se_trng_0_reseed_n_lsb: u32,
    }),

    // 0x230
    se_trng_0_ctrl_2: mmio.Mmio(packed struct(u32) {
        se_trng_0_reseed_n_msb: u16,
        reserved16: u16,
    }),

    // 0x234
    se_trng_0_ctrl_3: mmio.Mmio(packed struct(u32) {
        se_trng_0_cp_ratio: u8,
        se_trng_0_ht_rct_c: u8,
        se_trng_0_ht_apt_c: u10,
        se_trng_0_ht_od_en: u1,
        reserved27: u4,
        se_trng_0_rosc_en: u1,
    }),

    padding568: [2]u32,
    // 0x240
    se_trng_0_test_out_0: mmio.Mmio(packed struct(u32) {
        se_trng_0_test_out_0: u32,
    }),

    // 0x244
    se_trng_0_test_out_1: mmio.Mmio(packed struct(u32) {
        se_trng_0_test_out_1: u32,
    }),

    // 0x248
    se_trng_0_test_out_2: mmio.Mmio(packed struct(u32) {
        se_trng_0_test_out_2: u32,
    }),

    // 0x24c
    se_trng_0_test_out_3: mmio.Mmio(packed struct(u32) {
        se_trng_0_test_out_3: u32,
    }),

    padding592: [43]u32,
    // 0x2fc
    se_trng_0_ctrl_prot: mmio.Mmio(packed struct(u32) {
        reserved0: u1,
        se_trng_id0_en: u1,
        se_trng_id1_en: u1,
        reserved3: u29,
    }),

    // 0x300
    se_pka_0_ctrl_0: mmio.Mmio(packed struct(u32) {
        se_pka_0_done: u1,
        se_pka_0_done_clr_1t: u1,
        se_pka_0_busy: u1,
        se_pka_0_en: u1,
        se_pka_0_prot_md: u4,
        se_pka_0_int: u1,
        se_pka_0_int_clr_1t: u1,
        se_pka_0_int_set: u1,
        se_pka_0_int_mask: u1,
        se_pka_0_endian: u1,
        se_pka_0_ram_clr_md: u1,
        reserved14: u1,
        se_pka_0_status_clr_1t: u1,
        se_pka_0_status: u16,
    }),

    padding772: [2]u32,
    // 0x30c
    se_pka_0_seed: mmio.Mmio(packed struct(u32) {
        se_pka_0_seed: u32,
    }),

    // 0x310
    se_pka_0_ctrl_1: mmio.Mmio(packed struct(u32) {
        se_pka_0_hburst: u3,
        se_pka_0_hbypass: u1,
        reserved4: u28,
    }),

    padding788: [11]u32,
    // 0x340
    se_pka_0_rw: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    padding836: [7]u32,
    // 0x360
    se_pka_0_rw_burst: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    padding868: [38]u32,
    // 0x3fc
    se_pka_0_ctrl_prot: mmio.Mmio(packed struct(u32) {
        reserved0: u1,
        se_pka_id0_en: u1,
        se_pka_id1_en: u1,
        reserved3: u29,
    }),

    // 0x400
    se_cdet_0_ctrl_0: mmio.Mmio(packed struct(u32) {
        se_cdet_0_en: u1,
        se_cdet_0_busy: u1,
        reserved2: u1,
        se_cdet_0_status: u5,
        se_cdet_0_int: u1,
        se_cdet_0_int_clr: u1,
        se_cdet_0_int_set: u1,
        se_cdet_0_int_mask: u1,
        se_cdet_0_mode: u1,
        reserved13: u19,
    }),

    // 0x404
    se_cdet_0_ctrl_1: mmio.Mmio(packed struct(u32) {
        se_cdet_0_g_loop_max: u16,
        se_cdet_0_g_loop_min: u16,
    }),

    // 0x408
    se_cdet_0_ctrl_2: mmio.Mmio(packed struct(u32) {
        se_cdet_0_t_loop_n: u16,
        se_cdet_0_t_dly_n: u8,
        se_cdet_0_g_slp_n: u8,
    }),

    // 0x40c
    se_cdet_0_ctrl_3: mmio.Mmio(packed struct(u32) {
        se_cdet_0_t_count: u16,
        se_cdet_0_g_count: u16,
    }),

    padding1040: [59]u32,
    // 0x4fc
    se_cdet_0_ctrl_prot: mmio.Mmio(packed struct(u32) {
        se_cdet_prot_en: u1,
        se_cdet_id0_en: u1,
        se_cdet_id1_en: u1,
        reserved3: u29,
    }),

    // 0x500
    se_gmac_0_ctrl_0: mmio.Mmio(packed struct(u32) {
        se_gmac_0_busy: u1,
        se_gmac_0_trig_1t: u1,
        se_gmac_0_en: u1,
        reserved3: u5,
        se_gmac_0_int: u1,
        se_gmac_0_int_clr_1t: u1,
        se_gmac_0_int_set_1t: u1,
        se_gmac_0_int_mask: u1,
        se_gmac_0_t_endian: u1,
        se_gmac_0_h_endian: u1,
        se_gmac_0_x_endian: u1,
        reserved15: u17,
    }),

    // 0x504
    se_gmac_0_lca: mmio.Mmio(packed struct(u32) {
        se_gmac_0_lca: u32,
    }),

    // 0x508
    se_gmac_0_status: mmio.Mmio(packed struct(u32) {
        se_gmac_0_status: u32,
    }),

    padding1292: [60]u32,
    // 0x5fc
    se_gmac_0_ctrl_prot: mmio.Mmio(packed struct(u32) {
        reserved0: u1,
        se_gmac_id0_en: u1,
        se_gmac_id1_en: u1,
        reserved3: u29,
    }),

    padding1536: [576]u32,
    // 0xf00
    se_ctrl_prot_rd: mmio.Mmio(packed struct(u32) {
        se_sha_id0_en_rd: u1,
        se_sha_id1_en_rd: u1,
        se_aes_id0_en_rd: u1,
        se_aes_id1_en_rd: u1,
        se_trng_id0_en_rd: u1,
        se_trng_id1_en_rd: u1,
        se_pka_id0_en_rd: u1,
        se_pka_id1_en_rd: u1,
        se_cdet_id0_en_rd: u1,
        se_cdet_id1_en_rd: u1,
        se_gmac_id0_en_rd: u1,
        se_gmac_id1_en_rd: u1,
        reserved12: u19,
        se_dbg_dis: u1,
    }),

    // 0xf04
    se_ctrl_reserved_0: mmio.Mmio(packed struct(u32) {
        se_ctrl_reserved_0: u32,
    }),

    // 0xf08
    se_ctrl_reserved_1: mmio.Mmio(packed struct(u32) {
        se_ctrl_reserved_1: u32,
    }),

    // 0xf0c
    se_ctrl_reserved_2: mmio.Mmio(packed struct(u32) {
        se_ctrl_reserved_2: u32,
    }),
};
