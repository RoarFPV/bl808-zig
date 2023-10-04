const mmio = @import("microzig").mmio;

pub const Type = extern struct {
    // 0x0
    cpu0_boot: mmio.Mmio(packed struct(u32) {
        reg_cpu0_rvba: u32,
    }),

    padding4: [1]u32,
    // 0x8
    cpu_cfg: mmio.Mmio(packed struct(u32) {
        reg_cpu0_apb_base: u13,
        reserved13: u15,
        cpu0_ndm_rstn_en: u1,
        cpu0_hart_rstn_en: u1,
        reserved30: u2,
    }),

    // 0xc
    cpu_sts1: mmio.Mmio(packed struct(u32) {
        reserved0: u4,
        cpu0_lpmd_b: u2,
        reserved6: u10,
        cpu0_retire_pc_39_32: u8,
        cpu0_retire: u1,
        cpu0_pad_halted: u1,
        reserved26: u2,
        cpu0_ndm_rstn_req: u1,
        cpu0_hart_rstn_req: u1,
        reserved30: u2,
    }),

    // 0x10
    cpu_sts2: mmio.Mmio(packed struct(u32) {
        cpu0_retire_pc_31_0: u32,
    }),

    padding20: [1]u32,
    // 0x18
    cpu_rtc: mmio.Mmio(packed struct(u32) {
        c906_rtc_div: u10,
        reserved10: u20,
        c906_rtc_rst: u1,
        c906_rtc_en: u1,
    }),

    // 0x1c
    tzc_mmsys_misc: mmio.Mmio(packed struct(u32) {
        tzc_mm_cpu0_lock: u1,
        reserved1: u1,
        tzc_mm_sram_lock: u1,
        reserved3: u29,
    }),

    // 0x20
    peri_apb_ctrl: mmio.Mmio(packed struct(u32) {
        reg_mminfra_berr_int_en: u1,
        reg_berr_int_en: u1,
        reg_codec_berr_int_en: u1,
        reg_mmcpu_berr_int_en: u1,
        reserved4: u4,
        reg_mm_x2hs_sp_bypass: u1,
        reserved9: u7,
        rg_pclk_force_on: u16,
    }),

    padding36: [2]u32,
    // 0x2c
    mm_infra_qos_ctrl: mmio.Mmio(packed struct(u32) {
        reserved0: u2,
        reg_mmcpu0_awqos: u1,
        reg_mmcpu0_arqos: u1,
        reserved4: u12,
        reg_h_wthre_mm2conn: u2,
        reg_h_wthre_conn2mm: u2,
        reg_x_wthre_mmhw2pa: u2,
        reg_x_wthre_mmhw2ext: u2,
        reg_x_wthre_puhs: u2,
        reserved26: u6,
    }),

    padding48: [4]u32,
    // 0x40
    dma_clk_ctrl: mmio.Mmio(packed struct(u32) {
        dma_clk_en: u8,
        reserved8: u24,
    }),

    padding68: [3]u32,
    // 0x50
    vram_ctrl: mmio.Mmio(packed struct(u32) {
        reg_sysram_set: u1,
        reg_h2pf_sram_rel: u2,
        reserved3: u1,
        reg_vram_sram_rel: u1,
        reserved5: u1,
        reg_sub_sram_rel: u1,
        reg_blai_sram_rel: u1,
        reg_h2pf_sram_sel: u3,
        reserved11: u1,
        reg_vram_sram_sel: u1,
        reserved13: u1,
        reg_sub_sram_sel: u1,
        reg_blai_sram_sel: u1,
        reserved16: u16,
    }),

    padding84: [3]u32,
    // 0x60
    sram_parm: mmio.Mmio(packed struct(u32) {
        reg_sram_cpu_ram_dvs: u4,
        reg_sram_cpu_ram_dvse: u1,
        reg_sram_cpu_ram_nap: u1,
        reserved6: u2,
        reg_sram_l2ram_dvs: u4,
        reg_sram_l2ram_dvse: u1,
        reg_sram_l2ram_nap: u1,
        reserved14: u2,
        reg_sram_cdc_ram_dvs: u4,
        reg_sram_cdc_ram_dvse: u1,
        reg_sram_cdc_ram_nap: u1,
        reserved22: u2,
        reg_sram_sub_ram_dvs: u4,
        reg_sram_sub_ram_dvse: u1,
        reg_sram_sub_ram_nap: u1,
        reserved30: u2,
    }),

    padding100: [15]u32,
    // 0xa0
    mm_int_sta0: mmio.Mmio(packed struct(u32) {
        mm_int_sta0: u32,
    }),

    // 0xa4
    mm_int_mask0: mmio.Mmio(packed struct(u32) {
        mm_int_mask0: u32,
    }),

    // 0xa8
    mm_int_clr_0: mmio.Mmio(packed struct(u32) {
        mm_int_clr0: u32,
    }),

    // 0xac
    mm_int_sta1: mmio.Mmio(packed struct(u32) {
        mm_int_sta1: u32,
    }),

    // 0xb0
    mm_int_mask1: mmio.Mmio(packed struct(u32) {
        mm_int_mask1: u32,
    }),

    // 0xb4
    mm_int_clr_1: mmio.Mmio(packed struct(u32) {
        mm_int_clr1: u32,
    }),

    padding184: [14]u32,
    // 0xf0
    mmsys_debug_sel: mmio.Mmio(packed struct(u32) {
        mmsys_debug_sel: u4,
        reserved4: u28,
    }),

    padding244: [2]u32,
    // 0xfc
    mmsys_misc_dummy: mmio.Mmio(packed struct(u32) {
        pir_ctrl_o: u1,
        light_sensor_ctrl_o: u1,
        ir_cut_ctrl_o: u1,
        dvp_sensor_pwdn: u1,
        dummy_reg: u28,
    }),

    // 0x100
    ddr_debug: mmio.Mmio(packed struct(u32) {
        ddr_calib_done: u1,
        reserved1: u31,
    }),

    padding260: [15]u32,
    // 0x140
    mm_berr_cfg0: mmio.Mmio(packed struct(u32) {
        reg_berr_en: u3,
        reserved3: u5,
        reg_codec_berr_en: u3,
        reserved11: u5,
        reg_mmcpu_berr_en: u1,
        reserved17: u7,
        reg_mminfra_berr_en: u5,
        reserved29: u3,
    }),

    // 0x144
    mm_berr_cfg1: mmio.Mmio(packed struct(u32) {
        reg_berr_clr: u1,
        reg_codec_berr_clr: u1,
        reg_mmcpu_berr_clr: u1,
        reg_mminfra_berr_clr: u1,
        reserved4: u4,
        reg_berr_last: u1,
        reg_codec_berr_last: u1,
        reg_mmcpu_berr_last: u1,
        reg_mminfra_berr_last: u1,
        reserved12: u4,
        sts_berr: u1,
        sts_codec_berr: u1,
        sts_mmcpu_berr: u1,
        sts_mminfra_berr: u1,
        reserved20: u4,
        sts_berr_write: u1,
        sts_codec_berr_write: u1,
        sts_mmcpu_berr_write: u1,
        sts_mminfra_berr_write: u1,
        reserved28: u4,
    }),

    // 0x148
    mm_berr_cfg2: mmio.Mmio(packed struct(u32) {
        sts_berr_src: u3,
        reserved3: u5,
        sts_berr_id: u4,
        reserved12: u4,
        sts_codec_berr_src: u3,
        reserved19: u5,
        sts_codec_berr_id: u1,
        reserved25: u7,
    }),

    // 0x14c
    mm_berr_cfg3: mmio.Mmio(packed struct(u32) {
        sts_mmcpu_berr_src: u1,
        reserved1: u7,
        sts_mmcpu_berr_id: u4,
        reserved12: u4,
        sts_mminfra_berr_src: u5,
        reserved21: u3,
        sts_mminfra_berr_id: u6,
        reserved30: u2,
    }),

    // 0x150
    mm_berr_cfg4: mmio.Mmio(packed struct(u32) {
        sts_berr_addr: u32,
    }),

    // 0x154
    mm_berr_cfg5: mmio.Mmio(packed struct(u32) {
        sts_codec_berr_addr: u32,
    }),

    // 0x158
    mm_berr_cfg6: mmio.Mmio(packed struct(u32) {
        sts_mmcpu_berr_addr: u32,
    }),

    // 0x15c
    mm_berr_cfg7: mmio.Mmio(packed struct(u32) {
        sts_mminfra_berr_addr: u32,
    }),
};
