const mmio = @import("microzig").mmio;

pub const Type = extern struct {
    // 0x0
    ctl: mmio.Mmio(packed struct(u32) {
        rtc_ctl: u4,
        rtc_dly_option: u1,
        pu_ldo18io_aon: u1,
        reserved6: u1,
        mode: u1,
        trap_mode: u1,
        pwrdn_hbn_core: u1,
        reserved10: u2,
        sw_rst: u1,
        dis_pwr_off_ldo11: u1,
        dis_pwr_off_ldo11_rt: u1,
        ldo11_rt_vout_sel: u4,
        ldo11_aon_vout_sel: u4,
        pu_dcdc_aon: u1,
        pu_dcdc18_aon: u1,
        pwr_on_option: u1,
        sram_slp_option: u1,
        sram_slp: u1,
        state: u4,
    }),

    // 0x4
    time_l: mmio.Mmio(packed struct(u32) {
        time_l: u32,
    }),

    // 0x8
    time_h: mmio.Mmio(packed struct(u32) {
        time_h: u8,
        reserved8: u24,
    }),

    // 0xc
    rtc_time_l: mmio.Mmio(packed struct(u32) {
        rtc_time_latch_l: u32,
    }),

    // 0x10
    rtc_time_h: mmio.Mmio(packed struct(u32) {
        rtc_time_latch_h: u8,
        reserved8: u23,
        rtc_time_latch: u1,
    }),

    // 0x14
    irq_mode: mmio.Mmio(packed struct(u32) {
        pin_wakeup_mode: u4,
        pin_wakeup_mask: u9,
        reserved13: u3,
        reg_en_hw_pu_pd: u1,
        reserved17: u1,
        irq_bor_en: u1,
        reserved19: u1,
        irq_acomp0_en: u2,
        irq_acomp1_en: u2,
        pin_wakeup_sel: u3,
        pin_wakeup_en: u1,
        reserved28: u4,
    }),

    // 0x18
    irq_stat: mmio.Mmio(packed struct(u32) {
        irq_stat: u32,
    }),

    // 0x1c
    irq_clr: mmio.Mmio(packed struct(u32) {
        irq_clr: u32,
    }),

    // 0x20
    pir_cfg: mmio.Mmio(packed struct(u32) {
        pir_hpf_sel: u2,
        pir_lpf_sel: u1,
        reserved3: u1,
        pir_dis: u2,
        reserved6: u1,
        pir_en: u1,
        gpadc_cs: u1,
        reserved9: u23,
    }),

    // 0x24
    pir_vth: mmio.Mmio(packed struct(u32) {
        pir_vth: u14,
        reserved14: u18,
    }),

    // 0x28
    pir_interval: mmio.Mmio(packed struct(u32) {
        pir_interval: u12,
        reserved12: u20,
    }),

    // 0x2c
    bor_cfg: mmio.Mmio(packed struct(u32) {
        bod_sel: u1,
        bod_vth: u3,
        pu_bod: u1,
        r_bod_out: u1,
        reserved6: u26,
    }),

    // 0x30
    glb: mmio.Mmio(packed struct(u32) {
        root_clk_sel: u2,
        uart_clk_sel: u1,
        f32k_sel: u2,
        reserved5: u2,
        reset_event: u6,
        clr_reset_event: u1,
        reserved14: u1,
        uart_clk_sel2: u1,
        sw_ldo11soc_vout_sel_aon: u4,
        reserved20: u4,
        sw_ldo11_rt_vout_sel: u4,
        sw_ldo11_aon_vout_sel: u4,
    }),

    // 0x34
    sram: mmio.Mmio(packed struct(u32) {
        reserved0: u6,
        retram_ret: u1,
        retram_slp: u1,
        reserved8: u24,
    }),

    // 0x38
    pad_ctrl_0: mmio.Mmio(packed struct(u32) {
        reg_aon_pad_ie_smt: u9,
        reserved9: u1,
        reg_aon_led_sel: u9,
        reserved19: u1,
        reg_en_aon_ctrl_gpio: u9,
        reserved29: u2,
        reg_aon_gpio_iso_mode: u1,
    }),

    // 0x3c
    pad_ctrl_1: mmio.Mmio(packed struct(u32) {
        reg_aon_pad_oe: u9,
        reserved9: u1,
        reg_aon_pad_pd: u9,
        reserved19: u1,
        reg_aon_pad_pu: u9,
        reserved29: u3,
    }),

    padding64: [48]u32,
    // 0x100
    rsv0: mmio.Mmio(packed struct(u32) {
        rsv0: u32,
    }),

    // 0x104
    rsv1: mmio.Mmio(packed struct(u32) {
        rsv1: u32,
    }),

    // 0x108
    rsv2: mmio.Mmio(packed struct(u32) {
        rsv2: u32,
    }),

    // 0x10c
    rsv3: mmio.Mmio(packed struct(u32) {
        rsv3: u32,
    }),

    padding272: [60]u32,
    // 0x200
    rc32k_ctrl0: mmio.Mmio(packed struct(u32) {
        rc32k_cal_done: u1,
        rc32k_rdy: u1,
        rc32k_cal_inprogress: u1,
        rc32k_cal_div: u2,
        rc32k_cal_precharge: u1,
        rc32k_dig_code_fr_cal: u10,
        rc32k_vref_dly: u2,
        rc32k_allow_cal: u1,
        rc32k_ext_code_en: u1,
        rc32k_cal_en: u1,
        pu_rc32k: u1,
        rc32k_code_fr_ext: u10,
    }),

    // 0x204
    xtal32k: mmio.Mmio(packed struct(u32) {
        reserved0: u2,
        xtal32k_ext_sel: u1,
        xtal32k_amp_ctrl: u2,
        xtal32k_reg: u2,
        xtal32k_outbuf_stre: u1,
        xtal32k_otf_short: u1,
        xtal32k_inv_stre: u2,
        xtal32k_capbank: u6,
        xtal32k_ac_cap_short: u1,
        pu_xtal32k_buf: u1,
        pu_xtal32k: u1,
        xtal32k_hiz_en: u1,
        reserved21: u1,
        dten_xtal32k: u1,
        ten_xtal32k: u1,
        f32k_sel_rtc: u1,
        reserved25: u7,
    }),

    // 0x208
    rtc_rst_ctrl: mmio.Mmio(packed struct(u32) {
        rtc_rst_wait_cnt_rtc: u16,
        rtc_rst_refdiv_rtc: u3,
        rtc_rst_ctrl_misc: u13,
    }),

    // 0x20c
    rtc_rst_ctrl2: mmio.Mmio(packed struct(u32) {
        rtc_resv: u8,
        reg_en_hw_pu_rc32k: u1,
        reserved9: u23,
    }),
};
