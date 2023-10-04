const mmio = @import("microzig").mmio;

pub const Type = extern struct {
    // 0x0
    HBN_CTL: mmio.Mmio(packed struct(u32) {
        hbn_rtc_enable: u1,
        hbn_rtc_ctl: u3,
        hbn_rtc_dly_option: u1,
        reserved5: u2,
        hbn_mode: u1,
        hbn_trap_mode: u1,
        hbn_pwrdn_hbn_core: u1,
        reserved10: u1,
        hbn_pwrdn_hbn_rtc: u1,
        hbn_sw_rst: u1,
        hbn_dis_pwr_off_ldo11: u1,
        hbn_dis_pwr_off_ldo11_rt: u1,
        hbn_ldo11_rt_vout_sel: u4,
        hbn_ldo11_aon_vout_sel: u4,
        hbn_pu_dcdc18_aon: u1,
        reserved24: u1,
        hbn_pwr_on_option: u1,
        hbn_sram_slp_option: u1,
        hbn_sram_slp: u1,
        hbn_state: u4,
    }),

    // 0x4
    HBN_TIME_L: mmio.Mmio(packed struct(u32) {
        hbn_time_l: u32,
    }),

    // 0x8
    HBN_TIME_H: mmio.Mmio(packed struct(u32) {
        hbn_time_h: u8,
        reserved8: u24,
    }),

    // 0xc
    RTC_TIME_L: mmio.Mmio(packed struct(u32) {
        hbn_rtc_time_latch_l: u32,
    }),

    // 0x10
    RTC_TIME_H: mmio.Mmio(packed struct(u32) {
        hbn_rtc_time_latch_h: u8,
        reserved8: u23,
        hbn_rtc_time_latch: u1,
    }),
};
