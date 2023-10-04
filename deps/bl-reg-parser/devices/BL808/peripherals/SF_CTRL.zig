const mmio = @import("microzig").mmio;

pub const Type = extern struct {
    // 0x0
    sf_ctrl_0: mmio.Mmio(packed struct(u32) {
        reserved0: u2,
        sf_clk_sf_rx_inv_sel: u1,
        sf_clk_out_gate_en: u1,
        sf_clk_out_inv_sel: u1,
        reserved5: u3,
        sf_if_read_dly_n: u3,
        sf_if_read_dly_en: u1,
        reserved12: u4,
        sf_if_int: u1,
        sf_if_int_clr: u1,
        sf_if_int_set: u1,
        sf_if_32b_adr_en: u1,
        sf_aes_dout_endian: u1,
        sf_aes_din_endian: u1,
        sf_aes_key_endian: u1,
        sf_aes_iv_endian: u1,
        sf_id: u8,
    }),

    // 0x4
    sf_ctrl_1: mmio.Mmio(packed struct(u32) {
        sf_if_sr_pat_mask: u8,
        sf_if_sr_pat: u8,
        sf_if_sr_int: u1,
        sf_if_sr_int_en: u1,
        sf_if_sr_int_set: u1,
        reserved19: u1,
        sf_if_0_ack_lat: u3,
        sf_ahb2sif_diswrap: u1,
        sf_if_reg_hold: u1,
        sf_if_reg_wp: u1,
        sf_ahb2sif_stopped: u1,
        sf_ahb2sif_stop: u1,
        sf_if_fn_sel: u1,
        sf_if_en: u1,
        sf_ahb2sif_en: u1,
        sf_ahb2sram_en: u1,
    }),

    // 0x8
    sf_if_sahb_0: mmio.Mmio(packed struct(u32) {
        sf_if_busy: u1,
        sf_if_0_trig: u1,
        sf_if_0_dat_byte: u10,
        sf_if_0_dmy_byte: u5,
        sf_if_0_adr_byte: u3,
        sf_if_0_cmd_byte: u3,
        sf_if_0_dat_rw: u1,
        sf_if_0_dat_en: u1,
        sf_if_0_dmy_en: u1,
        sf_if_0_adr_en: u1,
        sf_if_0_cmd_en: u1,
        sf_if_0_spi_mode: u3,
        sf_if_0_qpi_mode_en: u1,
    }),

    // 0xc
    sf_if_sahb_1: mmio.Mmio(packed struct(u32) {
        sf_if_0_cmd_buf_0: u32,
    }),

    // 0x10
    sf_if_sahb_2: mmio.Mmio(packed struct(u32) {
        sf_if_0_cmd_buf_1: u32,
    }),

    // 0x14
    sf_if_iahb_0: mmio.Mmio(packed struct(u32) {
        reserved0: u12,
        sf_if_1_dmy_byte: u5,
        sf_if_1_adr_byte: u3,
        sf_if_1_cmd_byte: u3,
        sf_if_1_dat_rw: u1,
        sf_if_1_dat_en: u1,
        sf_if_1_dmy_en: u1,
        sf_if_1_adr_en: u1,
        sf_if_1_cmd_en: u1,
        sf_if_1_spi_mode: u3,
        sf_if_1_qpi_mode_en: u1,
    }),

    // 0x18
    sf_if_iahb_1: mmio.Mmio(packed struct(u32) {
        sf_if_1_cmd_buf_0: u32,
    }),

    // 0x1c
    sf_if_iahb_2: mmio.Mmio(packed struct(u32) {
        sf_if_1_cmd_buf_1: u32,
    }),

    // 0x20
    sf_if_status_0: mmio.Mmio(packed struct(u32) {
        sf_if_status_0: u32,
    }),

    // 0x24
    sf_if_status_1: mmio.Mmio(packed struct(u32) {
        sf_if_status_1: u32,
    }),

    // 0x28
    sf_aes: mmio.Mmio(packed struct(u32) {
        sf_aes_en: u1,
        sf_aes_mode: u2,
        sf_aes_blk_mode: u1,
        sf_aes_xts_key_opt: u1,
        sf_aes_status: u27,
    }),

    // 0x2c
    sf_ahb2sif_status: mmio.Mmio(packed struct(u32) {
        sf_ahb2sif_status: u32,
    }),

    // 0x30
    sf_if_io_dly_0: mmio.Mmio(packed struct(u32) {
        sf_cs_dly_sel: u2,
        sf_cs2_dly_sel: u2,
        reserved4: u4,
        sf_clk_out_dly_sel: u2,
        reserved10: u16,
        sf_dqs_oe_dly_sel: u2,
        sf_dqs_di_dly_sel: u2,
        sf_dqs_do_dly_sel: u2,
    }),

    // 0x34
    sf_if_io_dly_1: mmio.Mmio(packed struct(u32) {
        sf_io_0_oe_dly_sel: u2,
        reserved2: u6,
        sf_io_0_di_dly_sel: u2,
        reserved10: u6,
        sf_io_0_do_dly_sel: u2,
        reserved18: u14,
    }),

    // 0x38
    sf_if_io_dly_2: mmio.Mmio(packed struct(u32) {
        sf_io_1_oe_dly_sel: u2,
        reserved2: u6,
        sf_io_1_di_dly_sel: u2,
        reserved10: u6,
        sf_io_1_do_dly_sel: u2,
        reserved18: u14,
    }),

    // 0x3c
    sf_if_io_dly_3: mmio.Mmio(packed struct(u32) {
        sf_io_2_oe_dly_sel: u2,
        reserved2: u6,
        sf_io_2_di_dly_sel: u2,
        reserved10: u6,
        sf_io_2_do_dly_sel: u2,
        reserved18: u14,
    }),

    // 0x40
    sf_if_io_dly_4: mmio.Mmio(packed struct(u32) {
        sf_io_3_oe_dly_sel: u2,
        reserved2: u6,
        sf_io_3_di_dly_sel: u2,
        reserved10: u6,
        sf_io_3_do_dly_sel: u2,
        reserved18: u14,
    }),

    // 0x44
    sf_reserved: mmio.Mmio(packed struct(u32) {
        sf_reserved: u32,
    }),

    // 0x48
    sf2_if_io_dly_0: mmio.Mmio(packed struct(u32) {
        sf2_cs_dly_sel: u2,
        sf2_cs2_dly_sel: u2,
        reserved4: u4,
        sf2_clk_out_dly_sel: u2,
        reserved10: u16,
        sf2_dqs_oe_dly_sel: u2,
        sf2_dqs_di_dly_sel: u2,
        sf2_dqs_do_dly_sel: u2,
    }),

    // 0x4c
    sf2_if_io_dly_1: mmio.Mmio(packed struct(u32) {
        sf2_io_0_oe_dly_sel: u2,
        reserved2: u6,
        sf2_io_0_di_dly_sel: u2,
        reserved10: u6,
        sf2_io_0_do_dly_sel: u2,
        reserved18: u14,
    }),

    // 0x50
    sf2_if_io_dly_2: mmio.Mmio(packed struct(u32) {
        sf2_io_1_oe_dly_sel: u2,
        reserved2: u6,
        sf2_io_1_di_dly_sel: u2,
        reserved10: u6,
        sf2_io_1_do_dly_sel: u2,
        reserved18: u14,
    }),

    // 0x54
    sf2_if_io_dly_3: mmio.Mmio(packed struct(u32) {
        sf2_io_2_oe_dly_sel: u2,
        reserved2: u6,
        sf2_io_2_di_dly_sel: u2,
        reserved10: u6,
        sf2_io_2_do_dly_sel: u2,
        reserved18: u14,
    }),

    // 0x58
    sf2_if_io_dly_4: mmio.Mmio(packed struct(u32) {
        sf2_io_3_oe_dly_sel: u2,
        reserved2: u6,
        sf2_io_3_di_dly_sel: u2,
        reserved10: u6,
        sf2_io_3_do_dly_sel: u2,
        reserved18: u14,
    }),

    // 0x5c
    sf3_if_io_dly_0: mmio.Mmio(packed struct(u32) {
        sf3_cs_dly_sel: u2,
        sf3_cs2_dly_sel: u2,
        reserved4: u4,
        sf3_clk_out_dly_sel: u2,
        reserved10: u16,
        sf3_dqs_oe_dly_sel: u2,
        sf3_dqs_di_dly_sel: u2,
        sf3_dqs_do_dly_sel: u2,
    }),

    // 0x60
    sf3_if_io_dly_1: mmio.Mmio(packed struct(u32) {
        sf3_io_0_oe_dly_sel: u2,
        reserved2: u6,
        sf3_io_0_di_dly_sel: u2,
        reserved10: u6,
        sf3_io_0_do_dly_sel: u2,
        reserved18: u14,
    }),

    // 0x64
    sf3_if_io_dly_2: mmio.Mmio(packed struct(u32) {
        sf3_io_1_oe_dly_sel: u2,
        reserved2: u6,
        sf3_io_1_di_dly_sel: u2,
        reserved10: u6,
        sf3_io_1_do_dly_sel: u2,
        reserved18: u14,
    }),

    // 0x68
    sf3_if_io_dly_3: mmio.Mmio(packed struct(u32) {
        sf3_io_2_oe_dly_sel: u2,
        reserved2: u6,
        sf3_io_2_di_dly_sel: u2,
        reserved10: u6,
        sf3_io_2_do_dly_sel: u2,
        reserved18: u14,
    }),

    // 0x6c
    sf3_if_io_dly_4: mmio.Mmio(packed struct(u32) {
        sf3_io_3_oe_dly_sel: u2,
        reserved2: u6,
        sf3_io_3_di_dly_sel: u2,
        reserved10: u6,
        sf3_io_3_do_dly_sel: u2,
        reserved18: u14,
    }),

    // 0x70
    sf_ctrl_2: mmio.Mmio(packed struct(u32) {
        sf_if_pad_sel: u2,
        reserved2: u1,
        sf_if_pad_sel_lock: u1,
        sf_if_dtr_en: u1,
        sf_if_dqs_en: u1,
        sf_if_trig_wr_prot: u1,
        sf_id_offset_lock: u1,
        reserved8: u17,
        sf_ahb2sif_remap_lock: u1,
        sf_ahb2sif_remap: u2,
        sf_if_bk_swap: u1,
        sf_if_bk2_mode: u1,
        sf_if_bk2_en: u1,
        sf_if_0_bk_sel: u1,
    }),

    // 0x74
    sf_ctrl_3: mmio.Mmio(packed struct(u32) {
        sf_cmds_2_wrap_len: u4,
        sf_cmds_2_en: u1,
        sf_cmds_2_bt_dly: u3,
        sf_cmds_2_bt_en: u1,
        sf_cmds_2_wrap_q_ini: u1,
        sf_cmds_2_wrap_mode: u2,
        sf_cmds_2_wrap_q: u1,
        sf_cmds_1_wrap_len: u4,
        sf_cmds_1_en: u1,
        sf_cmds_1_wrap_mode: u2,
        sf_cmds_core_en: u1,
        reserved21: u8,
        sf_if_1_ack_lat: u3,
    }),

    // 0x78
    sf_if_iahb_3: mmio.Mmio(packed struct(u32) {
        reserved0: u12,
        sf_if_2_dmy_byte: u5,
        sf_if_2_adr_byte: u3,
        sf_if_2_cmd_byte: u3,
        sf_if_2_dat_rw: u1,
        sf_if_2_dat_en: u1,
        sf_if_2_dmy_en: u1,
        sf_if_2_adr_en: u1,
        sf_if_2_cmd_en: u1,
        sf_if_2_spi_mode: u3,
        sf_if_2_qpi_mode_en: u1,
    }),

    // 0x7c
    sf_if_iahb_4: mmio.Mmio(packed struct(u32) {
        sf_if_2_cmd_buf_0: u32,
    }),

    // 0x80
    sf_if_iahb_5: mmio.Mmio(packed struct(u32) {
        sf_if_2_cmd_buf_1: u32,
    }),

    // 0x84
    sf_if_iahb_6: mmio.Mmio(packed struct(u32) {
        reserved0: u17,
        sf_if_3_adr_byte: u3,
        sf_if_3_cmd_byte: u3,
        reserved23: u3,
        sf_if_3_adr_en: u1,
        sf_if_3_cmd_en: u1,
        sf_if_3_spi_mode: u3,
        sf_if_3_qpi_mode_en: u1,
    }),

    // 0x88
    sf_if_iahb_7: mmio.Mmio(packed struct(u32) {
        sf_if_3_cmd_buf_0: u32,
    }),

    // 0x8c
    sf_if_iahb_8: mmio.Mmio(packed struct(u32) {
        sf_if_3_cmd_buf_1: u32,
    }),

    // 0x90
    sf_if_iahb_9: mmio.Mmio(packed struct(u32) {
        reserved0: u12,
        sf_if_4_dmy_byte: u5,
        sf_if_4_adr_byte: u3,
        sf_if_4_cmd_byte: u3,
        sf_if_4_dat_rw: u1,
        sf_if_4_dat_en: u1,
        sf_if_4_dmy_en: u1,
        sf_if_4_adr_en: u1,
        sf_if_4_cmd_en: u1,
        sf_if_4_spi_mode: u3,
        sf_if_4_qpi_mode_en: u1,
    }),

    // 0x94
    sf_if_iahb_10: mmio.Mmio(packed struct(u32) {
        sf_if_4_cmd_buf_0: u32,
    }),

    // 0x98
    sf_if_iahb_11: mmio.Mmio(packed struct(u32) {
        sf_if_4_cmd_buf_1: u32,
    }),

    // 0x9c
    sf_if_iahb_12: mmio.Mmio(packed struct(u32) {
        reserved0: u2,
        sf2_clk_sf_rx_inv_sel: u1,
        sf2_clk_sf_rx_inv_src: u1,
        sf2_clk_out_inv_sel: u1,
        sf3_clk_out_inv_sel: u1,
        reserved6: u2,
        sf2_if_read_dly_n: u3,
        sf2_if_read_dly_en: u1,
        sf2_if_read_dly_src: u1,
        reserved13: u19,
    }),

    // 0xa0
    sf_id0_offset: mmio.Mmio(packed struct(u32) {
        sf_id0_offset: u28,
        reserved28: u4,
    }),

    // 0xa4
    sf_id1_offset: mmio.Mmio(packed struct(u32) {
        sf_id1_offset: u28,
        reserved28: u4,
    }),

    // 0xa8
    sf_bk2_id0_offset: mmio.Mmio(packed struct(u32) {
        sf_bk2_id0_offset: u28,
        reserved28: u4,
    }),

    // 0xac
    sf_bk2_id1_offset: mmio.Mmio(packed struct(u32) {
        sf_bk2_id1_offset: u28,
        reserved28: u4,
    }),

    // 0xb0
    sf_dbg: mmio.Mmio(packed struct(u32) {
        sf_autoload_st: u5,
        sf_autoload_st_done: u1,
        reserved6: u26,
    }),

    padding180: [3]u32,
    // 0xc0
    sf_if2_ctrl_0: mmio.Mmio(packed struct(u32) {
        reserved0: u2,
        sf_clk_sf_if2_rx_inv_sel: u1,
        reserved3: u5,
        sf_if2_read_dly_n: u3,
        sf_if2_read_dly_en: u1,
        reserved12: u4,
        sf_if2_int: u1,
        sf_if2_int_clr: u1,
        sf_if2_int_set: u1,
        reserved19: u4,
        sf_if2_replace_sf1: u1,
        sf_if2_replace_sf2: u1,
        sf_if2_replace_sf3: u1,
        sf_if2_pad_sel: u2,
        sf_if2_bk_swap: u1,
        sf_if2_bk2_mode: u1,
        sf_if2_bk2_en: u1,
        sf_if2_bk_sel: u1,
    }),

    // 0xc4
    sf_if2_ctrl_1: mmio.Mmio(packed struct(u32) {
        sf_if2_sr_pat_mask: u8,
        sf_if2_sr_pat: u8,
        sf_if2_sr_int: u1,
        sf_if2_sr_int_en: u1,
        sf_if2_sr_int_set: u1,
        reserved19: u1,
        sf_if2_ack_lat: u3,
        reserved23: u1,
        sf_if2_reg_hold: u1,
        sf_if2_reg_wp: u1,
        reserved26: u2,
        sf_if2_fn_sel: u1,
        sf_if2_en: u1,
        reserved30: u2,
    }),

    // 0xc8
    sf_if2_sahb_0: mmio.Mmio(packed struct(u32) {
        sf_if2_busy: u1,
        sf_if2_0_trig: u1,
        sf_if2_0_dat_byte: u10,
        sf_if2_0_dmy_byte: u5,
        sf_if2_0_adr_byte: u3,
        sf_if2_0_cmd_byte: u3,
        sf_if2_0_dat_rw: u1,
        sf_if2_0_dat_en: u1,
        sf_if2_0_dmy_en: u1,
        sf_if2_0_adr_en: u1,
        sf_if2_0_cmd_en: u1,
        sf_if2_0_spi_mode: u3,
        sf_if2_0_qpi_mode_en: u1,
    }),

    // 0xcc
    sf_if2_sahb_1: mmio.Mmio(packed struct(u32) {
        sf_if2_0_cmd_buf_0: u32,
    }),

    // 0xd0
    sf_if2_sahb_2: mmio.Mmio(packed struct(u32) {
        sf_if2_0_cmd_buf_1: u32,
    }),

    padding212: [11]u32,
    // 0x100
    sf_ctrl_prot_en_rd: mmio.Mmio(packed struct(u32) {
        reserved0: u1,
        id0_en_rd: u1,
        id1_en_rd: u1,
        reserved3: u25,
        sf_sec_tzsid_lock: u1,
        sf_if2_0_trig_wr_lock: u1,
        sf_if_0_trig_wr_lock: u1,
        sf_dbg_dis: u1,
    }),

    // 0x104
    sf_ctrl_prot_en: mmio.Mmio(packed struct(u32) {
        reserved0: u1,
        id0_en: u1,
        id1_en: u1,
        reserved3: u29,
    }),

    padding264: [62]u32,
    // 0x200
    sf_aes_key_r0_0: mmio.Mmio(packed struct(u32) {
        sf_aes_key_r0_0: u32,
    }),

    // 0x204
    sf_aes_key_r0_1: mmio.Mmio(packed struct(u32) {
        sf_aes_key_r0_1: u32,
    }),

    // 0x208
    sf_aes_key_r0_2: mmio.Mmio(packed struct(u32) {
        sf_aes_key_r0_2: u32,
    }),

    // 0x20c
    sf_aes_key_r0_3: mmio.Mmio(packed struct(u32) {
        sf_aes_key_r0_3: u32,
    }),

    // 0x210
    sf_aes_key_r0_4: mmio.Mmio(packed struct(u32) {
        sf_aes_key_r0_4: u32,
    }),

    // 0x214
    sf_aes_key_r0_5: mmio.Mmio(packed struct(u32) {
        sf_aes_key_r0_5: u32,
    }),

    // 0x218
    sf_aes_key_r0_6: mmio.Mmio(packed struct(u32) {
        sf_aes_key_r0_6: u32,
    }),

    // 0x21c
    sf_aes_key_r0_7: mmio.Mmio(packed struct(u32) {
        sf_aes_key_r0_7: u32,
    }),

    // 0x220
    sf_aes_iv_r0_w0: mmio.Mmio(packed struct(u32) {
        sf_aes_iv_r0_w0: u32,
    }),

    // 0x224
    sf_aes_iv_r0_w1: mmio.Mmio(packed struct(u32) {
        sf_aes_iv_r0_w1: u32,
    }),

    // 0x228
    sf_aes_iv_r0_w2: mmio.Mmio(packed struct(u32) {
        sf_aes_iv_r0_w2: u32,
    }),

    // 0x22c
    sf_aes_iv_r0_w3: mmio.Mmio(packed struct(u32) {
        sf_aes_iv_r0_w3: u32,
    }),

    // 0x230
    sf_aes_r0_start: mmio.Mmio(packed struct(u32) {
        sf_aes_region_r0_start: u19,
        reserved19: u10,
        sf_aes_region_r0_hw_key_en: u1,
        sf_aes_region_r0_en: u1,
        sf_aes_region_r0_lock: u1,
    }),

    // 0x234
    sf_aes_r0_end: mmio.Mmio(packed struct(u32) {
        sf_aes_region_r0_end: u19,
        reserved19: u13,
    }),

    padding568: [18]u32,
    // 0x280
    sf_aes_key_r1_0: mmio.Mmio(packed struct(u32) {
        sf_aes_key_r1_0: u32,
    }),

    // 0x284
    sf_aes_key_r1_1: mmio.Mmio(packed struct(u32) {
        sf_aes_key_r1_1: u32,
    }),

    // 0x288
    sf_aes_key_r1_2: mmio.Mmio(packed struct(u32) {
        sf_aes_key_r1_2: u32,
    }),

    // 0x28c
    sf_aes_key_r1_3: mmio.Mmio(packed struct(u32) {
        sf_aes_key_r1_3: u32,
    }),

    // 0x290
    sf_aes_key_r1_4: mmio.Mmio(packed struct(u32) {
        sf_aes_key_r1_4: u32,
    }),

    // 0x294
    sf_aes_key_r1_5: mmio.Mmio(packed struct(u32) {
        sf_aes_key_r1_5: u32,
    }),

    // 0x298
    sf_aes_key_r1_6: mmio.Mmio(packed struct(u32) {
        sf_aes_key_r1_6: u32,
    }),

    // 0x29c
    sf_aes_key_r1_7: mmio.Mmio(packed struct(u32) {
        sf_aes_key_r1_7: u32,
    }),

    // 0x2a0
    sf_aes_iv_r1_w0: mmio.Mmio(packed struct(u32) {
        sf_aes_iv_r1_w0: u32,
    }),

    // 0x2a4
    sf_aes_iv_r1_w1: mmio.Mmio(packed struct(u32) {
        sf_aes_iv_r1_w1: u32,
    }),

    // 0x2a8
    sf_aes_iv_r1_w2: mmio.Mmio(packed struct(u32) {
        sf_aes_iv_r1_w2: u32,
    }),

    // 0x2ac
    sf_aes_iv_r1_w3: mmio.Mmio(packed struct(u32) {
        sf_aes_iv_r1_w3: u32,
    }),

    // 0x2b0
    sf_aes_r1_start: mmio.Mmio(packed struct(u32) {
        sf_aes_r1_start: u19,
        reserved19: u10,
        sf_aes_r1_hw_key_en: u1,
        sf_aes_r1_en: u1,
        sf_aes_r1_lock: u1,
    }),

    // 0x2b4
    sf_aes_r1_end: mmio.Mmio(packed struct(u32) {
        sf_aes_r1_end: u19,
        reserved19: u13,
    }),

    padding696: [18]u32,
    // 0x300
    sf_aes_key_r2_0: mmio.Mmio(packed struct(u32) {
        sf_aes_key_r2_0: u32,
    }),

    // 0x304
    sf_aes_key_r2_1: mmio.Mmio(packed struct(u32) {
        sf_aes_key_r2_1: u32,
    }),

    // 0x308
    sf_aes_key_r2_2: mmio.Mmio(packed struct(u32) {
        sf_aes_key_r2_2: u32,
    }),

    // 0x30c
    sf_aes_key_r2_3: mmio.Mmio(packed struct(u32) {
        sf_aes_key_r2_3: u32,
    }),

    // 0x310
    sf_aes_key_r2_4: mmio.Mmio(packed struct(u32) {
        sf_aes_key_r2_4: u32,
    }),

    // 0x314
    sf_aes_key_r2_5: mmio.Mmio(packed struct(u32) {
        sf_aes_key_r2_5: u32,
    }),

    // 0x318
    sf_aes_key_r2_6: mmio.Mmio(packed struct(u32) {
        sf_aes_key_r2_6: u32,
    }),

    // 0x31c
    sf_aes_key_r2_7: mmio.Mmio(packed struct(u32) {
        sf_aes_key_r2_7: u32,
    }),

    // 0x320
    sf_aes_iv_r2_w0: mmio.Mmio(packed struct(u32) {
        sf_aes_iv_r2_w0: u32,
    }),

    // 0x324
    sf_aes_iv_r2_w1: mmio.Mmio(packed struct(u32) {
        sf_aes_iv_r2_w1: u32,
    }),

    // 0x328
    sf_aes_iv_r2_w2: mmio.Mmio(packed struct(u32) {
        sf_aes_iv_r2_w2: u32,
    }),

    // 0x32c
    sf_aes_iv_r2_w3: mmio.Mmio(packed struct(u32) {
        sf_aes_iv_r2_w3: u32,
    }),

    // 0x330
    sf_aes_r2_start: mmio.Mmio(packed struct(u32) {
        sf_aes_r2_start: u19,
        reserved19: u10,
        sf_aes_r2_hw_key_en: u1,
        sf_aes_r2_en: u1,
        sf_aes_r2_lock: u1,
    }),

    // 0x334
    sf_aes_r2_end: mmio.Mmio(packed struct(u32) {
        sf_aes_r2_end: u19,
        reserved19: u13,
    }),

    // 0x0
    sf_ctrl_0: mmio.Mmio(packed struct(u32) {
        if_busy: u1,
        if_0_trig: u1,
        if_0_dat_byte: u10,
        if_0_dmy_byte: u5,
        if_0_adr_byte: u3,
        if_0_cmd_byte: u3,
        if_0_dat_rw: u1,
        if_0_dat_en: u1,
        if_0_dmy_en: u1,
        if_0_adr_en: u1,
        if_0_cmd_en: u1,
        if_0_spi_mode: u3,
        if_0_qpi_mode_en: u1,
    }),

    // 0x4
    sf_ctrl_1: mmio.Mmio(packed struct(u32) {
        if_0_cmd_buf_0: u32,
    }),

    // 0x8
    sf_if_sahb_0: mmio.Mmio(packed struct(u32) {
        if_0_cmd_buf_1: u32,
    }),

    // 0x0
    sf_ctrl_0: mmio.Mmio(packed struct(u32) {
        cs_dly_sel: u2,
        cs2_dly_sel: u2,
        reserved4: u4,
        clk_out_dly_sel: u2,
        reserved10: u16,
        dqs_oe_dly_sel: u2,
        dqs_di_dly_sel: u2,
        dqs_do_dly_sel: u2,
    }),

    // 0x4
    sf_ctrl_1: mmio.Mmio(packed struct(u32) {
        io_0_oe_dly_sel: u2,
        reserved2: u6,
        io_0_di_dly_sel: u2,
        reserved10: u6,
        io_0_do_dly_sel: u2,
        reserved18: u14,
    }),

    // 0x8
    sf_if_sahb_0: mmio.Mmio(packed struct(u32) {
        io_1_oe_dly_sel: u2,
        reserved2: u6,
        io_1_di_dly_sel: u2,
        reserved10: u6,
        io_1_do_dly_sel: u2,
        reserved18: u14,
    }),

    // 0xc
    sf_if_sahb_1: mmio.Mmio(packed struct(u32) {
        io_2_oe_dly_sel: u2,
        reserved2: u6,
        io_2_di_dly_sel: u2,
        reserved10: u6,
        io_2_do_dly_sel: u2,
        reserved18: u14,
    }),

    // 0x10
    sf_if_sahb_2: mmio.Mmio(packed struct(u32) {
        io_3_oe_dly_sel: u2,
        reserved2: u6,
        io_3_di_dly_sel: u2,
        reserved10: u6,
        io_3_do_dly_sel: u2,
        reserved18: u14,
    }),

    // 0x0
    sf_ctrl_0: mmio.Mmio(packed struct(u32) {
        sf_aes_key_0: u32,
    }),

    // 0x4
    sf_ctrl_1: mmio.Mmio(packed struct(u32) {
        sf_aes_key_1: u32,
    }),

    // 0x8
    sf_if_sahb_0: mmio.Mmio(packed struct(u32) {
        sf_aes_key_2: u32,
    }),

    // 0xc
    sf_if_sahb_1: mmio.Mmio(packed struct(u32) {
        sf_aes_key_3: u32,
    }),

    // 0x10
    sf_if_sahb_2: mmio.Mmio(packed struct(u32) {
        sf_aes_key_4: u32,
    }),

    // 0x14
    sf_if_iahb_0: mmio.Mmio(packed struct(u32) {
        sf_aes_key_5: u32,
    }),

    // 0x18
    sf_if_iahb_1: mmio.Mmio(packed struct(u32) {
        sf_aes_key_6: u32,
    }),

    // 0x1c
    sf_if_iahb_2: mmio.Mmio(packed struct(u32) {
        sf_aes_key_7: u32,
    }),

    // 0x20
    sf_if_status_0: mmio.Mmio(packed struct(u32) {
        sf_aes_iv_w0: u32,
    }),

    // 0x24
    sf_if_status_1: mmio.Mmio(packed struct(u32) {
        sf_aes_iv_w1: u32,
    }),

    // 0x28
    sf_aes: mmio.Mmio(packed struct(u32) {
        sf_aes_iv_w2: u32,
    }),

    // 0x2c
    sf_ahb2sif_status: mmio.Mmio(packed struct(u32) {
        sf_aes_iv_w3: u32,
    }),

    // 0x30
    sf_if_io_dly_0: mmio.Mmio(packed struct(u32) {
        sf_aes_region_start: u19,
        reserved19: u10,
        sf_aes_region_hw_key_en: u1,
        sf_aes_region_en: u1,
        sf_aes_region_lock: u1,
    }),

    // 0x34
    sf_if_io_dly_1: mmio.Mmio(packed struct(u32) {
        sf_aes_region_end: u19,
        reserved19: u13,
    }),
};
