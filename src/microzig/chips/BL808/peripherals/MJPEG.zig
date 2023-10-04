const mmio = @import("microzig").mmio;

pub const Type = extern struct {
    // 0x0
    mjpeg_control_1: mmio.Mmio(packed struct(u32) {
        reg_mjpeg_enable: u1,
        reg_mjpeg_bit_order: u1,
        reg_order_u_even: u1,
        reg_hw_mode_swen: u1,
        reg_last_hf_wblk_dmy: u1,
        reg_last_hf_hblk_dmy: u1,
        reg_reflect_dmy: u1,
        reg_read_fwrap: u1,
        reg_w_xlen: u3,
        reserved11: u1,
        reg_yuv_mode: u2,
        reserved14: u10,
        reg_mjpeg_hw_frame: u6,
        reserved30: u2,
    }),

    // 0x4
    mjpeg_control_2: mmio.Mmio(packed struct(u32) {
        reg_sw_frame: u5,
        reserved5: u1,
        reg_sw_kick: u1,
        reg_sw_kick_mode: u1,
        reg_mjpeg_sw_mode: u1,
        reg_mjpeg_sw_run: u1,
        reg_yy_dvp2axi_sel: u3,
        reg_uv_dvp2axi_sel: u3,
        reg_mjpeg_wait_cycle: u16,
    }),

    // 0x8
    mjpeg_yy_frame_addr: mmio.Mmio(packed struct(u32) {
        reg_yy_addr_start: u32,
    }),

    // 0xc
    mjpeg_uv_frame_addr: mmio.Mmio(packed struct(u32) {
        reg_uv_addr_start: u32,
    }),

    // 0x10
    mjpeg_yuv_mem: mmio.Mmio(packed struct(u32) {
        reg_yy_mem_hblk: u13,
        reserved13: u3,
        reg_uv_mem_hblk: u13,
        reserved29: u3,
    }),

    // 0x14
    jpeg_frame_addr: mmio.Mmio(packed struct(u32) {
        reg_w_addr_start: u32,
    }),

    // 0x18
    jpeg_store_memory: mmio.Mmio(packed struct(u32) {
        reg_w_burst_cnt: u32,
    }),

    // 0x1c
    mjpeg_control_3: mmio.Mmio(packed struct(u32) {
        reg_int_normal_en: u1,
        reg_int_cam_en: u1,
        reg_int_mem_en: u1,
        reg_int_frame_en: u1,
        sts_normal_int: u1,
        sts_cam_int: u1,
        sts_mem_int: u1,
        sts_frame_int: u1,
        idle: u1,
        func: u1,
        wait: u1,
        flsh: u1,
        mans: u1,
        manf: u1,
        axi_read_idle: u1,
        axi_write_idle: u1,
        reg_frame_cnt_trgr_int: u5,
        reg_int_idle_en: u1,
        sts_idle_int: u1,
        reserved23: u1,
        frame_valid_cnt: u5,
        reg_int_swap_en: u1,
        sts_swap_int: u1,
        reserved31: u1,
    }),

    // 0x20
    mjpeg_frame_fifo_pop: mmio.Mmio(packed struct(u32) {
        rfifo_pop: u1,
        reg_w_swap_clr: u1,
        reserved2: u6,
        reg_int_normal_clr: u1,
        reg_int_cam_clr: u1,
        reg_int_mem_clr: u1,
        reg_int_frame_clr: u1,
        reg_int_idle_clr: u1,
        reg_int_swap_clr: u1,
        reserved14: u18,
    }),

    // 0x24
    mjpeg_frame_size: mmio.Mmio(packed struct(u32) {
        reg_frame_wblk: u12,
        reserved12: u4,
        reg_frame_hblk: u12,
        reserved28: u4,
    }),

    // 0x28
    mjpeg_header_byte: mmio.Mmio(packed struct(u32) {
        reg_head_byte: u12,
        reserved12: u4,
        reg_tail_exp: u1,
        reserved17: u7,
        reg_y0_order: u2,
        reg_u0_order: u2,
        reg_y1_order: u2,
        reg_v0_order: u2,
    }),

    padding44: [1]u32,
    // 0x30
    mjpeg_swap_mode: mmio.Mmio(packed struct(u32) {
        reg_w_swap_mode: u1,
        reserved1: u7,
        sts_swap0_full: u1,
        sts_swap1_full: u1,
        sts_read_swap_idx: u1,
        sts_swap_fstart: u1,
        sts_swap_fend: u1,
        reserved13: u19,
    }),

    // 0x34
    mjpeg_swap_bit_cnt: mmio.Mmio(packed struct(u32) {
        frame_swap_end_bit_cnt: u32,
    }),

    // 0x38
    mjpeg_yuv_mem_sw: mmio.Mmio(packed struct(u32) {
        reg_sw_kick_hblk: u13,
        reserved13: u19,
    }),

    padding60: [1]u32,
    // 0x40
    mjpeg_Y_frame_read_status_1: mmio.Mmio(packed struct(u32) {
        yy_mem_hblk_r: u13,
        reserved13: u3,
        yy_frm_hblk_r: u13,
        reserved29: u3,
    }),

    // 0x44
    mjpeg_Y_frame_read_status_2: mmio.Mmio(packed struct(u32) {
        yy_wblk_r: u13,
        reserved13: u3,
        yy_mem_rnd_r: u8,
        yy_frm_cnt_r: u8,
    }),

    // 0x48
    mjpeg_Y_frame_write_status: mmio.Mmio(packed struct(u32) {
        yy_mem_hblk_w: u13,
        reserved13: u3,
        yy_mem_rnd_w: u8,
        yy_frm_cnt_w: u8,
    }),

    // 0x4c
    mjpeg_UV_frame_read_status_1: mmio.Mmio(packed struct(u32) {
        uv_mem_hblk_r: u13,
        reserved13: u3,
        uv_frm_hblk_r: u13,
        reserved29: u3,
    }),

    // 0x50
    mjpeg_UV_frame_read_status_2: mmio.Mmio(packed struct(u32) {
        uv_wblk_r: u13,
        reserved13: u3,
        uv_mem_rnd_r: u8,
        uv_frm_cnt_r: u8,
    }),

    // 0x54
    mjpeg_UV_frame_write_status: mmio.Mmio(packed struct(u32) {
        uv_mem_hblk_w: u13,
        reserved13: u3,
        uv_mem_rnd_w: u8,
        uv_frm_cnt_w: u8,
    }),

    // 0x58
    mjpeg_frame_w_hblk_status: mmio.Mmio(packed struct(u32) {
        yy_frm_hblk_w: u13,
        reserved13: u3,
        uv_frm_hblk_w: u13,
        reserved29: u3,
    }),

    padding92: [9]u32,
    // 0x80
    mjpeg_start_addr0: mmio.Mmio(packed struct(u32) {
        frame_start_addr_0: u32,
    }),

    // 0x84
    mjpeg_bit_cnt0: mmio.Mmio(packed struct(u32) {
        frame_bit_cnt_0: u32,
    }),

    // 0x88
    mjpeg_start_addr1: mmio.Mmio(packed struct(u32) {
        frame_start_addr_1: u32,
    }),

    // 0x8c
    mjpeg_bit_cnt1: mmio.Mmio(packed struct(u32) {
        frame_bit_cnt_1: u32,
    }),

    // 0x90
    mjpeg_start_addr2: mmio.Mmio(packed struct(u32) {
        frame_start_addr_2: u32,
    }),

    // 0x94
    mjpeg_bit_cnt2: mmio.Mmio(packed struct(u32) {
        frame_bit_cnt_2: u32,
    }),

    // 0x98
    mjpeg_start_addr3: mmio.Mmio(packed struct(u32) {
        frame_start_addr_3: u32,
    }),

    // 0x9c
    mjpeg_bit_cnt3: mmio.Mmio(packed struct(u32) {
        frame_bit_cnt_3: u32,
    }),

    padding160: [24]u32,
    // 0x100
    mjpeg_q_enc: mmio.Mmio(packed struct(u32) {
        frame_q_sram_0: u1,
        frame_q_sram_1: u1,
        frame_q_sram_2: u1,
        frame_q_sram_3: u1,
        reserved4: u20,
        reg_q_sram_sw: u1,
        sts_q_sram_enc: u1,
        reserved26: u6,
    }),

    padding260: [3]u32,
    // 0x110
    mjpeg_frame_id_10: mmio.Mmio(packed struct(u32) {
        frame_id_0: u16,
        frame_id_1: u16,
    }),

    // 0x114
    mjpeg_frame_id_32: mmio.Mmio(packed struct(u32) {
        frame_id_2: u16,
        frame_id_3: u16,
    }),

    padding280: [54]u32,
    // 0x1f0
    mjpeg_debug: mmio.Mmio(packed struct(u32) {
        reg_mjpeg_dbg_en: u1,
        reserved1: u3,
        reg_mjpeg_dbg_sel: u4,
        reg_id_latch_hblk: u4,
        reserved12: u20,
    }),

    padding500: [2]u32,
    // 0x1fc
    mjpeg_dummy_reg: mmio.Mmio(packed struct(u32) {
        dummy_reg: u32,
    }),
};
