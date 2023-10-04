const mmio = @import("microzig").mmio;

pub const Type = extern struct {
    // 0x0
    mcu_bus_cfg0: mmio.Mmio(packed struct(u32) {
        reg_mcu_infra_timeout_en: u1,
        reg_mcu_infra_timeout_clr: u1,
        reserved2: u14,
        sts_mcu_infra_timeout: u1,
        reserved17: u15,
    }),

    // 0x4
    mcu_bus_cfg1: mmio.Mmio(packed struct(u32) {
        reg_mcu1_hqos: u1,
        reg_mcu1_awqos: u1,
        reg_mcu1_arqos: u1,
        reg_mcu_x2hs_sp_bypass: u1,
        reserved4: u3,
        reg_x_wthre_mcu2ext: u2,
        reserved9: u7,
        reg_mcu_infra_arb_mode: u1,
        reserved17: u15,
    }),

    padding8: [3]u32,
    // 0x14
    mcu_e907_rtc: mmio.Mmio(packed struct(u32) {
        reg_mcu_rtc_div: u10,
        reserved10: u20,
        reg_mcu_rtc_rst: u1,
        reg_mcu_rtc_en: u1,
    }),

    padding24: [58]u32,
    // 0x100
    mcu_cfg1: mmio.Mmio(packed struct(u32) {
        reg_mcu1_dfs_req: u1,
        reserved1: u1,
        sts_mcu1_dfs_ack: u1,
        reserved3: u1,
        reg_mcu1_srst_en: u2,
        reserved6: u4,
        sts_mcu1_lpmd_b: u2,
        reserved12: u4,
        mcu1_wfi_force: u1,
        reserved17: u11,
        mcu1_ndm_rstn_en: u1,
        mcu1_hart_rstn_en: u1,
        reserved30: u2,
    }),

    padding260: [3]u32,
    // 0x110
    mcu1_log1: mmio.Mmio(packed struct(u32) {
        sts_mcu1_mcause: u32,
    }),

    // 0x114
    mcu1_log2: mmio.Mmio(packed struct(u32) {
        sts_mcu1_mintstatus: u32,
    }),

    // 0x118
    mcu1_log3: mmio.Mmio(packed struct(u32) {
        sts_mcu1_mstatus: u32,
    }),

    // 0x11c
    mcu1_log4: mmio.Mmio(packed struct(u32) {
        sts_mcu1_sp: u1,
        sts_mcu1_pc: u31,
    }),

    // 0x120
    mcu1_log5: mmio.Mmio(packed struct(u32) {
        reserved0: u24,
        sts_mcu1_lockup: u1,
        sts_mcu1_halted: u1,
        reserved26: u2,
        mcu1_ndm_rstn_req: u1,
        mcu1_hart_rstn_req: u1,
        reserved30: u2,
    }),

    padding292: [57]u32,
    // 0x208
    irom1_misr_dataout_0: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    // 0x20c
    irom1_misr_dataout_1: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),
};
