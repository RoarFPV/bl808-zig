// fw_header

pub const BFLB_FW_LENGTH_OFFSET = 140;
pub const BFLB_FW_HASH_OFFSET = 144;

pub const bootheader_t = extern struct {
    magiccode: u32 = 0x504e4642,
    rivison: u32 = 1,
    flash_cfg: boot_flash_cfg_t = .{},
    clk_cfg: boot_clk_cfg_t = .{},
    basic_cfg: boot_basic_cfg_t = .{},
    cpu_cfg: [3]boot_cpu_cfg_t = .{
        .{
            .config_enable = 1,
            .rsvd0 = 0x58000000,
        }, // m0
        .{ .config_enable = 0 }, // d0?
        .{ .config_enable = 0 }, // lp?
    },
    boot2_pt_table_0_rsvd: u32 = 0, //* address of partition table 0 */ /* 4 */
    boot2_pt_table_1_rsvd: u32 = 0, //* address of partition table 1 */ /* 4 */
    flash_cfg_table_addr: u32 = 0, //* address of flashcfg table list */ /* 4 */
    flash_cfg_table_len: u32 = 0, //* flashcfg table list len */         /* 4 */
    rsvd0: [8]u32 = .{0} ** 8,
    rsvd1: [8]u32 = .{
        0x20000320,
        0x00000000,
        0x2000F038,
        0x18000000,
        0,
        0,
        0,
        0,
    },
    rsvd3: [5]u32 = .{0} ** 5,
    crc32: u32 = 0xdeadbeef,
};

