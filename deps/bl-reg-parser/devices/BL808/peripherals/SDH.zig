const mmio = @import("microzig").mmio;

pub const Type = extern struct {
    // 0x0
    @"system address low register": mmio.Mmio(packed struct(u32) {
        dma_addr_l: u16,
        reserved16: u16,
    }),

    // 0x2
    @"system address high register": mmio.Mmio(packed struct(u32) {
        dma_addr_h: u16,
        reserved16: u16,
    }),

    // 0x4
    @"block size register": mmio.Mmio(packed struct(u32) {
        block_size: u12,
        host_dma_bdry: u3,
        reserved15: u17,
    }),

    // 0x6
    @"block count register": mmio.Mmio(packed struct(u32) {
        block_count: u16,
        reserved16: u16,
    }),

    // 0x8
    @"argument low register": mmio.Mmio(packed struct(u32) {
        arg_l: u16,
        reserved16: u16,
    }),

    // 0xa
    @"argument high register": mmio.Mmio(packed struct(u32) {
        arg_h: u16,
        reserved16: u16,
    }),

    // 0xc
    @"transfer mode register": mmio.Mmio(packed struct(u32) {
        dma_en: u1,
        blk_cnt_en: u1,
        auto_cmd_en: u2,
        to_host_dir: u1,
        multi_blk_sel: u1,
        reserved6: u26,
    }),

    // 0xe
    @"command register": mmio.Mmio(packed struct(u32) {
        resp_type: u2,
        reserved2: u1,
        cmd_crc_chk_en: u1,
        cmd_index_chk_en: u1,
        data_present: u1,
        cmd_type: u2,
        cmd_index: u6,
        reserved14: u18,
    }),

    // 0x10
    @"response register 0": mmio.Mmio(packed struct(u32) {
        resp0: u16,
        reserved16: u16,
    }),

    // 0x12
    @"response register 1": mmio.Mmio(packed struct(u32) {
        resp1: u16,
        reserved16: u16,
    }),

    // 0x14
    @"response register 2": mmio.Mmio(packed struct(u32) {
        resp2: u16,
        reserved16: u16,
    }),

    // 0x16
    @"response register 3": mmio.Mmio(packed struct(u32) {
        resp3: u16,
        reserved16: u16,
    }),

    // 0x18
    @"response register 4": mmio.Mmio(packed struct(u32) {
        resp4: u16,
        reserved16: u16,
    }),

    // 0x1a
    @"response register 5": mmio.Mmio(packed struct(u32) {
        resp5: u16,
        reserved16: u16,
    }),

    // 0x1c
    @"response register 6": mmio.Mmio(packed struct(u32) {
        resp6: u16,
        reserved16: u16,
    }),

    // 0x1e
    @"response register 7": mmio.Mmio(packed struct(u32) {
        resp7: u16,
        reserved16: u16,
    }),

    // 0x20
    @"buffer data port 0 register": mmio.Mmio(packed struct(u32) {
        cpu_data0: u16,
        reserved16: u16,
    }),

    // 0x22
    @"buffer data port 1 register": mmio.Mmio(packed struct(u32) {
        cpu_data1: u16,
        reserved16: u16,
    }),

    // 0x24
    @"present state register 1": mmio.Mmio(packed struct(u32) {
        cmd_inhibit_cmd: u1,
        cmd_inhibit_dat: u1,
        _dat_active: u1,
        retuning_req: u1,
        reserved4: u4,
        tx_active: u1,
        rx_active: u1,
        buffer_wr_en: u1,
        buffer_rd_en: u1,
        reserved12: u20,
    }),

    // 0x26
    @"present state register 2": mmio.Mmio(packed struct(u32) {
        card_inserted: u1,
        card_stable: u1,
        card_det: u1,
        write_prot: u1,
        dat_level: u4,
        cmd_level: u1,
        reserved9: u23,
    }),

    // 0x28
    @"host control register": mmio.Mmio(packed struct(u32) {
        led_ctrl: u1,
        data_width: u1,
        hi_speed_en: u1,
        dma_sel: u2,
        ex_data_width: u1,
        card_det_l: u1,
        card_det_s: u1,
        sd_bus_power: u1,
        sd_bus_vlt: u3,
        reserved12: u20,
    }),

    // 0x2a
    @"block gap control register": mmio.Mmio(packed struct(u32) {
        stop_at_block_gap_req: u1,
        cont_req: u1,
        rd_wait_ctl: u1,
        int_blk_gap: u1,
        reserved4: u4,
        w_card_int: u1,
        w_insertion: u1,
        w_removal: u1,
        reserved11: u21,
    }),

    // 0x2c
    @"clock control register": mmio.Mmio(packed struct(u32) {
        int_clk_en: u1,
        int_clk_stable: u1,
        sd_clk_en: u1,
        reserved3: u2,
        clk_gen_sel: u1,
        sd_freq_sel_hi: u2,
        sd_freq_sel_lo: u8,
        reserved16: u16,
    }),

    // 0x2e
    @"timeout control/software reset register": mmio.Mmio(packed struct(u32) {
        timeout_value: u4,
        reserved4: u4,
        sw_rst_all: u1,
        sw_rst_cmd: u1,
        sw_rst_dat: u1,
        reserved11: u21,
    }),

    // 0x30
    @"normal interrupt status register": mmio.Mmio(packed struct(u32) {
        cmd_complete: u1,
        xfer_complete: u1,
        block_gap_evt: u1,
        dma_int: u1,
        tx_rdy: u1,
        rx_rdy: u1,
        card_ins_int: u1,
        card_rem_int: u1,
        card_int: u1,
        int_a: u1,
        int_b: u1,
        int_c: u1,
        retuning_int: u1,
        reserved13: u2,
        err_int: u1,
        reserved16: u16,
    }),

    // 0x32
    @"error interrupt status register": mmio.Mmio(packed struct(u32) {
        cmd_timeout_err: u1,
        cmd_crc_err: u1,
        cmd_end_bit_err: u1,
        cmd_index_err: u1,
        data_timeout_err: u1,
        rd_data_crc_err: u1,
        rd_data_end_bit_err: u1,
        cur_limit_err: u1,
        auto_cmd12_err: u1,
        adma_err: u1,
        tune_err: u1,
        reserved11: u1,
        spi_err: u1,
        axi_resp_err: u1,
        cpl_timeout_err: u1,
        crc_status_err: u1,
        reserved16: u16,
    }),

    // 0x34
    @"normal interrupt status enable register": mmio.Mmio(packed struct(u32) {
        cmd_complete_en: u1,
        xfer_complete_en: u1,
        block_gap_evt_en: u1,
        dma_int_en: u1,
        tx_rdy_en: u1,
        rd_rdy_en: u1,
        card_ins_en: u1,
        card_rem_en: u1,
        card_int_en: u1,
        int_a_int_en: u1,
        int_b_int_en: u1,
        int_c_int_en: u1,
        retune_int_en: u1,
        reserved13: u19,
    }),

    // 0x36
    @"error interrupt status enable register": mmio.Mmio(packed struct(u32) {
        cmd_timeout_err_en: u1,
        cmd_crc_err_en: u1,
        cmd_end_bit_err_en: u1,
        cmd_index_err_en: u1,
        data_timeout_err_en: u1,
        rd_data_crc_err_en: u1,
        rd_data_end_bit_err_en: u1,
        cur_lim_err_en: u1,
        auto_cmd12_err_en: u1,
        adma_err_en: u1,
        tuning_err_en: u1,
        reserved11: u1,
        spi_err_en: u1,
        axi_resp_err_en: u1,
        cpl_timeout_err_en: u1,
        crc_status_err_en: u1,
        reserved16: u16,
    }),

    // 0x38
    @"normal interrupt status interrupt enable register": mmio.Mmio(packed struct(u32) {
        cmd_complete_int_en: u1,
        xfer_complete_int_en: u1,
        block_gap_evt_int_en: u1,
        dma_int_int_en: u1,
        tx_rdy_int_en: u1,
        rx_rdy_int_en: u1,
        card_ins_int_en: u1,
        card_rem_int_en: u1,
        card_int_int_en: u1,
        int_a_int_int_en: u1,
        int_b_int_int_en: u1,
        int_c_int_int_en: u1,
        retune_int_int_en: u1,
        reserved13: u19,
    }),

    // 0x3a
    @"error interrupt status interrupt enable register": mmio.Mmio(packed struct(u32) {
        cmd_timeout_err_int_en: u1,
        cmd_crc_err_int_en: u1,
        cmd_end_bit_err_int_en: u1,
        cmd_index_err_int_en: u1,
        data_timeout_err_int_en: u1,
        rd_data_crc_err_int_en: u1,
        rd_data_end_bit_err_int_en: u1,
        cur_lim_err_int_en: u1,
        auto_cmd12_err_int_en: u1,
        adma_err_int_en: u1,
        tune_err_int_en: u1,
        reserved11: u1,
        spi_err_int_en: u1,
        axi_resp_err_int_en: u1,
        cpl_timeout_err_int_en: u1,
        crc_status_err_int_en: u1,
        reserved16: u16,
    }),

    // 0x3c
    @"auto cmd12 error status register": mmio.Mmio(packed struct(u32) {
        auto_cmd12_not_exe: u1,
        auto_cmd_timeout_err: u1,
        auto_cmd_crc_err: u1,
        auto_cmd_end_bit_err: u1,
        auto_cmd_index_err: u1,
        reserved5: u2,
        cmd_not_issued: u1,
        reserved8: u24,
    }),

    // 0x3e
    @"host control 2 register": mmio.Mmio(packed struct(u32) {
        uhs_mode_sel: u3,
        sdh_v18_en: u1,
        drv_strength_sel: u2,
        exe_tuning: u1,
        sampling_clk_sel: u1,
        reserved8: u6,
        async_int_en: u1,
        pre_val_en: u1,
        reserved16: u16,
    }),

    // 0x40
    @"capabilities register 1": mmio.Mmio(packed struct(u32) {
        timeout_freq: u6,
        reserved6: u1,
        timeout_unit: u1,
        base_freq: u8,
        reserved16: u16,
    }),

    // 0x42
    @"capabilities register 2": mmio.Mmio(packed struct(u32) {
        max_blk_len: u2,
        ex_data_width_support: u1,
        adma2_support: u1,
        adma1_support: u1,
        hi_speed_support: u1,
        sdma_support: u1,
        sus_res_support: u1,
        vlg_33_support: u1,
        vlg_30_support: u1,
        vlg_18_support: u1,
        reserved11: u1,
        sys_bus_64_support: u1,
        async_int_support: u1,
        cfg_slot_type: u2,
        reserved16: u16,
    }),

    // 0x44
    @"capabilities register 3": mmio.Mmio(packed struct(u32) {
        sdr50_support: u1,
        sdr104_support: u1,
        ddr50_support: u1,
        reserved3: u1,
        drv_type_a: u1,
        drv_type_c: u1,
        drv_type_d: u1,
        reserved7: u1,
        tmr_retune: u4,
        reserved12: u1,
        sdr50_tune: u1,
        retune_modes: u2,
        reserved16: u16,
    }),

    // 0x46
    @"capabilities register 4": mmio.Mmio(packed struct(u32) {
        clk_multiplier: u8,
        reserved8: u24,
    }),

    // 0x48
    @"maximum current register 1": mmio.Mmio(packed struct(u32) {
        max_cur_33: u8,
        max_cur_30: u8,
        reserved16: u16,
    }),

    // 0x4a
    @"maximum current register 2": mmio.Mmio(packed struct(u32) {
        max_cur_18: u8,
        reserved8: u24,
    }),

    // 0x4c
    @"maximum current register 3": mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    // 0x4e
    @"maximum current register 4": mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    // 0x50
    @"force event auto cmd12 error register": mmio.Mmio(packed struct(u32) {
        f_acmd12_nexe_err: u1,
        f_acmd_to_err: u1,
        f_acmd_crc_err: u1,
        f__acmd_ebit_err: u1,
        f_acmd_index_err: u1,
        reserved5: u2,
        f_acmd12_issue_err: u1,
        reserved8: u24,
    }),

    // 0x52
    @"force event for error status register": mmio.Mmio(packed struct(u32) {
        f_cmd_to_err: u1,
        f_cmd_crc_err: u1,
        f_cmd_end_bit_err: u1,
        f_cmd_index_err: u1,
        f_dat_to_err: u1,
        f_dat_crc_err: u1,
        f_dat_end_bit_err: u1,
        f_current_err: u1,
        f_acmd12_err: u1,
        f_adma_err: u1,
        reserved10: u2,
        f_spi_err: u1,
        f_axi_resp_err: u1,
        f_cpl_timeout_err: u1,
        f_crc_status_err: u1,
        reserved16: u16,
    }),

    // 0x54
    @"adma error status register": mmio.Mmio(packed struct(u32) {
        adma_state: u2,
        adma_len_err: u1,
        reserved3: u29,
    }),

    // 0x58
    @"adma system address register 1": mmio.Mmio(packed struct(u32) {
        adma_sys_addr: u16,
        reserved16: u16,
    }),

    // 0x5a
    @"adma system address register 2": mmio.Mmio(packed struct(u32) {
        adma_sys_addr: u16,
        reserved16: u16,
    }),

    // 0x5c
    @"adma system address register 3": mmio.Mmio(packed struct(u32) {
        adma_sys_addr: u16,
        reserved16: u16,
    }),

    // 0x5e
    @"adma system address register 4": mmio.Mmio(packed struct(u32) {
        adma_sys_addr: u16,
        reserved16: u16,
    }),

    // 0x60
    @"preset value register for initialization": mmio.Mmio(packed struct(u32) {
        sdclk_freq_sel_val: u10,
        clkgen_sel_val: u1,
        reserved11: u3,
        drv_strength_val: u2,
        reserved16: u16,
    }),

    // 0x62
    @"preset value register for default speed": mmio.Mmio(packed struct(u32) {
        sdclk_freq_sel_val: u10,
        clkgen_sel_val: u1,
        reserved11: u3,
        drv_strength_val: u2,
        reserved16: u16,
    }),

    // 0x64
    @"preset value register for high speed": mmio.Mmio(packed struct(u32) {
        sdclk_freq_sel_val: u10,
        clkgen_sel_val: u1,
        reserved11: u3,
        drv_strength_val: u2,
        reserved16: u16,
    }),

    // 0x66
    @"preset value register for sdr12": mmio.Mmio(packed struct(u32) {
        sdclk_freq_sel_val: u10,
        clkgen_sel_val: u1,
        reserved11: u3,
        drv_strength_val: u2,
        reserved16: u16,
    }),

    // 0x68
    @"preset value register for sdr25": mmio.Mmio(packed struct(u32) {
        sdclk_freq_sel_val: u10,
        clkgen_sel_val: u1,
        reserved11: u3,
        drv_strength_val: u2,
        reserved16: u16,
    }),

    // 0x6a
    @"preset value register for sdr50": mmio.Mmio(packed struct(u32) {
        sdclk_freq_sel_val: u10,
        clkgen_sel_val: u1,
        reserved11: u3,
        drv_strength_val: u2,
        reserved16: u16,
    }),

    // 0x6c
    @"preset value register for sdr104": mmio.Mmio(packed struct(u32) {
        sdclk_freq_sel_val: u10,
        clkgen_sel_val: u1,
        reserved11: u3,
        drv_strength_val: u2,
        reserved16: u16,
    }),

    // 0x6e
    @"preset value register for ddr50": mmio.Mmio(packed struct(u32) {
        sdclk_freq_sel_val: u10,
        clkgen_sel_val: u1,
        reserved11: u3,
        drv_strength_val: u2,
        reserved16: u16,
    }),

    padding114: [27]u32,
    // 0xe0
    @"shared bus control register": mmio.Mmio(packed struct(u32) {
        num_clk_pins: u3,
        reserved3: u1,
        num_int_pins: u2,
        reserved6: u2,
        bus_width_preset: u7,
        reserved15: u1,
        clk_pin_sel: u3,
        reserved19: u1,
        int_pin_sel: u3,
        reserved23: u1,
        bend_pwr_ctrl: u7,
        reserved31: u1,
    }),

    padding228: [6]u32,
    // 0xfc
    @"slot interrupt status register": mmio.Mmio(packed struct(u32) {
        slot_int0: u1,
        slot_int1: u1,
        reserved2: u30,
    }),

    // 0xfe
    @"host control version register": mmio.Mmio(packed struct(u32) {
        sd_ver: u8,
        vendor_ver: u8,
        reserved16: u16,
    }),

    // 0x100
    @"sd extra parameters register": mmio.Mmio(packed struct(u32) {
        reserved0: u3,
        boot_ack: u1,
        squ_empty_chk: u1,
        squ_full_chk: u1,
        gen_pad_clk_on: u1,
        reserved7: u17,
        gen_pad_clk_cnt: u8,
    }),

    // 0x104
    @"fifo parameters register": mmio.Mmio(packed struct(u32) {
        rtc: u2,
        wtc: u2,
        fifo_clk: u1,
        fifo_cs: u1,
        pdwn: u1,
        use_dat3: u1,
        clk_gate_ctl: u1,
        clk_gate_on: u1,
        reserved10: u1,
        ovrrd_clk_oen: u1,
        force_clk_on: u1,
        pdfvssm: u1,
        pdlvmc: u1,
        reserved15: u1,
        pre_gate_clk_cnt: u4,
        reserved20: u12,
    }),

    // 0x108
    @"spi mode register": mmio.Mmio(packed struct(u32) {
        spi_en: u1,
        reserved1: u7,
        spi_err_token: u5,
        reserved13: u19,
    }),

    // 0x10a
    @"clock and burst size setup register": mmio.Mmio(packed struct(u32) {
        brst_size: u2,
        dma_size: u2,
        priority: u1,
        axi_non_post_wr: u1,
        rd_endian: u1,
        wr_endian: u1,
        reserved8: u6,
        rd_ostdg: u1,
        wr_ostdg: u1,
        reserved16: u16,
    }),

    // 0x10c
    @"ce-ata register 1": mmio.Mmio(packed struct(u32) {
        cpl_timeout: u14,
        reserved14: u18,
    }),

    // 0x10e
    @"ce-ata register 2": mmio.Mmio(packed struct(u32) {
        misc_int_int_en: u1,
        misc_int_en: u1,
        misc_int: u1,
        reserved3: u1,
        cpl_complete_int_en: u1,
        cpl_complete_en: u1,
        cpl_complete: u1,
        reserved7: u4,
        mmc_resetn: u1,
        mmc_card: u1,
        ceata_card: u1,
        snd_cpl: u1,
        chk_cpl: u1,
        reserved16: u16,
    }),

    // 0x110
    @"pad i/o setup register": mmio.Mmio(packed struct(u32) {
        async_io_en: u1,
        inand_sel: u1,
        reserved2: u14,
        eco_reg: u8,
        reserved24: u8,
    }),

    // 0x114
    @"rx configuration register": mmio.Mmio(packed struct(u32) {
        sdclk_sel0: u2,
        sdclk_sel1: u2,
        reserved4: u4,
        sdclk_delay: u10,
        tuning_dly_inc: u10,
        reserved28: u4,
    }),

    // 0x118
    @"tx configuration register": mmio.Mmio(packed struct(u32) {
        tx_hold_delay0: u10,
        reserved10: u6,
        tx_hold_delay1: u10,
        reserved26: u4,
        tx_int_clk_sel: u1,
        tx_mux_sel: u1,
    }),

    // 0x11c
    @"tuning config register": mmio.Mmio(packed struct(u32) {
        tuning_tt_cnt: u8,
        tuning_wd_cnt: u6,
        tuning_clk_dly: u10,
        tuning_success_cnt: u6,
        reserved30: u2,
    }),
};
