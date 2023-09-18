const std = @import("std");
const microzig = @import("microzig");

const cpu = microzig.cpu;
const bl808 = microzig.chip;
const regs = microzig.chip.peripherals;

const AON = regs.AON;
fn arch_delay_us(us: u32) void {
    _ = us;
}

pub const mBandGap = struct {
    pub fn powerOn() void {
        AON.rf_top_aon.modify(.{ .pu_mbg_aon = 1 });
        arch_delay_us(55);
    }

    pub fn powerOff() void {
        AON.rf_top_aon.modify(.{ .pu_mbg_aon = 0 });
    }
};

pub const xtal = struct {
    pub fn powerOn() void {
        AON.rf_top_aon.modify(.{
            .pu_xtal_aon = 1,
            .pu_xtal_buf_aon = 1,
        });

        var timeOut: u8 = 120;
        while (timeOut > 0 and AON.tsen.read().xtal_rdy == 0) {
            arch_delay_us(10);
            timeOut -= 1;
        }

        // if (timeOut <= 0)
        //     return error.XtalRdyTimeout;
    }

    pub fn powerOff() void {
        AON.rf_top_aon.modify(.{
            .pu_xtal_aon = 0,
            .pu_xtal_buf_aon = 0,
        });
    }

    pub fn setCapCode(capIn: u6, capOut: u6) void {
        AON.xtal_cfg.write(.{
            .xtal_capcode_in_aon = capIn,
            .xtal_capcode_out_aon = capOut,
        });

        arch_delay_us(100);
    }

    pub fn getCapCode() u6 {
        return AON.xtal_cfg.read().xtal_capcode_in_aon;
    }
};

pub const bandGap = struct {
    pub fn powerOn() void {
        AON.bg_sys_top.modify(.{ .pu_bg_sys_aon = 1 });
        arch_delay_us(55);
    }

    pub fn powerOff() void {
        AON.bg_sys_top.modify(.{ .pu_bg_sys_aon = 0 });
        arch_delay_us(55);
    }
};

pub const ld015rf = struct {
    pub fn powerOn() void {
        AON.rf_top_aon.modify(.{ .pu_ldo15rf_aon = 1 });
        arch_delay_us(90);
    }

    pub fn powerOff() void {
        AON.rf_top_aon.modify(.{ .pu_ldo15rf_aon = 0 });
    }
};

pub const sourceFollow = struct {
    pub fn powerOn() void {
        AON.rf_top_aon.modify(.{ .pu_sfreg_aon = 1 });
        arch_delay_us(90);
    }

    pub fn powerOff() void {
        AON.rf_top_aon.modify(.{ .pu_sfreg_aon = 0 });
    }
};

pub const pds0 = struct {
    pub fn lowPowerEnter() void {
        AON.aon_misc.modify(.{ .sw_wb_en_aon = 1 });

        AON.rf_top_aon.modify(.{
            .pu_sfreg_aon = 0,
            .pu_ldo15rf_aon = 0,
            .pu_mbg_aon = 0,
        });

        // gating clock
        // tmpVal = BL_RD_REG(GLB_BASE, GLB_CGEN_CFG0);
        // tmpVal = tmpVal & (~(1 << 6));
        // tmpVal = tmpVal & (~(1 << 7));
        // BL_WR_REG(GLB_BASE, GLB_CGEN_CFG0, tmpVal);
    }

    pub fn lowPowerExit() void {}
};
