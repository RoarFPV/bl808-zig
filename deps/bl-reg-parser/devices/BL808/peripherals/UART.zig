const mmio = @import("microzig").mmio;

pub const Type = extern struct {
    // 0x0
    utx_config: mmio.Mmio(packed struct(u32) {
        cr_utx_en: u1,
        cr_utx_cts_en: u1,
        cr_utx_frm_en: u1,
        cr_utx_lin_en: u1,
        cr_utx_prt_en: u1,
        cr_utx_prt_sel: u1,
        cr_utx_ir_en: u1,
        cr_utx_ir_inv: u1,
        cr_utx_bit_cnt_d: u3,
        cr_utx_bit_cnt_p: u2,
        cr_utx_bit_cnt_b: u3,
        cr_utx_len: u16,
    }),

    // 0x4
    urx_config: mmio.Mmio(packed struct(u32) {
        cr_urx_en: u1,
        cr_urx_abr_en: u1,
        reserved2: u1,
        cr_urx_lin_en: u1,
        cr_urx_prt_en: u1,
        cr_urx_prt_sel: u1,
        cr_urx_ir_en: u1,
        cr_urx_ir_inv: u1,
        cr_urx_bit_cnt_d: u3,
        cr_urx_deg_en: u1,
        cr_urx_deg_cnt: u4,
        cr_urx_len: u16,
    }),

    // 0x8
    uart_bit_prd: mmio.Mmio(packed struct(u32) {
        cr_utx_bit_prd: u16,
        cr_urx_bit_prd: u16,
    }),

    // 0xc
    data_config: mmio.Mmio(packed struct(u32) {
        cr_uart_bit_inv: u1,
        reserved1: u31,
    }),

    // 0x10
    utx_ir_position: mmio.Mmio(packed struct(u32) {
        cr_utx_ir_pos_s: u16,
        cr_utx_ir_pos_p: u16,
    }),

    // 0x14
    urx_ir_position: mmio.Mmio(packed struct(u32) {
        cr_urx_ir_pos_s: u16,
        reserved16: u16,
    }),

    // 0x18
    urx_rto_timer: mmio.Mmio(packed struct(u32) {
        cr_urx_rto_value: u8,
        reserved8: u24,
    }),

    // 0x1c
    uart_sw_mode: mmio.Mmio(packed struct(u32) {
        cr_utx_txd_sw_mode: u1,
        cr_utx_txd_sw_val: u1,
        cr_urx_rts_sw_mode: u1,
        cr_urx_rts_sw_val: u1,
        reserved4: u28,
    }),

    // 0x20
    int_sts: mmio.Mmio(packed struct(u32) {
        utx_end_int: u1,
        urx_end_int: u1,
        utx_fifo_int: u1,
        urx_fifo_int: u1,
        urx_rto_int: u1,
        urx_pce_int: u1,
        utx_fer_int: u1,
        urx_fer_int: u1,
        urx_lse_int: u1,
        urx_bcr_int: u1,
        urx_ads_int: u1,
        urx_ad5_int: u1,
        reserved12: u20,
    }),

    // 0x24
    int_mask: mmio.Mmio(packed struct(u32) {
        cr_utx_end_mask: u1,
        cr_urx_end_mask: u1,
        cr_utx_fifo_mask: u1,
        cr_urx_fifo_mask: u1,
        cr_urx_rto_mask: u1,
        cr_urx_pce_mask: u1,
        cr_utx_fer_mask: u1,
        cr_urx_fer_mask: u1,
        cr_urx_lse_mask: u1,
        cr_urx_bcr_mask: u1,
        cr_urx_ads_mask: u1,
        cr_urx_ad5_mask: u1,
        reserved12: u20,
    }),

    // 0x28
    int_clear: mmio.Mmio(packed struct(u32) {
        cr_utx_end_clr: u1,
        cr_urx_end_clr: u1,
        reserved2: u2,
        cr_urx_rto_clr: u1,
        cr_urx_pce_clr: u1,
        reserved6: u2,
        cr_urx_lse_clr: u1,
        cr_urx_bcr_clr: u1,
        cr_urx_ads_clr: u1,
        cr_urx_ad5_clr: u1,
        reserved12: u20,
    }),

    // 0x2c
    int_en: mmio.Mmio(packed struct(u32) {
        cr_utx_end_en: u1,
        cr_urx_end_en: u1,
        cr_utx_fifo_en: u1,
        cr_urx_fifo_en: u1,
        cr_urx_rto_en: u1,
        cr_urx_pce_en: u1,
        cr_utx_fer_en: u1,
        cr_urx_fer_en: u1,
        cr_urx_lse_en: u1,
        cr_urx_bcr_en: u1,
        cr_urx_ads_en: u1,
        cr_urx_ad5_en: u1,
        reserved12: u20,
    }),

    // 0x30
    uart_status: mmio.Mmio(packed struct(u32) {
        sts_utx_bus_busy: u1,
        sts_urx_bus_busy: u1,
        reserved2: u30,
    }),

    // 0x34
    sts_urx_abr_prd: mmio.Mmio(packed struct(u32) {
        sts_urx_abr_prd_start: u16,
        sts_urx_abr_prd_0x55: u16,
    }),

    // 0x38
    urx_abr_prd_b01: mmio.Mmio(packed struct(u32) {
        sts_urx_abr_prd_bit0: u16,
        sts_urx_abr_prd_bit1: u16,
    }),

    // 0x3c
    urx_abr_prd_b23: mmio.Mmio(packed struct(u32) {
        sts_urx_abr_prd_bit2: u16,
        sts_urx_abr_prd_bit3: u16,
    }),

    // 0x40
    urx_abr_prd_b45: mmio.Mmio(packed struct(u32) {
        sts_urx_abr_prd_bit4: u16,
        sts_urx_abr_prd_bit5: u16,
    }),

    // 0x44
    urx_abr_prd_b67: mmio.Mmio(packed struct(u32) {
        sts_urx_abr_prd_bit6: u16,
        sts_urx_abr_prd_bit7: u16,
    }),

    // 0x48
    urx_abr_pw_tol: mmio.Mmio(packed struct(u32) {
        cr_urx_abr_pw_tol: u8,
        reserved8: u24,
    }),

    padding76: [1]u32,
    // 0x50
    urx_bcr_int_cfg: mmio.Mmio(packed struct(u32) {
        cr_urx_bcr_value: u16,
        sts_urx_bcr_count: u16,
    }),

    // 0x54
    utx_rs485_cfg: mmio.Mmio(packed struct(u32) {
        cr_utx_rs485_en: u1,
        cr_utx_rs485_pol: u1,
        reserved2: u30,
    }),

    padding88: [10]u32,
    // 0x80
    uart_fifo_config_0: mmio.Mmio(packed struct(u32) {
        dma_tx_en: u1,
        dma_rx_en: u1,
        tx_fifo_clr: u1,
        rx_fifo_clr: u1,
        tx_fifo_overflow: u1,
        tx_fifo_underflow: u1,
        rx_fifo_overflow: u1,
        rx_fifo_underflow: u1,
        reserved8: u24,
    }),

    // 0x84
    uart_fifo_config_1: mmio.Mmio(packed struct(u32) {
        tx_fifo_cnt: u6,
        reserved6: u2,
        rx_fifo_cnt: u6,
        reserved14: u2,
        tx_fifo_th: u5,
        reserved21: u3,
        rx_fifo_th: u5,
        reserved29: u3,
    }),

    // 0x88
    uart_fifo_wdata: mmio.Mmio(packed struct(u32) {
        fifo_wdata: u8,
        reserved8: u24,
    }),

    // 0x8c
    uart_fifo_rdata: mmio.Mmio(packed struct(u32) {
        fifo_rdata: u8,
        reserved8: u24,
    }),
};