pub const spi_flash_cfg_t = extern struct {
    ioMode: u8 = 0x11,
    cReadSupport: u8 = 0x00,
    clkDelay: u8 = 0x01,
    clkInvert: u8 = 0x01,
    resetEnCmd: u8 = 0x66,
    resetCmd: u8 = 0x99,
    resetCreadCmd: u8 = 0xff,
    resetCreadCmdSize: u8 = 0x03,
    jedecIdCmd: u8 = 0x9f,
    jedecIdCmdDmyClk: u8 = 0x00,
    enter32BitsAddrCmd: u8 = 0xb7,
    exit32BitsAddrCmd: u8 = 0xe9,
    sectorSize: u8 = 0x04,
    mid: u8 = 0x00,
    pageSize: u16 = 0x100,
    chipEraseCmd: u8 = 0xc7,
    sectorEraseCmd: u8 = 0x20,
    blk32EraseCmd: u8 = 0x52,
    blk64EraseCmd: u8 = 0xd8,
    writeEnableCmd: u8 = 0x06,
    pageProgramCmd: u8 = 0x02,
    qpageProgramCmd: u8 = 0x32,
    qppAddrMode: u8 = 0x00,
    fastReadCmd: u8 = 0x0b,
    frDmyClk: u8 = 0x01,
    qpiFastReadCmd: u8 = 0x0b,
    qpiFrDmyClk: u8 = 0x01,
    fastReadDoCmd: u8 = 0x3b,
    frDoDmyClk: u8 = 0x01,
    fastReadDioCmd: u8 = 0xbb,
    frDioDmyClk: u8 = 0x00,
    fastReadQoCmd: u8 = 0x6b,
    frQoDmyClk: u8 = 0x01,
    fastReadQioCmd: u8 = 0xeb,
    frQioDmyClk: u8 = 0x02,
    qpiFastReadQioCmd: u8 = 0xeb,
    qpiFrQioDmyClk: u8 = 0x02,
    qpiPageProgramCmd: u8 = 0x02,
    writeVregEnableCmd: u8 = 0x50,
    wrEnableIndex: u8 = 0x00,
    qeIndex: u8 = 0x01,
    busyIndex: u8 = 0x00,
    wrEnableBit: u8 = 0x01,
    qeBit: u8 = 0x01,
    busyBit: u8 = 0x00,
    wrEnableWriteRegLen: u8 = 0x02,
    wrEnableReadRegLen: u8 = 0x01,
    qeWriteRegLen: u8 = 0x02,
    qeReadRegLen: u8 = 0x01,
    releasePowerDown: u8 = 0xab,
    busyReadRegLen: u8 = 0x01,
    // readRegCmd: [4]u8 = .{ 5, 0x35, 0, 0 },
    // writeRegCmd: [4]u8 = .{ 1, 1, 0, 0 },
    enterQpi: u8 = 0x38,
    exitQpi: u8 = 0xff,
    cReadMode: u8 = 0x20,
    cRExit: u8 = 0xf0,
    burstWrapCmd: u8 = 0x77,
    burstWrapCmdDmyClk: u8 = 0x03,
    burstWrapDataMode: u8 = 0x02,
    burstWrapData: u8 = 0x40,
    deBurstWrapCmd: u8 = 0x77,
    deBurstWrapCmdDmyClk: u8 = 0x03,
    deBurstWrapDataMode: u8 = 0x02,
    deBurstWrapData: u8 = 0xf0,
    timeEsector: u16 = 300,
    timeE32k: u16 = 1200,
    timeE64k: u16 = 1200,
    timePagePgm: u16 = 50,
    timeCe: u16 = 30000,
    pdDelay: u8 = 20,
    qeData: u8 = 0,
};
pub const boot_flash_cfg_t = extern struct {
    magiccode: u32 = 0x47464346,
    cfg: spi_flash_cfg_t = .{},
    crc32: u32 = 0xdeadbeef,
};
pub const sys_clk_cfg_t = extern struct {
    xtal_type: u8 = 0x07,
    mcu_clk: u8 = 0x04,
    mcu_clk_div: u8 = 0x00,
    mcu_bclk_div: u8 = 0x00,
    mcu_pbclk_div: u8 = 0x03,
    lp_div: u8 = 0x01,
    dsp_clk: u8 = 0x03,
    dsp_clk_div: u8 = 0x00,
    dsp_bclk_div: u8 = 0x01,
    dsp_pbclk: u8 = 0x02,
    dsp_pbclk_div: u8 = 0x00,
    emi_clk: u8 = 0x02,
    emi_clk_div: u8 = 0x01,
    flash_clk_type: u8 = 0x01,
    flash_clk_div: u8 = 0x00,
    wifipll_pu: u8 = 0x01,
    aupll_pu: u8 = 0x01,
    cpupll_pu: u8 = 0x01,
    mipipll_pu: u8 = 0x01,
    uhspll_pu: u8 = 0x01,
};
pub const boot_clk_cfg_t = extern struct {
    magiccode: u32 = 0x47464350,
    cfg: sys_clk_cfg_t = .{},
    crc32: u32 = 0xdeadbeef,
};
pub const boot_basic_cfg_t = extern struct {
    sign_type: u8 = 0x0, //* [1: 0]   for sign */
    encrypt_type: u8 = 0x0, //* [3: 2]   for encrypt */
    key_sel: u8 = 0x0, //* [5: 4]   key slot */
    xts_mode: u8 = 0x0, //* [6]      for xts mode */
    aes_region_lock: u8 = 0x0, //* [7]      rsvd */
    no_segment: u8 = 0x1, //* [8]      no segment info */
    rsvd_0: u8 = 0x0, //* [9]      boot2 enable(rsvd_0) */
    rsvd_1: u8 = 0x0, //* [10]     boot2 rollback(rsvd_1) */
    cpu_master_id: u8 = 0x0, //* [14: 11] master id */
    notload_in_bootrom: u8 = 0x0, //* [15]     notload in bootrom */
    crc_ignore: u8 = 0x1, //* [16]     ignore crc */
    hash_ignore: u8 = 0x1, //* [17]     hash ignore */
    power_on_mm: u8 = 0x1, //* [18]     power on mm */
    em_sel: u8 = 0x1, //* [21: 19] em_sel */
    cmds_en: u8 = 0x1, //* [22]     command spliter enable */
    cmds_wrap_mode: u8 = 0x1, //* [24: 23] cmds wrap mode */
    cmds_wrap_len: u8 = 0x9, //* [28: 25] cmds wrap len */
    icache_invalid: u8 = 0x1, //* [29] icache invalid */
    dcache_invalid: u8 = 0x1, //* [30] dcache invalid */
    rsvd_3: u8 = 0x0, //* [31] rsvd_3 */

    // group_image_offset: u32 = 0x00002000, // /* flash controller offset */
    group_image_offset: u32 = 0x00001000, // /* flash controller offset */

    aes_region_len: u32 = 0, //     /* aes region length */

    img_len_cnt: u32 = 0x00010000, // /* image length or segment count */
    hash: [8]u32 = .{0xdeadbeef} ** 8,
};

pub const boot_cpu_cfg_t = extern struct {
    config_enable: u8 = 0x00, // coinfig this cpu */
    halt_cpu: u8 = 0x0, // halt this cpu */
    cache_enable: u8 = 0x0, // cache setting */
    cache_wa: u8 = 0x0, // cache setting */
    cache_wb: u8 = 0x0, // cache setting */
    cache_wt: u8 = 0x0, // cache setting */
    cache_way_dis: u8 = 0x0, // cache setting */
    rsvd: u8 = 0x0,

    cache_range_h: u32 = 0x00000000, // cache range high */
    cache_range_l: u32 = 0x00000000, // cache range low */
    image_address_offset: u32 = 0x0, // image_address_offset */
    rsvd0: u32 = 0x58000000, // rsvd0 */
    msp_val: u32 = 0x00000000,
};

pub const aesiv_cfg_t = extern struct {
    aesiv: [16]u8,
    crc32: u32,
};
pub const pkey_cfg_t = extern struct {
    eckeyx: [32]u8,
    eckeyy: [32]u8,
    crc32: u32,
};
pub const sign_cfg_t = extern struct {
    sig_len: u32,
    signature: [32]u8,
    crc32: u32,
};
