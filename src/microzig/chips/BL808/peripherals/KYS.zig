const mmio = @import("microzig").mmio;


pub const Type =  extern struct {
// 0x0
ks_ctrl: mmio.Mmio(packed struct(u32) {
ks_en: u1
,
fifo_mode: u1
,
ghost_en: u1
,
deg_en: u1
,
deg_cnt: u4
,
rc_ext: u2
,
reserved10: u6,
row_num: u3
,
reserved19: u1,
col_num: u5
,
reserved25: u7,
}),

padding4: [3]u32,
// 0x10
ks_int_en: mmio.Mmio(packed struct(u32) {
reserved0: u7,
ks_done_int_en: u1
,
keyfifo_full_int_en: u1
,
keyfifo_half_int_en: u1
,
keyfifo_quarter_int_en: u1
,
keyfifo_nonempty_int_en: u1
,
ghost_int_en: u1
,
reserved13: u19,
}),

// 0x14
ks_int_sts: mmio.Mmio(packed struct(u32) {
reserved0: u7,
keycode_done: u1
,
keyfifo_full: u1
,
keyfifo_half: uNone
,
