const mmio = @import("microzig").mmio;

pub const Type = extern struct {
    // 0x0
    tccr: mmio.Mmio(packed struct(u32) {
        cs_0: u4,
        cs_1: u4,
        cs_wdt: u4,
        reserved12: u12,
        id: u8,
    }),

    padding4: [3]u32,
    // 0x10
    tmr0_0: mmio.Mmio(packed struct(u32) {
        tmr0_0: u32,
    }),

    // 0x14
    tmr0_1: mmio.Mmio(packed struct(u32) {
        tmr0_1: u32,
    }),

    // 0x18
    tmr0_2: mmio.Mmio(packed struct(u32) {
        tmr0_2: u32,
    }),

    // 0x1c
    tmr1_0: mmio.Mmio(packed struct(u32) {
        tmr1_0: u32,
    }),

    // 0x20
    tmr1_1: mmio.Mmio(packed struct(u32) {
        tmr1_1: u32,
    }),

    // 0x24
    tmr1_2: mmio.Mmio(packed struct(u32) {
        tmr1_2: u32,
    }),

    padding40: [1]u32,
    // 0x2c
    tcr0: mmio.Mmio(packed struct(u32) {
        tcr0_cnt: u32,
    }),

    // 0x30
    tcr1: mmio.Mmio(packed struct(u32) {
        tcr1_cnt: u32,
    }),

    padding52: [1]u32,
    // 0x38
    tsr0: mmio.Mmio(packed struct(u32) {
        tsr0_0: u1,
        tsr0_1: u1,
        tsr0_2: u1,
        reserved3: u29,
    }),

    // 0x3c
    tsr1: mmio.Mmio(packed struct(u32) {
        tsr1_0: u1,
        tsr1_1: u1,
        tsr1_2: u1,
        reserved3: u29,
    }),

    padding64: [1]u32,
    // 0x44
    tier0: mmio.Mmio(packed struct(u32) {
        tier0_0: u1,
        tier0_1: u1,
        tier0_2: u1,
        reserved3: u29,
    }),

    // 0x48
    tier1: mmio.Mmio(packed struct(u32) {
        tier1_0: u1,
        tier1_1: u1,
        tier1_2: u1,
        reserved3: u29,
    }),

    padding76: [1]u32,
    // 0x50
    tplvr0: mmio.Mmio(packed struct(u32) {
        tplvr0: u32,
    }),

    // 0x54
    tplvr1: mmio.Mmio(packed struct(u32) {
        tplvr1: u32,
    }),

    padding88: [1]u32,
    // 0x5c
    tplcr0: mmio.Mmio(packed struct(u32) {
        tplcr0: u2,
        reserved2: u30,
    }),

    // 0x60
    tplcr1: mmio.Mmio(packed struct(u32) {
        tplcr1: u2,
        reserved2: u30,
    }),

    // 0x64
    wmer: mmio.Mmio(packed struct(u32) {
        we: u1,
        wrie: u1,
        reserved2: u30,
    }),

    // 0x68
    wmr: mmio.Mmio(packed struct(u32) {
        wmr: u16,
        wdt_align: u1,
        reserved17: u15,
    }),

    // 0x6c
    wvr: mmio.Mmio(packed struct(u32) {
        wdt_cnt: u16,
        reserved16: u16,
    }),

    // 0x70
    wsr: mmio.Mmio(packed struct(u32) {
        wts: u1,
        reserved1: u31,
    }),

    padding116: [1]u32,
    // 0x78
    ticr0: mmio.Mmio(packed struct(u32) {
        tclr0_0: u1,
        tclr0_1: u1,
        tclr0_2: u1,
        reserved3: u29,
    }),

    // 0x7c
    ticr1: mmio.Mmio(packed struct(u32) {
        tclr1_0: u1,
        tclr1_1: u1,
        tclr1_2: u1,
        reserved3: u29,
    }),

    // 0x80
    wicr: mmio.Mmio(packed struct(u32) {
        wiclr: u1,
        reserved1: u31,
    }),

    // 0x84
    tcer: mmio.Mmio(packed struct(u32) {
        reserved0: u1,
        timer0_en: u1,
        timer1_en: u1,
        reserved3: u2,
        tcr0_cnt_clr: u1,
        tcr1_cnt_clr: u1,
        reserved7: u25,
    }),

    // 0x88
    tcmr: mmio.Mmio(packed struct(u32) {
        reserved0: u1,
        timer0_mode: u1,
        timer1_mode: u1,
        reserved3: u2,
        timer0_align: u1,
        timer1_align: u1,
        reserved7: u25,
    }),

    padding140: [1]u32,
    // 0x90
    tilr0: mmio.Mmio(packed struct(u32) {
        tilr0_0: u1,
        tilr0_1: u1,
        tilr0_2: u1,
        reserved3: u29,
    }),

    // 0x94
    tilr1: mmio.Mmio(packed struct(u32) {
        tilr1_0: u1,
        tilr1_1: u1,
        tilr1_2: u1,
        reserved3: u29,
    }),

    // 0x98
    wcr: mmio.Mmio(packed struct(u32) {
        wcr: u1,
        reserved1: u31,
    }),

    // 0x9c
    wfar: mmio.Mmio(packed struct(u32) {
        wfar: u16,
        reserved16: u16,
    }),

    // 0xa0
    wsar: mmio.Mmio(packed struct(u32) {
        wsar: u16,
        reserved16: u16,
    }),

    padding164: [1]u32,
    // 0xa8
    tcvwr0: mmio.Mmio(packed struct(u32) {
        tcr0_cnt_lat: u32,
    }),

    // 0xac
    tcvwr1: mmio.Mmio(packed struct(u32) {
        tcr1_cnt_lat: u32,
    }),

    padding176: [1]u32,
    // 0xb4
    tcvsyn0: mmio.Mmio(packed struct(u32) {
        tcr0_cnt_sync: u32,
    }),

    // 0xb8
    tcvsyn1: mmio.Mmio(packed struct(u32) {
        tcr1_cnt_sync: u32,
    }),

    // 0xbc
    tcdr: mmio.Mmio(packed struct(u32) {
        reserved0: u8,
        tcdr0: u8,
        tcdr1: u8,
        wcdr: u8,
    }),

    // 0xc0
    gpio: mmio.Mmio(packed struct(u32) {
        reserved0: u1,
        timer0_gpio_en: u1,
        reserved2: u3,
        timer0_gpio_inv: u1,
        timer1_gpio_inv: u1,
        wdt_gpio_inv: u1,
        reserved8: u23,
        gpio_lat_ok: u1,
    }),

    // 0xc4
    gpio_lat1: mmio.Mmio(packed struct(u32) {
        gpio_lat1: u32,
    }),

    // 0xc8
    gpio_lat2: mmio.Mmio(packed struct(u32) {
        gpio_lat2: u32,
    }),

    // 0xcc
    tcdr_force: mmio.Mmio(packed struct(u32) {
        reserved0: u1,
        tcdr0_force: u1,
        tcdr1_force: u1,
        reserved3: u1,
        wcdr_force: u1,
        reserved5: u27,
    }),
};
