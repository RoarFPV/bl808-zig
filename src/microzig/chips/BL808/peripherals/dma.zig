const mmio = @import("microzig").mmio;

pub const Type = extern struct {
    pub const Channel = extern struct {
        // 0x100
        SrcAddr: mmio.Mmio(packed struct(u32) {
            srcaddr: u32,
        }),

        // 0x104
        DstAddr: mmio.Mmio(packed struct(u32) {
            dstaddr: u32,
        }),

        // 0x108
        LLI: mmio.Mmio(packed struct(u32) {
            lli: u32,
        }),

        // 0x10c
        Control: mmio.Mmio(packed struct(u32) {
            transfersize: u12,
            sbsize: u2,
            dst_min_mode: u1,
            dbsize: u2,
            dst_add_mode: u1,
            swidth: u2,
            reserved20: u1,
            dwidth: u2,
            fix_cnt: u3,
            si: u1,
            di: u1,
            prot: u3,
            i: u1,
        }),

        // 0x110
        Config: mmio.Mmio(packed struct(u32) {
            e: u1,
            srcperipheral: u5,
            dstperipheral: u5,
            flowcntrl: u3,
            ie: u1,
            itc: u1,
            l: u1,
            a: u1,
            h: u1,
            reserved19: u1,
            llicounter: u10,
            reserved30: u2,
        }),
    };

    // 0x0
    IntStatus: mmio.Mmio(packed struct(u32) {
        intstatus: u8,
        reserved8: u24,
    }),

    // 0x4
    IntTCStatus: mmio.Mmio(packed struct(u32) {
        inttcstatus: u8,
        reserved8: u24,
    }),

    // 0x8
    IntTCClear: mmio.Mmio(packed struct(u32) {
        inttcclear: u8,
        reserved8: u24,
    }),

    // 0xc
    IntErrorStatus: mmio.Mmio(packed struct(u32) {
        interrorstatus: u8,
        reserved8: u24,
    }),

    // 0x10
    IntErrClr: mmio.Mmio(packed struct(u32) {
        interrclr: u8,
        reserved8: u24,
    }),

    // 0x14
    RawIntTCStatus: mmio.Mmio(packed struct(u32) {
        rawinttcstatus: u8,
        reserved8: u24,
    }),

    // 0x18
    RawIntErrorStatus: mmio.Mmio(packed struct(u32) {
        rawinterrorstatus: u8,
        reserved8: u24,
    }),

    // 0x1c
    EnbldChns: mmio.Mmio(packed struct(u32) {
        enabledchannels: u8,
        reserved8: u24,
    }),

    // 0x20
    SoftBReq: mmio.Mmio(packed struct(u32) {
        softbreq: u32,
    }),

    // 0x24
    SoftSReq: mmio.Mmio(packed struct(u32) {
        softsreq: u32,
    }),

    // 0x28
    SoftLBReq: mmio.Mmio(packed struct(u32) {
        softlbreq: u32,
    }),

    // 0x2c
    SoftLSReq: mmio.Mmio(packed struct(u32) {
        softlsreq: u32,
    }),

    // 0x30
    Top_Config: mmio.Mmio(packed struct(u32) {
        e: u1,
        m: u1,
        reserved2: u30,
    }),

    // 0x34
    Sync: mmio.Mmio(packed struct(u32) {
        sync: u32,
    }),

    padding56: [50]u32,

    channel: [8]Channel,
};
