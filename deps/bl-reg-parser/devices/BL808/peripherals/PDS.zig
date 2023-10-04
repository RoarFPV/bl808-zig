const mmio = @import("microzig").mmio;

pub const Type = extern struct {
    // 0x0
    ctl: mmio.Mmio(packed struct(u32) {
        start_ps: u1,
        cr_sleep_forever: u1,
        cr_xtal_force_off: u1,
        cr_pds_wifi_save_state: u1,
        cr_pds_pd_dcdc11: u1,
        cr_pds_pd_bg_sys: u1,
        cr_pds_ctrl_gpio_ie_pu_pd: u1,
        cr_pds_pd_dcdc18: u1,
        cr_pds_gate_clk: u1,
        cr_pds_mem_stby: u1,
        cr_pds_glb_reg_reset_protect: u1,
        cr_pds_iso_en: u1,
        cr_pds_wait_xtal_rdy: u1,
        cr_pds_pwr_off: u1,
        cr_pds_pd_xtal: u1,
        cr_pds_ctrl_soc_enb: u1,
        cr_pds_rst_soc: u1,
        cr_pds_rc32m_off_dis: u1,
        cr_pds_dcdc11_vsel_en: u1,
        cr_pds_ctrl_usbpll_pd: u1,
        cr_pds_ctrl_aupll_pd: u1,
        cr_pds_ctrl_cpupll_pd: u1,
        cr_pds_ctrl_wifipll_pd: u1,
        cr_pds_dcdc11_vol: u5,
        cr_pds_ctrl_rf: u2,
        cr_pds_start_use_tbtt_sleep: u1,
        cr_pds_gpio_iso_mode: u1,
    }),

    // 0x4
    time1: mmio.Mmio(packed struct(u32) {
        cr_sleep_duration: u32,
    }),

    padding8: [1]u32,
    // 0xc
    int: mmio.Mmio(packed struct(u32) {
        ro_pds_wake_int: u1,
        ro_pds_rf_done_int: u1,
        ro_pds_wifi_tbtt_sleep_irq: u1,
        ro_pds_wifi_tbtt_wakeup_irq: u1,
        cr_pds_wake_int_mask: u1,
        cr_pds_rf_done_int_mask: u1,
        cr_pds_wifi_tbtt_sleep_irq_mask: u1,
        cr_pds_wifi_tbtt_wakeup_irq_mask: u1,
        cr_pds_int_clr: u1,
        reserved9: u1,
        cr_pds_wakeup_src_en: u11,
        ro_pds_wakeup_event: u11,
    }),

    // 0x10
    ctl2: mmio.Mmio(packed struct(u32) {
        reserved0: u1,
        cr_pds_force_mm_pwr_off: u1,
        reserved2: u1,
        cr_pds_force_usb_pwr_off: u1,
        reserved4: u1,
        cr_pds_force_mm_iso_en: u1,
        reserved6: u1,
        cr_pds_force_usb_iso_en: u1,
        cr_pds_force_np_pds_rst: u1,
        cr_pds_force_mm_pds_rst: u1,
        cr_pds_force_wb_pds_rst: u1,
        cr_pds_force_usb_pds_rst: u1,
        cr_pds_force_np_mem_stby: u1,
        cr_pds_force_mm_mem_stby: u1,
        cr_pds_force_wb_mem_stby: u1,
        cr_pds_force_usb_mem_stby: u1,
        cr_pds_force_np_gate_clk: u1,
        cr_pds_force_mm_gate_clk: u1,
        cr_pds_force_wb_gate_clk: u1,
        cr_pds_force_usb_gate_clk: u1,
        reserved20: u12,
    }),

    // 0x14
    ctl3: mmio.Mmio(packed struct(u32) {
        reserved0: u1,
        cr_pds_force_misc_pwr_off: u1,
        reserved2: u2,
        cr_pds_force_misc_iso_en: u1,
        reserved5: u2,
        cr_pds_force_misc_pds_rst: u1,
        reserved8: u2,
        cr_pds_force_misc_mem_stby: u1,
        reserved11: u2,
        cr_pds_force_misc_gate_clk: u1,
        reserved14: u12,
        cr_pds_mm_iso_en: u1,
        reserved27: u2,
        cr_pds_usb_iso_en: u1,
        cr_pds_misc_iso_en: u1,
        reserved31: u1,
    }),

    // 0x18
    ctl4: mmio.Mmio(packed struct(u32) {
        reserved0: u1,
        cr_pds_np_reset: u1,
        cr_pds_np_mem_stby: u1,
        cr_pds_np_gate_clk: u1,
        reserved4: u4,
        cr_pds_mm_pwr_off: u1,
        cr_pds_mm_reset: u1,
        cr_pds_mm_mem_stby: u1,
        cr_pds_mm_gate_clk: u1,
        reserved12: u1,
        cr_pds_wb_reset: u1,
        cr_pds_wb_mem_stby: u1,
        cr_pds_wb_gate_clk: u1,
        reserved16: u4,
        cr_pds_usb_pwr_off: u1,
        cr_pds_usb_reset: u1,
        cr_pds_usb_mem_stby: u1,
        cr_pds_usb_gate_clk: u1,
        cr_pds_misc_pwr_off: u1,
        cr_pds_misc_reset: u1,
        cr_pds_misc_mem_stby: u1,
        cr_pds_misc_gate_clk: u1,
        reserved28: u4,
    }),

    // 0x1c
    stat: mmio.Mmio(packed struct(u32) {
        ro_pds_state: u5,
        reserved5: u3,
        ro_pds_rf_state: u5,
        reserved13: u11,
        reset_event: u3,
        reserved27: u4,
        clr_reset_event: u1,
    }),

    // 0x20
    ram1: mmio.Mmio(packed struct(u32) {
        cr_ocram_slp: u4,
        cr_ocram_ret: u4,
        cr_pds_ram_clk_cnt: u6,
        reserved14: u2,
        cr_pds_ram_clk2_cnt: u6,
        reserved22: u2,
        cr_pds_ctrl_np_ram_clk: u1,
        cr_pds_ctrl_mm_ram_clk: u1,
        cr_pds_ctrl_wb_ram_clk: u1,
        cr_pds_ctrl_usb_ram_clk: u1,
        cr_pds_ctrl_misc_ram_clk: u1,
        reserved29: u1,
        cr_pds_ctrl_ram_clk2: u1,
        cr_pds_ctrl_ram_clk: u1,
    }),

    // 0x24
    ctl5: mmio.Mmio(packed struct(u32) {
        cr_np_wfi_mask: u1,
        reserved1: u1,
        cr_mm_wfi_mask: u1,
        reserved3: u1,
        cr_pico_wfi_mask: u1,
        reserved5: u3,
        cr_pds_ctrl_usb33: u1,
        cr_pds_pd_ldo18io: u1,
        reserved10: u6,
        cr_pds_gpio_keep_en: u3,
        reserved19: u13,
    }),

    // 0x28
    ram2: mmio.Mmio(packed struct(u32) {
        cr_wram_slp: u10,
        cr_wram_ret: u10,
        reserved20: u12,
    }),

    padding44: [1]u32,
    // 0x30
    gpio_i_set: mmio.Mmio(packed struct(u32) {
        cr_pds_gpio_ie_set: u3,
        cr_pds_gpio_pd_set: u3,
        cr_pds_gpio_pu_set: u3,
        reserved9: u23,
    }),

    // 0x34
    gpio_pd_set: mmio.Mmio(packed struct(u32) {
        cr_pds_gpio_set_int_mask: u32,
    }),

    padding56: [2]u32,
    // 0x40
    gpio_int: mmio.Mmio(packed struct(u32) {
        reserved0: u2,
        gpio_set1_int_clr: u1,
        reserved3: u1,
        gpio_set1_int_mode: u4,
        reserved8: u2,
        gpio_set2_int_clr: u1,
        reserved11: u1,
        gpio_set2_int_mode: u4,
        reserved16: u2,
        gpio_set3_int_clr: u1,
        reserved19: u1,
        gpio_set3_int_mode: u4,
        reserved24: u2,
        gpio_set4_int_clr: u1,
        reserved27: u1,
        gpio_set4_int_mode: u4,
    }),

    // 0x44
    gpio_stat: mmio.Mmio(packed struct(u32) {
        gpio_int_stat: u32,
    }),

    padding72: [50]u32,
    // 0x110
    cpu_core_cfg0: mmio.Mmio(packed struct(u32) {
        reserved0: u28,
        reg_pico_clk_en: u1,
        e902_dfs_req: u1,
        e902_dfs_ack: u1,
        reserved31: u1,
    }),

    // 0x114
    cpu_core_cfg1: mmio.Mmio(packed struct(u32) {
        reserved0: u4,
        reg_pll_sel: u2,
        reserved6: u2,
        reg_mcu1_clk_en: u1,
        reserved9: u23,
    }),

    padding280: [5]u32,
    // 0x12c
    cpu_core_cfg7: mmio.Mmio(packed struct(u32) {
        reg_pico_div: u8,
        reserved8: u20,
        e902_lpmd_b: u2,
        reserved30: u1,
        pico_rst_mask: u1,
    }),

    // 0x130
    cpu_core_cfg8: mmio.Mmio(packed struct(u32) {
        e902_rtc_div: u10,
        reserved10: u20,
        e902_rtc_rst: u1,
        e902_rtc_en: u1,
    }),

    // 0x134
    cpu_core_cfg9: mmio.Mmio(packed struct(u32) {
        pico_rtc_cnt_l: u32,
    }),

    // 0x138
    cpu_core_cfg10: mmio.Mmio(packed struct(u32) {
        pico_rtc_cnt_h: u32,
    }),

    padding316: [1]u32,
    // 0x140
    cpu_core_cfg12: mmio.Mmio(packed struct(u32) {
        e902_iahbl_base: u12,
        reserved12: u4,
        e902_iahbl_mask: u12,
        reserved28: u4,
    }),

    // 0x144
    cpu_core_cfg13: mmio.Mmio(packed struct(u32) {
        e902_rst_addr: u32,
    }),

    // 0x148
    cpu_core_cfg14: mmio.Mmio(packed struct(u32) {
        e906_rst_addr: u32,
    }),

    // 0x14c
    tzc_pds: mmio.Mmio(packed struct(u32) {
        cr_e902_cfg_wr_lock: u1,
        cr_e906_cfg_wr_lock: u1,
        reserved2: u30,
    }),

    padding336: [108]u32,
    // 0x300
    rc32m_ctrl0: mmio.Mmio(packed struct(u32) {
        rc32m_cal_done: u1,
        rc32m_rdy: u1,
        rc32m_cal_inprogress: u1,
        rc32m_cal_div: u2,
        rc32m_cal_precharge: u1,
        rc32m_dig_code_fr_cal: u8,
        reserved14: u3,
        rc32m_allow_cal: u1,
        rc32m_refclk_half: u1,
        rc32m_ext_code_en: u1,
        rc32m_cal_en: u1,
        rc32m_pd: u1,
        rc32m_code_fr_ext: u8,
        reserved30: u2,
    }),

    // 0x304
    rc32m_ctrl1: mmio.Mmio(packed struct(u32) {
        rc32m_test_en: u1,
        rc32m_soft_rst: u1,
        rc32m_clk_soft_rst: u1,
        rc32m_clk_inv: u1,
        rc32m_clk_force_on: u1,
        reserved5: u19,
        rc32m_reserved: u8,
    }),

    padding776: [62]u32,
    // 0x400
    pu_rst_clkpll: mmio.Mmio(packed struct(u32) {
        reserved0: u9,
        cr_pds_pu_clkpll_sfreg: u1,
        cr_pds_pu_clkpll: u1,
        reserved11: u21,
    }),

    padding1028: [63]u32,
    // 0x500
    usb_ctl: mmio.Mmio(packed struct(u32) {
        reg_usb_sw_rst_n: u1,
        reg_usb_ext_susp_n: u1,
        reg_usb_wakeup: u1,
        reg_usb_l1_wakeup: u1,
        reg_usb_drvbus_pol: u1,
        reg_usb_iddig: u1,
        reserved6: u26,
    }),

    // 0x504
    usb_phy_ctrl: mmio.Mmio(packed struct(u32) {
        reg_usb_phy_ponrst: u1,
        reg_usb_phy_oscouten: u1,
        reg_usb_phy_xtlsel: u2,
        reg_usb_phy_outclksel: u1,
        reg_usb_phy_pllaliv: u1,
        reg_pu_usb20_psw: u1,
        reserved7: u25,
    }),

    padding1288: [318]u32,
    // 0xa00
    @"touch channel, clock, ana config1": mmio.Mmio(packed struct(u32) {
        touch_vref_sel: u3,
        touch_vldo_sel: u3,
        touch_comp_hys_sel: u1,
        touch_current_sel: u1,
        reserved8: u8,
        touch_clk_sel: u1,
        touch_clk_div_ratio: u3,
        touch_pcharge_high: u3,
        touch_pcharge_low: u3,
        touch_cont_en: u1,
        touch_cycle_en: u1,
        touch_ulp_en: u1,
        reserved29: u1,
        pu_touch: u1,
        reserved31: u1,
    }),

    // 0xa04
    @"touch channel, clock, ana config2": mmio.Mmio(packed struct(u32) {
        touch_channel_sel: u4,
        touch_channel0_highz_en: u1,
        touch_channel1_highz_en: u1,
        touch_channel2_highz_en: u1,
        touch_channel3_highz_en: u1,
        touch_channel4_highz_en: u1,
        touch_channel5_highz_en: u1,
        touch_channel6_highz_en: u1,
        touch_channel7_highz_en: u1,
        touch_channel8_highz_en: u1,
        touch_channel9_highz_en: u1,
        touch_channel10_highz_en: u1,
        touch_channel11_highz_en: u1,
        reserved16: u16,
    }),

    // 0xa08
    @"touch data process": mmio.Mmio(packed struct(u32) {
        touch_channel_cal_en: u1,
        touch_force_value_en: u1,
        touch_data_hys_en: u1,
        reserved3: u1,
        touch_lta_en: u1,
        touch_lta_order: u3,
        touch_flt_en: u1,
        touch_flt_order: u3,
        touch_self_mutual_sel: u1,
        touch_vldo_ccsel: u2,
        reserved15: u3,
        ten_touch: u1,
        reserved19: u13,
    }),

    // 0xa0c
    touch_sleep_time: mmio.Mmio(packed struct(u32) {
        touch_sleep_cycle: u23,
        reserved23: u9,
    }),

    // 0xa10
    touch_data_hystersis: mmio.Mmio(packed struct(u32) {
        touch_data_hys: u9,
        reserved9: u23,
    }),

    // 0xa14
    channel_force_data_0: mmio.Mmio(packed struct(u32) {
        touch_force_data_ch0: u16,
        touch_force_data_ch1: u16,
    }),

    // 0xa18
    channel_force_data_1: mmio.Mmio(packed struct(u32) {
        touch_force_data_ch2: u16,
        touch_force_data_ch3: u16,
    }),

    // 0xa1c
    channel_force_data_2: mmio.Mmio(packed struct(u32) {
        touch_force_data_ch4: u16,
        touch_force_data_ch5: u16,
    }),

    // 0xa20
    channel_force_data_3: mmio.Mmio(packed struct(u32) {
        touch_force_data_ch6: u16,
        touch_force_data_ch7: u16,
    }),

    // 0xa24
    channel_force_data_4: mmio.Mmio(packed struct(u32) {
        touch_force_data_ch8: u16,
        touch_force_data_ch9: u16,
    }),

    // 0xa28
    channel_force_data_5: mmio.Mmio(packed struct(u32) {
        touch_force_data_ch10: u16,
        touch_force_data_ch11: u16,
    }),

    // 0xa2c
    channel_vth_data_0: mmio.Mmio(packed struct(u32) {
        touch_vth_data_ch0: u8,
        touch_vth_data_ch1: u8,
        touch_vth_data_ch2: u8,
        touch_vth_data_ch3: u8,
    }),

    // 0xa30
    channel_vth_data_1: mmio.Mmio(packed struct(u32) {
        touch_vth_data_ch4: u8,
        touch_vth_data_ch5: u8,
        touch_vth_data_ch6: u8,
        touch_vth_data_ch7: u8,
    }),

    // 0xa34
    channel_vth_data_2: mmio.Mmio(packed struct(u32) {
        touch_vth_data_ch8: u8,
        touch_vth_data_ch9: u8,
        touch_vth_data_ch10: u8,
        touch_vth_data_ch11: u8,
    }),

    // 0xa38
    channel_raw_data_0: mmio.Mmio(packed struct(u32) {
        touch_raw_data_ch0: u16,
        reserved16: u16,
    }),

    // 0xa3c
    channel_raw_data_1: mmio.Mmio(packed struct(u32) {
        touch_raw_data_ch1: u16,
        reserved16: u16,
    }),

    // 0xa40
    channel_raw_data_2: mmio.Mmio(packed struct(u32) {
        touch_raw_data_ch2: u16,
        reserved16: u16,
    }),

    // 0xa44
    channel_raw_data_3: mmio.Mmio(packed struct(u32) {
        touch_raw_data_ch3: u16,
        reserved16: u16,
    }),

    // 0xa48
    channel_raw_data_4: mmio.Mmio(packed struct(u32) {
        touch_raw_data_ch4: u16,
        reserved16: u16,
    }),

    // 0xa4c
    channel_raw_data_5: mmio.Mmio(packed struct(u32) {
        touch_raw_data_ch5: u16,
        reserved16: u16,
    }),

    // 0xa50
    channel_raw_data_6: mmio.Mmio(packed struct(u32) {
        touch_raw_data_ch6: u16,
        reserved16: u16,
    }),

    // 0xa54
    channel_raw_data_7: mmio.Mmio(packed struct(u32) {
        touch_raw_data_ch7: u16,
        reserved16: u16,
    }),

    // 0xa58
    channel_raw_data_8: mmio.Mmio(packed struct(u32) {
        touch_raw_data_ch8: u16,
        reserved16: u16,
    }),

    // 0xa5c
    channel_raw_data_9: mmio.Mmio(packed struct(u32) {
        touch_raw_data_ch9: u16,
        reserved16: u16,
    }),

    // 0xa60
    channel_raw_data_10: mmio.Mmio(packed struct(u32) {
        touch_raw_data_ch10: u16,
        reserved16: u16,
    }),

    // 0xa64
    channel_raw_data_11: mmio.Mmio(packed struct(u32) {
        touch_raw_data_ch11: u16,
        reserved16: u16,
    }),

    // 0xa68
    channel_lta_data_0: mmio.Mmio(packed struct(u32) {
        touch_lta_data_ch0: u16,
        reserved16: u16,
    }),

    // 0xa6c
    channel_lta_data_1: mmio.Mmio(packed struct(u32) {
        touch_lta_data_ch1: u16,
        reserved16: u16,
    }),

    // 0xa70
    channel_lta_data_2: mmio.Mmio(packed struct(u32) {
        touch_lta_data_ch2: u16,
        reserved16: u16,
    }),

    // 0xa74
    channel_lta_data_3: mmio.Mmio(packed struct(u32) {
        touch_lta_data_ch3: u16,
        reserved16: u16,
    }),

    // 0xa78
    channel_lta_data_4: mmio.Mmio(packed struct(u32) {
        touch_lta_data_ch4: u16,
        reserved16: u16,
    }),

    // 0xa7c
    channel_lta_data_5: mmio.Mmio(packed struct(u32) {
        touch_lta_data_ch5: u16,
        reserved16: u16,
    }),

    // 0xa80
    channel_lta_data_6: mmio.Mmio(packed struct(u32) {
        touch_lta_data_ch6: u16,
        reserved16: u16,
    }),

    // 0xa84
    channel_lta_data_7: mmio.Mmio(packed struct(u32) {
        touch_lta_data_ch7: u16,
        reserved16: u16,
    }),

    // 0xa88
    channel_lta_data_8: mmio.Mmio(packed struct(u32) {
        touch_lta_data_ch8: u16,
        reserved16: u16,
    }),

    // 0xa8c
    channel_lta_data_9: mmio.Mmio(packed struct(u32) {
        touch_lta_data_ch9: u16,
        reserved16: u16,
    }),

    // 0xa90
    channel_lta_data_10: mmio.Mmio(packed struct(u32) {
        touch_lta_data_ch10: u16,
        reserved16: u16,
    }),

    // 0xa94
    channel_lta_data_11: mmio.Mmio(packed struct(u32) {
        touch_lta_data_ch11: u16,
        reserved16: u16,
    }),

    // 0xa98
    channel_flt_data_0: mmio.Mmio(packed struct(u32) {
        touch_flt_data_ch0: u16,
        reserved16: u16,
    }),

    // 0xa9c
    channel_flt_data_1: mmio.Mmio(packed struct(u32) {
        touch_flt_data_ch1: u16,
        reserved16: u16,
    }),

    // 0xaa0
    channel_flt_data_2: mmio.Mmio(packed struct(u32) {
        touch_flt_data_ch2: u16,
        reserved16: u16,
    }),

    // 0xaa4
    channel_flt_data_3: mmio.Mmio(packed struct(u32) {
        touch_flt_data_ch3: u16,
        reserved16: u16,
    }),

    // 0xaa8
    channel_flt_data_4: mmio.Mmio(packed struct(u32) {
        touch_flt_data_ch4: u16,
        reserved16: u16,
    }),

    // 0xaac
    channel_flt_data_5: mmio.Mmio(packed struct(u32) {
        touch_flt_data_ch5: u16,
        reserved16: u16,
    }),

    // 0xab0
    channel_flt_data_6: mmio.Mmio(packed struct(u32) {
        touch_flt_data_ch6: u16,
        reserved16: u16,
    }),

    // 0xab4
    channel_flt_data_7: mmio.Mmio(packed struct(u32) {
        touch_flt_data_ch7: u16,
        reserved16: u16,
    }),

    // 0xab8
    channel_flt_data_8: mmio.Mmio(packed struct(u32) {
        touch_flt_data_ch8: u16,
        reserved16: u16,
    }),

    // 0xabc
    channel_flt_data_9: mmio.Mmio(packed struct(u32) {
        touch_flt_data_ch9: u16,
        reserved16: u16,
    }),

    // 0xac0
    channel_flt_data_10: mmio.Mmio(packed struct(u32) {
        touch_flt_data_ch10: u16,
        reserved16: u16,
    }),

    // 0xac4
    channel_flt_data_11: mmio.Mmio(packed struct(u32) {
        touch_flt_data_ch11: u16,
        reserved16: u16,
    }),

    // 0xac8
    touch_rsvd: mmio.Mmio(packed struct(u32) {
        touch_reserved: u8,
        reserved8: u24,
    }),

    // 0xacc
    touch_int_setting: mmio.Mmio(packed struct(u32) {
        touch_int_clr: u12,
        reserved12: u4,
        touch_int_mask: u12,
        reserved28: u3,
        touch_int_en: u1,
    }),

    // 0xad0
    touch_int_status: mmio.Mmio(packed struct(u32) {
        touch_int_status: u12,
        touch_end_flag: u1,
        reserved13: u19,
    }),
};
