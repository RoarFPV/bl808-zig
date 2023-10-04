const mmio = @import("microzig").mmio;

pub const Type = extern struct {
    padding0: [16]u32,
    // 0x40
    tzc_rom_tzsrg_ctrl: mmio.Mmio(packed struct(u32) {
        tzc_rom_tzsrg_r0_id_en: u2,
        tzc_rom_tzsrg_r1_id_en: u2,
        tzc_rom_tzsrg_r2_id_en: u2,
        reserved6: u10,
        tzc_rom_tzsrg_r0_en: u1,
        tzc_rom_tzsrg_r1_en: u1,
        tzc_rom_tzsrg_r2_en: u1,
        reserved19: u5,
        tzc_rom_tzsrg_r0_lock: u1,
        tzc_rom_tzsrg_r1_lock: u1,
        tzc_rom_tzsrg_r2_lock: u1,
        reserved27: u1,
        tzc_sboot_done: u4,
    }),

    // 0x44
    tzc_rom_tzsrg_adr_mask: mmio.Mmio(packed struct(u32) {
        tzc_rom_tzsrg_adr_mask: u10,
        reserved10: u6,
        tzc_rom_tzsrg_adr_mask_lock: u1,
        reserved17: u15,
    }),

    // 0x48
    tzc_rom_tzsrg_r0: mmio.Mmio(packed struct(u32) {
        tzc_rom_tzsrg_r0_end: u10,
        reserved10: u6,
        tzc_rom_tzsrg_r0_start: u10,
        reserved26: u6,
    }),

    // 0x4c
    tzc_rom_tzsrg_r1: mmio.Mmio(packed struct(u32) {
        tzc_rom_tzsrg_r1_end: u10,
        reserved10: u6,
        tzc_rom_tzsrg_r1_start: u10,
        reserved26: u6,
    }),

    // 0x50
    tzc_rom_tzsrg_r2: mmio.Mmio(packed struct(u32) {
        tzc_rom_tzsrg_r2_end: u10,
        reserved10: u6,
        tzc_rom_tzsrg_r2_start: u10,
        reserved26: u6,
    }),

    // 0x54
    tzc_rom_tzsrg_r3: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    padding88: [42]u32,
    // 0x100
    tzc_bmx_tzmid: mmio.Mmio(packed struct(u32) {
        tzc_pico_tzmid: u1,
        tzc_mm_tzmid: u1,
        tzc_usb_tzmid: u1,
        tzc_wifi_tzmid: u1,
        tzc_cci_tzmid: u1,
        tzc_sdhm_tzmid: u1,
        tzc_emaca_tzmid: u1,
        tzc_cpu_tzmid: u1,
        tzc_dma_tzmid: u1,
        tzc_dma2_tzmid: u1,
        tzc_lz4_tzmid: u1,
        reserved11: u5,
        tzc_pico_tzmid_sel: u1,
        tzc_mm_tzmid_sel: u1,
        tzc_usb_tzmid_sel: u1,
        tzc_wifi_tzmid_sel: u1,
        tzc_cci_tzmid_sel: u1,
        tzc_sdhm_tzmid_sel: u1,
        tzc_emaca_tzmid_sel: u1,
        tzc_cpu_tzmid_sel: u1,
        tzc_dma_tzmid_sel: u1,
        tzc_dma2_tzmid_sel: u1,
        tzc_lz4_tzmid_sel: u1,
        reserved27: u5,
    }),

    // 0x104
    tzc_bmx_tzmid_lock: mmio.Mmio(packed struct(u32) {
        tzc_pico_tzmid_lock: u1,
        tzc_mm_tzmid_lock: u1,
        tzc_usb_tzmid_lock: u1,
        tzc_wifi_tzmid_lock: u1,
        tzc_cci_tzmid_lock: u1,
        tzc_sdhm_tzmid_lock: u1,
        tzc_emaca_tzmid_lock: u1,
        tzc_cpu_tzmid_lock: u1,
        tzc_dma_tzmid_lock: u1,
        tzc_dma2_tzmid_lock: u1,
        tzc_lz4_tzmid_lock: u1,
        reserved11: u21,
    }),

    // 0x108
    tzc_bmx_s0: mmio.Mmio(packed struct(u32) {
        tzc_bmx_mm_tzsid_en: u2,
        tzc_bmx_dma_tzsid_en: u2,
        tzc_bmx_dma2_tzsid_en: u2,
        tzc_bmx_pwr_tzsid_en: u2,
        tzc_bmx_sdh_tzsid_en: u2,
        tzc_bmx_emac_tzsid_en: u2,
        reserved12: u4,
        tzc_bmx_mm_tzsid_lock: u1,
        tzc_bmx_dma_tzsid_lock: u1,
        tzc_bmx_dma2_tzsid_lock: u1,
        tzc_bmx_pwr_tzsid_lock: u1,
        tzc_bmx_sdh_tzsid_lock: u1,
        tzc_bmx_emac_tzsid_lock: u1,
        reserved22: u10,
    }),

    // 0x10c
    tzc_bmx_s1: mmio.Mmio(packed struct(u32) {
        tzc_bmx_s10_tzsid_en: u2,
        tzc_bmx_s11_tzsid_en: u2,
        tzc_bmx_s12_tzsid_en: u2,
        tzc_bmx_s13_tzsid_en: u2,
        tzc_bmx_s14_tzsid_en: u2,
        tzc_bmx_s15_tzsid_en: u2,
        tzc_bmx_s16_tzsid_en: u2,
        tzc_bmx_s17_tzsid_en: u2,
        tzc_bmx_s18_tzsid_en: u2,
        tzc_bmx_s19_tzsid_en: u2,
        tzc_bmx_s1a_tzsid_en: u2,
        tzc_bmx_s1b_tzsid_en: u2,
        tzc_bmx_s1c_tzsid_en: u2,
        tzc_bmx_s1d_tzsid_en: u2,
        tzc_bmx_s1e_tzsid_en: u2,
        tzc_bmx_s1f_tzsid_en: u2,
    }),

    // 0x110
    tzc_bmx_s2: mmio.Mmio(packed struct(u32) {
        tzc_bmx_s20_tzsid_en: u2,
        tzc_bmx_s21_tzsid_en: u2,
        tzc_bmx_s22_tzsid_en: u2,
        tzc_bmx_s23_tzsid_en: u2,
        tzc_bmx_s24_tzsid_en: u2,
        tzc_bmx_s25_tzsid_en: u2,
        tzc_bmx_s26_tzsid_en: u2,
        tzc_bmx_s27_tzsid_en: u2,
        tzc_bmx_s28_tzsid_en: u2,
        tzc_bmx_s29_tzsid_en: u2,
        tzc_bmx_s2a_tzsid_en: u2,
        tzc_bmx_s2b_tzsid_en: u2,
        tzc_bmx_s2c_tzsid_en: u2,
        tzc_bmx_s2d_tzsid_en: u2,
        tzc_bmx_s2e_tzsid_en: u2,
        tzc_bmx_s2f_tzsid_en: u2,
    }),

    // 0x114
    tzc_bmx_s_lock: mmio.Mmio(packed struct(u32) {
        tzc_bmx_s10_tzsid_lock: u1,
        tzc_bmx_s11_tzsid_lock: u1,
        tzc_bmx_s12_tzsid_lock: u1,
        tzc_bmx_s13_tzsid_lock: u1,
        tzc_bmx_s14_tzsid_lock: u1,
        tzc_bmx_s15_tzsid_lock: u1,
        tzc_bmx_s16_tzsid_lock: u1,
        tzc_bmx_s17_tzsid_lock: u1,
        tzc_bmx_s18_tzsid_lock: u1,
        tzc_bmx_s19_tzsid_lock: u1,
        tzc_bmx_s1a_tzsid_lock: u1,
        tzc_bmx_s1b_tzsid_lock: u1,
        tzc_bmx_s1c_tzsid_lock: u1,
        tzc_bmx_s1d_tzsid_lock: u1,
        tzc_bmx_s1e_tzsid_lock: u1,
        tzc_bmx_s1f_tzsid_lock: u1,
        tzc_bmx_s20_tzsid_lock: u1,
        tzc_bmx_s21_tzsid_lock: u1,
        tzc_bmx_s22_tzsid_lock: u1,
        tzc_bmx_s23_tzsid_lock: u1,
        tzc_bmx_s24_tzsid_lock: u1,
        tzc_bmx_s25_tzsid_lock: u1,
        tzc_bmx_s26_tzsid_lock: u1,
        tzc_bmx_s27_tzsid_lock: u1,
        tzc_bmx_s28_tzsid_lock: u1,
        tzc_bmx_s29_tzsid_lock: u1,
        tzc_bmx_s2a_tzsid_lock: u1,
        tzc_bmx_s2b_tzsid_lock: u1,
        tzc_bmx_s2c_tzsid_lock: u1,
        tzc_bmx_s2d_tzsid_lock: u1,
        tzc_bmx_s2e_tzsid_lock: u1,
        tzc_bmx_s2f_tzsid_lock: u1,
    }),

    padding280: [10]u32,
    // 0x140
    tzc_ocram_tzsrg_ctrl: mmio.Mmio(packed struct(u32) {
        tzc_ocram_tzsrg_r0_id_en: u4,
        tzc_ocram_tzsrg_r1_id_en: u4,
        tzc_ocram_tzsrg_r2_id_en: u4,
        tzc_ocram_tzsrg_rx_id_en: u4,
        tzc_ocram_tzsrg_r0_en: u1,
        tzc_ocram_tzsrg_r1_en: u1,
        tzc_ocram_tzsrg_r2_en: u1,
        tzc_ocram_tzsrg_rx_en: u1,
        tzc_ocram_tzsrg_r0_lock: u1,
        tzc_ocram_tzsrg_r1_lock: u1,
        tzc_ocram_tzsrg_r2_lock: u1,
        tzc_ocram_tzsrg_rx_lock: u1,
        reserved24: u8,
    }),

    // 0x144
    tzc_ocram_tzsrg_adr_mask: mmio.Mmio(packed struct(u32) {
        tzc_ocram_tzsrg_adr_mask: u10,
        reserved10: u6,
        tzc_ocram_tzsrg_adr_mask_lock: u1,
        reserved17: u15,
    }),

    // 0x148
    tzc_ocram_tzsrg_r0: mmio.Mmio(packed struct(u32) {
        tzc_ocram_tzsrg_r0_end: u10,
        reserved10: u6,
        tzc_ocram_tzsrg_r0_start: u10,
        reserved26: u6,
    }),

    // 0x14c
    tzc_ocram_tzsrg_r1: mmio.Mmio(packed struct(u32) {
        tzc_ocram_tzsrg_r1_end: u10,
        reserved10: u6,
        tzc_ocram_tzsrg_r1_start: u10,
        reserved26: u6,
    }),

    // 0x150
    tzc_ocram_tzsrg_r2: mmio.Mmio(packed struct(u32) {
        tzc_ocram_tzsrg_r2_end: u10,
        reserved10: u6,
        tzc_ocram_tzsrg_r2_start: u10,
        reserved26: u6,
    }),

    // 0x154
    tzc_ocram_tzsrg_r3: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    padding344: [10]u32,
    // 0x180
    tzc_wram_tzsrg_ctrl: mmio.Mmio(packed struct(u32) {
        tzc_wram_tzsrg_r0_id_en: u4,
        tzc_wram_tzsrg_r1_id_en: u4,
        tzc_wram_tzsrg_r2_id_en: u4,
        tzc_wram_tzsrg_rx_id_en: u4,
        tzc_wram_tzsrg_r0_en: u1,
        tzc_wram_tzsrg_r1_en: u1,
        tzc_wram_tzsrg_r2_en: u1,
        tzc_wram_tzsrg_rx_en: u1,
        tzc_wram_tzsrg_r0_lock: u1,
        tzc_wram_tzsrg_r1_lock: u1,
        tzc_wram_tzsrg_r2_lock: u1,
        tzc_wram_tzsrg_rx_lock: u1,
        reserved24: u8,
    }),

    // 0x184
    tzc_wram_tzsrg_adr_mask: mmio.Mmio(packed struct(u32) {
        tzc_wram_tzsrg_adr_mask: u10,
        reserved10: u6,
        tzc_wram_tzsrg_adr_mask_lock: u1,
        reserved17: u15,
    }),

    // 0x188
    tzc_wram_tzsrg_r0: mmio.Mmio(packed struct(u32) {
        tzc_wram_tzsrg_r0_end: u10,
        reserved10: u6,
        tzc_wram_tzsrg_r0_start: u10,
        reserved26: u6,
    }),

    // 0x18c
    tzc_wram_tzsrg_r1: mmio.Mmio(packed struct(u32) {
        tzc_wram_tzsrg_r1_end: u10,
        reserved10: u6,
        tzc_wram_tzsrg_r1_start: u10,
        reserved26: u6,
    }),

    // 0x190
    tzc_wram_tzsrg_r2: mmio.Mmio(packed struct(u32) {
        tzc_wram_tzsrg_r2_end: u10,
        reserved10: u6,
        tzc_wram_tzsrg_r2_start: u10,
        reserved26: u6,
    }),

    // 0x194
    tzc_wram_tzsrg_r3: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    // 0x198
    tzc_wifi_dbg: mmio.Mmio(packed struct(u32) {
        tzc_mac_dbg_dis: u1,
        reserved1: u31,
    }),

    padding412: [41]u32,
    // 0x240
    tzc_pdm_ctrl: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    // 0x244
    tzc_uart_ctrl: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    // 0x248
    tzc_i2c_ctrl: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    // 0x24c
    tzc_timer_ctrl: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    // 0x250
    tzc_i2s_ctrl: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    padding596: [11]u32,
    // 0x280
    tzc_sf_tzsrg_ctrl: mmio.Mmio(packed struct(u32) {
        tzc_sf_tzsrg_r0_id_en: u4,
        tzc_sf_tzsrg_r1_id_en: u4,
        tzc_sf_tzsrg_r2_id_en: u4,
        tzc_sf_tzsrg_r3_id_en: u4,
        tzc_sf_tzsrg_rx_id_en: u4,
        tzc_sf_tzsrg_r0_en: u1,
        tzc_sf_tzsrg_r1_en: u1,
        tzc_sf_tzsrg_r2_en: u1,
        tzc_sf_tzsrg_r3_en: u1,
        tzc_sf_tzsrg_rx_en: u1,
        tzc_sf_tzsrg_r0_lock: u1,
        tzc_sf_tzsrg_r1_lock: u1,
        tzc_sf_tzsrg_r2_lock: u1,
        tzc_sf_tzsrg_r3_lock: u1,
        tzc_sf_tzsrg_rx_lock: u1,
        reserved30: u2,
    }),

    // 0x284
    tzc_sf_tzsrg_adr_mask: mmio.Mmio(packed struct(u32) {
        tzc_sf_tzsrg_adr_mask: u19,
        reserved19: u12,
        tzc_sf_tzsrg_adr_mask_lock: u1,
    }),

    // 0x288
    tzc_sf_tzsrg_r0: mmio.Mmio(packed struct(u32) {
        tzc_sf_tzsrg_r0_end: u16,
        tzc_sf_tzsrg_r0_start: u16,
    }),

    // 0x28c
    tzc_sf_tzsrg_r1: mmio.Mmio(packed struct(u32) {
        tzc_sf_tzsrg_r1_end: u16,
        tzc_sf_tzsrg_r1_start: u16,
    }),

    // 0x290
    tzc_sf_tzsrg_r2: mmio.Mmio(packed struct(u32) {
        tzc_sf_tzsrg_r2_end: u16,
        tzc_sf_tzsrg_r2_start: u16,
    }),

    // 0x294
    tzc_sf_tzsrg_r3: mmio.Mmio(packed struct(u32) {
        tzc_sf_tzsrg_r3_end: u16,
        tzc_sf_tzsrg_r3_start: u16,
    }),

    // 0x298
    tzc_sf_tzsrg_msb: mmio.Mmio(packed struct(u32) {
        tzc_sf_tzsrg_r0_end_msb: u3,
        reserved3: u1,
        tzc_sf_tzsrg_r0_start_msb: u3,
        reserved7: u1,
        tzc_sf_tzsrg_r1_end_msb: u3,
        reserved11: u1,
        tzc_sf_tzsrg_r1_start_msb: u3,
        reserved15: u1,
        tzc_sf_tzsrg_r2_end_msb: u3,
        reserved19: u1,
        tzc_sf_tzsrg_r2_start_msb: u3,
        reserved23: u1,
        tzc_sf_tzsrg_r3_end_msb: u3,
        reserved27: u1,
        tzc_sf_tzsrg_r3_start_msb: u3,
        reserved31: u1,
    }),

    padding668: [25]u32,
    // 0x300
    tzc_mm_bmx_tzmid: mmio.Mmio(packed struct(u32) {
        tzc_mmcpu_tzmid: u1,
        tzc_blai_tzmid: u1,
        tzc_codec_tzmid: u1,
        tzc_subsys_tzmid: u1,
        tzc_x2ddma_tzmid: u1,
        tzc_xdma_tzmid: u1,
        reserved6: u10,
        tzc_mmcpu_tzmid_sel: u1,
        tzc_blai_tzmid_sel: u1,
        tzc_codec_tzmid_sel: u1,
        tzc_subsys_tzmid_sel: u1,
        tzc_x2ddma_tzmid_sel: u1,
        tzc_xdma_tzmid_sel: u1,
        reserved22: u10,
    }),

    // 0x304
    tzc_mm_bmx_tzmid_lock: mmio.Mmio(packed struct(u32) {
        tzc_mmcpu_tzmid_lock: u1,
        tzc_blai_tzmid_lock: u1,
        tzc_codec_tzmid_lock: u1,
        tzc_subsys_tzmid_lock: u1,
        tzc_x2ddma_tzmid_lock: u1,
        tzc_xdma_tzmid_lock: u1,
        reserved6: u26,
    }),

    // 0x308
    tzc_mm_bmx_s0: mmio.Mmio(packed struct(u32) {
        tzc_mmperi_s10_tzsid_en: u2,
        tzc_mmperi_s11_tzsid_en: u2,
        tzc_mmperi_s12_tzsid_en: u2,
        tzc_mmperi_s13_tzsid_en: u2,
        tzc_mmperi_s14_tzsid_en: u2,
        tzc_mmperi_s15_tzsid_en: u2,
        tzc_mmperi_s16_tzsid_en: u2,
        tzc_mmperi_s17_tzsid_en: u2,
        tzc_mmperi_s18_tzsid_en: u2,
        tzc_mmperi_s19_tzsid_en: u2,
        tzc_mmperi_s1a_tzsid_en: u2,
        tzc_mmperi_s1b_tzsid_en: u2,
        tzc_mmperi_s1c_tzsid_en: u2,
        tzc_mmperi_s1d_tzsid_en: u2,
        tzc_mmperi_s1e_tzsid_en: u2,
        tzc_mmperi_s1f_tzsid_en: u2,
    }),

    // 0x30c
    tzc_mm_bmx_s1: mmio.Mmio(packed struct(u32) {
        tzc_s10_tzsid_en: u2,
        tzc_s11_tzsid_en: u2,
        tzc_s12_tzsid_en: u2,
        tzc_s13_tzsid_en: u2,
        tzc_s14_tzsid_en: u2,
        tzc_s15_tzsid_en: u2,
        tzc_s16_tzsid_en: u2,
        tzc_s17_tzsid_en: u2,
        tzc_s18_tzsid_en: u2,
        tzc_s19_tzsid_en: u2,
        tzc_s1a_tzsid_en: u2,
        tzc_s1b_tzsid_en: u2,
        tzc_s1c_tzsid_en: u2,
        tzc_s1d_tzsid_en: u2,
        tzc_s1e_tzsid_en: u2,
        tzc_s1f_tzsid_en: u2,
    }),

    // 0x310
    tzc_mm_bmx_s2: mmio.Mmio(packed struct(u32) {
        tzc_codec_s10_tzsid_en: u2,
        tzc_codec_s11_tzsid_en: u2,
        tzc_codec_s12_tzsid_en: u2,
        tzc_codec_s13_tzsid_en: u2,
        tzc_codec_s14_tzsid_en: u2,
        tzc_codec_s15_tzsid_en: u2,
        tzc_codec_s16_tzsid_en: u2,
        tzc_codec_s17_tzsid_en: u2,
        tzc_codec_s18_tzsid_en: u2,
        tzc_codec_s19_tzsid_en: u2,
        tzc_codec_s1a_tzsid_en: u2,
        tzc_codec_s1b_tzsid_en: u2,
        tzc_codec_s1c_tzsid_en: u2,
        tzc_codec_s1d_tzsid_en: u2,
        tzc_codec_s1e_tzsid_en: u2,
        tzc_codec_s1f_tzsid_en: u2,
    }),

    // 0x314
    tzc_mm_bmx_s_lock0: mmio.Mmio(packed struct(u32) {
        tzc_mmperi_s10_tzsid_lock: u1,
        tzc_mmperi_s11_tzsid_lock: u1,
        tzc_mmperi_s12_tzsid_lock: u1,
        tzc_mmperi_s13_tzsid_lock: u1,
        tzc_mmperi_s14_tzsid_lock: u1,
        tzc_mmperi_s15_tzsid_lock: u1,
        tzc_mmperi_s16_tzsid_lock: u1,
        tzc_mmperi_s17_tzsid_lock: u1,
        tzc_mmperi_s18_tzsid_lock: u1,
        tzc_mmperi_s19_tzsid_lock: u1,
        tzc_mmperi_s1a_tzsid_lock: u1,
        tzc_mmperi_s1b_tzsid_lock: u1,
        tzc_mmperi_s1c_tzsid_lock: u1,
        tzc_mmperi_s1d_tzsid_lock: u1,
        tzc_mmperi_s1e_tzsid_lock: u1,
        tzc_mmperi_s1f_tzsid_lock: u1,
        reserved16: u16,
    }),

    // 0x318
    tzc_mm_bmx_s_lock1: mmio.Mmio(packed struct(u32) {
        tzc_codec_s10_tzsid_lock: u1,
        tzc_codec_s11_tzsid_lock: u1,
        tzc_codec_s12_tzsid_lock: u1,
        tzc_codec_s13_tzsid_lock: u1,
        tzc_codec_s14_tzsid_lock: u1,
        tzc_codec_s15_tzsid_lock: u1,
        tzc_codec_s16_tzsid_lock: u1,
        tzc_codec_s17_tzsid_lock: u1,
        tzc_codec_s18_tzsid_lock: u1,
        tzc_codec_s19_tzsid_lock: u1,
        tzc_codec_s1a_tzsid_lock: u1,
        tzc_codec_s1b_tzsid_lock: u1,
        tzc_codec_s1c_tzsid_lock: u1,
        tzc_codec_s1d_tzsid_lock: u1,
        tzc_codec_s1e_tzsid_lock: u1,
        tzc_codec_s1f_tzsid_lock: u1,
        tzc_s10_tzsid_lock: u1,
        tzc_s11_tzsid_lock: u1,
        tzc_s12_tzsid_lock: u1,
        tzc_s13_tzsid_lock: u1,
        tzc_s14_tzsid_lock: u1,
        tzc_s15_tzsid_lock: u1,
        tzc_s16_tzsid_lock: u1,
        tzc_s17_tzsid_lock: u1,
        tzc_s18_tzsid_lock: u1,
        tzc_s19_tzsid_lock: u1,
        tzc_s1a_tzsid_lock: u1,
        tzc_s1b_tzsid_lock: u1,
        tzc_s1c_tzsid_lock: u1,
        tzc_s1d_tzsid_lock: u1,
        tzc_s1e_tzsid_lock: u1,
        tzc_s1f_tzsid_lock: u1,
    }),

    padding796: [9]u32,
    // 0x340
    tzc_l2sram_tzsrg_ctrl: mmio.Mmio(packed struct(u32) {
        tzc_l2sram_tzsrg_r0_id_en: u2,
        tzc_l2sram_tzsrg_r1_id_en: u2,
        tzc_l2sram_tzsrg_r2_id_en: u2,
        reserved6: u10,
        tzc_l2sram_tzsrg_r0_en: u1,
        tzc_l2sram_tzsrg_r1_en: u1,
        tzc_l2sram_tzsrg_r2_en: u1,
        reserved19: u5,
        tzc_l2sram_tzsrg_r0_lock: u1,
        tzc_l2sram_tzsrg_r1_lock: u1,
        tzc_l2sram_tzsrg_r2_lock: u1,
        reserved27: u5,
    }),

    // 0x344
    tzc_l2sram_tzsrg_adr_mask: mmio.Mmio(packed struct(u32) {
        tzc_l2sram_tzsrg_adr_mask: u10,
        reserved10: u6,
        tzc_l2sram_tzsrg_adr_mask_lock: u1,
        reserved17: u15,
    }),

    // 0x348
    tzc_l2sram_tzsrg_r0: mmio.Mmio(packed struct(u32) {
        tzc_l2sram_tzsrg_r0_end: u10,
        reserved10: u6,
        tzc_l2sram_tzsrg_r0_start: u10,
        reserved26: u6,
    }),

    // 0x34c
    tzc_l2sram_tzsrg_r1: mmio.Mmio(packed struct(u32) {
        tzc_l2sram_tzsrg_r1_end: u10,
        reserved10: u6,
        tzc_l2sram_tzsrg_r1_start: u10,
        reserved26: u6,
    }),

    // 0x350
    tzc_l2sram_tzsrg_r2: mmio.Mmio(packed struct(u32) {
        tzc_l2sram_tzsrg_r2_end: u10,
        reserved10: u6,
        tzc_l2sram_tzsrg_r2_start: u10,
        reserved26: u6,
    }),

    // 0x354
    tzc_l2sram_tzsrg_r3: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    padding856: [2]u32,
    // 0x360
    tzc_vram_tzsrg_ctrl: mmio.Mmio(packed struct(u32) {
        tzc_vram_tzsrg_r0_id_en: u2,
        tzc_vram_tzsrg_r1_id_en: u2,
        tzc_vram_tzsrg_r2_id_en: u2,
        reserved6: u10,
        tzc_vram_tzsrg_r0_en: u1,
        tzc_vram_tzsrg_r1_en: u1,
        tzc_vram_tzsrg_r2_en: u1,
        reserved19: u5,
        tzc_vram_tzsrg_r0_lock: u1,
        tzc_vram_tzsrg_r1_lock: u1,
        tzc_vram_tzsrg_r2_lock: u1,
        reserved27: u5,
    }),

    // 0x364
    tzc_vram_tzsrg_adr_mask: mmio.Mmio(packed struct(u32) {
        tzc_vram_tzsrg_adr_mask: u10,
        reserved10: u6,
        tzc_vram_tzsrg_adr_mask_lock: u1,
        reserved17: u15,
    }),

    // 0x368
    tzc_vram_tzsrg_r0: mmio.Mmio(packed struct(u32) {
        tzc_vram_tzsrg_r0_end: u10,
        reserved10: u6,
        tzc_vram_tzsrg_r0_start: u10,
        reserved26: u6,
    }),

    // 0x36c
    tzc_vram_tzsrg_r1: mmio.Mmio(packed struct(u32) {
        tzc_vram_tzsrg_r1_end: u10,
        reserved10: u6,
        tzc_vram_tzsrg_r1_start: u10,
        reserved26: u6,
    }),

    // 0x370
    tzc_vram_tzsrg_r2: mmio.Mmio(packed struct(u32) {
        tzc_vram_tzsrg_r2_end: u10,
        reserved10: u6,
        tzc_vram_tzsrg_r2_start: u10,
        reserved26: u6,
    }),

    // 0x374
    tzc_vram_tzsrg_r3: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    padding888: [2]u32,
    // 0x380
    tzc_psrama_tzsrg_ctrl: mmio.Mmio(packed struct(u32) {
        tzc_psrama_tzsrg_r0_id_en: u2,
        tzc_psrama_tzsrg_r1_id_en: u2,
        tzc_psrama_tzsrg_r2_id_en: u2,
        reserved6: u10,
        tzc_psrama_tzsrg_r0_en: u1,
        tzc_psrama_tzsrg_r1_en: u1,
        tzc_psrama_tzsrg_r2_en: u1,
        reserved19: u5,
        tzc_psrama_tzsrg_r0_lock: u1,
        tzc_psrama_tzsrg_r1_lock: u1,
        tzc_psrama_tzsrg_r2_lock: u1,
        reserved27: u5,
    }),

    // 0x384
    tzc_psrama_tzsrg_adr_mask: mmio.Mmio(packed struct(u32) {
        tzc_psrama_tzsrg_adr_mask: u16,
        tzc_psrama_tzsrg_adr_mask_lock: u1,
        reserved17: u15,
    }),

    // 0x388
    tzc_psrama_tzsrg_r0: mmio.Mmio(packed struct(u32) {
        tzc_psrama_tzsrg_r0_end: u16,
        tzc_psrama_tzsrg_r0_start: u16,
    }),

    // 0x38c
    tzc_psrama_tzsrg_r1: mmio.Mmio(packed struct(u32) {
        tzc_psrama_tzsrg_r1_end: u16,
        tzc_psrama_tzsrg_r1_start: u16,
    }),

    // 0x390
    tzc_psrama_tzsrg_r2: mmio.Mmio(packed struct(u32) {
        tzc_psrama_tzsrg_r2_end: u16,
        tzc_psrama_tzsrg_r2_start: u16,
    }),

    // 0x394
    tzc_psrama_tzsrg_r3: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    padding920: [2]u32,
    // 0x3a0
    tzc_psramb_tzsrg_ctrl: mmio.Mmio(packed struct(u32) {
        tzc_psramb_tzsrg_r0_id_en: u2,
        tzc_psramb_tzsrg_r1_id_en: u2,
        tzc_psramb_tzsrg_r2_id_en: u2,
        reserved6: u10,
        tzc_psramb_tzsrg_r0_en: u1,
        tzc_psramb_tzsrg_r1_en: u1,
        tzc_psramb_tzsrg_r2_en: u1,
        reserved19: u5,
        tzc_psramb_tzsrg_r0_lock: u1,
        tzc_psramb_tzsrg_r1_lock: u1,
        tzc_psramb_tzsrg_r2_lock: u1,
        reserved27: u5,
    }),

    // 0x3a4
    tzc_psramb_tzsrg_adr_mask: mmio.Mmio(packed struct(u32) {
        tzc_psramb_tzsrg_adr_mask: u16,
        tzc_psramb_tzsrg_adr_mask_lock: u1,
        reserved17: u15,
    }),

    // 0x3a8
    tzc_psramb_tzsrg_r0: mmio.Mmio(packed struct(u32) {
        tzc_psramb_tzsrg_r0_end: u16,
        tzc_psramb_tzsrg_r0_start: u16,
    }),

    // 0x3ac
    tzc_psramb_tzsrg_r1: mmio.Mmio(packed struct(u32) {
        tzc_psramb_tzsrg_r1_end: u16,
        tzc_psramb_tzsrg_r1_start: u16,
    }),

    // 0x3b0
    tzc_psramb_tzsrg_r2: mmio.Mmio(packed struct(u32) {
        tzc_psramb_tzsrg_r2_end: u16,
        tzc_psramb_tzsrg_r2_start: u16,
    }),

    // 0x3b4
    tzc_psramb_tzsrg_r3: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    padding952: [2]u32,
    // 0x3c0
    tzc_xram_tzsrg_ctrl: mmio.Mmio(packed struct(u32) {
        tzc_xram_tzsrg_r0_id_en: u2,
        tzc_xram_tzsrg_r1_id_en: u2,
        tzc_xram_tzsrg_r2_id_en: u2,
        reserved6: u10,
        tzc_xram_tzsrg_r0_en: u1,
        tzc_xram_tzsrg_r1_en: u1,
        tzc_xram_tzsrg_r2_en: u1,
        reserved19: u5,
        tzc_xram_tzsrg_r0_lock: u1,
        tzc_xram_tzsrg_r1_lock: u1,
        tzc_xram_tzsrg_r2_lock: u1,
        reserved27: u5,
    }),

    // 0x3c4
    tzc_xram_tzsrg_adr_mask: mmio.Mmio(packed struct(u32) {
        tzc_xram_tzsrg_adr_mask: u10,
        reserved10: u6,
        tzc_xram_tzsrg_adr_mask_lock: u1,
        reserved17: u15,
    }),

    // 0x3c8
    tzc_xram_tzsrg_r0: mmio.Mmio(packed struct(u32) {
        tzc_xram_tzsrg_r0_end: u10,
        reserved10: u6,
        tzc_xram_tzsrg_r0_start: u10,
        reserved26: u6,
    }),

    // 0x3cc
    tzc_xram_tzsrg_r1: mmio.Mmio(packed struct(u32) {
        tzc_xram_tzsrg_r1_end: u10,
        reserved10: u6,
        tzc_xram_tzsrg_r1_start: u10,
        reserved26: u6,
    }),

    // 0x3d0
    tzc_xram_tzsrg_r2: mmio.Mmio(packed struct(u32) {
        tzc_xram_tzsrg_r2_end: u10,
        reserved10: u6,
        tzc_xram_tzsrg_r2_start: u10,
        reserved26: u6,
    }),

    // 0x3d4
    tzc_xram_tzsrg_r3: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    padding984: [714]u32,
    // 0xf00
    tzc_glb_ctrl_0: mmio.Mmio(packed struct(u32) {
        tzc_glb_pwron_rst_tzsid_en: u2,
        tzc_glb_cpu_reset_tzsid_en: u2,
        tzc_glb_sys_reset_tzsid_en: u2,
        tzc_glb_cpu2_reset_tzsid_en: u2,
        tzc_glb_misc_tzsid_en: u2,
        tzc_glb_sram_tzsid_en: u2,
        tzc_glb_swrst_tzsid_en: u2,
        tzc_glb_bmx_tzsid_en: u2,
        tzc_glb_dbg_tzsid_en: u2,
        tzc_glb_mbist_tzsid_en: u2,
        tzc_glb_clk_tzsid_en: u2,
        tzc_glb_int_tzsid_en: u2,
        tzc_glb_pwr_tzsid_en: u2,
        reserved26: u6,
    }),

    // 0xf04
    tzc_glb_ctrl_1: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    // 0xf08
    tzc_glb_ctrl_2: mmio.Mmio(packed struct(u32) {
        tzc_glb_pwron_rst_tzsid_lock: u1,
        tzc_glb_cpu_reset_tzsid_lock: u1,
        tzc_glb_sys_reset_tzsid_lock: u1,
        tzc_glb_cpu2_reset_tzsid_lock: u1,
        tzc_glb_misc_tzsid_lock: u1,
        tzc_glb_sram_tzsid_lock: u1,
        tzc_glb_swrst_tzsid_lock: u1,
        tzc_glb_bmx_tzsid_lock: u1,
        tzc_glb_dbg_tzsid_lock: u1,
        tzc_glb_mbist_tzsid_lock: u1,
        tzc_glb_clk_tzsid_lock: u1,
        tzc_glb_int_tzsid_lock: u1,
        tzc_glb_pwr_tzsid_lock: u1,
        reserved13: u19,
    }),

    padding3852: [5]u32,
    // 0xf20
    tzc_mm_ctrl_0: mmio.Mmio(packed struct(u32) {
        tzc_mm_pwron_rst_tzsid_en: u2,
        tzc_mm_cpu0_reset_tzsid_en: u2,
        tzc_mm_sys_reset_tzsid_en: u2,
        tzc_mm_cpu0_tzsid_en: u2,
        reserved8: u2,
        tzc_mm_sram_tzsid_en: u2,
        tzc_mm_swrst_tzsid_en: u2,
        reserved14: u6,
        tzc_mm_clk_tzsid_en: u2,
        reserved22: u10,
    }),

    // 0xf24
    tzc_mm_ctrl_1: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    // 0xf28
    tzc_mm_ctrl_2: mmio.Mmio(packed struct(u32) {
        tzc_mm_pwron_rst_tzsid_lock: u1,
        tzc_mm_cpu0_reset_tzsid_lock: u1,
        tzc_mm_sys_reset_tzsid_lock: u1,
        tzc_mm_cpu0_tzsid_lock: u1,
        reserved4: u1,
        tzc_mm_sram_tzsid_lock: u1,
        tzc_mm_swrst_tzsid_lock: u1,
        reserved7: u3,
        tzc_mm_clk_tzsid_lock: u1,
        reserved11: u21,
    }),

    padding3884: [5]u32,
    // 0xf40
    tzc_se_ctrl_0: mmio.Mmio(packed struct(u32) {
        tzc_se_sha_tzsid_en: u2,
        tzc_se_aes_tzsid_en: u2,
        tzc_se_trng_tzsid_en: u2,
        tzc_se_pka_tzsid_en: u2,
        tzc_se_cdet_tzsid_en: u2,
        tzc_se_gmac_tzsid_en: u2,
        tzc_se_tzsid_crmd: u1,
        reserved13: u3,
        tzc_se_wdt_dly: u16,
    }),

    // 0xf44
    tzc_se_ctrl_1: mmio.Mmio(packed struct(u32) {
        tzc_sf_cr_tzsid_en: u2,
        tzc_sf_sec_tzsid_en: u2,
        tzc_sf_tzsid_crmd: u1,
        reserved5: u27,
    }),

    // 0xf48
    tzc_se_ctrl_2: mmio.Mmio(packed struct(u32) {
        tzc_se_sha_tzsid_lock: u1,
        tzc_se_aes_tzsid_lock: u1,
        tzc_se_trng_tzsid_lock: u1,
        tzc_se_pka_tzsid_lock: u1,
        tzc_se_cdet_tzsid_lock: u1,
        tzc_se_gmac_tzsid_lock: u1,
        tzc_se_tzsid_crmd_lock: u1,
        reserved7: u9,
        tzc_sf_cr_tzsid_lock: u1,
        tzc_sf_sec_tzsid_lock: u1,
        tzc_sf_tzsid_crmd_lock: u1,
        reserved19: u13,
    }),
};
