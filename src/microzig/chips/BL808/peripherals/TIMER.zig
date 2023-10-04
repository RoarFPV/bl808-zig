const mmio = @import("microzig").mmio;

pub const Type = extern struct {
    // 0x0
    @"Timer Clock Source": mmio.Mmio(packed struct(u32) {
        cs_0: u4,
        cs_1: u4,
        cs_wdt: u4,
        reserved12: u12,
        id: u8,
    }),

    padding4: [3]u32,
    // 0x10
    @"Timer0 Match Value 0": mmio.Mmio(packed struct(u32) {
        tmr0_0: u32,
    }),

    // 0x14
    @"Timer0 Match Value 1": mmio.Mmio(packed struct(u32) {
        tmr0_1: u32,
    }),

    // 0x18
    @"Timer0 Match Value 2": mmio.Mmio(packed struct(u32) {
        tmr0_2: u32,
    }),

    // 0x1c
    @"Timer1 Match Value 0": mmio.Mmio(packed struct(u32) {
        tmr1_0: u32,
    }),

    // 0x20
    @"Timer1 Match Value 1": mmio.Mmio(packed struct(u32) {
        tmr1_1: u32,
    }),

    // 0x24
    @"Timer1 Match Value 2": mmio.Mmio(packed struct(u32) {
        tmr1_2: u32,
    }),

    padding40: [1]u32,
    // 0x2c
    @"Timer0 Counter Value": mmio.Mmio(packed struct(u32) {
        tcr0_cnt: u32,
    }),

    // 0x30
    @"Timer1 Counter Value": mmio.Mmio(packed struct(u32) {
        tcr1_cnt: u32,
    }),

    padding52: [1]u32,
    // 0x38
    @"Timer0 Match Status": mmio.Mmio(packed struct(u32) {
        tsr0_0: u1,
        tsr0_1: u1,
        tsr0_2: u1,
        reserved3: u29,
    }),

    // 0x3c
    @"Timer1 Match Status": mmio.Mmio(packed struct(u32) {
        tsr1_0: u1,
        tsr1_1: u1,
        tsr1_2: u1,
        reserved3: u29,
    }),

    padding64: [1]u32,
    // 0x44
    @"Timer0 Match Interrupt Enable": mmio.Mmio(packed struct(u32) {
        tier0_0: u1,
        tier0_1: u1,
        tier0_2: u1,
        reserved3: u29,
    }),

    // 0x48
    @"Timer1 Match Interrupt Enable": mmio.Mmio(packed struct(u32) {
        tier1_0: u1,
        tier1_1: u1,
        tier1_2: u1,
        reserved3: u29,
    }),

    padding76: [1]u32,
    // 0x50
    @"Timer0 Pre-Load Value": mmio.Mmio(packed struct(u32) {
        tplvr0: u32,
    }),

    // 0x54
    @"Timer1 Pre-Load Value": mmio.Mmio(packed struct(u32) {
        tplvr1: u32,
    }),

    padding88: [1]u32,
    // 0x5c
    @"Timer0 Pre-Load Control": mmio.Mmio(packed struct(u32) {
        tplcr0: u2,
        reserved2: u30,
    }),

    // 0x60
    @"Timer1 Pre-Load Control": mmio.Mmio(packed struct(u32) {
        tplcr1: u2,
        reserved2: u30,
    }),

    // 0x64
    @"Watch-dog reset/interrupt Mode": mmio.Mmio(packed struct(u32) {
        we: u1,
        wrie: u1,
        reserved2: u30,
    }),

    // 0x68
    @"Watch-dog Match Value": mmio.Mmio(packed struct(u32) {
        wmr: u16,
        wdt_align: u1,
        reserved17: u15,
    }),

    // 0x6c
    @"Watch-dog Counter Value": mmio.Mmio(packed struct(u32) {
        wdt_cnt: u16,
        reserved16: u16,
    }),

    // 0x70
    @"Watch-dog Reset Status": mmio.Mmio(packed struct(u32) {
        wts: u1,
        reserved1: u31,
    }),

    padding116: [1]u32,
    // 0x78
    @"Timer0 Interrupt Clear": mmio.Mmio(packed struct(u32) {
        tclr0_0: u1,
        tclr0_1: u1,
        tclr0_2: u1,
        reserved3: u29,
    }),

    // 0x7c
    @"Timer1 Interrupt Clear": mmio.Mmio(packed struct(u32) {
        tclr1_0: u1,
        tclr1_1: u1,
        tclr1_2: u1,
        reserved3: u29,
    }),

    // 0x80
    @"WDT Interrupt Clear": mmio.Mmio(packed struct(u32) {
        wiclr: u1,
        reserved1: u31,
    }),

    // 0x84
    @"Timer Counter Enable/Clear": mmio.Mmio(packed struct(u32) {
        reserved0: u1,
        timer0_en: u1,
        timer1_en: u1,
        reserved3: u2,
        tcr0_cnt_clr: u1,
        tcr1_cnt_clr: u1,
        reserved7: u25,
    }),

    // 0x88
    @"Timer Counter Mode": mmio.Mmio(packed struct(u32) {
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
    @"Timer0 Match Interrupt Mode": mmio.Mmio(packed struct(u32) {
        tilr0_0: u1,
        tilr0_1: u1,
        tilr0_2: u1,
        reserved3: u29,
    }),

    // 0x94
    @"Timer1 Match Interrupt Mode": mmio.Mmio(packed struct(u32) {
        tilr1_0: u1,
        tilr1_1: u1,
        tilr1_2: u1,
        reserved3: u29,
    }),

    // 0x98
    @"WDT Counter Reset": mmio.Mmio(packed struct(u32) {
        wcr: u1,
        reserved1: u31,
    }),

    // 0x9c
    @"WDT Access Key1": mmio.Mmio(packed struct(u32) {
        wfar: u16,
        reserved16: u16,
    }),

    // 0xa0
    @"WDT Access Key2": mmio.Mmio(packed struct(u32) {
        wsar: u16,
        reserved16: u16,
    }),

    padding164: [1]u32,
    // 0xa8
    @"Timer0 Counter Latch Value": mmio.Mmio(packed struct(u32) {
        tcr0_cnt_lat: u32,
    }),

    // 0xac
    @"Timer1 Counter Latch Value": mmio.Mmio(packed struct(u32) {
        tcr1_cnt_lat: u32,
    }),

    padding176: [1]u32,
    // 0xb4
    @"Timer0 Counter Sync Value": mmio.Mmio(packed struct(u32) {
        tcr0_cnt_sync: u32,
    }),

    // 0xb8
    @"Timer1 Counter Sync Value": mmio.Mmio(packed struct(u32) {
        tcr1_cnt_sync: u32,
    }),

    // 0xbc
    @"Timer Division": mmio.Mmio(packed struct(u32) {
        reserved0: u8,
        tcdr0: u8,
        tcdr1: u8,
        wcdr: u8,
    }),

    // 0xc0
    @"GPIO Mode": mmio.Mmio(packed struct(u32) {
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
    @"GPIO Latch Value1": mmio.Mmio(packed struct(u32) {
        gpio_lat1: u32,
    }),

    // 0xc8
    @"GPIO Latch Value2": mmio.Mmio(packed struct(u32) {
        gpio_lat2: u32,
    }),

    // 0xcc
    @"Timer Division Force": mmio.Mmio(packed struct(u32) {
        reserved0: u1,
        tcdr0_force: u1,
        tcdr1_force: u1,
        reserved3: u1,
        wcdr_force: u1,
        reserved5: u27,
    }),
};
