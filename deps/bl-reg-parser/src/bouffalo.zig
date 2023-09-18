const std = @import("std");

const c = @cImport({
    @cDefine("ARCH_RISCV", "");
    @cDefine("CPU_M0", "");
    @cDefine("BL808", "");

    @cInclude("defines.h");

    const soc_std = "";
    _ = soc_std; //"soc/bl808/std/include/";
    const hardware = ""; //soc_std ++ "hardware/";

    // @cInclude(hardware ++ "bl808.h");
    @cInclude(hardware ++ "aon_reg.h");
    @cInclude(hardware ++ "cci_reg.h");
    @cInclude(hardware ++ "codec_misc_reg.h");
    @cInclude(hardware ++ "ef_ctrl_reg.h");
    @cInclude(hardware ++ "ef_data_0_reg.h");
    @cInclude(hardware ++ "ef_data_1_reg.h");
    @cInclude(hardware ++ "glb_reg.h");
    @cInclude(hardware ++ "gpip_reg.h");
    @cInclude(hardware ++ "hbn_reg.h");
    @cInclude(hardware ++ "ipc_reg.h");
    @cInclude(hardware ++ "mcu_misc_reg.h");
    @cInclude(hardware ++ "mm_glb_reg.h");
    @cInclude(hardware ++ "mm_misc_reg.h");
    @cInclude(hardware ++ "pds_reg.h");
    @cInclude(hardware ++ "psram_reg.h");
    @cInclude(hardware ++ "psram_uhs_reg.h");
    @cInclude(hardware ++ "sdh_reg.h");
    @cInclude(hardware ++ "sf_ctrl_reg.h");
    @cInclude(hardware ++ "tzc_nsec_reg.h");
    @cInclude(hardware ++ "tzc_sec_reg.h");

    // @cInclude(soc_std ++ "bl808_glb.h");
});

pub usingnamespace c;
