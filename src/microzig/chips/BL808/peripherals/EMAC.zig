const mmio = @import("microzig").mmio;


pub const Type =  extern struct {
// 0x0
@"EMAC MODE config": mmio.Mmio(packed struct(u32) {
rx_en: u1
,
tx_en: u1
,
nopre: u1
,
bro: u1
,
reserved4: u1,
pro: u1
,
ifg: u1
,
reserved7: u3,
fulld: u1
,
reserved11: u2,
crcen: u1
,
hugen: u1
,
pad: u1
,
recsmall: u1
,
rmii_en: u1
,
reserved18: u14,
}),

// 0x4
INT_SOURCE: mmio.Mmio(packed struct(u32) {
txb: u1
,
txe: u1
,
rxb: u1
,
rxe: u1
,
busy: u1
,
txc: u1
,
rxc: u1
,
reserved7: u25,
}),

// 0x8
INT_MASK: mmio.Mmio(packed struct(u32) {
txb_m: u1
,
txe_m: u1
,
rxb_m: u1
,
rxe_m: u1
,
busy_m: u1
,
txc_m: u1
,
rxc_m: u1
,
reserved7: u25,
}),

// 0xc
IPGT: mmio.Mmio(packed struct(u32) {
ipgt: u7
,
reserved7: u25,
}),

padding16: [2]u32,
// 0x18
PACKETLEN: mmio.Mmio(packed struct(u32) {
maxfl: u16
,
minfl: u16
,
}),

// 0x1c
COLLCONFIG: mmio.Mmio(packed struct(u32) {
collvalid: u6
,
reserved6: u10,
maxret: u4
,
reserved20: u12,
}),

// 0x20
TX_BD_NUM: mmio.Mmio(packed struct(u32) {
txbdnum: u8
,
reserved8: u8,
txbdptr: u7
,
reserved23: u1,
rxbdptr: u7
,
reserved31: u1,
}),

padding36: [1]u32,
// 0x28
MIIMODE: mmio.Mmio(packed struct(u32) {
clkdiv: u8
,
miinopre: u1
,
reserved9: u23,
}),

// 0x2c
MIICOMMAND: mmio.Mmio(packed struct(u32) {
scanstat: u1
,
rstat: u1
,
wctrldata: u1
,
reserved3: u29,
}),

// 0x30
MIIADDRESS: mmio.Mmio(packed struct(u32) {
fiad: u5
,
reserved5: u3,
rgad: u5
,
reserved13: u19,
}),

// 0x34
MIITX_DATA: mmio.Mmio(packed struct(u32) {
ctrldata: u16
,
reserved16: u16,
}),

// 0x38
MIIRX_DATA: mmio.Mmio(packed struct(u32) {
prsd: u16
,
reserved16: u16,
}),

// 0x3c
MIISTATUS: mmio.Mmio(packed struct(u32) {
miim_linkfail: u1
,
miim_busy: u1
,
reserved2: u30,
}),

// 0x40
MAC_ADDR0: mmio.Mmio(packed struct(u32) {
mac_b5: u8
,
mac_b4: u8
,
mac_b3: u8
,
mac_b2: u8
,
}),

// 0x44
MAC_ADDR1: mmio.Mmio(packed struct(u32) {
mac_b1: u8
,
mac_b0: u8
,
reserved16: u16,
}),

// 0x48
HASH0_ADDR: mmio.Mmio(packed struct(u32) {
hash0: u32
,
}),

// 0x4c
HASH1_ADDR: mmio.Mmio(packed struct(u32) {
hash1: u32
,
}),

// 0x50
TXCTRL: mmio.Mmio(packed struct(u32) {
txpausetv: u16
,
bd_tx_cs: uNone
,
