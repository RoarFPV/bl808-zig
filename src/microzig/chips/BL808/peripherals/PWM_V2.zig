const mmio = @import("microzig").mmio;

pub const Type = extern struct {
    // 0x0
    pwm_int_config: mmio.Mmio(packed struct(u32) {
        pwm0_int_sts: u1,
        pwm1_int_sts: u1,
        reserved2: u6,
        pwm0_int_clr: u1,
        pwm1_int_clr: u1,
        reserved10: u22,
    }),

    padding4: [15]u32,
    // 0x40
    pwm_mc0_config0: mmio.Mmio(packed struct(u32) {
        pwm_clk_div: u16,
        reserved16: u3,
        pwm_stop_on_rept: u1,
        pwm_adc_trg_src: u4,
        pwm_sw_break_en: u1,
        pwm_ext_break_en: u1,
        pwm_ext_break_pl: u1,
        pwm_stop_en: u1,
        pwm_stop_mode: u1,
        pwm_sts_stop: u1,
        pwm_reg_clk_sel: u2,
    }),

    // 0x44
    pwm_mc0_config1: mmio.Mmio(packed struct(u32) {
        pwm_ch0_pen: u1,
        pwm_ch0_psi: u1,
        pwm_ch0_nen: u1,
        pwm_ch0_nsi: u1,
        pwm_ch1_pen: u1,
        pwm_ch1_psi: u1,
        pwm_ch1_nen: u1,
        pwm_ch1_nsi: u1,
        pwm_ch2_pen: u1,
        pwm_ch2_psi: u1,
        pwm_ch2_nen: u1,
        pwm_ch2_nsi: u1,
        pwm_ch3_pen: u1,
        pwm_ch3_psi: u1,
        pwm_ch3_nen: u1,
        pwm_ch3_nsi: u1,
        pwm_ch0_ppl: u1,
        pwm_ch0_npl: u1,
        pwm_ch1_ppl: u1,
        pwm_ch1_npl: u1,
        pwm_ch2_ppl: u1,
        pwm_ch2_npl: u1,
        pwm_ch3_ppl: u1,
        pwm_ch3_npl: u1,
        pwm_ch0_pbs: u1,
        pwm_ch0_nbs: u1,
        pwm_ch1_pbs: u1,
        pwm_ch1_nbs: u1,
        pwm_ch2_pbs: u1,
        pwm_ch2_nbs: u1,
        pwm_ch3_pbs: u1,
        pwm_ch3_nbs: u1,
    }),

    // 0x48
    pwm_mc0_period: mmio.Mmio(packed struct(u32) {
        pwm_period: u16,
        pwm_int_period_cnt: u16,
    }),

    // 0x4c
    pwm_mc0_dead_time: mmio.Mmio(packed struct(u32) {
        pwm_ch0_dtg: u8,
        pwm_ch1_dtg: u8,
        pwm_ch2_dtg: u8,
        pwm_ch3_dtg: u8,
    }),

    // 0x50
    pwm_mc0_ch0_thre: mmio.Mmio(packed struct(u32) {
        pwm_ch0_threl: u16,
        pwm_ch0_threh: u16,
    }),

    // 0x54
    pwm_mc0_ch1_thre: mmio.Mmio(packed struct(u32) {
        pwm_ch1_threl: u16,
        pwm_ch1_threh: u16,
    }),

    // 0x58
    pwm_mc0_ch2_thre: mmio.Mmio(packed struct(u32) {
        pwm_ch2_threl: u16,
        pwm_ch2_threh: u16,
    }),

    // 0x5c
    pwm_mc0_ch3_thre: mmio.Mmio(packed struct(u32) {
        pwm_ch3_threl: u16,
        pwm_ch3_threh: u16,
    }),

    // 0x60
    pwm_mc0_int_sts: mmio.Mmio(packed struct(u32) {
        pwm_ch0l_int: u1,
        pwm_ch0h_int: u1,
        pwm_ch1l_int: u1,
        pwm_ch1h_int: u1,
        pwm_ch2l_int: u1,
        pwm_ch2h_int: u1,
        pwm_ch3l_int: u1,
        pwm_ch3h_int: u1,
        pwm_prde_int: u1,
        pwm_brk_int: u1,
        pwm_rept_int: u1,
        reserved11: u21,
    }),

    // 0x64
    pwm_mc0_int_mask: mmio.Mmio(packed struct(u32) {
        pwm_cr_pwm_ch0l_mask: u1,
        pwm_cr_pwm_ch0h_mask: u1,
        pwm_cr_pwm_ch1l_mask: u1,
        pwm_cr_pwm_ch1h_mask: u1,
        pwm_cr_pwm_ch2l_mask: u1,
        pwm_cr_pwm_ch2h_mask: u1,
        pwm_cr_pwm_ch3l_mask: u1,
        pwm_cr_pwm_ch3h_mask: u1,
        pwm_cr_pwm_prde_mask: u1,
        pwm_cr_pwm_brk_mask: u1,
        pwm_cr_pwm_rept_mask: u1,
        reserved11: u21,
    }),

    // 0x68
    pwm_mc0_int_clear: mmio.Mmio(packed struct(u32) {
        pwm_cr_pwm_ch0l_clr: u1,
        pwm_cr_pwm_ch0h_clr: u1,
        pwm_cr_pwm_ch1l_clr: u1,
        pwm_cr_pwm_ch1h_clr: u1,
        pwm_cr_pwm_ch2l_clr: u1,
        pwm_cr_pwm_ch2h_clr: u1,
        pwm_cr_pwm_ch3l_clr: u1,
        pwm_cr_pwm_ch3h_clr: u1,
        pwm_cr_pwm_prde_clr: u1,
        pwm_cr_pwm_brk_clr: u1,
        pwm_cr_pwm_rept_clr: u1,
        reserved11: u21,
    }),

    // 0x6c
    pwm_mc0_int_en: mmio.Mmio(packed struct(u32) {
        pwm_cr_pwm_ch0l_en: u1,
        pwm_cr_pwm_ch0h_en: u1,
        pwm_cr_pwm_ch1l_en: u1,
        pwm_cr_pwm_ch1h_en: u1,
        pwm_cr_pwm_ch2l_en: u1,
        pwm_cr_pwm_ch2h_en: u1,
        pwm_cr_pwm_ch3l_en: u1,
        pwm_cr_pwm_ch3h_en: u1,
        pwm_cr_pwm_prde_en: u1,
        pwm_cr_pwm_brk_en: u1,
        pwm_cr_pwm_rept_en: u1,
        reserved11: u21,
    }),
};
