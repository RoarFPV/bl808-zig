const mmio = @import("microzig").mmio;

pub const Type = extern struct {
    // 0x0
    pwm_int_config: mmio.Mmio(packed struct(u32) {
        interrupt_sts: u6,
        reserved6: u2,
        int_clear: u6,
        reserved14: u18,
    }),

    padding4: [7]u32,
    // 0x20
    pwm0_clkdiv: mmio.Mmio(packed struct(u32) {
        clk_div: u16,
        reserved16: u16,
    }),

    // 0x24
    pwm0_thre1: mmio.Mmio(packed struct(u32) {
        thre1: u16,
        reserved16: u16,
    }),

    // 0x28
    pwm0_thre2: mmio.Mmio(packed struct(u32) {
        thre2: u16,
        reserved16: u16,
    }),

    // 0x2c
    pwm0_period: mmio.Mmio(packed struct(u32) {
        period: u16,
        reserved16: u16,
    }),

    // 0x30
    pwm0_config: mmio.Mmio(packed struct(u32) {
        reg_clk_sel: u2,
        out_inv: u1,
        stop_mode: u1,
        sw_force_val: u1,
        sw_mode: u1,
        stop_en: u1,
        sts_top: u1,
        reserved8: u24,
    }),

    // 0x34
    pwm0_interrupt: mmio.Mmio(packed struct(u32) {
        int_period_cnt: u16,
        int_enable: u1,
        reserved17: u15,
    }),

    padding56: [2]u32,
    // 0x40
    pwm1_clkdiv: mmio.Mmio(packed struct(u32) {
        clk_div: u16,
        reserved16: u16,
    }),

    // 0x44
    pwm1_thre1: mmio.Mmio(packed struct(u32) {
        thre1: u16,
        reserved16: u16,
    }),

    // 0x48
    pwm1_thre2: mmio.Mmio(packed struct(u32) {
        thre2: u16,
        reserved16: u16,
    }),

    // 0x4c
    pwm1_period: mmio.Mmio(packed struct(u32) {
        period: u16,
        reserved16: u16,
    }),

    // 0x50
    pwm1_config: mmio.Mmio(packed struct(u32) {
        reg_clk_sel: u2,
        out_inv: u1,
        stop_mode: u1,
        sw_force_val: u1,
        sw_mode: u1,
        stop_en: u1,
        sts_top: u1,
        reserved8: u24,
    }),

    // 0x54
    pwm1_interrupt: mmio.Mmio(packed struct(u32) {
        int_period_cnt: u16,
        int_enable: u1,
        reserved17: u15,
    }),

    padding88: [2]u32,
    // 0x60
    pwm2_clkdiv: mmio.Mmio(packed struct(u32) {
        clk_div: u16,
        reserved16: u16,
    }),

    // 0x64
    pwm2_thre1: mmio.Mmio(packed struct(u32) {
        thre1: u16,
        reserved16: u16,
    }),

    // 0x68
    pwm2_thre2: mmio.Mmio(packed struct(u32) {
        thre2: u16,
        reserved16: u16,
    }),

    // 0x6c
    pwm2_period: mmio.Mmio(packed struct(u32) {
        period: u16,
        reserved16: u16,
    }),

    // 0x70
    pwm2_config: mmio.Mmio(packed struct(u32) {
        reg_clk_sel: u2,
        out_inv: u1,
        stop_mode: u1,
        sw_force_val: u1,
        sw_mode: u1,
        stop_en: u1,
        sts_top: u1,
        reserved8: u24,
    }),

    // 0x74
    pwm2_interrupt: mmio.Mmio(packed struct(u32) {
        int_period_cnt: u16,
        int_enable: u1,
        reserved17: u15,
    }),

    padding120: [2]u32,
    // 0x80
    pwm3_clkdiv: mmio.Mmio(packed struct(u32) {
        clk_div: u16,
        reserved16: u16,
    }),

    // 0x84
    pwm3_thre1: mmio.Mmio(packed struct(u32) {
        thre1: u16,
        reserved16: u16,
    }),

    // 0x88
    pwm3_thre2: mmio.Mmio(packed struct(u32) {
        thre2: u16,
        reserved16: u16,
    }),

    // 0x8c
    pwm3_period: mmio.Mmio(packed struct(u32) {
        period: u16,
        reserved16: u16,
    }),

    // 0x90
    pwm3_config: mmio.Mmio(packed struct(u32) {
        reg_clk_sel: u2,
        out_inv: u1,
        stop_mode: u1,
        sw_force_val: u1,
        sw_mode: u1,
        stop_en: u1,
        sts_top: u1,
        reserved8: u24,
    }),

    // 0x94
    pwm3_interrupt: mmio.Mmio(packed struct(u32) {
        int_period_cnt: u16,
        int_enable: u1,
        reserved17: u15,
    }),

    padding152: [2]u32,
    // 0xa0
    pwm4_clkdiv: mmio.Mmio(packed struct(u32) {
        clk_div: u16,
        reserved16: u16,
    }),

    // 0xa4
    pwm4_thre1: mmio.Mmio(packed struct(u32) {
        thre1: u16,
        reserved16: u16,
    }),

    // 0xa8
    pwm4_thre2: mmio.Mmio(packed struct(u32) {
        thre2: u16,
        reserved16: u16,
    }),

    // 0xac
    pwm4_period: mmio.Mmio(packed struct(u32) {
        period: u16,
        reserved16: u16,
    }),

    // 0xb0
    pwm4_config: mmio.Mmio(packed struct(u32) {
        reg_clk_sel: u2,
        out_inv: u1,
        stop_mode: u1,
        sw_force_val: u1,
        sw_mode: u1,
        stop_en: u1,
        sts_top: u1,
        reserved8: u24,
    }),

    // 0xb4
    pwm4_interrupt: mmio.Mmio(packed struct(u32) {
        int_period_cnt: u16,
        int_enable: u1,
        reserved17: u15,
    }),
};
