const mmio = @import("microzig").mmio;

pub const Type = extern struct {
    // 0x0
    DMA_CxSrcAddr: mmio.Mmio(packed struct(u32) {
        intstatus: u8,
        reserved8: u24,
    }),

    // 0x4
    DMA_CxDstAddr: mmio.Mmio(packed struct(u32) {
        inttcstatus: u8,
        reserved8: u24,
    }),

    // 0x8
    DMA_CxLLI: mmio.Mmio(packed struct(u32) {
        inttcclear: u8,
        reserved8: u24,
    }),

    // 0xc
    DMA_CxControl: mmio.Mmio(packed struct(u32) {
        interrorstatus: u8,
        reserved8: u24,
    }),

    // 0x10
    DMA_CxConfig: mmio.Mmio(packed struct(u32) {
        interrclr: u8,
        reserved8: u24,
    }),

    // 0x14
    DMA_RawIntTCStatus: mmio.Mmio(packed struct(u32) {
        rawinttcstatus: u8,
        reserved8: u24,
    }),

    // 0x18
    DMA_RawIntErrorStatus: mmio.Mmio(packed struct(u32) {
        rawinterrorstatus: u8,
        reserved8: u24,
    }),

    // 0x1c
    DMA_EnbldChns: mmio.Mmio(packed struct(u32) {
        enabledchannels: u8,
        reserved8: u24,
    }),

    // 0x20
    DMA_SoftBReq: mmio.Mmio(packed struct(u32) {
        softbreq: u32,
    }),

    // 0x24
    DMA_SoftSReq: mmio.Mmio(packed struct(u32) {
        softsreq: u32,
    }),

    // 0x28
    DMA_SoftLBReq: mmio.Mmio(packed struct(u32) {
        softlbreq: u32,
    }),

    // 0x2c
    DMA_SoftLSReq: mmio.Mmio(packed struct(u32) {
        softlsreq: u32,
    }),

    // 0x30
    DMA_Top_Config: mmio.Mmio(packed struct(u32) {
        e: u1,
        m: u1,
        reserved2: u30,
    }),

    // 0x34
    DMA_Sync: mmio.Mmio(packed struct(u32) {
        sync: u32,
    }),

    padding56: [50]u32,
    // 0x100
    DMA_CxSrcAddr: mmio.Mmio(packed struct(u32) {
        srcaddr: u32,
    }),

    // 0x104
    DMA_CxDstAddr: mmio.Mmio(packed struct(u32) {
        dstaddr: u32,
    }),

    // 0x108
    DMA_CxLLI: mmio.Mmio(packed struct(u32) {
        lli: u32,
    }),

    // 0x10c
    DMA_CxControl: mmio.Mmio(packed struct(u32) {
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
    DMA_CxConfig: mmio.Mmio(packed struct(u32) {
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
