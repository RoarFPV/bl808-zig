const mmio = @import("microzig").mmio;

pub const Type = extern struct {
    // 0x0
    config: mmio.Mmio(packed struct(u32) {
        cr_enable: u1,
        cr_axi_en: u1,
        cr_mode_cea_861: u1,
        cr_snsr_en: u1,
        cr_snsr_hsync_inv: u1,
        cr_snsr_vsync_inv: u1,
        reserved6: u1,
        cr_axi_swap_mode: u1,
        cr_axi_swap_idx_sel: u4,
        cr_axi_swap_idx_swm: u1,
        cr_axi_swap_idx_swv: u1,
        reserved14: u2,
        cr_axi_dvp_data_mode: u3,
        reserved19: u1,
        cr_axi_b0_sel: u2,
        cr_axi_b1_sel: u2,
        cr_axi_b2_sel: u2,
        reserved26: u6,
    }),

    // 0x4
    frame_size_h: mmio.Mmio(packed struct(u32) {
        cr_total_h: u12,
        reserved12: u4,
        cr_blank_h: u12,
        reserved28: u4,
    }),

    // 0x8
    frame_size_v: mmio.Mmio(packed struct(u32) {
        cr_total_v: u12,
        reserved12: u4,
        cr_blank_v: u12,
        reserved28: u4,
    }),

    // 0xc
    frame_size_cea_861: mmio.Mmio(packed struct(u32) {
        cr_h_duration: u8,
        cr_h_placement: u8,
        cr_v_duration: u8,
        cr_v_placement: u8,
    }),

    // 0x10
    pix_data_range: mmio.Mmio(packed struct(u32) {
        cr_data_min: u16,
        cr_data_max: u16,
    }),

    // 0x14
    pix_data_step: mmio.Mmio(packed struct(u32) {
        cr_data_step: u8,
        reserved8: u24,
    }),

    padding24: [2]u32,
    // 0x20
    axi2dvp_setting: mmio.Mmio(packed struct(u32) {
        cr_axi_xlen: u3,
        reserved3: u1,
        cr_axi_drain_err_clr: u1,
        reserved5: u3,
        cr_axi_420_mode: u1,
        cr_axi_420_ud_sel: u1,
        cr_qos_sw_mode: u1,
        cr_qos_sw: u1,
        reserved12: u20,
    }),

    // 0x24
    axi2dvp_start_addr_by: mmio.Mmio(packed struct(u32) {
        cr_axi_addr_start_by: u32,
    }),

    // 0x28
    axi2dvp_burst_cnt: mmio.Mmio(packed struct(u32) {
        cr_axi_frame_bc: u32,
    }),

    // 0x2c
    axi2dvp_status: mmio.Mmio(packed struct(u32) {
        st_axi_fifo_cnt_by: u7,
        st_axi_drain_error_by: u1,
        st_axi_state_idle_by: u1,
        st_axi_state_func_by: u1,
        st_axi_state_flsh_by: u1,
        reserved11: u5,
        st_axi_fifo_cnt_uv: u7,
        st_axi_drain_error_uv: u1,
        st_axi_state_idle_uv: u1,
        st_axi_state_func_uv: u1,
        st_axi_state_flsh_uv: u1,
        reserved27: u5,
    }),

    // 0x30
    axi2dvp_swap_addr_by: mmio.Mmio(packed struct(u32) {
        cr_axi_addr_swap_by: u32,
    }),

    // 0x34
    axi2dvp_prefetch: mmio.Mmio(packed struct(u32) {
        cr_prefetch_v: u12,
        reserved12: u20,
    }),

    // 0x38
    snsr2dvp_wait_pos: mmio.Mmio(packed struct(u32) {
        cr_snsr_fifo_th: u11,
        reserved11: u21,
    }),

    padding60: [1]u32,
    // 0x40
    axi2dvp_start_addr_uv: mmio.Mmio(packed struct(u32) {
        cr_axi_addr_start_uv: u32,
    }),

    // 0x44
    axi2dvp_swap_addr_uv: mmio.Mmio(packed struct(u32) {
        cr_axi_addr_swap_uv: u32,
    }),
};
