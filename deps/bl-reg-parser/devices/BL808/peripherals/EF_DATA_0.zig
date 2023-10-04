const mmio = @import("microzig").mmio;

pub const Type = extern struct {
    // 0x0
    ef_cfg_0: mmio.Mmio(packed struct(u32) {
        ef_sf_aes_mode: u2,
        ef_ai_dis: u1,
        ef_cpu0_dis: u1,
        ef_sboot_en: u2,
        ef_uart_dis: u4,
        ef_no_xtal: u1,
        ef_force_no_trim: u1,
        ef_sf_key_re_sel: u2,
        ef_sdu_dis: u1,
        ef_btdm_dis: u1,
        ef_wifi_dis: u1,
        ef_0_key_enc_en: u1,
        ef_cam_dis: u1,
        ef_m154_dis: u1,
        ef_cpu1_dis: u1,
        ef_cpu_rst_dbg_dis: u1,
        ef_se_dbg_dis: u1,
        ef_efuse_dbg_dis: u1,
        ef_dbg_jtag_1_dis: u2,
        ef_dbg_jtag_0_dis: u2,
        ef_dbg_mode: u4,
    }),

    // 0x4
    ef_dbg_pwd_low: mmio.Mmio(packed struct(u32) {
        ef_dbg_pwd_low: u32,
    }),

    // 0x8
    ef_dbg_pwd_high: mmio.Mmio(packed struct(u32) {
        ef_dbg_pwd_high: u32,
    }),

    // 0xc
    ef_dbg_pwd2_low: mmio.Mmio(packed struct(u32) {
        ef_dbg_pwd2_low: u32,
    }),

    // 0x10
    ef_dbg_pwd2_high: mmio.Mmio(packed struct(u32) {
        ef_dbg_pwd2_high: u32,
    }),

    // 0x14
    ef_wifi_mac_low: mmio.Mmio(packed struct(u32) {
        ef_wifi_mac_low: u32,
    }),

    // 0x18
    ef_wifi_mac_high: mmio.Mmio(packed struct(u32) {
        ef_wifi_mac_high: u32,
    }),

    // 0x1c
    ef_key_slot_0_w0: mmio.Mmio(packed struct(u32) {
        ef_key_slot_0_w0: u32,
    }),

    // 0x20
    ef_key_slot_0_w1: mmio.Mmio(packed struct(u32) {
        ef_key_slot_0_w1: u32,
    }),

    // 0x24
    ef_key_slot_0_w2: mmio.Mmio(packed struct(u32) {
        ef_key_slot_0_w2: u32,
    }),

    // 0x28
    ef_key_slot_0_w3: mmio.Mmio(packed struct(u32) {
        ef_key_slot_0_w3: u32,
    }),

    // 0x2c
    ef_key_slot_1_w0: mmio.Mmio(packed struct(u32) {
        ef_key_slot_1_w0: u32,
    }),

    // 0x30
    ef_key_slot_1_w1: mmio.Mmio(packed struct(u32) {
        ef_key_slot_1_w1: u32,
    }),

    // 0x34
    ef_key_slot_1_w2: mmio.Mmio(packed struct(u32) {
        ef_key_slot_1_w2: u32,
    }),

    // 0x38
    ef_key_slot_1_w3: mmio.Mmio(packed struct(u32) {
        ef_key_slot_1_w3: u32,
    }),

    // 0x3c
    ef_key_slot_2_w0: mmio.Mmio(packed struct(u32) {
        ef_key_slot_2_w0: u32,
    }),

    // 0x40
    ef_key_slot_2_w1: mmio.Mmio(packed struct(u32) {
        ef_key_slot_2_w1: u32,
    }),

    // 0x44
    ef_key_slot_2_w2: mmio.Mmio(packed struct(u32) {
        ef_key_slot_2_w2: u32,
    }),

    // 0x48
    ef_key_slot_2_w3: mmio.Mmio(packed struct(u32) {
        ef_key_slot_2_w3: u32,
    }),

    // 0x4c
    ef_key_slot_3_w0: mmio.Mmio(packed struct(u32) {
        ef_key_slot_3_w0: u32,
    }),

    // 0x50
    ef_key_slot_3_w1: mmio.Mmio(packed struct(u32) {
        ef_key_slot_3_w1: u32,
    }),

    // 0x54
    ef_key_slot_3_w2: mmio.Mmio(packed struct(u32) {
        ef_key_slot_3_w2: u32,
    }),

    // 0x58
    ef_key_slot_3_w3: mmio.Mmio(packed struct(u32) {
        ef_key_slot_3_w3: u32,
    }),

    // 0x5c
    ef_sw_usage_0: mmio.Mmio(packed struct(u32) {
        ef_sw_usage_0: u32,
        ef_sboot_sign_mode: u2,
        reserved10: u22,
    }),

    // 0x60
    ef_sw_usage_1: mmio.Mmio(packed struct(u32) {
        ef_sw_usage_1: u32,
    }),

    // 0x64
    ef_sw_usage_2: mmio.Mmio(packed struct(u32) {
        ef_sw_usage_2: u32,
    }),

    // 0x68
    ef_sw_usage_3: mmio.Mmio(packed struct(u32) {
        ef_sw_usage_3: u32,
    }),

    // 0x6c
    ef_key_slot_11_w0: mmio.Mmio(packed struct(u32) {
        ef_key_slot_11_w0: u32,
    }),

    // 0x70
    ef_key_slot_11_w1: mmio.Mmio(packed struct(u32) {
        ef_key_slot_11_w1: u32,
    }),

    // 0x74
    ef_key_slot_11_w2: mmio.Mmio(packed struct(u32) {
        ef_key_slot_11_w2: u32,
    }),

    // 0x78
    ef_key_slot_11_w3: mmio.Mmio(packed struct(u32) {
        ef_key_slot_11_w3: u32,
    }),

    // 0x7c
    lock: mmio.Mmio(packed struct(u32) {
        ef_sec_lifecycle: u4,
        wr_lock_rsvd_0: u10,
        wr_lock_boot_mode: u1,
        wr_lock_dbg_pwd: u1,
        wr_lock_wifi_mac: u1,
        wr_lock_key_slot_0: u1,
        wr_lock_key_slot_1: u1,
        wr_lock_key_slot_2: u1,
        wr_lock_key_slot_3: u1,
        wr_lock_sw_usage_0: u1,
        wr_lock_sw_usage_1: u1,
        wr_lock_sw_usage_2: u1,
        wr_lock_sw_usage_3: u1,
        wr_lock_key_slot_11: u1,
        rd_lock_dbg_pwd: u1,
        rd_lock_key_slot_0: u1,
        rd_lock_key_slot_1: u1,
        rd_lock_key_slot_2: u1,
        rd_lock_key_slot_3: u1,
        rd_lock_key_slot_11: u1,
    }),
};
