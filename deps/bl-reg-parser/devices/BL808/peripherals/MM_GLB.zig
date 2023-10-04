const mmio = @import("microzig").mmio;

pub const Type = extern struct {
    // 0x0
    mm_clk_ctrl_cpu: mmio.Mmio(packed struct(u32) {
        reg_pll_en: u1,
        reg_cpu_clk_en: u1,
        reg_bclk_en: u1,
        reg_mm_cpu_clk_en: u1,
        reg_uart_clk_sel: u2,
        reg_i2c_clk_sel: u1,
        reg_spi_clk_sel: u1,
        reg_cpu_clk_sel: u2,
        reg_xclk_clk_sel: u1,
        reg_cpu_root_clk_sel: u1,
        reg_mmcpu0_clk_en: u1,
        reg_bclk1x_sel: u2,
        reserved15: u3,
        reg_bclk2x_div_act_pulse: u1,
        reg_bclk2x_div_bypass: u1,
        sts_bclk2x_prot_done: u1,
        reserved21: u3,
        reg_bclk2x_sw_done_cnt: u4,
        cpu_clk_sw_state: u3,
        reserved31: u1,
    }),

    // 0x4
    mm_clk_cpu: mmio.Mmio(packed struct(u32) {
        reg_cpu_clk_div: u8,
        reg_cnn_clk_div_en: u1,
        reg_cnn_clk_sel: u2,
        reserved11: u1,
        reg_cnn_clk_div: u3,
        reserved15: u1,
        reg_bclk2x_div: u8,
        reg_bclk1x_div: u8,
    }),

    // 0x8
    dp_clk: mmio.Mmio(packed struct(u32) {
        reg_clk_div_en: u1,
        reg_clk_sel: u2,
        reserved3: u5,
        reg_clk_div: u8,
        reg_dp_clk_div_en: u1,
        reg_dp_clk_sel: u1,
        reserved18: u2,
        reg_dp_clk_div: u4,
        reserved24: u8,
    }),

    // 0xc
    codec_clk: mmio.Mmio(packed struct(u32) {
        reserved0: u8,
        reg_h264_clk_div_en: u1,
        reg_h264_clk_sel: u2,
        reserved11: u1,
        reg_h264_clk_div: u3,
        reserved15: u17,
    }),

    // 0x10
    mm_clk_ctrl_peri: mmio.Mmio(packed struct(u32) {
        reg_i2c0_clk_div: u8,
        reg_i2c0_clk_div_en: u1,
        reg_i2c0_clk_en: u1,
        reserved10: u6,
        reg_uart0_clk_div_en: u1,
        reg_uart0_clk_div: u3,
        reserved20: u3,
        reg_spi_clk_div_en: u1,
        reg_spi_clk_div: u8,
    }),

    padding20: [1]u32,
    // 0x18
    mm_clk_ctrl_peri3: mmio.Mmio(packed struct(u32) {
        reg_i2c1_clk_div: u8,
        reg_i2c1_clk_div_en: u1,
        reg_i2c1_clk_en: u1,
        reserved10: u6,
        reg_uart1_clk_div_en: u1,
        reg_uart1_clk_div: u3,
        reserved20: u12,
    }),

    padding28: [9]u32,
    // 0x40
    mm_sw_sys_reset: mmio.Mmio(packed struct(u32) {
        reg_ctrl_sys_reset: u1,
        reserved1: u1,
        reg_ctrl_pwron_rst: u1,
        reserved3: u5,
        reg_ctrl_mmcpu0_reset: u1,
        reserved9: u23,
    }),

    // 0x44
    sw_reset_mm_peri: mmio.Mmio(packed struct(u32) {
        swrst_mm_misc: u1,
        swrst_dma: u1,
        swrst_uart0: u1,
        swrst_i2c0: u1,
        swrst_i2c1: u1,
        swrst_ipc: u1,
        swrst_dma2d: u1,
        reserved7: u1,
        swrst_spi: u1,
        swrst_timer: u1,
        swrst_i2s0: u1,
        swrst_i2s1: u1,
        swrst_pdm0: u1,
        swrst_pdm1: u1,
        swrst_uart1: u1,
        swrst_puhs: u1,
        reserved16: u16,
    }),

    // 0x48
    sw_reset_sub: mmio.Mmio(packed struct(u32) {
        swrst_misc: u1,
        swrst_main: u1,
        swrst_tsrc: u1,
        swrst_dp_tsrc: u1,
        swrst_nr3d_ctrl: u1,
        swrst_dvp2busa: u1,
        swrst_dvp2busb: u1,
        swrst_dvp2busc: u1,
        swrst_dvp2busd: u1,
        swrst_mipi: u1,
        reserved10: u7,
        swrst_dvp2buse: u1,
        swrst_dvp2busf: u1,
        swrst_dvp2busg: u1,
        swrst_dvp2bush: u1,
        reserved21: u11,
    }),

    // 0x4c
    sw_reset_codec_sub: mmio.Mmio(packed struct(u32) {
        swrst_codec_misc: u1,
        swrst_mjpeg: u1,
        swrst_h264: u1,
        swrst_mjpeg_dec: u1,
        swrst_cnn: u1,
        reserved5: u11,
        swrst_vram: u1,
        reserved17: u15,
    }),

    // 0x50
    image_sensor_ctrl: mmio.Mmio(packed struct(u32) {
        rg_is_rst_n: u1,
        reserved1: u31,
    }),

    padding84: [3]u32,
    // 0x60
    tz_mm_clkrst: mmio.Mmio(packed struct(u32) {
        tzc_mm_swrst_lock: u1,
        tzc_mm_sys_reset_lock: u1,
        tzc_mm_pwron_rst_lock: u1,
        tzc_mm_cpu0_reset_lock: u1,
        tzc_mm_clk_lock: u1,
        reserved5: u27,
    }),
};
