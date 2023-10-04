const mmio = @import("microzig").mmio;

pub const Type = extern struct {
    padding0: [561]u32,
    // 0x8c4
    gpio_cfg0: mmio.Mmio(packed struct(u32) {
        glb_reg_gpio_0_ie: u1,
        glb_reg_gpio_0_smt: u1,
        glb_reg_gpio_0_drv: u2,
        glb_reg_gpio_0_pu: u1,
        glb_reg_gpio_0_pd: u1,
        glb_reg_gpio_0_oe: u1,
        reserved7: u1,
        glb_reg_gpio_0_func_sel: u5,
        reserved13: u3,
        glb_reg_gpio_0_int_mode_set: u4,
        glb_reg_gpio_0_int_clr: u1,
        glb_gpio_0_int_stat: u1,
        glb_reg_gpio_0_int_mask: u1,
        reserved23: u1,
        glb_reg_gpio_0_o: u1,
        glb_reg_gpio_0_set: u1,
        glb_reg_gpio_0_clr: u1,
        reserved27: u1,
        glb_reg_gpio_0_i: u1,
        reserved29: u1,
        glb_reg_gpio_0_mode: u2,
    }),

    padding2248: [141]u32,
    // 0xafc
    gpio_cfg142: mmio.Mmio(packed struct(u32) {
        glb_cr_gpio_tx_en: u1,
        glb_cr_invert_code0_high: u1,
        glb_cr_invert_code1_high: u1,
        glb_cr_core_gpio_ls1p8: u3,
        reserved6: u1,
        glb_cr_code_total_time: u9,
        glb_cr_code0_high_time: u8,
        glb_cr_code1_high_time: u8,
    }),

    // 0xb00
    gpio_cfg143: mmio.Mmio(packed struct(u32) {
        glb_cr_gpio_dma_tx_en: u1,
        glb_cr_gpio_dma_out_sel_latch: u1,
        glb_gpio_tx_fifo_clr: u1,
        glb_gpio_tx_end_clr: u1,
        glb_gpio_tx_fifo_overflow: u1,
        glb_gpio_tx_fifo_underflow: u1,
        reserved6: u1,
        glb_cr_gpio_dma_park_value: u1,
        glb_gpio_tx_fifo_cnt: u8,
        glb_cr_gpio_tx_fifo_th: u7,
        glb_cr_gpio_tx_end_mask: u1,
        glb_cr_gpio_tx_fifo_mask: u1,
        glb_cr_gpio_tx_fer_mask: u1,
        glb_r_gpio_tx_end_int: u1,
        glb_r_gpio_tx_fifo_int: u1,
        glb_r_gpio_tx_fer_int: u1,
        glb_cr_gpio_tx_end_en: u1,
        glb_cr_gpio_tx_fifo_en: u1,
        glb_cr_gpio_tx_fer_en: u1,
    }),

    // 0xb04
    gpio_cfg144: mmio.Mmio(packed struct(u32) {
        glb_gpio_tx_data_to_fifo: u16,
        reserved16: u16,
    }),
};
