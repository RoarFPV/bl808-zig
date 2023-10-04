const mmio = @import("microzig").mmio;

pub const Type = extern struct {
    padding0: [576]u32,
    // 0x900
    acomp0_ctrl: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    // 0x904
    acomp1_ctrl: mmio.Mmio(packed struct(u32) {
        aon_acomp_en: u1,
        reserved1: u3,
        aon_acomp_hyst_seln: u3,
        aon_acomp_hyst_selp: u3,
        aon_acomp_bias_prog: u2,
        aon_acomp_level_sel: u6,
        aon_acomp_neg_sel: u4,
        aon_acomp_pos_sel: u4,
        aon_acomp_mux_en: u1,
        reserved27: u5,
    }),

    // 0x908
    acomp_ctrl: mmio.Mmio(packed struct(u32) {
        aon_acomp1_rstn_ana: u1,
        aon_acomp0_rstn_ana: u1,
        reserved2: u6,
        aon_acomp1_test_en: u1,
        aon_acomp0_test_en: u1,
        aon_acomp1_test_sel: u2,
        aon_acomp0_test_sel: u2,
        reserved14: u3,
        aon_acomp1_out_raw_data: u1,
        reserved18: u1,
        aon_acomp0_out_raw_data: u1,
        reserved20: u4,
        aon_acomp_vref_sel: u6,
        reserved30: u2,
    }),
};
