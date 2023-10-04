const mmio = @import("microzig").mmio;

pub const Type = extern struct {
    // 0x0
    HCCAP: mmio.Mmio(packed struct(u32) {
        usb_caplength: u8,
        reserved8: u8,
        usb_hciversion: u16,
    }),

    // 0x4
    HCSPARAMS: mmio.Mmio(packed struct(u32) {
        usb_n_ports: u4,
        reserved4: u28,
    }),

    // 0x8
    HCCPARAMS: mmio.Mmio(packed struct(u32) {
        reserved0: u1,
        usb_prog_fr_list_flag: u1,
        usb_asyn_sch_park_cap: u1,
        reserved3: u29,
    }),

    padding12: [1]u32,
    // 0x10
    USBCMD: mmio.Mmio(packed struct(u32) {
        usb_rs: u1,
        usb_hc_reset: u1,
        usb_frl_size: u2,
        usb_psch_en: u1,
        usb_asch_en: u1,
        usb_int_oaad: u1,
        reserved7: u1,
        usb_asyn_pk_cnt: u2,
        reserved10: u1,
        usb_asyn_pk_en: u1,
        reserved12: u4,
        usb_int_thrc: u8,
        reserved24: u8,
    }),

    // 0x14
    USBSTS: mmio.Mmio(packed struct(u32) {
        usb_int: u1,
        usberr_int: u1,
        usb_po_chg_det: u1,
        usb_frl_rol: u1,
        usb_h_syserr: u1,
        usb_int_oaa: u1,
        reserved6: u6,
        usb_hchalted: u1,
        usb_reclamation: u1,
        usb_psch_sts: u1,
        usb_asch_sts: u1,
        reserved16: u16,
    }),

    // 0x18
    USBINTR: mmio.Mmio(packed struct(u32) {
        usb_int_en: u1,
        usberr_int_en: u1,
        usb_po_chg_int_en: u1,
        usb_frl_rol_en: u1,
        usb_h_syserr_en: u1,
        usb_int_oaa_en: u1,
        reserved6: u26,
    }),

    // 0x1c
    FRINDEX: mmio.Mmio(packed struct(u32) {
        usb_frindex: u14,
        reserved14: u18,
    }),

    padding32: [1]u32,
    // 0x24
    PERIODICLISTBASE: mmio.Mmio(packed struct(u32) {
        reserved0: u12,
        usb_peri_basadr: u20,
    }),

    // 0x28
    ASYNCLISTADDR: mmio.Mmio(packed struct(u32) {
        reserved0: u5,
        usb_async_ladr: u23,
        reserved28: u4,
    }),

    padding44: [1]u32,
    // 0x30
    PORTSC: mmio.Mmio(packed struct(u32) {
        usb_conn_sts: u1,
        usb_conn_chg: u1,
        usb_po_en: u1,
        usb_po_en_chg: u1,
        reserved4: u2,
        usb_f_po_resm: u1,
        usb_po_susp: u1,
        usb_po_reset: u1,
        reserved9: u1,
        usb_line_sts: u2,
        reserved12: u4,
        usb_port_test: u4,
        usb_hc_tst_pkdone: u1,
        reserved21: u11,
    }),

    padding52: [3]u32,
    // 0x40
    HCMISC: mmio.Mmio(packed struct(u32) {
        usb_asyn_sch_slpt: u2,
        usb_eof1_time: u2,
        usb_eof2_time: u2,
        usb_hostphy_suspend: u1,
        reserved7: u1,
        usb_hc_wkp_det_en: u1,
        usb_hc_conn_det_en: u1,
        reserved10: u22,
    }),

    // 0x44
    FS_EOF: mmio.Mmio(packed struct(u32) {
        usb_fs_eof1_time: u12,
        usb_fs_eof1_time_125us: u3,
        reserved15: u1,
        usb_itddmasm: u4,
        usb_itdtravsm: u2,
        usb_dmadmsm: u4,
        usb_qhttrsm: u3,
        usb_qhtravsm: u3,
    }),

    // 0x48
    HS_EOF: mmio.Mmio(packed struct(u32) {
        usb_hs_eof1_time: u12,
        usb_fs_eof1_time_125us: u3,
        reserved15: u1,
        usb_sitddmasm: u4,
        usb_sitdtravsm: u2,
        reserved22: u10,
    }),

    padding76: [13]u32,
    // 0x80
    OTG_CSR: mmio.Mmio(packed struct(u32) {
        usb_b_bus_req: u1,
        usb_b_hnp_en: u1,
        usb_b_dschrg_vbus: u1,
        reserved3: u1,
        usb_a_bus_req_hov: u1,
        usb_a_bus_drop_hov: u1,
        usb_a_set_b_hnp_en: u1,
        usb_a_srp_det_en: u1,
        usb_a_srp_resp_typ: u1,
        usb_id_flt_sel: u1,
        usb_vbus_flt_sel_hov_pov: u1,
        usb_hdiscon_flt_sel_hov: u1,
        reserved12: u1,
        usb_idpulup_hov_pov: u1,
        reserved14: u2,
        usb_b_sess_end_pov: u1,
        usb_b_sess_vld_pov: u1,
        usb_a_sess_vld: u1,
        usb_vbus_vld_hov: u1,
        usb_crole_hov_pov: u1,
        usb_id_hov_pov: u1,
        usb_spd_typ_hov_pov: u2,
        reserved24: u8,
    }),

    // 0x84
    OTG_ISR: mmio.Mmio(packed struct(u32) {
        usb_b_srp_dn: u1,
        reserved1: u3,
        usb_a_srp_det: u1,
        usb_a_vbus_err_hov: u1,
        usb_b_sess_end_int_pov: u1,
        reserved7: u1,
        usb_rlchg: u1,
        usb_idchg: u1,
        usb_ovc_hov: u1,
        usb_a_wait_con_hov: u1,
        usb_aplgrmv: u1,
        reserved13: u19,
    }),

    // 0x88
    OTG_IER: mmio.Mmio(packed struct(u32) {
        usb_b_srp_dn_en: u1,
        reserved1: u3,
        usb_a_srp_det_int_en: u1,
        usb_a_vbus_err_en_hov: u1,
        usb_b_sess_end_en_pov: u1,
        reserved7: u1,
        usb_rlchg_en: u1,
        usb_idchg_en: u1,
        usb_ovc_en_hov: u1,
        usb_a_wait_con_en_hov: u1,
        usb_aplgrmv_en: u1,
        reserved13: u19,
    }),

    padding140: [13]u32,
    // 0xc0
    GLB_ISR: mmio.Mmio(packed struct(u32) {
        usb_dev_int: u1,
        usb_otg_int: u1,
        usb_hc_int: u1,
        reserved3: u29,
    }),

    // 0xc4
    GLB_INT: mmio.Mmio(packed struct(u32) {
        usb_mdev_int: u1,
        usb_motg_int: u1,
        usb_mhc_int: u1,
        reserved3: u29,
    }),

    padding200: [6]u32,
    // 0xe0
    REVISION: mmio.Mmio(packed struct(u32) {
        usb_revision: u32,
    }),

    // 0xe4
    FEATURE: mmio.Mmio(packed struct(u32) {
        usb_dmabufsize: u5,
        usb_fifo_num: u5,
        usb_ep_num: u5,
        usb_dev_only: u1,
        usb_host_only: u1,
        reserved17: u15,
    }),

    // 0xe8
    AXI_CR: mmio.Mmio(packed struct(u32) {
        usb_axi_sglbst: u1,
        reserved1: u31,
    }),

    padding236: [5]u32,
    // 0x100
    DEV_CTL: mmio.Mmio(packed struct(u32) {
        usb_cap_rmwakup: u1,
        usb_half_speed_hov: u1,
        usb_glint_en_hov: u1,
        usb_gosusp: u1,
        usb_sfrst_hov: u1,
        usb_chip_en_hov: u1,
        usb_hs_en_hov: u1,
        usb_sysbus_width_hov: u1,
        reserved8: u1,
        usb_force_fs: u1,
        usb_idle_deglitch_hov: u1,
        reserved11: u1,
        usb_lpm_besl_max: u4,
        usb_lpm_besl_min: u4,
        usb_lpm_besl: u4,
        reserved24: u1,
        usb_lpm_en: u1,
        usb_lpm_accept: u1,
        reserved27: u5,
    }),

    // 0x104
    DEV_ADR: mmio.Mmio(packed struct(u32) {
        usb_devadr: u7,
        usb_aft_conf: u1,
        reserved8: u24,
    }),

    // 0x108
    DEV_TST: mmio.Mmio(packed struct(u32) {
        usb_tst_clrff_hov: u1,
        usb_tst_lpcx: u1,
        usb_tst_clrea: u1,
        reserved3: u1,
        usb_tst_disto_hov: u1,
        usb_tst_mod_hov: u1,
        usb_disgensof: u1,
        usb_tst_mod_typ_hov: u1,
        reserved8: u24,
    }),

    // 0x10c
    DEV_SFN: mmio.Mmio(packed struct(u32) {
        usb_sofn: u11,
        usb_usofn: u3,
        reserved14: u18,
    }),

    // 0x110
    DEV_SMT: mmio.Mmio(packed struct(u32) {
        usb_sofmt: u16,
        reserved16: u16,
    }),

    // 0x114
    PHY_TST: mmio.Mmio(packed struct(u32) {
        usb_unplug: u1,
        usb_tst_jsta: u1,
        usb_tst_ksta: u1,
        usb_tst_se0nak: u1,
        usb_tst_pkt: u1,
        reserved5: u27,
    }),

    padding280: [1]u32,
    // 0x11c
    DEV_CXCFG: mmio.Mmio(packed struct(u32) {
        usb_vsta_hov: u8,
        reserved8: u24,
    }),

    // 0x120
    DEV_CXCFE: mmio.Mmio(packed struct(u32) {
        usb_cx_done: u1,
        usb_tst_pkdone: u1,
        usb_cx_stl: u1,
        usb_cx_clr: u1,
        usb_cx_ful: u1,
        usb_cx_emp: u1,
        reserved6: u2,
        usb_f0_emp: u1,
        usb_f1_emp: u1,
        usb_f2_emp: u1,
        usb_f3_emp: u1,
        reserved12: u20,
    }),

    // 0x124
    DEV_ICR: mmio.Mmio(packed struct(u32) {
        usb_idle_cnt: u3,
        reserved3: u29,
    }),

    padding296: [2]u32,
    // 0x130
    DEV_MIGR: mmio.Mmio(packed struct(u32) {
        usb_mint_g0: u1,
        usb_mint_g1: u1,
        usb_mint_g2: u1,
        usb_mint_g3: u1,
        usb_mint_g4: u1,
        reserved5: u27,
    }),

    // 0x134
    DEV_MISG0: mmio.Mmio(packed struct(u32) {
        usb_mcx_setup_int: u1,
        usb_mcx_in_int: u1,
        usb_mcx_out_int: u1,
        reserved3: u1,
        usb_mcx_comfail_int: u1,
        usb_mcx_comabort_int: u1,
        reserved6: u26,
    }),

    // 0x138
    DEV_MISG1: mmio.Mmio(packed struct(u32) {
        usb_mf0_out_int: u1,
        usb_mf0_spk_int: u1,
        usb_mf1_out_int: u1,
        usb_mf1_spk_int: u1,
        usb_mf2_out_int: u1,
        usb_mf2_spk_int: u1,
        usb_mf3_out_int: u1,
        usb_mf3_spk_int: u1,
        reserved8: u8,
        usb_mf0_in_int: u1,
        usb_mf1_in_int: u1,
        usb_mf2_in_int: u1,
        usb_mf3_in_int: u1,
        reserved20: u12,
    }),

    // 0x13c
    DEV_MISG2: mmio.Mmio(packed struct(u32) {
        usb_musbrst_int: u1,
        usb_msusp_int: u1,
        usb_mresm_int: u1,
        usb_mseq_err_int: u1,
        usb_mseq_abort_int: u1,
        usb_mtx0byte_int: u1,
        usb_mrx0byte_int: u1,
        usb_mdma_cmplt_hov: u1,
        usb_mdma_error_hov: u1,
        usb_mdev_idle_hov: u1,
        usb_mdev_wakeup_byvbus: u1,
        reserved11: u21,
    }),

    // 0x140
    DEV_IGR: mmio.Mmio(packed struct(u32) {
        usb_int_g0: u1,
        usb_int_g1: u1,
        usb_int_g2: u1,
        usb_int_g3: u1,
        usb_int_g4: u1,
        reserved5: u27,
    }),

    // 0x144
    DEV_ISG0: mmio.Mmio(packed struct(u32) {
        usb_cx_setup_int: u1,
        usb_cx_in_int: u1,
        usb_cx_out_int: u1,
        reserved3: u1,
        usb_cx_comfail_int: u1,
        usb_cx_comabt_int: u1,
        reserved6: u26,
    }),

    // 0x148
    DEV_ISG1: mmio.Mmio(packed struct(u32) {
        usb_f0_out_int: u1,
        usb_f0_spk_int: u1,
        usb_f1_out_int: u1,
        usb_f1_spk_int: u1,
        usb_f2_out_int: u1,
        usb_f2_spk_int: u1,
        usb_f3_out_int: u1,
        usb_f3_spk_int: u1,
        reserved8: u8,
        usb_f0_in_int: u1,
        usb_f1_in_int: u1,
        usb_f2_in_int: u1,
        usb_f3_in_int: u1,
        reserved20: u12,
    }),

    // 0x14c
    DEV_ISG2: mmio.Mmio(packed struct(u32) {
        usbrst_int: u1,
        usb_susp_int: u1,
        usb_resm_int: u1,
        usb_iso_seq_err_int: u1,
        usb_iso_seq_abort_int: u1,
        usb_tx0byte_int: u1,
        usb_rx0byte_int: u1,
        usb_dma_cmplt_hov: u1,
        usb_dma_error_hov: u1,
        usb_dev_idle_hov: u1,
        usb_dev_wakeup_byvbus: u1,
        reserved11: u21,
    }),

    // 0x150
    DEV_RXZ: mmio.Mmio(packed struct(u32) {
        usb_rx0byte_ep1: u1,
        usb_rx0byte_ep2: u1,
        usb_rx0byte_ep3: u1,
        usb_rx0byte_ep4: u1,
        reserved4: u28,
    }),

    // 0x154
    DEV_TXZ: mmio.Mmio(packed struct(u32) {
        usb_tx0byte_ep1: u1,
        usb_tx0byte_ep2: u1,
        usb_tx0byte_ep3: u1,
        usb_tx0byte_ep4: u1,
        reserved4: u28,
    }),

    // 0x158
    DEV_ISE: mmio.Mmio(packed struct(u32) {
        usb_iso_abt_err_ep1: u1,
        usb_iso_abt_err_ep2: u1,
        usb_iso_abt_err_ep3: u1,
        usb_iso_abt_err_ep4: u1,
        reserved4: u12,
        usb_iso_seq_err_ep1: u1,
        usb_iso_seq_err_ep2: u1,
        usb_iso_seq_err_ep3: u1,
        usb_iso_seq_err_ep4: u1,
        reserved20: u12,
    }),

    padding348: [1]u32,
    // 0x160
    DEV_INMPS1: mmio.Mmio(packed struct(u32) {
        usb_maxps_iep1: u11,
        usb_stl_iep1: u1,
        usb_rstg_iep1: u1,
        usb_tx_num_hbw_iep1: u2,
        usb_tx0byte_iep1: u1,
        reserved16: u16,
    }),

    // 0x164
    DEV_INMPS2: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    // 0x168
    DEV_INMPS3: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    // 0x16c
    DEV_INMPS4: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    // 0x170
    DEV_INMPS5: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    // 0x174
    DEV_INMPS6: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    // 0x178
    DEV_INMPS7: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    // 0x17c
    DEV_INMPS8: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    // 0x180
    DEV_OUTMPS1: mmio.Mmio(packed struct(u32) {
        usb_maxps_oep1: u11,
        usb_stl_oep1: u1,
        usb_rstg_oep1: u1,
        reserved13: u19,
    }),

    // 0x184
    DEV_OUTMPS2: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    // 0x188
    DEV_OUTMPS3: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    // 0x18c
    DEV_OUTMPS4: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    // 0x190
    DEV_OUTMPS5: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    // 0x194
    DEV_OUTMPS6: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    // 0x198
    DEV_OUTMPS7: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    // 0x19c
    DEV_OUTMPS8: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    // 0x1a0
    DEV_EPMAP0: mmio.Mmio(packed struct(u32) {
        usb_fno_iep1: u4,
        usb_fno_oep1: u4,
        usb_fno_iep2: u4,
        usb_fno_oep2: u4,
        usb_fno_iep3: u4,
        usb_fno_oep3: u4,
        usb_fno_iep4: u4,
        usb_fno_oep4: u4,
    }),

    // 0x1a4
    DEV_EPMAP1: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    // 0x1a8
    DEV_FMAP: mmio.Mmio(packed struct(u32) {
        usb_epno_fifo0: u4,
        usb_dir_fifo0: u2,
        reserved6: u2,
        usb_epno_fifo1: u4,
        usb_dir_fifo1: u2,
        reserved14: u2,
        usb_epno_fifo2: u4,
        usb_dir_fifo2: u2,
        reserved22: u2,
        usb_epno_fifo3: u4,
        usb_dir_fifo3: u2,
        reserved30: u2,
    }),

    // 0x1ac
    DEV_FCFG: mmio.Mmio(packed struct(u32) {
        usb_blk_typ_f0: u2,
        usb_blkno_f0: u2,
        usb_blksz_f0: u1,
        usb_en_f0: u1,
        reserved6: u2,
        usb_blk_typ_f1: u2,
        usb_blkno_f1: u2,
        usb_blksz_f1: u1,
        usb_en_f1: u1,
        reserved14: u2,
        usb_blk_typ_f2: u2,
        usb_blkno_f2: u2,
        usb_blksz_f2: u1,
        usb_en_f2: u1,
        reserved22: u2,
        usb_blk_typ_f3: u2,
        usb_blkno_f3: u2,
        usb_blksz_f3: u1,
        usb_en_f3: u1,
        reserved30: u2,
    }),

    // 0x1b0
    DEV_FIBC0: mmio.Mmio(packed struct(u32) {
        usb_bc_f0: u11,
        reserved11: u1,
        usb_ffrst0_hov: u1,
        reserved13: u19,
    }),

    // 0x1b4
    DEV_FIBC1: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    // 0x1b8
    DEV_FIBC2: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    // 0x1bc
    DEV_FIBC3: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    // 0x1c0
    DMA_TFN: mmio.Mmio(packed struct(u32) {
        usb_acc_f0_hov: u1,
        usb_acc_f1_hov: u1,
        usb_acc_f2_hov: u1,
        usb_acc_f3_hov: u1,
        usb_acc_cxf_hov: u1,
        reserved5: u27,
    }),

    // 0x1c4
    DMA_CPS0: mmio.Mmio(packed struct(u32) {
        usb_awchache_hov: u4,
        usb_awport_hov: u3,
        usb_awlock_hov: u2,
        usb_arcache_hov: u4,
        usb_arport_hov: u3,
        usb_arlock_hov: u2,
        usb_buf_ld_en_hov: u1,
        usb_dst_wd_hov: u1,
        reserved20: u12,
    }),

    // 0x1c8
    DMA_CPS1: mmio.Mmio(packed struct(u32) {
        usb_dma_start_hov: u1,
        usb_dma_type_hov: u1,
        usb_dma_io_hov: u1,
        usb_dma_abort_hov: u1,
        usb_clrfifo_dmaabort_hov: u1,
        reserved5: u3,
        usb_dma_len_hov: u17,
        usb_r_hport_hov: u4,
        usb_undef_len_burst_hov: u1,
        usb_l1_wakeup: u1,
        usb_devphy_suspend_hov: u1,
    }),

    // 0x1cc
    DMA_CPS2: mmio.Mmio(packed struct(u32) {
        usb_dma_maddr_hov: u32,
    }),

    // 0x1d0
    DMA_CPS3: mmio.Mmio(packed struct(u32) {
        usb_setup_cmd_rport: u32,
    }),

    // 0x1d4
    DMA_CPS4: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    // 0x1d8
    DEV_FMAP2: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    // 0x1dc
    DEV_FCFG2: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    // 0x1e0
    DEV_FMAP3: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    // 0x1e4
    DEV_FCFG3: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    // 0x1e8
    DEV_FMAP4: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    // 0x1ec
    DEV_FCFG4: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    // 0x1f0
    DEV_FIBC4: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    // 0x1f4
    DEV_FIBC5: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    // 0x1f8
    DEV_FIBC6: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    // 0x1fc
    DEV_FIBC7: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    padding512: [64]u32,
    // 0x300
    VDMA_CXFPS1: mmio.Mmio(packed struct(u32) {
        usb_vdma_start_cxf: u1,
        usb_vdma_type_cxf: u1,
        usb_vdma_io_cxf: u1,
        reserved3: u5,
        usb_vdma_len_cxf: u17,
        reserved25: u7,
    }),

    // 0x304
    VDMA_CXFPS2: mmio.Mmio(packed struct(u32) {
        reserved0: u8,
        usb_vdma_maddr_cxf: u17,
        reserved25: u7,
    }),

    // 0x308
    VDMA_F0PS1: mmio.Mmio(packed struct(u32) {
        usb_vdma_start_f0: u1,
        usb_vdma_type_f0: u1,
        usb_vdma_io_f0: u1,
        reserved3: u5,
        usb_vdma_len_f0: u17,
        reserved25: u7,
    }),

    // 0x30c
    VDMA_F0PS2: mmio.Mmio(packed struct(u32) {
        reserved0: u8,
        usb_vdma_maddr_f0: u17,
        reserved25: u7,
    }),

    // 0x310
    VDMA_F1PS1: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    // 0x314
    VDMA_F1PS2: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    // 0x318
    VDMA_F2PS1: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    // 0x31c
    VDMA_F2PS2: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    // 0x320
    VDMA_F3PS1: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    // 0x324
    VDMA_F3PS2: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    // 0x328
    DEV_ISG3: mmio.Mmio(packed struct(u32) {
        usb_vdma_cmplt_cxf: u1,
        usb_vdma_cmplt_f0: u1,
        usb_vdma_cmplt_f1: u1,
        usb_vdma_cmplt_f2: u1,
        usb_vdma_cmplt_f3: u1,
        reserved5: u11,
        usb_vdma_error_cxf: u1,
        usb_vdma_error_f0: u1,
        usb_vdma_error_f1: u1,
        usb_vdma_error_f2: u1,
        usb_vdma_error_f3: u1,
        reserved21: u11,
    }),

    // 0x32c
    DEV_MISG3: mmio.Mmio(packed struct(u32) {
        usb_mvdma_cmplt_cxf: u1,
        usb_mvdma_cmplt_f0: u1,
        usb_mvdma_cmplt_f1: u1,
        usb_mvdma_cmplt_f2: u1,
        usb_mvdma_cmplt_f3: u1,
        reserved5: u11,
        usb_mvdma_error_cxf: u1,
        usb_mvdma_error_f0: u1,
        usb_mvdma_error_f1: u1,
        usb_mvdma_error_f2: u1,
        usb_mvdma_error_f3: u1,
        reserved21: u11,
    }),

    // 0x330
    VDMA_CTRL: mmio.Mmio(packed struct(u32) {
        usb_vdma_en: u1,
        reserved1: u31,
    }),

    // 0x334
    LPM_CAP: mmio.Mmio(packed struct(u32) {
        usb_lpm_wakeup_en: u1,
        reserved1: u31,
    }),

    // 0x338
    DEV_ISG4: mmio.Mmio(packed struct(u32) {
        usb_l1_int: u1,
        reserved1: u31,
    }),

    // 0x33c
    DEV_MISG4: mmio.Mmio(packed struct(u32) {
        usb_ml1_int: u1,
        reserved1: u31,
    }),

    padding832: [4]u32,
    // 0x350
    VDMA_FnPS1: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),

    // 0x354
    VDMA_FnPS2: mmio.Mmio(packed struct(u32) {
        reserved0: u32,
    }),
};
