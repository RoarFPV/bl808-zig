const mmio = @import("microzig").mmio;

pub const Type = extern struct {
    // 0x0
    dvp2axi_configue: mmio.Mmio(packed struct(u32) {
        reg_dvp_enable: u1,
        reg_sw_mode: u1,
        reg_fram_vld_pol: u1,
        reg_line_vld_pol: u1,
        reg_xlen: u3,
        reserved7: u1,
        reg_dvp_mode: u3,
        reg_hw_mode_fwrap: u1,
        reg_drop_en: u1,
        reg_drop_even: u1,
        reg_qos_sw_mode: u1,
        reg_qos_sw: u1,
        reg_dvp_data_mode: u3,
        reg_dvp_data_bsel: u1,
        reg_dvp_pix_clk_cg: u1,
        reserved21: u1,
        reg_v_subsample_en: u1,
        reg_v_subsample_pol: u1,
        reg_dvp_wait_cycle: u8,
    }),

    // 0x4
    dvp2axi_addr_start: mmio.Mmio(packed struct(u32) {
        reg_addr_start: u32,
    }),

    // 0x8
    dvp2axi_mem_bcnt: mmio.Mmio(packed struct(u32) {
        reg_mem_burst_cnt: u32,
    }),

    // 0xc
    dvp_status_and_error: mmio.Mmio(packed struct(u32) {
        reg_frame_cnt_trgr_int: u5,
        reserved5: u1,
        reg_int_hcnt_en: u1,
        reg_int_vcnt_en: u1,
        reg_int_normal_en: u1,
        reg_int_mem_en: u1,
        reg_int_frame_en: u1,
        reg_int_fifo_en: u1,
        sts_normal_int: u1,
        sts_mem_int: u1,
        sts_frame_int: u1,
        sts_fifo_int: u1,
        frame_valid_cnt: u5,
        sts_hcnt_int: u1,
        sts_vcnt_int: u1,
        reserved23: u1,
        st_bus_idle: u1,
        st_bus_func: u1,
        st_bus_wait: u1,
        st_bus_flsh: u1,
        axi_idle: u1,
        st_dvp_idle: u1,
        reserved30: u2,
    }),

    // 0x10
    dvp2axi_frame_bcnt: mmio.Mmio(packed struct(u32) {
        reg_frame_byte_cnt: u32,
    }),

    // 0x14
    dvp_frame_fifo_pop: mmio.Mmio(packed struct(u32) {
        rfifo_pop: u1,
        reserved1: u3,
        reg_int_normal_clr: u1,
        reg_int_mem_clr: u1,
        reg_int_frame_clr: u1,
        reg_int_fifo_clr: u1,
        reg_int_hcnt_clr: u1,
        reg_int_vcnt_clr: u1,
        reserved10: u22,
    }),

    // 0x18
    dvp2axi_frame_vld: mmio.Mmio(packed struct(u32) {
        reg_frame_n_vld: u32,
    }),

    // 0x1c
    dvp2axi_frame_period: mmio.Mmio(packed struct(u32) {
        reg_frame_period: u5,
        reserved5: u27,
    }),

    // 0x20
    dvp2axi_misc: mmio.Mmio(packed struct(u32) {
        reg_alpha: u8,
        reg_format_565: u3,
        reserved11: u21,
    }),

    padding36: [3]u32,
    // 0x30
    dvp2axi_hsync_crop: mmio.Mmio(packed struct(u32) {
        reg_hsync_act_end: u16,
        reg_hsync_act_start: u16,
    }),

    // 0x34
    dvp2axi_vsync_crop: mmio.Mmio(packed struct(u32) {
        reg_vsync_act_end: u16,
        reg_vsync_act_start: u16,
    }),

    // 0x38
    dvp2axi_fram_exm: mmio.Mmio(packed struct(u32) {
        reg_total_hcnt: u16,
        reg_total_vcnt: u16,
    }),

    padding60: [1]u32,
    // 0x40
    frame_start_addr0: mmio.Mmio(packed struct(u32) {
        frame_start_addr_0: u32,
    }),

    padding68: [1]u32,
    // 0x48
    frame_start_addr1: mmio.Mmio(packed struct(u32) {
        frame_start_addr_1: u32,
    }),

    padding76: [1]u32,
    // 0x50
    frame_start_addr2: mmio.Mmio(packed struct(u32) {
        frame_start_addr_2: u32,
    }),

    padding84: [1]u32,
    // 0x58
    frame_start_addr3: mmio.Mmio(packed struct(u32) {
        frame_start_addr_3: u32,
    }),

    padding92: [1]u32,
    // 0x60
    frame_id_sts01: mmio.Mmio(packed struct(u32) {
        frame_id_0: u16,
        frame_id_1: u16,
    }),

    // 0x64
    frame_id_sts23: mmio.Mmio(packed struct(u32) {
        frame_id_2: u16,
        frame_id_3: u16,
    }),

    padding104: [34]u32,
    // 0xf0
    dvp_debug: mmio.Mmio(packed struct(u32) {
        reg_dvp_dbg_en: u1,
        reg_dvp_dbg_sel: u3,
        reserved4: u4,
        reg_id_latch_line: u4,
        reserved12: u20,
    }),

    padding244: [2]u32,
    // 0xfc
    dvp_dummy_reg: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),
};
