const mmio = @import("microzig").mmio;

pub const Type = extern struct {
    // 0x0
    audac_0: mmio.Mmio(packed struct(u32) {
        dac_0_en: u1,
        dac_itf_en: u1,
        reserved2: u25,
        ckg_ena: u1,
        au_pwm_mode: u4,
    }),

    // 0x4
    audac_status: mmio.Mmio(packed struct(u32) {
        reserved0: u12,
        dac_h0_busy: u1,
        dac_h0_mute_done: u1,
        reserved14: u2,
        dac_s0_int: u1,
        dac_s0_int_clr: u1,
        reserved18: u5,
        zd_amute: u1,
        audio_int_all: u1,
        reserved25: u7,
    }),

    // 0x8
    audac_s0: mmio.Mmio(packed struct(u32) {
        reserved0: u2,
        dac_s0_ctrl_rmp_rate: u4,
        dac_s0_ctrl_zcd_rate: u4,
        dac_s0_ctrl_mode: u2,
        dac_s0_volume_update: u1,
        dac_s0_volume: u9,
        dac_s0_mute_rmpup_rate: u4,
        dac_s0_mute_rmpdn_rate: u4,
        dac_s0_mute_softmode: u1,
        dac_s0_mute: u1,
    }),

    // 0xc
    audac_s0_misc: mmio.Mmio(packed struct(u32) {
        reserved0: u28,
        dac_s0_ctrl_zcd_timeout: u4,
    }),

    // 0x10
    audac_zd_0: mmio.Mmio(packed struct(u32) {
        zd_time: u15,
        reserved15: u1,
        zd_en: u1,
        reserved17: u15,
    }),

    // 0x14
    audac_1: mmio.Mmio(packed struct(u32) {
        dac_mix_sel: u2,
        reserved2: u2,
        dac_dsm_out_fmt: u1,
        dac_dsm_order: u2,
        dac_dsm_scaling_mode: u2,
        reserved9: u1,
        dac_dsm_scaling_en: u1,
        dac_dsm_dither_amp: u3,
        dac_dsm_dither_en: u1,
        dac_dsm_dither_prbs_mode: u2,
        reserved17: u15,
    }),

    // 0x18
    audac_rsvd: mmio.Mmio(packed struct(u32) {
        au_pwm_reserved: u32,
    }),

    // 0x1c
    audac_test_0: mmio.Mmio(packed struct(u32) {
        dac_in_0: u16,
        dac_dpga_0: u16,
    }),

    // 0x20
    audac_test_1: mmio.Mmio(packed struct(u32) {
        dac_fir_0: u17,
        reserved17: u15,
    }),

    // 0x24
    audac_test_2: mmio.Mmio(packed struct(u32) {
        dac_sinc_0: u16,
        reserved16: u16,
    }),

    // 0x28
    audac_test_3: mmio.Mmio(packed struct(u32) {
        au_pwm_test_read: u32,
    }),

    padding44: [24]u32,
    // 0x8c
    audac_fifo_ctrl: mmio.Mmio(packed struct(u32) {
        tx_fifo_flush: u1,
        txo_int_en: u1,
        txu_int_en: u1,
        txa_int_en: u1,
        tx_drq_en: u1,
        reserved5: u3,
        tx_ch_en: u2,
        reserved10: u4,
        tx_drq_cnt: u2,
        tx_trg_level: u5,
        reserved21: u3,
        tx_data_mode: u2,
        reserved26: u6,
    }),

    // 0x90
    audac_fifo_status: mmio.Mmio(packed struct(u32) {
        reserved0: u1,
        txo_int: u1,
        txu_int: u1,
        reserved3: u1,
        txa_int: u1,
        reserved5: u11,
        txa_cnt: u5,
        reserved21: u3,
        txa: u1,
        reserved25: u7,
    }),

    // 0x94
    audac_fifo_data: mmio.Mmio(packed struct(u32) {
        tx_data: u32,
    }),
};
