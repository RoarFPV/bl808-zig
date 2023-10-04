const mmio = @import("microzig").mmio;

fn Peripheral(comptime addr: u32, comptime PType: type) *volatile PType {
    return @as(*volatile PType, @ptrFromInt(addr));
}
pub const devices = struct {
    ///  Bouffalo BL808 chip
    pub const M0 = struct {
        //pub var bl_fw_header linksection("fw_header") = BootHeader{};

        pub const properties = struct {
            pub const @"cpu.endian" = "little";
            pub const @"cpu.mpuPresent" = "true";
            pub const license =
                \\
                \\Copyright (c) 2022 Bouffalo Lab
                \\bl808-pac is licensed under Mulan PSL v2.
                \\You can use this software according to the terms and conditions of the Mulan PSL v2.
                \\You may obtain a copy of Mulan PSL v2 at:
                \\         http://license.coscl.org.cn/MulanPSL2
                \\THIS SOFTWARE IS PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OF ANY KIND,
                \\EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO NON-INFRINGEMENT,
                \\MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
                \\See the Mulan PSL v2 for more details.
                \\  
            ;
            pub const @"cpu.name" = "M0";
            pub const @"cpu.revision" = "e907";
            pub const @"cpu.nvicPrioBits" = "4";
            pub const @"cpu.vendorSystickConfig" = "false";
            pub const @"cpu.fpuPresent" = "true";
        };

        pub const peripherals = memorymap;
        pub const memorymap = struct {
            pub const GLB = Peripheral(0x20000000, types.peripherals.GLB);
            pub const MIX = Peripheral(0x20001000, types.peripherals.NotFound);
            pub const RF = Peripheral(0x20001000, types.peripherals.NotFound);
            pub const GPIP = Peripheral(0x20002000, types.peripherals.GPIP);
            pub const PHY = Peripheral(0x20002800, types.peripherals.NotFound);
            pub const AGC = Peripheral(0x20002c00, types.peripherals.NotFound);
            pub const SEC_DBG = Peripheral(0x20003000, types.peripherals.NotFound);
            pub const SEC_ENG = Peripheral(0x20004000, types.peripherals.SEC_ENG);
            pub const TZ1 = Peripheral(0x20005000, types.peripherals.NotFound);
            pub const TZC_SEC = Peripheral(0x20005000, types.peripherals.TZC_SEC);
            pub const TZ2 = Peripheral(0x20006000, types.peripherals.NotFound);
            pub const TZC_NSEC = Peripheral(0x20006000, types.peripherals.TZC_NSEC);
            pub const CCI = Peripheral(0x20008000, types.peripherals.CCI);
            pub const MCU_MISC = Peripheral(0x20009000, types.peripherals.MCU_MISC);
            pub const L1C = Peripheral(0x20009000, types.peripherals.NotFound);
            pub const UART0 = Peripheral(0x2000a000, types.peripherals.UART);
            pub const PDM0 = Peripheral(0x2000a000, types.peripherals.NotFound);
            pub const UART1 = Peripheral(0x2000a100, types.peripherals.UART);
            pub const SPI0 = Peripheral(0x2000a200, types.peripherals.SPI);
            pub const I2C0 = Peripheral(0x2000a300, types.peripherals.I2C);
            pub const PWM = Peripheral(0x2000a400, types.peripherals.PWM);
            pub const TIMER0 = Peripheral(0x2000a500, types.peripherals.TIMER);
            pub const IR = Peripheral(0x2000a600, types.peripherals.IR);
            pub const CKS = Peripheral(0x2000a700, types.peripherals.CKS);
            pub const IPC0 = Peripheral(0x2000a800, types.peripherals.NotFound);
            pub const IPC1 = Peripheral(0x2000a840, types.peripherals.NotFound);
            pub const I2C1 = Peripheral(0x2000a900, types.peripherals.I2C);
            pub const UART2 = Peripheral(0x2000aa00, types.peripherals.UART);
            pub const I2S = Peripheral(0x2000ab00, types.peripherals.I2S);
            pub const LZ4D = Peripheral(0x2000ad00, types.peripherals.NotFound);
            pub const QSPI = Peripheral(0x2000b000, types.peripherals.NotFound);
            pub const SF_CTRL = Peripheral(0x2000b000, types.peripherals.SF_CTRL);
            pub const SF_CTRL_BUF = Peripheral(0x2000b600, types.peripherals.NotFound);
            pub const DMA0 = Peripheral(0x2000c000, types.peripherals.DMA);
            pub const PDS = Peripheral(0x2000e000, types.peripherals.PDS);
            pub const HBN = Peripheral(0x2000f000, types.peripherals.HBN);
            pub const AON = Peripheral(0x2000f000, types.peripherals.AON);
            pub const HBN_RAM = Peripheral(0x20010000, types.peripherals.NotFound);
            pub const EMI_MISC = Peripheral(0x20050000, types.peripherals.NotFound);
            pub const PSRAM_CTRL = Peripheral(0x20052000, types.peripherals.NotFound);
            pub const AUDIO = Peripheral(0x20055000, types.peripherals.NotFound);
            pub const EFUSE = Peripheral(0x20056000, types.peripherals.NotFound);
            pub const EF_DATA = Peripheral(0x20056000, types.peripherals.NotFound);
            pub const EF_CTRL = Peripheral(0x20056000, types.peripherals.EF_CTRL);
            pub const SDH = Peripheral(0x20060000, types.peripherals.SDH);
            //pub const EMAC = Peripheral(0x20070000, types.peripherals.EMAC);
            pub const DMA1 = Peripheral(0x20071000, types.peripherals.DMA);
            pub const USB = Peripheral(0x20072000, types.peripherals.NotFound);
            pub const MM_MISC = Peripheral(0x30000000, types.peripherals.MM_MISC);
            pub const DMA2 = Peripheral(0x30001000, types.peripherals.DMA);
            pub const UART3 = Peripheral(0x30002000, types.peripherals.UART);
            pub const I2C2 = Peripheral(0x30003000, types.peripherals.I2C);
            pub const I2C3 = Peripheral(0x30004000, types.peripherals.I2C);
            pub const IPC2 = Peripheral(0x30005000, types.peripherals.NotFound);
            pub const DMA2D = Peripheral(0x30006000, types.peripherals.NotFound);
            pub const CLKRST_CTRL = Peripheral(0x30007000, types.peripherals.NotFound);
            pub const MM_GLB = Peripheral(0x30007000, types.peripherals.MM_GLB);
            pub const SPI1 = Peripheral(0x30008000, types.peripherals.SPI);
            pub const TIMER1 = Peripheral(0x30009000, types.peripherals.TIMER);
            pub const PSRAM_UHS = Peripheral(0x3000f000, types.peripherals.PSRAM_UHS);
            pub const SUB_MISC = Peripheral(0x30010000, types.peripherals.NotFound);
            pub const CAM_FRONT = Peripheral(0x30010000, types.peripherals.CAM_FRONT);
            pub const SUB = Peripheral(0x30011000, types.peripherals.NotFound);
            pub const MM_SUBSYS = Peripheral(0x30011000, types.peripherals.NotFound);
            pub const DVP0 = Peripheral(0x30012000, types.peripherals.NotFound);
            pub const DVP1 = Peripheral(0x30012100, types.peripherals.NotFound);
            pub const DVP2 = Peripheral(0x30012200, types.peripherals.NotFound);
            pub const DVP3 = Peripheral(0x30012300, types.peripherals.NotFound);
            pub const DVP4 = Peripheral(0x30012400, types.peripherals.NotFound);
            pub const DVP5 = Peripheral(0x30012500, types.peripherals.NotFound);
            pub const DVP6 = Peripheral(0x30012600, types.peripherals.NotFound);
            pub const DVP7 = Peripheral(0x30012700, types.peripherals.NotFound);
            pub const DVP_TSRC0 = Peripheral(0x30012800, types.peripherals.NotFound);
            pub const DVP_TSRC1 = Peripheral(0x30012900, types.peripherals.NotFound);
            pub const AXI_CTRL_NR3D = Peripheral(0x30012a00, types.peripherals.NotFound);
            pub const OSD_PROBE = Peripheral(0x30012b00, types.peripherals.NotFound);
            pub const OSD_A = Peripheral(0x30013000, types.peripherals.NotFound);
            pub const OSD_B = Peripheral(0x30014000, types.peripherals.NotFound);
            pub const OSD_DP = Peripheral(0x30015000, types.peripherals.NotFound);
            pub const MIPI = Peripheral(0x3001a000, types.peripherals.NotFound);
            pub const CSI = Peripheral(0x3001a000, types.peripherals.CSI);
            pub const DSI = Peripheral(0x3001a100, types.peripherals.NotFound);
            pub const DBI = Peripheral(0x3001b000, types.peripherals.DBI);
            pub const CODEC_MISC = Peripheral(0x30020000, types.peripherals.CODEC_MISC);
            pub const MJPEG = Peripheral(0x30021000, types.peripherals.MJPEG);
            pub const VIDEO = Peripheral(0x30022000, types.peripherals.NotFound);
            pub const MJPEG_DEC = Peripheral(0x30023000, types.peripherals.NotFound);
            pub const BL_CNN = Peripheral(0x30024000, types.peripherals.NotFound);
            pub const UART = &[_]types.peripherals.UART{ UART0, UART1, UART2, UART3 };
            pub const SPI = &[_]types.peripherals.SPI{ SPI0, SPI1 };
            pub const I2C = &[_]types.peripherals.I2C{ I2C0, I2C1, I2C2, I2C3 };
            pub const TIMER = &[_]types.peripherals.TIMER{ TIMER0, TIMER1 };
            pub const IPC = &[_]types.peripherals.NotFound{ IPC0, IPC1, IPC2 };
            pub const PDM = &[_]types.peripherals.NotFound{PDM0};
            pub const DMA = &[_]types.peripherals.DMA{ DMA0, DMA1, DMA2 };
            pub const DVP = &[_]types.peripherals.NotFound{ DVP0, DVP1, DVP2, DVP3, DVP4, DVP5, DVP6, DVP7 };
            pub const DVP_TSRC = &[_]types.peripherals.NotFound{ DVP_TSRC0, DVP_TSRC1 };
        };
    };
};
pub const types = struct {
    pub const peripherals = struct {
        pub const NotFound = u32;
        pub const ACOMP = @import("peripherals/ACOMP.zig").Type;
        pub const ADC = @import("peripherals/ADC.zig").Type;
        pub const AUADC = @import("peripherals/AUADC.zig").Type;
        pub const AUDAC = @import("peripherals/AUDAC.zig").Type;
        pub const CAM_FRONT = @import("peripherals/CAM_FRONT.zig").Type;
        pub const CAM = @import("peripherals/CAM.zig").Type;
        pub const CKS = @import("peripherals/CKS.zig").Type;
        pub const CSI = @import("peripherals/CSI.zig").Type;
        pub const DAC = @import("peripherals/DAC.zig").Type;
        pub const DBI = @import("peripherals/DBI.zig").Type;
        pub const DMA = @import("peripherals/dma.zig").Type;
        pub const DTSRC = @import("peripherals/DTSRC.zig").Type;
        pub const EF_CTRL = @import("peripherals/EF_CTRL.zig").Type;
        //pub const EMAC = @import("peripherals/EMAC.zig").Type;
        pub const GPIO = @import("peripherals/GPIO.zig").Type;
        pub const I2C = @import("peripherals/I2C.zig").Type;
        pub const I2S = @import("peripherals/I2S.zig").Type;
        pub const IR = @import("peripherals/IR.zig").Type;
        //pub const KYS = @import("peripherals/KYS.zig").Type;
        pub const MJPEG = @import("peripherals/MJPEG.zig").Type;
        pub const PLATFORM_DMA = @import("peripherals/PLATFORM_DMA.zig").Type;
        pub const PWM = @import("peripherals/PWM.zig").Type;
        pub const PWM_V2 = @import("peripherals/PWM_V2.zig").Type;
        pub const RTC = @import("peripherals/RTC.zig").Type;
        pub const SDIO2 = @import("peripherals/SDIO2.zig").Type;
        pub const SEC_ENG = @import("peripherals/SEC_ENG.zig").Type;
        pub const SF_CTRL = @import("peripherals/SF_CTRL.zig").Type;
        pub const SPI = @import("peripherals/SPI.zig").Type;
        pub const TIMER = @import("peripherals/TIMER.zig").Type;
        pub const UART = @import("peripherals/UART.zig").Type;
        pub const USB_V1 = @import("peripherals/USB_V1.zig").Type;
        pub const USB_V2 = @import("peripherals/USB_V2.zig").Type;
        pub const WO = @import("peripherals/WO.zig").Type;
        pub const AON = @import("peripherals/AON.zig").Type;
        pub const CCI = @import("peripherals/CCI.zig").Type;
        pub const CODEC_MISC = @import("peripherals/CODEC_MISC.zig").Type;
        pub const EF_DATA_0 = @import("peripherals/EF_DATA_0.zig").Type;
        pub const EF_DATA_1 = @import("peripherals/EF_DATA_1.zig").Type;
        pub const GLB = @import("peripherals/GLB.zig").Type;
        pub const GPIP = @import("peripherals/GPIP.zig").Type;
        pub const HBN = @import("peripherals/HBN.zig").Type;
        pub const MCU_MISC = @import("peripherals/MCU_MISC.zig").Type;
        pub const MM_GLB = @import("peripherals/MM_GLB.zig").Type;
        pub const MM_MISC = @import("peripherals/MM_MISC.zig").Type;
        pub const PDS = @import("peripherals/PDS.zig").Type;
        pub const PSRAM = @import("peripherals/PSRAM.zig").Type;
        pub const PSRAM_UHS = @import("peripherals/PSRAM_UHS.zig").Type;
        pub const SDH = @import("peripherals/SDH.zig").Type;
        pub const TZC_NSEC = @import("peripherals/TZC_NSEC.zig").Type;
        pub const TZC_SEC = @import("peripherals/TZC_SEC.zig").Type;
    };
};
