const mmio = @import("microzig").mmio;

pub const Type = extern struct {
    // 0x0
    usb_config: mmio.Mmio(packed struct(u32) {
        usb_cr_usb_en: u1,
        reserved1: u3,
        usb_cr_usb_rom_dct_en: u1,
        reserved5: u3,
        usb_cr_usb_ep0_sw_ctrl: u1,
        usb_cr_usb_ep0_sw_addr: u7,
        usb_cr_usb_ep0_sw_size: u8,
        usb_cr_usb_ep0_sw_stall: u1,
        usb_cr_usb_ep0_sw_nack_in: u1,
        usb_cr_usb_ep0_sw_nack_out: u1,
        usb_cr_usb_ep0_sw_rdy: u1,
        usb_sts_usb_ep0_sw_rdy: u1,
        reserved29: u3,
    }),

    // 0x4
    usb_lpm_config: mmio.Mmio(packed struct(u32) {
        usb_cr_lpm_en: u1,
        usb_cr_lpm_resp_upd: u1,
        usb_cr_lpm_resp: u2,
        reserved4: u16,
        usb_sts_lpm_attr: u11,
        usb_sts_lpm: u1,
    }),

    // 0x8
    usb_resume_config: mmio.Mmio(packed struct(u32) {
        usb_cr_res_width: u11,
        reserved11: u1,
        usb_cr_res_trig: u1,
        reserved13: u18,
        usb_cr_res_force: u1,
    }),

    padding12: [1]u32,
    // 0x10
    usb_setup_data_0: mmio.Mmio(packed struct(u32) {
        usb_sts_setup_data_b0: u8,
        usb_sts_setup_data_b1: u8,
        usb_sts_setup_data_b2: u8,
        usb_sts_setup_data_b3: u8,
    }),

    // 0x14
    usb_setup_data_1: mmio.Mmio(packed struct(u32) {
        usb_sts_setup_data_b4: u8,
        usb_sts_setup_data_b5: u8,
        usb_sts_setup_data_b6: u8,
        usb_sts_setup_data_b7: u8,
    }),

    // 0x18
    usb_frame_no: mmio.Mmio(packed struct(u32) {
        usb_sts_frame_no: u11,
        reserved11: u1,
        usb_sts_pid: u4,
        usb_sts_ep_no: u4,
        reserved20: u12,
    }),

    // 0x1c
    usb_error: mmio.Mmio(packed struct(u32) {
        usb_utmi_rx_err: u1,
        usb_xfer_to_err: u1,
        usb_ivld_ep_err: u1,
        usb_pid_seq_err: u1,
        usb_pid_cks_err: u1,
        usb_crc5_err: u1,
        usb_crc16_err: u1,
        reserved7: u25,
    }),

    // 0x20
    usb_int_en: mmio.Mmio(packed struct(u32) {
        usb_cr_sof_en: u1,
        usb_cr_usb_reset_en: u1,
        usb_cr_vbus_tgl_en: u1,
        usb_cr_get_dct_cmd_en: u1,
        usb_cr_ep0_setup_cmd_en: u1,
        usb_cr_ep0_setup_done_en: u1,
        usb_cr_ep0_in_cmd_en: u1,
        usb_cr_ep0_in_done_en: u1,
        usb_cr_ep0_out_cmd_en: u1,
        usb_cr_ep0_out_done_en: u1,
        usb_cr_ep1_cmd_en: u1,
        usb_cr_ep1_done_en: u1,
        usb_cr_ep2_cmd_en: u1,
        usb_cr_ep2_done_en: u1,
        usb_cr_ep3_cmd_en: u1,
        usb_cr_ep3_done_en: u1,
        usb_cr_ep4_cmd_en: u1,
        usb_cr_ep4_done_en: u1,
        usb_cr_ep5_cmd_en: u1,
        usb_cr_ep5_done_en: u1,
        usb_cr_ep6_cmd_en: u1,
        usb_cr_ep6_done_en: u1,
        usb_cr_ep7_cmd_en: u1,
        usb_cr_ep7_done_en: u1,
        reserved24: u3,
        usb_cr_usb_rend_en: u1,
        usb_cr_lpm_wkup_en: u1,
        usb_cr_lpm_pkt_en: u1,
        usb_cr_sof_3ms_en: u1,
        usb_cr_usb_err_en: u1,
    }),

    // 0x24
    usb_int_sts: mmio.Mmio(packed struct(u32) {
        usb_sof_int: u1,
        usb_reset_int: u1,
        usb_vbus_tgl_int: u1,
        usb_get_dct_cmd_int: u1,
        usb_ep0_setup_cmd_int: u1,
        usb_ep0_setup_done_int: u1,
        usb_ep0_in_cmd_int: u1,
        usb_ep0_in_done_int: u1,
        usb_ep0_out_cmd_int: u1,
        usb_ep0_out_done_int: u1,
        usb_ep1_cmd_int: u1,
        usb_ep1_done_int: u1,
        usb_ep2_cmd_int: u1,
        usb_ep2_done_int: u1,
        usb_ep3_cmd_int: u1,
        usb_ep3_done_int: u1,
        usb_ep4_cmd_int: u1,
        usb_ep4_done_int: u1,
        usb_ep5_cmd_int: u1,
        usb_ep5_done_int: u1,
        usb_ep6_cmd_int: u1,
        usb_ep6_done_int: u1,
        usb_ep7_cmd_int: u1,
        usb_ep7_done_int: u1,
        reserved24: u3,
        usb_rend_int: u1,
        usb_lpm_wkup_int: u1,
        usb_lpm_pkt_int: u1,
        usb_sof_3ms_int: u1,
        usb_err_int: u1,
    }),

    // 0x28
    usb_int_mask: mmio.Mmio(packed struct(u32) {
        usb_cr_sof_mask: u1,
        usb_cr_usb_reset_mask: u1,
        usb_cr_vbus_tgl_mask: u1,
        usb_cr_get_dct_cmd_mask: u1,
        usb_cr_ep0_setup_cmd_mask: u1,
        usb_cr_ep0_setup_done_mask: u1,
        usb_cr_ep0_in_cmd_mask: u1,
        usb_cr_ep0_in_done_mask: u1,
        usb_cr_ep0_out_cmd_mask: u1,
        usb_cr_ep0_out_done_mask: u1,
        usb_cr_ep1_cmd_mask: u1,
        usb_cr_ep1_done_mask: u1,
        usb_cr_ep2_cmd_mask: u1,
        usb_cr_ep2_done_mask: u1,
        usb_cr_ep3_cmd_mask: u1,
        usb_cr_ep3_done_mask: u1,
        usb_cr_ep4_cmd_mask: u1,
        usb_cr_ep4_done_mask: u1,
        usb_cr_ep5_cmd_mask: u1,
        usb_cr_ep5_done_mask: u1,
        usb_cr_ep6_cmd_mask: u1,
        usb_cr_ep6_done_mask: u1,
        usb_cr_ep7_cmd_mask: u1,
        usb_cr_ep7_done_mask: u1,
        reserved24: u3,
        usb_cr_usb_rend_mask: u1,
        usb_cr_lpm_wkup_mask: u1,
        usb_cr_lpm_pkt_mask: u1,
        usb_cr_sof_3ms_mask: u1,
        usb_cr_usb_err_mask: u1,
    }),

    // 0x2c
    usb_int_clear: mmio.Mmio(packed struct(u32) {
        usb_cr_sof_clr: u1,
        usb_cr_usb_reset_clr: u1,
        usb_cr_vbus_tgl_clr: u1,
        usb_cr_get_dct_cmd_clr: u1,
        usb_cr_ep0_setup_cmd_clr: u1,
        usb_cr_ep0_setup_done_clr: u1,
        usb_cr_ep0_in_cmd_clr: u1,
        usb_cr_ep0_in_done_clr: u1,
        usb_cr_ep0_out_cmd_clr: u1,
        usb_cr_ep0_out_done_clr: u1,
        usb_cr_ep1_cmd_clr: u1,
        usb_cr_ep1_done_clr: u1,
        usb_cr_ep2_cmd_clr: u1,
        usb_cr_ep2_done_clr: u1,
        usb_cr_ep3_cmd_clr: u1,
        usb_cr_ep3_done_clr: u1,
        usb_cr_ep4_cmd_clr: u1,
        usb_cr_ep4_done_clr: u1,
        usb_cr_ep5_cmd_clr: u1,
        usb_cr_ep5_done_clr: u1,
        usb_cr_ep6_cmd_clr: u1,
        usb_cr_ep6_done_clr: u1,
        usb_cr_ep7_cmd_clr: u1,
        usb_cr_ep7_done_clr: u1,
        reserved24: u3,
        usb_cr_usb_rend_clr: u1,
        usb_cr_lpm_wkup_clr: u1,
        usb_cr_lpm_pkt_clr: u1,
        usb_cr_sof_3ms_clr: u1,
        usb_cr_usb_err_clr: u1,
    }),

    padding48: [4]u32,
    // 0x40
    ep1_config: mmio.Mmio(packed struct(u32) {
        usb_cr_ep1_size: u11,
        usb_cr_ep1_dir: u2,
        usb_cr_ep1_type: u3,
        usb_cr_ep1_stall: u1,
        usb_cr_ep1_nack: u1,
        usb_cr_ep1_rdy: u1,
        usb_sts_ep1_rdy: u1,
        reserved20: u12,
    }),

    // 0x44
    ep2_config: mmio.Mmio(packed struct(u32) {
        usb_cr_ep2_size: u11,
        usb_cr_ep2_dir: u2,
        usb_cr_ep2_type: u3,
        usb_cr_ep2_stall: u1,
        usb_cr_ep2_nack: u1,
        usb_cr_ep2_rdy: u1,
        usb_sts_ep2_rdy: u1,
        reserved20: u12,
    }),

    // 0x48
    ep3_config: mmio.Mmio(packed struct(u32) {
        usb_cr_ep3_size: u11,
        usb_cr_ep3_dir: u2,
        usb_cr_ep3_type: u3,
        usb_cr_ep3_stall: u1,
        usb_cr_ep3_nack: u1,
        usb_cr_ep3_rdy: u1,
        usb_sts_ep3_rdy: u1,
        reserved20: u12,
    }),

    // 0x4c
    ep4_config: mmio.Mmio(packed struct(u32) {
        usb_cr_ep4_size: u11,
        usb_cr_ep4_dir: u2,
        usb_cr_ep4_type: u3,
        usb_cr_ep4_stall: u1,
        usb_cr_ep4_nack: u1,
        usb_cr_ep4_rdy: u1,
        usb_sts_ep4_rdy: u1,
        reserved20: u12,
    }),

    // 0x50
    ep5_config: mmio.Mmio(packed struct(u32) {
        usb_cr_ep5_size: u11,
        usb_cr_ep5_dir: u2,
        usb_cr_ep5_type: u3,
        usb_cr_ep5_stall: u1,
        usb_cr_ep5_nack: u1,
        usb_cr_ep5_rdy: u1,
        usb_sts_ep5_rdy: u1,
        reserved20: u12,
    }),

    // 0x54
    ep6_config: mmio.Mmio(packed struct(u32) {
        usb_cr_ep6_size: u11,
        usb_cr_ep6_dir: u2,
        usb_cr_ep6_type: u3,
        usb_cr_ep6_stall: u1,
        usb_cr_ep6_nack: u1,
        usb_cr_ep6_rdy: u1,
        usb_sts_ep6_rdy: u1,
        reserved20: u12,
    }),

    // 0x58
    ep7_config: mmio.Mmio(packed struct(u32) {
        usb_cr_ep7_size: u11,
        usb_cr_ep7_dir: u2,
        usb_cr_ep7_type: u3,
        usb_cr_ep7_stall: u1,
        usb_cr_ep7_nack: u1,
        usb_cr_ep7_rdy: u1,
        usb_sts_ep7_rdy: u1,
        reserved20: u12,
    }),

    padding92: [41]u32,
    // 0x100
    ep0_fifo_config: mmio.Mmio(packed struct(u32) {
        usb_ep0_dma_tx_en: u1,
        usb_ep0_dma_rx_en: u1,
        usb_ep0_tx_fifo_clr: u1,
        usb_ep0_rx_fifo_clr: u1,
        usb_ep0_tx_fifo_overflow: u1,
        usb_ep0_tx_fifo_underflow: u1,
        usb_ep0_rx_fifo_overflow: u1,
        usb_ep0_rx_fifo_underflow: u1,
        reserved8: u24,
    }),

    // 0x104
    ep0_fifo_status: mmio.Mmio(packed struct(u32) {
        usb_ep0_tx_fifo_cnt: u7,
        reserved7: u7,
        usb_ep0_tx_fifo_empty: u1,
        usb_ep0_tx_fifo_full: u1,
        usb_ep0_rx_fifo_cnt: u7,
        reserved23: u7,
        usb_ep0_rx_fifo_empty: u1,
        usb_ep0_rx_fifo_full: u1,
    }),

    // 0x108
    ep0_tx_fifo_wdata: mmio.Mmio(packed struct(u32) {
        usb_ep0_tx_fifo_wdata: u8,
        reserved8: u24,
    }),

    // 0x10c
    ep0_rx_fifo_rdata: mmio.Mmio(packed struct(u32) {
        usb_ep0_rx_fifo_rdata: u8,
        reserved8: u24,
    }),

    // 0x110
    ep1_fifo_config: mmio.Mmio(packed struct(u32) {
        usb_ep1_dma_tx_en: u1,
        usb_ep1_dma_rx_en: u1,
        usb_ep1_tx_fifo_clr: u1,
        usb_ep1_rx_fifo_clr: u1,
        usb_ep1_tx_fifo_overflow: u1,
        usb_ep1_tx_fifo_underflow: u1,
        usb_ep1_rx_fifo_overflow: u1,
        usb_ep1_rx_fifo_underflow: u1,
        reserved8: u24,
    }),

    // 0x114
    ep1_fifo_status: mmio.Mmio(packed struct(u32) {
        usb_ep1_tx_fifo_cnt: u7,
        reserved7: u7,
        usb_ep1_tx_fifo_empty: u1,
        usb_ep1_tx_fifo_full: u1,
        usb_ep1_rx_fifo_cnt: u7,
        reserved23: u7,
        usb_ep1_rx_fifo_empty: u1,
        usb_ep1_rx_fifo_full: u1,
    }),

    // 0x118
    ep1_tx_fifo_wdata: mmio.Mmio(packed struct(u32) {
        usb_ep1_tx_fifo_wdata: u8,
        reserved8: u24,
    }),

    // 0x11c
    ep1_rx_fifo_rdata: mmio.Mmio(packed struct(u32) {
        usb_ep1_rx_fifo_rdata: u8,
        reserved8: u24,
    }),

    // 0x120
    ep2_fifo_config: mmio.Mmio(packed struct(u32) {
        usb_ep2_dma_tx_en: u1,
        usb_ep2_dma_rx_en: u1,
        usb_ep2_tx_fifo_clr: u1,
        usb_ep2_rx_fifo_clr: u1,
        usb_ep2_tx_fifo_overflow: u1,
        usb_ep2_tx_fifo_underflow: u1,
        usb_ep2_rx_fifo_overflow: u1,
        usb_ep2_rx_fifo_underflow: u1,
        reserved8: u24,
    }),

    // 0x124
    ep2_fifo_status: mmio.Mmio(packed struct(u32) {
        usb_ep2_tx_fifo_cnt: u7,
        reserved7: u7,
        usb_ep2_tx_fifo_empty: u1,
        usb_ep2_tx_fifo_full: u1,
        usb_ep2_rx_fifo_cnt: u7,
        reserved23: u7,
        usb_ep2_rx_fifo_empty: u1,
        usb_ep2_rx_fifo_full: u1,
    }),

    // 0x128
    ep2_tx_fifo_wdata: mmio.Mmio(packed struct(u32) {
        usb_ep2_tx_fifo_wdata: u8,
        reserved8: u24,
    }),

    // 0x12c
    ep2_rx_fifo_rdata: mmio.Mmio(packed struct(u32) {
        usb_ep2_rx_fifo_rdata: u8,
        reserved8: u24,
    }),

    // 0x130
    ep3_fifo_config: mmio.Mmio(packed struct(u32) {
        usb_ep3_dma_tx_en: u1,
        usb_ep3_dma_rx_en: u1,
        usb_ep3_tx_fifo_clr: u1,
        usb_ep3_rx_fifo_clr: u1,
        usb_ep3_tx_fifo_overflow: u1,
        usb_ep3_tx_fifo_underflow: u1,
        usb_ep3_rx_fifo_overflow: u1,
        usb_ep3_rx_fifo_underflow: u1,
        reserved8: u24,
    }),

    // 0x134
    ep3_fifo_status: mmio.Mmio(packed struct(u32) {
        usb_ep3_tx_fifo_cnt: u7,
        reserved7: u7,
        usb_ep3_tx_fifo_empty: u1,
        usb_ep3_tx_fifo_full: u1,
        usb_ep3_rx_fifo_cnt: u7,
        reserved23: u7,
        usb_ep3_rx_fifo_empty: u1,
        usb_ep3_rx_fifo_full: u1,
    }),

    // 0x138
    ep3_tx_fifo_wdata: mmio.Mmio(packed struct(u32) {
        usb_ep3_tx_fifo_wdata: u8,
        reserved8: u24,
    }),

    // 0x13c
    ep3_rx_fifo_rdata: mmio.Mmio(packed struct(u32) {
        usb_ep3_rx_fifo_rdata: u8,
        reserved8: u24,
    }),

    // 0x140
    ep4_fifo_config: mmio.Mmio(packed struct(u32) {
        usb_ep4_dma_tx_en: u1,
        usb_ep4_dma_rx_en: u1,
        usb_ep4_tx_fifo_clr: u1,
        usb_ep4_rx_fifo_clr: u1,
        usb_ep4_tx_fifo_overflow: u1,
        usb_ep4_tx_fifo_underflow: u1,
        usb_ep4_rx_fifo_overflow: u1,
        usb_ep4_rx_fifo_underflow: u1,
        reserved8: u24,
    }),

    // 0x144
    ep4_fifo_status: mmio.Mmio(packed struct(u32) {
        usb_ep4_tx_fifo_cnt: u7,
        reserved7: u7,
        usb_ep4_tx_fifo_empty: u1,
        usb_ep4_tx_fifo_full: u1,
        usb_ep4_rx_fifo_cnt: u7,
        reserved23: u7,
        usb_ep4_rx_fifo_empty: u1,
        usb_ep4_rx_fifo_full: u1,
    }),

    // 0x148
    ep4_tx_fifo_wdata: mmio.Mmio(packed struct(u32) {
        usb_ep4_tx_fifo_wdata: u8,
        reserved8: u24,
    }),

    // 0x14c
    ep4_rx_fifo_rdata: mmio.Mmio(packed struct(u32) {
        usb_ep4_rx_fifo_rdata: u8,
        reserved8: u24,
    }),

    // 0x150
    ep5_fifo_config: mmio.Mmio(packed struct(u32) {
        usb_ep5_dma_tx_en: u1,
        usb_ep5_dma_rx_en: u1,
        usb_ep5_tx_fifo_clr: u1,
        usb_ep5_rx_fifo_clr: u1,
        usb_ep5_tx_fifo_overflow: u1,
        usb_ep5_tx_fifo_underflow: u1,
        usb_ep5_rx_fifo_overflow: u1,
        usb_ep5_rx_fifo_underflow: u1,
        reserved8: u24,
    }),

    // 0x154
    ep5_fifo_status: mmio.Mmio(packed struct(u32) {
        usb_ep5_tx_fifo_cnt: u7,
        reserved7: u7,
        usb_ep5_tx_fifo_empty: u1,
        usb_ep5_tx_fifo_full: u1,
        usb_ep5_rx_fifo_cnt: u7,
        reserved23: u7,
        usb_ep5_rx_fifo_empty: u1,
        usb_ep5_rx_fifo_full: u1,
    }),

    // 0x158
    ep5_tx_fifo_wdata: mmio.Mmio(packed struct(u32) {
        usb_ep5_tx_fifo_wdata: u8,
        reserved8: u24,
    }),

    // 0x15c
    ep5_rx_fifo_rdata: mmio.Mmio(packed struct(u32) {
        usb_ep5_rx_fifo_rdata: u8,
        reserved8: u24,
    }),

    // 0x160
    ep6_fifo_config: mmio.Mmio(packed struct(u32) {
        usb_ep6_dma_tx_en: u1,
        usb_ep6_dma_rx_en: u1,
        usb_ep6_tx_fifo_clr: u1,
        usb_ep6_rx_fifo_clr: u1,
        usb_ep6_tx_fifo_overflow: u1,
        usb_ep6_tx_fifo_underflow: u1,
        usb_ep6_rx_fifo_overflow: u1,
        usb_ep6_rx_fifo_underflow: u1,
        reserved8: u24,
    }),

    // 0x164
    ep6_fifo_status: mmio.Mmio(packed struct(u32) {
        usb_ep6_tx_fifo_cnt: u7,
        reserved7: u7,
        usb_ep6_tx_fifo_empty: u1,
        usb_ep6_tx_fifo_full: u1,
        usb_ep6_rx_fifo_cnt: u7,
        reserved23: u7,
        usb_ep6_rx_fifo_empty: u1,
        usb_ep6_rx_fifo_full: u1,
    }),

    // 0x168
    ep6_tx_fifo_wdata: mmio.Mmio(packed struct(u32) {
        usb_ep6_tx_fifo_wdata: u8,
        reserved8: u24,
    }),

    // 0x16c
    ep6_rx_fifo_rdata: mmio.Mmio(packed struct(u32) {
        usb_ep6_rx_fifo_rdata: u8,
        reserved8: u24,
    }),

    // 0x170
    ep7_fifo_config: mmio.Mmio(packed struct(u32) {
        usb_ep7_dma_tx_en: u1,
        usb_ep7_dma_rx_en: u1,
        usb_ep7_tx_fifo_clr: u1,
        usb_ep7_rx_fifo_clr: u1,
        usb_ep7_tx_fifo_overflow: u1,
        usb_ep7_tx_fifo_underflow: u1,
        usb_ep7_rx_fifo_overflow: u1,
        usb_ep7_rx_fifo_underflow: u1,
        reserved8: u24,
    }),

    // 0x174
    ep7_fifo_status: mmio.Mmio(packed struct(u32) {
        usb_ep7_tx_fifo_cnt: u7,
        reserved7: u7,
        usb_ep7_tx_fifo_empty: u1,
        usb_ep7_tx_fifo_full: u1,
        usb_ep7_rx_fifo_cnt: u7,
        reserved23: u7,
        usb_ep7_rx_fifo_empty: u1,
        usb_ep7_rx_fifo_full: u1,
    }),

    // 0x178
    ep7_tx_fifo_wdata: mmio.Mmio(packed struct(u32) {
        usb_ep7_tx_fifo_wdata: u8,
        reserved8: u24,
    }),

    // 0x17c
    ep7_rx_fifo_rdata: mmio.Mmio(packed struct(u32) {
        usb_ep7_rx_fifo_rdata: u8,
        reserved8: u24,
    }),

    padding384: [28]u32,
    // 0x1f0
    rsvd_0: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    // 0x1f4
    rsvd_1: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    padding504: [1]u32,
    // 0x1fc
    xcvr_if_config: mmio.Mmio(packed struct(u32) {
        usb_cr_xcvr_force_tx_en: u1,
        usb_cr_xcvr_force_tx_oe: u1,
        usb_cr_xcvr_force_tx_dp: u1,
        usb_cr_xcvr_force_tx_dn: u1,
        usb_cr_xcvr_force_rx_en: u1,
        usb_cr_xcvr_force_rx_d: u1,
        usb_cr_xcvr_force_rx_dp: u1,
        usb_cr_xcvr_force_rx_dn: u1,
        usb_cr_xcvr_om_rx_sel: u1,
        usb_cr_xcvr_om_rx_d: u1,
        usb_cr_xcvr_om_rx_dp: u1,
        usb_cr_xcvr_om_rx_dn: u1,
        reserved12: u19,
        usb_sts_vbus_det: u1,
    }),
};
