//======= GEN_SOURCE
const micro = @import("microzig");
const mmio = micro.mmio;

fn Peripheral(comptime addr: u32, comptime PType: type) *volatile PType {
    return @as(*volatile PType, @ptrFromInt(addr));
}

pub const devices = struct {
    ///  Bouffalo BL808 chip
    pub const M0 = struct {
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

        pub const peripherals = struct {
            ///  Global configuration register
            pub const GLB = Peripheral(0x20000000, types.peripherals.GLB);
            ///  Generic DAC, ADC and ACOMP interface control
            pub const GPIP = Peripheral(0x20002000, types.peripherals.GPIP);
            ///  Automatic Gain Control
            pub const AGC = Peripheral(0x20002c00, types.peripherals.AGC);
            ///  Secure debug configuration
            pub const DEBUG = Peripheral(0x20003000, types.peripherals.DEBUG);
            ///  Digest, Encryption and Signing accelerator
            pub const SEC = Peripheral(0x20004000, types.peripherals.SEC);
            ///  Camera Control Interface
            pub const CCI = Peripheral(0x20008000, types.peripherals.CCI);
            ///  Chip Miscellaneous control
            pub const MISC = Peripheral(0x20009000, types.peripherals.MISC);
            ///  Universal Asynchronous Receiver Transmitter
            pub const UART = Peripheral(0x2000a000, [2]types.peripherals.UART);
            ///  Serial Peripheral Interface
            pub const SPI = Peripheral(0x2000a200, [1]types.peripherals.SPI);
            ///  Inter-Integrated Circuit bus
            pub const I2C = Peripheral(0x2000a300, [2]types.peripherals.I2C);
            ///  Pulse-Width Modulation module
            pub const PWM = Peripheral(0x2000a400, types.peripherals.PWM);
            ///  Timer control
            pub const TIMER = Peripheral(0x2000a500, types.peripherals.TIMER);
            ///  Infrared Remote module
            pub const IR = Peripheral(0x2000a600, types.peripherals.IR);
            ///  Inter-processor Channel
            pub const IPC = Peripheral(0x2000a800, types.peripherals.IPC);
            ///  ISO 11898 communication protocol
            pub const ISO11898 = Peripheral(0x2000aa00, types.peripherals.ISO11898);
            ///  Inter-IC Sound controller
            pub const I2S = Peripheral(0x2000ab00, types.peripherals.I2S);
            ///  Pulse Density Modulation
            pub const PDM = Peripheral(0x2000ac00, types.peripherals.PDM);
            ///  Hardware LZ4 Decompressor
            pub const LZ4D = Peripheral(0x2000ad00, types.peripherals.LZ4D);
            ///  Quad Serial Flash control
            pub const FLASH = Peripheral(0x2000b000, types.peripherals.FLASH);
            ///  Direct Memory Access
            pub const DMA = Peripheral(0x2000c000, [2]types.peripherals.DMA);
            ///  Power-Down Sleep control
            pub const PDS = Peripheral(0x2000e000, types.peripherals.PDS);
            ///  Hibernate (Deep sleep) control
            pub const HBN = Peripheral(0x2000f000, types.peripherals.HBN);
            ///  Always-On function control
            pub const AON = Peripheral(0x2000f800, types.peripherals.AON);
            ///  Pseudo Static Random Access Memory control
            pub const PSRAM = Peripheral(0x20052000, types.peripherals.PSRAM);
            ///  Audio codec controller
            pub const AUDIO = Peripheral(0x20055000, types.peripherals.AUDIO);
            ///  eFuse memory control
            pub const EFUSE = Peripheral(0x20056000, types.peripherals.EFUSE);
            ///  Secure Digital host control
            pub const SDH = Peripheral(0x20060000, types.peripherals.SDH);
            ///  Ethernet Media Access Control
            pub const EMAC = Peripheral(0x20070000, types.peripherals.EMAC);
            ///  Universal Serial Bus host
            pub const USB = Peripheral(0x20072000, types.peripherals.USB);
            ///  Packet Traffic Arbitration
            pub const PTA = Peripheral(0x24920000, types.peripherals.PTA);
            ///  Wireless Fidelity control
            pub const WIFI = Peripheral(0x24b00000, types.peripherals.WIFI);
            ///  Multimedia Global controller
            pub const MMGLB = Peripheral(0x30007000, types.peripherals.MMGLB);
            ///  Codec miscellaneous control
            pub const CODEC = Peripheral(0x30020000, types.peripherals.CODEC);
            ///  Motion JPEG encoder
            pub const MJPEG = Peripheral(0x30021000, types.peripherals.MJPEG);
            ///  H.264 video codec control
            pub const H264 = Peripheral(0x30022000, types.peripherals.H264);
            ///  Bouffalo Convolutional Neural Network
            pub const NPU = Peripheral(0x30024000, types.peripherals.NPU);
        };
    };
};

pub const types = struct {
    pub const peripherals = struct {
        ///  Codec miscellaneous control
        pub const CODEC = extern struct {
            ///  ??
            todo: u32,
        };

        ///  Motion JPEG encoder
        pub const MJPEG = extern struct {
            ///  ??
            todo: u32,
        };

        ///  H.264 video codec control
        pub const H264 = extern struct {
            ///  ??
            todo: u32,
        };

        ///  Bouffalo Convolutional Neural Network
        pub const NPU = extern struct {
            ///  ??
            todo: u32,
        };

        ///  Multimedia Global controller
        pub const MMGLB = extern struct {
            ///  ??
            todo: u32,
        };

        ///  Packet Traffic Arbitration
        pub const PTA = extern struct {
            reserved1024: [1024]u8,
            ///  Peripheral silicon revision
            revision: u32,
            ///  Arbitration configuration register 0
            config_0: mmio.Mmio(packed struct(u32) {
                ///  Enable packet traffic arbitration
                function: u1,
                ///  ??
                wifi: u1,
                reserved4: u2 = 0,
                ///  ??
                priority: u1,
                padding: u27 = 0,
            }),
            ///  ??
            bluetooth_transmit: u32,
            reserved1040: [4]u8,
            ///  ??
            bluetooth_receive: u32,
            reserved1048: [4]u8,
            ///  ??
            wifi_transmit: u32,
            reserved1056: [4]u8,
            ///  ??
            wifi_receive: u32,
            reserved1064: [4]u8,
            ///  ??
            config_1: u32,
        };

        ///  Wireless Fidelity control
        pub const WIFI = extern struct {
            reserved1024: [1024]u8,
            ///  ??
            coex_control_0: u32,
            ///  ??
            coex_pti: u32,
            ///  ??
            coex_state: u32,
            ///  ??
            coex_interrupt: u32,
            ///  ??
            coex_control_1: u32,
        };

        ///  Ethernet Media Access Control
        pub const EMAC = extern struct {
            pub const InterruptState = enum(u1) {
                ///  Has interrupt
                has_interrupt = 0x1,
                ///  No interrupt occurred
                no_interrupt = 0x0,
            };

            pub const InterruptMask = enum(u1) {
                ///  Mask interrupt
                mask = 0x1,
                ///  Unmask interrupt
                unmask = 0x0,
            };

            ///  Interface enables and configurations
            mode: u32,
            ///  Interrupt source register
            interrupt_source: mmio.Mmio(packed struct(u32) {
                ///  Buffer transmitted interrupt state
                buffer_transmitted: InterruptState,
                ///  Transmit error interrupt state
                transmit_error: InterruptState,
                ///  Frame received interrupt state
                frame_received: InterruptState,
                ///  Receive error interrupt state
                receive_error: InterruptState,
                ///  Lack of buffer interrupt state
                busy: InterruptState,
                ///  Control frame transmitted interrupt state
                control_transmit: InterruptState,
                ///  Control frame received interrupt state
                control_receive: InterruptState,
                padding: u25 = 0,
            }),
            ///  Interrupt mask register
            interrupt_mask: mmio.Mmio(packed struct(u32) {
                ///  Buffer transmitted interrupt mask
                buffer_transmitted: InterruptMask,
                ///  Transmit error interrupt mask
                transmit_error: InterruptMask,
                ///  Frame received interrupt mask
                frame_received: InterruptMask,
                ///  Receive error interrupt mask
                receive_error: InterruptMask,
                ///  Lack of buffer interrupt mask
                busy: InterruptMask,
                ///  Control frame transmitted interrupt mask
                control_transmit: InterruptMask,
                ///  Control frame received interrupt mask
                control_receive: InterruptMask,
                padding: u25 = 0,
            }),
            ///  Back-to-back inter-packet gap register
            backed_gap: u32,
            ///  Non back-to-back inter-packet gap register 1
            non_backed_gap_1: u32,
            ///  Non back-to-back inter-packet gap register 2
            non_backed_gap_2: u32,
            ///  Minimum and maximum ethernet frame length
            frame_length: u32,
            ///  Collision time window and maximum retries
            collision: u32,
            ///  Transmit buffer descriptor
            transmit_buffer: u32,
            ///  Control frame function register
            flow_control: u32,
            ///  MII clock divider and premable enable
            mii_mode: u32,
            ///  MII control data, read and scan state
            mii_command: u32,
            ///  Physical layer bus address
            mii_address: u32,
            ///  Write data to MII physcial layer
            control_write: u32,
            ///  Read data from MII physcial layer
            control_read: u32,
            ///  MII bus and link layer state
            mii_state: u32,
            ///  Media Access Control address
            mac_address: [2]u32,
            ///  Hash register
            hash: [2]u32,
            ///  Transmit control register
            transmit_control: u32,
        };

        ///  Secure Digital host control
        pub const SDH = extern struct {
            ///  ??
            todo: u32,
        };

        ///  Audio codec controller
        pub const AUDIO = extern struct {
            ///  ??
            todo: u32,
        };

        ///  Universal Serial Bus host
        pub const USB = struct {};

        ///  Pseudo Static Random Access Memory control
        pub const PSRAM = extern struct {
            ///  ??
            todo: u32,
        };

        ///  Always-On function control
        pub const AON = extern struct {
            ///  ??
            todo: u32,
        };

        ///  Hibernate (Deep sleep) control
        pub const HBN = extern struct {
            ///  Miscellaneous control register
            control: u32,
            ///  Low bits of hibernate time
            time_lo: u32,
            ///  High bits of hibernate time
            time_hi: u32,
            ///  Low bits of Real-Time Clock time
            rtc_time_lo: u32,
            ///  High bits of Real-Time Clock time
            rtc_time_hi: u32,
            ///  Hibernate interrupt contol
            interrupt_mode: u32,
            ///  Hibernate interrupt state
            interrupt_state: u32,
            ///  Clear hibernate interrupt
            interrupt_clear: u32,
            reserved48: [16]u8,
            ///  Global hibernate configuration
            global: u32,
            ///  Static Random-Access Memory hibernate control
            sram: u32,
            reserved512: [456]u8,
            ///  32-kHz internal RC oscillator control
            rc32k: u32,
            ///  External crystal oscillator control
            xtal32k: u32,
            ///  Real-Time Clock control and reset register 0
            rtc_control_0: u32,
            ///  Real-Time Clock control and reset register 1
            rtc_control_1: u32,
        };

        ///  Power-Down Sleep control
        pub const PDS = extern struct {
            reserved2560: [2560]u8,
            ///  ??
            touch_config: u32,
            ///  ??
            touch_channel: u32,
            ///  ??
            touch_process: u32,
            ///  ??
            touch_sleep: u32,
            ///  ??
            touch_delay: u32,
            ///  ??
            touch_force: [6]u32,
            ///  ??
            touch_voltage: [3]u32,
            ///  ??
            touch_raw: [12]u32,
            reserved2764: [100]u8,
            ///  ??
            touch_interrupt_0: u32,
            ///  ??
            touch_interrupt_1: u32,
        };

        ///  Direct Memory Access
        pub const DMA = extern struct {
            ///  ??
            todo: u32,
            padding: [508]u8,
        };

        ///  Quad Serial Flash control
        pub const FLASH = extern struct {
            ///  ??
            todo: u32,
        };

        ///  Hardware LZ4 Decompressor
        pub const LZ4D = extern struct {
            pub const InterruptEnable = enum(u1) {
                ///  Enable interrupt
                enable = 0x1,
                ///  Disable interrupt
                disable = 0x0,
            };

            pub const InterruptState = enum(u1) {
                ///  Has interrupt
                has_interrupt = 0x1,
                ///  No interrupt occurred
                no_interrupt = 0x0,
            };

            ///  Decompressor peripheral configuration
            config: mmio.Mmio(packed struct(u32) {
                ///  Enable peripheral decompression
                enable: u1,
                ///  Suspend peripheral decompression
                _suspend: u1,
                reserved4: u2 = 0,
                ///  Does this block includes an LZ4 checksum?
                ///  Users should read checksum flag from frame descriptor to fill in correct value for this register field.
                has_checksum: u1,
                padding: u27 = 0,
            }),
            reserved16: [12]u8,
            ///  Writes source address before decompression
            source_start: mmio.Mmio(packed struct(u32) {
                ///  Start address
                start: u26,
                ///  Address base
                base: u6,
            }),
            ///  Reads the end address of source after decompression
            source_end: mmio.Mmio(packed struct(u32) {
                ///  End of address
                end: u26,
                padding: u6 = 0,
            }),
            ///  Writes destination address before decompression
            destination_start: mmio.Mmio(packed struct(u32) {
                ///  Start address
                start: u26,
                ///  Address base
                base: u6,
            }),
            ///  Reads the end address of destination after decompression
            destination_end: mmio.Mmio(packed struct(u32) {
                ///  End of address
                end: u26,
                padding: u6 = 0,
            }),
            ///  Interrupt enable register
            interrupt_enable: mmio.Mmio(packed struct(u32) {
                ///  Decompliation finished
                done: InterruptEnable,
                ///  Error occurred while decompliation
                @"error": InterruptEnable,
                padding: u30 = 0,
            }),
            ///  Interrupt state register
            interrupt_state: mmio.Mmio(packed struct(u32) {
                ///  Decompliation finished
                done: InterruptState,
                ///  Error occurred while decompliation
                @"error": InterruptState,
                padding: u30 = 0,
            }),
        };

        ///  Pulse Density Modulation
        pub const PDM = extern struct {
            ///  ??
            todo: u32,
        };

        ///  Inter-IC Sound controller
        pub const I2S = extern struct {
            pub const HasUnderflow = enum(u1) {
                ///  No FIFO buffer underflow
                not_underflow = 0x0,
                ///  Has FIFO buffer underflow
                underflow = 0x1,
            };

            pub const HasOverflow = enum(u1) {
                ///  No FIFO buffer overflow
                not_overflow = 0x0,
                ///  Has FIFO buffer overflow
                overflow = 0x1,
            };

            pub const FlagClear = enum(u1) {
                ///  Write 1 to clear fifo flags
                clear = 0x1,
                _,
            };

            pub const DmaEnable = enum(u1) {
                ///  Enable DMA interface
                enable = 0x1,
                ///  Disable DMA interface
                disable = 0x0,
            };

            ///  Function configuration register
            config: u32,
            ///  Interrupt enables, masks and states
            interrupt_state: u32,
            reserved16: [8]u8,
            ///  Base clock divider
            base_clock: mmio.Mmio(packed struct(u32) {
                ///  Lower half of base clock dividing factor
                divide_low: u12,
                reserved16: u4 = 0,
                ///  Higher half of base clock dividing factor
                divide_high: u12,
                padding: u4 = 0,
            }),
            reserved128: [108]u8,
            ///  FIFO configuration register 0
            fifo_config_0: mmio.Mmio(packed struct(u32) {
                ///  Enable signal of transmit DMA interface
                transmit_dma: DmaEnable,
                ///  Enable signal of receive DMA interface
                receive_dma: DmaEnable,
                ///  Clears transmit FIFO overflow and underflow flags
                transmit_clear: FlagClear,
                ///  Clears receive FIFO overflow and underflow flags
                receive_clear: FlagClear,
                ///  Transmit FIFO overflow flag
                ///  Can be cleared using `transmit_clear`.
                transmit_overflow: HasOverflow,
                ///  Transmit FIFO underflow flag
                ///  Can be cleared using `transmit_clear`.
                transmit_underflow: HasUnderflow,
                ///  Receive FIFO overflow flag
                ///  Can be cleared using `receive_clear`.
                receive_overflow: HasOverflow,
                ///  Receive FIFO underflow flag
                ///  Can be cleared using `receive_clear`.
                receive_underflow: HasUnderflow,
                merge_left_right: u1,
                swap_left_right: u1,
                left_justified: u1,
                padding: u21 = 0,
            }),
            ///  FIFO configuration register 1
            fifo_config_1: mmio.Mmio(packed struct(u32) {
                ///  Count of available data in transmit FIFO
                transmit_count: u5,
                reserved8: u3 = 0,
                ///  Count of available data in receive FIFO
                receive_count: u5,
                reserved16: u3 = 0,
                ///  Transmit FIFO threshold
                ///  DMA request will not be asserted if `transmit_available` is less than this value
                transmit_threshold: u4,
                reserved24: u4 = 0,
                ///  Receive FIFO threshold
                ///  DMA request will not be asserted if `receive_available` is less than this value
                receive_threshold: u4,
                padding: u4 = 0,
            }),
            ///  FIFO write data register
            data_write: mmio.Mmio(packed struct(u32) {
                ///  Write data to FIFO
                value: u8,
                padding: u24 = 0,
            }),
            ///  FIFO read data register
            data_read: mmio.Mmio(packed struct(u32) {
                ///  Read data from FIFO
                value: u8,
                padding: u24 = 0,
            }),
        };

        ///  ISO 11898 communication protocol
        pub const ISO11898 = extern struct {
            ///  ??
            todo: u32,
        };

        ///  Inter-processor Channel
        pub const IPC = extern struct {
            ///  ??
            todo: u32,
        };

        ///  Infrared Remote module
        pub const IR = extern struct {
            ///  ??
            transmit_config: u32,
            ///  ??
            transmit_interrupt: u32,
            ///  ??
            transmit_data: [2]u32,
            ///  ??
            transmit_width: u32,
            reserved128: [108]u8,
            ///  ??
            receive_config: u32,
            ///  ??
            receive_interrupt: u32,
            ///  ??
            receive_width: u32,
            reserved144: [4]u8,
            ///  ??
            receive_bit_count: u32,
            ///  ??
            receive_data: [2]u32,
        };

        ///  Timer control
        pub const TIMER = extern struct {
            ///  ??
            todo: u32,
        };

        ///  Pulse-Width Modulation module
        pub const PWM = extern struct {
            ///  Interrupt state and clear register
            interrupt_config: u32,
        };

        ///  Inter-Integrated Circuit bus
        pub const I2C = extern struct {
            pub const InterruptEnable = enum(u1) {
                ///  Enable interrupt
                enable = 0x1,
                ///  Disable interrupt
                disable = 0x0,
            };

            pub const InterruptClear = enum(u1) {
                ///  Write 1 to clear interrupt state
                clear = 0x1,
                _,
            };

            pub const InterruptMask = enum(u1) {
                ///  Mask interrupt
                mask = 0x1,
                ///  Unmask interrupt
                unmask = 0x0,
            };

            pub const InterruptState = enum(u1) {
                ///  Has interrupt
                has_interrupt = 0x1,
                ///  No interrupt occurred
                no_interrupt = 0x0,
            };

            pub const HasUnderflow = enum(u1) {
                ///  No FIFO buffer underflow
                not_underflow = 0x0,
                ///  Has FIFO buffer underflow
                underflow = 0x1,
            };

            pub const HasOverflow = enum(u1) {
                ///  No FIFO buffer overflow
                not_overflow = 0x0,
                ///  Has FIFO buffer overflow
                overflow = 0x1,
            };

            pub const FlagClear = enum(u1) {
                ///  Write 1 to clear fifo flags
                clear = 0x1,
                _,
            };

            pub const DmaEnable = enum(u1) {
                ///  Enable DMA interface
                enable = 0x1,
                ///  Disable DMA interface
                disable = 0x0,
            };

            ///  Function configuration register
            config: mmio.Mmio(packed struct(u32) {
                ///  Enable signal of I2C master function
                ///  Asserting this bit will trigger the transaction, and should be de-asserted after finish.
                master_enable: enum(u1) {
                    ///  Enable I2C master function
                    enable = 0x1,
                    ///  Disable I2C master function
                    disable = 0x0,
                },
                ///  Packet transfer direction
                transfer_direction: enum(u1) {
                    ///  Write from master side
                    write = 0x0,
                    ///  Read from master side
                    read = 0x1,
                },
                ///  Enable de-glitch function on all input pins
                deglitch_enable: enum(u1) {
                    ///  Enable de-glitch function on inputs
                    enable = 0x1,
                    ///  Disable de-glitch function on inputs
                    disable = 0x0,
                },
                ///  Enable I2C clock synchronization
                ///  Enable this bit to support multi-master and clock-stretching. It should not be turned-off normally.
                clock_synchronize: enum(u1) {
                    ///  Enable clock synchronization
                    enable = 0x1,
                    ///  Disable clock synchronization
                    disable = 0x0,
                },
                ///  Enable sub-address fields
                sub_address_enable: enum(u1) {
                    ///  Enable sub-address fields
                    enable = 0x1,
                    ///  Disable sub-address fields
                    disable = 0x0,
                },
                ///  Byte count for I2C sub-address
                sub_address_length: enum(u2) {
                    ///  Sub-addresses include 1 byte
                    one = 0x0,
                    ///  Sub-addresses include 2 bytes
                    two = 0x1,
                    ///  Sub-addresses include 3 bytes
                    three = 0x2,
                    ///  Sub-addresses include 4 bytes
                    four = 0x3,
                },
                reserved8: u1 = 0,
                ///  I2C transaction slave address
                slave_address: u7,
                reserved16: u1 = 0,
                ///  Byte count for each packet
                packet_length: u8,
                reserved28: u4 = 0,
                ///  De-glitch function cycle count
                deglitch_cycle: u4,
            }),
            ///  Interrupt enables, states and masks
            interrupt: mmio.Mmio(packed struct(u32) {
                ///  Transfer ended interrupt state
                transfer_end_state: InterruptState,
                ///  Transmit FIFO ready interrupt state
                ///  Auto cleared when data is pushed into transmit FIFO.
                transmit_fifo_ready_state: InterruptState,
                ///  Receive FIFO ready interrupt state
                ///  Auto cleared when data is popped from receive FIFO.
                receive_fifo_ready_state: InterruptState,
                ///  Not-acknowledged response interrupt state
                not_acknowledged_state: InterruptState,
                ///  Arbitration lost interrupt state
                arbitrate_lost_state: InterruptState,
                ///  Transmit or receive FIFO error interrupt state
                ///  Auto cleared when FIFO overflow or underflow error flag is cleared.
                fifo_error_state: InterruptState,
                reserved8: u2 = 0,
                ///  Transfer ended interrupt mask
                transfer_end_mask: InterruptMask,
                ///  Transmit FIFO ready interrupt mask
                transmit_fifo_ready_mask: InterruptMask,
                ///  Receive FIFO ready interrupt mask
                receive_fifo_ready_mask: InterruptMask,
                ///  Not-acknowledged response interrupt mask
                not_acknowledged_mask: InterruptMask,
                ///  Arbitration lost interrupt mask
                arbitrate_lost_mask: InterruptMask,
                ///  Transmit or receive FIFO error interrupt mask
                fifo_error_mask: InterruptMask,
                reserved16: u2 = 0,
                ///  Write 1 to clear transfer ended
                transfer_end_clear: InterruptClear,
                reserved19: u2 = 0,
                ///  Write 1 to clear not-acknowledged response
                not_acknowledged_clear: InterruptClear,
                ///  Write 1 to clear arbitration lost
                arbitrate_lost_clear: InterruptClear,
                reserved24: u3 = 0,
                ///  Transfer ended interrupt enable
                transfer_end_enable: InterruptEnable,
                ///  Transmit FIFO ready interrupt enable
                transmit_fifo_ready_enable: InterruptEnable,
                ///  Receive FIFO ready interrupt enable
                receive_fifo_ready_enable: InterruptEnable,
                ///  Not-acknowledged response interrupt enable
                not_acknowledged_enable: InterruptEnable,
                ///  Arbitration lost interrupt enable
                arbitrate_lost_enable: InterruptEnable,
                ///  Transmit or receive FIFO error interrupt enable
                fifo_error_enable: InterruptEnable,
                padding: u2 = 0,
            }),
            ///  Register address of slave device
            sub_address: mmio.Mmio(packed struct(u32) {
                ///  I2C sub-address byte %s
                byte: [4]u8,
            }),
            ///  Bus busy state indicator
            bus_busy: mmio.Mmio(packed struct(u32) {
                ///  Indicator to I2C bus busy signal
                busy: enum(u1) {
                    ///  Bus is busy
                    busy = 0x1,
                    ///  Bus is not busy
                    idle = 0x0,
                },
                ///  Force clear I2C bus busy state
                ///  Not for normal use; only use when I2C bus hangs
                force_clear: enum(u1) {
                    ///  Write 1 to force clear busy flag
                    clear = 0x1,
                    _,
                },
                padding: u30 = 0,
            }),
            ///  Duration of start phase
            period_start: mmio.Mmio(packed struct(u32) {
                ///  Length of start condition phase %s
                phase: [4]u8,
            }),
            ///  Duration of stop phase
            period_stop: mmio.Mmio(packed struct(u32) {
                ///  Length of stop condition phase %s
                phase: [4]u8,
            }),
            ///  Duration of data phase
            period_data: mmio.Mmio(packed struct(u32) {
                ///  Length of data condition phase %s
                phase: [4]u8,
            }),
            reserved128: [100]u8,
            ///  FIFO configuration register 0
            fifo_config_0: mmio.Mmio(packed struct(u32) {
                ///  Enable signal of transmit DMA interface
                transmit_dma: DmaEnable,
                ///  Enable signal of receive DMA interface
                receive_dma: DmaEnable,
                ///  Clears transmit FIFO overflow and underflow flags
                transmit_clear: FlagClear,
                ///  Clears receive FIFO overflow and underflow flags
                receive_clear: FlagClear,
                ///  Transmit FIFO overflow flag
                ///  Can be cleared using `transmit_clear`.
                transmit_overflow: HasOverflow,
                ///  Transmit FIFO underflow flag
                ///  Can be cleared using `transmit_clear`.
                transmit_underflow: HasUnderflow,
                ///  Receive FIFO overflow flag
                ///  Can be cleared using `receive_clear`.
                receive_overflow: HasOverflow,
                ///  Receive FIFO underflow flag
                ///  Can be cleared using `receive_clear`.
                receive_underflow: HasUnderflow,
                padding: u24 = 0,
            }),
            ///  FIFO configuration register 1
            fifo_config_1: mmio.Mmio(packed struct(u32) {
                ///  Count of available data in transmit FIFO
                transmit_count: u2,
                reserved8: u6 = 0,
                ///  Count of available data in receive FIFO
                receive_count: u2,
                reserved16: u6 = 0,
                ///  Transmit FIFO threshold
                ///  DMA request will not be asserted if `transmit_available` is less than this value
                transmit_threshold: u1,
                reserved24: u7 = 0,
                ///  Receive FIFO threshold
                ///  DMA request will not be asserted if `receive_available` is less than this value
                receive_threshold: u1,
                padding: u7 = 0,
            }),
            ///  FIFO write data register
            data_write: mmio.Mmio(packed struct(u32) {
                ///  Write data to FIFO
                value: u8,
                padding: u24 = 0,
            }),
            ///  FIFO read data register
            data_read: mmio.Mmio(packed struct(u32) {
                ///  Read data from FIFO
                value: u8,
                padding: u24 = 0,
            }),
            padding: [1392]u8,
        };

        ///  Serial Peripheral Interface
        pub const SPI = extern struct {
            ///  Function configuration register
            config: u32,
            ///  Interrupt enables, masks and states
            interrupt_state: u32,
            ///  Bus busy state indicator
            bus_busy: u32,
            reserved16: [4]u8,
            ///  Duration of control signals
            period_control: u32,
            ///  Interval bitween frames
            period_interval: u32,
            ///  Receive ignore index configuration
            ignore_index: u32,
            ///  Slave mode transmit timeout values
            timeout: u32,
            reserved128: [96]u8,
            ///  FIFO configuration register 0
            fifo_config_0: u32,
            ///  FIFO configuration register 1
            fifo_config_1: u32,
            ///  FIFO write data register
            data_write: u32,
            ///  FIFO read data register
            data_read: u32,
            padding: [112]u8,
        };

        ///  Universal Asynchronous Receiver Transmitter
        pub const UART = extern struct {
            pub const SignalAssert = enum(u1) {
                ///  Assert this signal
                high = 0x1,
                ///  Deassert this signal
                low = 0x0,
            };

            pub const OverrideEnable = enum(u1) {
                ///  Enable manual override of this signal
                enable = 0x1,
                ///  Disable manual override of this signal
                disable = 0x0,
            };

            pub const InterruptState = enum(u1) {
                ///  Has interrupt
                has_interrupt = 0x1,
                ///  No interrupt occurred
                no_interrupt = 0x0,
            };

            pub const InterruptMask = enum(u1) {
                ///  Mask interrupt
                mask = 0x1,
                ///  Unmask interrupt
                unmask = 0x0,
            };

            pub const InterruptClear = enum(u1) {
                ///  Write 1 to clear interrupt state
                clear = 0x1,
                _,
            };

            pub const InterruptEnable = enum(u1) {
                ///  Enable interrupt
                enable = 0x1,
                ///  Disable interrupt
                disable = 0x0,
            };

            pub const BusBusy = enum(u1) {
                ///  Bus is busy
                busy = 0x1,
                ///  Bus is not busy
                idle = 0x0,
            };

            pub const Polarity = enum(u1) {
                ///  Driver Enable (DE) pin is active high
                active_high = 0x1,
                ///  Driver Enable (DE) pin is active low
                active_low = 0x0,
            };

            pub const HasUnderflow = enum(u1) {
                ///  No FIFO buffer underflow
                not_underflow = 0x0,
                ///  Has FIFO buffer underflow
                underflow = 0x1,
            };

            pub const HasOverflow = enum(u1) {
                ///  No FIFO buffer overflow
                not_overflow = 0x0,
                ///  Has FIFO buffer overflow
                overflow = 0x1,
            };

            pub const FlagClear = enum(u1) {
                ///  Write 1 to clear fifo flags
                clear = 0x1,
                _,
            };

            pub const DmaEnable = enum(u1) {
                ///  Enable DMA interface
                enable = 0x1,
                ///  Disable DMA interface
                disable = 0x0,
            };

            ///  Transmit configuration register
            transmit_config: mmio.Mmio(packed struct(u32) {
                ///  Enable transmit function
                function: enum(u1) {
                    ///  Enable UART receive function signal
                    enable = 0x1,
                    ///  Disable UART receive function signal
                    disable = 0x0,
                },
                ///  Enable Clear-to-Send flow control signal
                cts: enum(u1) {
                    ///  Enable Clear-to-Send flow control signal
                    enable = 0x1,
                    ///  Disable Clear-to-Send flow control signal
                    disable = 0x0,
                },
                ///  Enable freerun mode
                freerun: enum(u1) {
                    ///  Enable freerun mode
                    enable = 0x1,
                    ///  Disable freerun mode
                    disable = 0x0,
                },
                ///  Local Interconnect Network protocol enable
                lin_transmit: enum(u1) {
                    ///  Enable Local Interconnect Network protocol
                    enable = 0x1,
                    ///  Disable Local Interconnect Network protocol
                    disable = 0x0,
                },
                ///  Enable transmit parity check
                parity_enable: enum(u1) {
                    ///  Enable transmit parity check
                    enable = 0x1,
                    ///  Disable transmit parity check
                    disable = 0x0,
                },
                ///  Select transmit parity mode if enabled
                parity_mode: enum(u1) {
                    ///  Odd parity if `parity_enable` is set
                    odd = 0x1,
                    ///  Even parity if `parity_enable` is set
                    even = 0x0,
                },
                ///  Enable IR transmit mode
                ir_transmit: enum(u1) {
                    ///  Enable IR transmit mode
                    enable = 0x1,
                    ///  Disable IR transmit mode
                    disable = 0x0,
                },
                ///  Inverse transmit signal output in IR mode
                ir_inverse: enum(u1) {
                    ///  Inverse transmit input in IR mode
                    inverse = 0x1,
                    ///  Don't inverse transmit input in IR mode
                    no_inverse = 0x0,
                },
                ///  Bit count for each transmit data word
                word_length: enum(u3) {
                    ///  Each word includes 5 bits
                    five = 0x4,
                    ///  Each word includes 6 bits
                    six = 0x5,
                    ///  Each word includes 7 bits
                    seven = 0x6,
                    ///  Each word includes 8 bits
                    eight = 0x7,
                    _,
                },
                ///  Number of stop bits
                stop_bits: enum(u2) {
                    ///  0.5 stop bits
                    zero_p_five = 0x0,
                    ///  1 stop bit
                    one = 0x1,
                    ///  1.5 stop bits
                    one_p_five = 0x2,
                    ///  2 stop bits
                    two = 0x3,
                },
                ///  Number of break bits for LIN protocol
                break_bits: u3,
                ///  Length of words per UART transmit transfer
                ///  This field is ignored when `freerun` mode is enabled.
                transfer_length: u16,
            }),
            ///  Receive configuration register
            receive_config: mmio.Mmio(packed struct(u32) {
                ///  Enable receive function
                function: enum(u1) {
                    ///  Enable UART receive function signal
                    enable = 0x1,
                    ///  Disable UART receive function signal
                    disable = 0x0,
                },
                ///  Enable receive auto baudrate detection
                auto_baudrate: enum(u1) {
                    ///  Enable auto baudrate upon receive
                    enable = 0x1,
                    ///  Disable auto baudrate upon receive
                    disable = 0x0,
                },
                reserved3: u1 = 0,
                ///  Local Interconnect Network protocol enable
                lin_receive: enum(u1) {
                    ///  Enable Local Interconnect Network protocol
                    enable = 0x1,
                    ///  Disable Local Interconnect Network protocol
                    disable = 0x0,
                },
                ///  Enable receive parity check
                parity_enable: enum(u1) {
                    ///  Enable receive parity check
                    enable = 0x1,
                    ///  Disable receive parity check
                    disable = 0x0,
                },
                ///  Select receive parity mode if enabled
                parity_mode: enum(u1) {
                    ///  Odd parity if `parity_enable` is set
                    odd = 0x1,
                    ///  Even parity if `parity_enable` is set
                    even = 0x0,
                },
                ///  Enable IR receive mode
                ir_receive: enum(u1) {
                    ///  Enable IR receive mode
                    enable = 0x1,
                    ///  Disable IR receive mode
                    disable = 0x0,
                },
                ///  Inverse receive signal output in IR mode
                ir_inverse: enum(u1) {
                    ///  Inverse receive input in IR mode
                    inverse = 0x1,
                    ///  Don't inverse receive input in IR mode
                    no_inverse = 0x0,
                },
                ///  Bit count for each receive data word
                word_length: enum(u3) {
                    ///  Each word includes 5 bits
                    five = 0x4,
                    ///  Each word includes 6 bits
                    six = 0x5,
                    ///  Each word includes 7 bits
                    seven = 0x6,
                    ///  Each word includes 8 bits
                    eight = 0x7,
                    _,
                },
                ///  Enable receive de-glitch function
                deglitch_enable: enum(u1) {
                    ///  Enable de-glitch function upon receive
                    enable = 0x1,
                    ///  Disable de-glitch function upon receive
                    disable = 0x0,
                },
                ///  De-glitch function cycle count
                deglitch_cycle: u4,
                ///  Length of words per UART receive transfer
                transfer_length: u16,
            }),
            ///  Bit period control register
            bit_period: mmio.Mmio(packed struct(u32) {
                ///  Period of each transmit bit
                ///  Add 1 to this value and divide by clock to get transmit baudrate.
                transmit: u16,
                ///  Period of each receive bit
                ///  Add 1 to this value and divide by clock to get receive baudrate.
                receive: u16,
            }),
            ///  Data configuration register
            data_config: mmio.Mmio(packed struct(u32) {
                ///  Enable bit inverse in each data word
                bit_order: enum(u1) {
                    ///  Each byte is sent out MSB-first
                    inverse = 0x1,
                    ///  Each byte is sent out LSB-first
                    no_inverse = 0x0,
                },
                padding: u31 = 0,
            }),
            ///  IR-mode transmit position control
            transmit_position: mmio.Mmio(packed struct(u32) {
                ///  Start position of transmit IR pulse
                start: u16,
                ///  Stop position of transmit IR pulse
                stop: u16,
            }),
            ///  IR-mode receive position control
            receive_position: mmio.Mmio(packed struct(u32) {
                ///  Start position of received pulse recovered from IR signal
                start: u16,
                padding: u16 = 0,
            }),
            ///  Receive Time-Out interrupt control
            receive_timeout: mmio.Mmio(packed struct(u32) {
                ///  Timeout interrupt triggering value by bits received
                value: u8,
                padding: u24 = 0,
            }),
            ///  Manual override of flow control signal
            signal_override: mmio.Mmio(packed struct(u32) {
                ///  Enable manual override of transmit signal
                transmit_signal: OverrideEnable,
                ///  Value to override transmit signal if override is enabled
                transmit_value: SignalAssert,
                ///  Enable manual override of Request-to-Send flow control signal
                rts_signal: OverrideEnable,
                ///  Value to override Request-to-Send signal if override is enabled
                rts_value: SignalAssert,
                padding: u28 = 0,
            }),
            ///  Interrupt state register
            interrupt_state: mmio.Mmio(packed struct(u32) {
                ///  Transmit transfer finish signal raised
                transmit_transfer: InterruptState,
                ///  Receive transfer finish signal raised
                receive_transfer: InterruptState,
                ///  Transmit FIFO ready signal raised
                transmit_fifo_ready: InterruptState,
                ///  Receive FIFO ready signal raised
                receive_fifo_ready: InterruptState,
                ///  Receive timed-out interrupt occurred
                receive_timeout: InterruptState,
                ///  Receive parity check failure occurred
                receive_parity: InterruptState,
                ///  Transmit FIFO overflow or underflow occurred
                transmit_fifo_error: InterruptState,
                ///  Receive FIFO overflow or underflow occurred
                receive_fifo_error: InterruptState,
                ///  Receive LIN mode synchronization field error occurred
                receive_sync_error: InterruptState,
                ///  Receive byte count reached occurred
                receive_byte_count: InterruptState,
                ///  Receive auto baudrate detection finished using start bit occurred
                auto_baudrate_start_bit: InterruptState,
                ///  Receive auto baudrate detection finished using 0x55 occurred
                auto_baudrate_five_five: InterruptState,
                padding: u20 = 0,
            }),
            ///  Interrupt mask register
            interrupt_mask: mmio.Mmio(packed struct(u32) {
                ///  Transmit transfer finish signal interrupt mask
                transmit_transfer: InterruptMask,
                ///  Receive transfer finish signal interrupt mask
                receive_transfer: InterruptMask,
                ///  Transmit FIFO ready signal interrupt mask
                transmit_fifo_ready: InterruptMask,
                ///  Receive FIFO ready signal interrupt mask
                receive_fifo_ready: InterruptMask,
                ///  Receive timed-out interrupt mask
                receive_timeout: InterruptMask,
                ///  Receive parity check failure interrupt mask
                receive_parity: InterruptMask,
                ///  Transmit FIFO overflow or underflow interrupt mask
                transmit_fifo_error: InterruptMask,
                ///  Receive FIFO overflow or underflow interrupt mask
                receive_fifo_error: InterruptMask,
                ///  Receive LIN mode synchronization field error interrupt mask
                receive_sync_error: InterruptMask,
                ///  Receive byte count reached interrupt mask
                receive_byte_count: InterruptMask,
                ///  Receive auto baudrate detection finished using start bit interrupt mask
                auto_baudrate_start_bit: InterruptMask,
                ///  Receive auto baudrate detection finished using 0x55 occurred
                auto_baudrate_five_five: InterruptMask,
                padding: u20 = 0,
            }),
            ///  Clear interrupt register
            interrupt_clear: mmio.Mmio(packed struct(u32) {
                ///  Write 1 to clear transmit transfer finish signal
                transmit_transfer: InterruptClear,
                ///  Write 1 to clear receive transfer finish signal
                receive_transfer: InterruptClear,
                reserved4: u2 = 0,
                ///  Write 1 to clear receive timed-out
                receive_timeout: InterruptClear,
                ///  Write 1 to clear receive parity check failure
                receive_parity: InterruptClear,
                reserved8: u2 = 0,
                ///  Write 1 to clear receive LIN mode synchronization field error
                receive_sync_error: InterruptClear,
                ///  Write 1 to clear receive byte count reached
                receive_byte_count: InterruptClear,
                ///  Write 1 to clear receive auto baudrate detection finished using start bit
                auto_baudrate_start_bit: InterruptClear,
                ///  Write 1 to clear receive auto baudrate detection finished using 0x55
                auto_baudrate_five_five: InterruptClear,
                padding: u20 = 0,
            }),
            ///  Interrupt enable register
            interrupt_enable: mmio.Mmio(packed struct(u32) {
                ///  Transmit transfer signal interrupt enable
                transmit_transfer: InterruptEnable,
                ///  Receive transfer signal interrupt enable
                receive_transfer: InterruptEnable,
                ///  Transmit FIFO ready signal interrupt enable
                transmit_fifo_ready: InterruptEnable,
                ///  Receive FIFO ready signal interrupt enable
                receive_fifo_ready: InterruptEnable,
                ///  Receive timed-out interrupt enable
                receive_timeout: InterruptEnable,
                ///  Receive parity check failure interrupt enable
                receive_parity: InterruptEnable,
                ///  Transmit FIFO overflow or underflow interrupt enable
                transmit_fifo_error: InterruptEnable,
                ///  Receive FIFO overflow or underflow interrupt enable
                receive_fifo_error: InterruptEnable,
                ///  Receive LIN mode synchronization field error interrupt enable
                receive_sync_error: InterruptEnable,
                ///  Receive byte count reached interrupt enable
                receive_byte_count: InterruptEnable,
                ///  Receive auto baudrate detection finished using start bit interrupt enable
                auto_baudrate_start_bit: InterruptEnable,
                ///  Receive auto baudrate detection finished using 0x55 interrupt enable
                auto_baudrate_five_five: InterruptEnable,
                padding: u20 = 0,
            }),
            ///  Bus state register
            bus_state: mmio.Mmio(packed struct(u32) {
                ///  Indicates that UART transmit bus is busy
                transmit_busy: BusBusy,
                ///  Indicates that UART receive bus is busy
                receive_busy: BusBusy,
                padding: u30 = 0,
            }),
            ///  Auto baudrate detection register
            auto_baudrate: mmio.Mmio(packed struct(u32) {
                ///  Bit period of auto baudrate detection using start bit
                by_start_bit: u16,
                ///  Bit period of auto baudrate detection using codeword 0x55
                by_five_five: u16,
            }),
            reserved72: [16]u8,
            ///  Pulse width tolerance for auto baudrate
            pulse_tolerance: mmio.Mmio(packed struct(u32) {
                ///  Pulse width tolerance of auto baudrate detection using codeword 0x55
                by_five_five: u8,
                padding: u24 = 0,
            }),
            reserved84: [8]u8,
            ///  RS-485 mode transmit configuration
            rs485_transmit: mmio.Mmio(packed struct(u32) {
                ///  RS-485 transceiver mode enable
                function: enum(u1) {
                    ///  Enable RS-485 transceiver mode
                    ///  The peripheral is connected to RS-485 transceiver, and RTS signal output becomes Driver Enable (DE) signal.
                    enable = 0x1,
                    ///  Disable RS-485 transceiver mode
                    ///  The peripheral operates as normal UART.
                    disable = 0x0,
                },
                ///  RS-485 pin polarity of Driver Enable (DE) pin
                polarity: Polarity,
                padding: u30 = 0,
            }),
            reserved128: [40]u8,
            ///  FIFO configuration register 0
            fifo_config_0: mmio.Mmio(packed struct(u32) {
                ///  Enable signal of transmit DMA interface
                transmit_dma: DmaEnable,
                ///  Enable signal of receive DMA interface
                receive_dma: DmaEnable,
                ///  Clears transmit FIFO overflow and underflow flags
                transmit_clear: FlagClear,
                ///  Clears receive FIFO overflow and underflow flags
                receive_clear: FlagClear,
                ///  Transmit FIFO overflow flag
                ///  Can be cleared using `transmit_clear`.
                transmit_overflow: HasOverflow,
                ///  Transmit FIFO underflow flag
                ///  Can be cleared using `transmit_clear`.
                transmit_underflow: HasUnderflow,
                ///  Receive FIFO overflow flag
                ///  Can be cleared using `receive_clear`.
                receive_overflow: HasOverflow,
                ///  Receive FIFO underflow flag
                ///  Can be cleared using `receive_clear`.
                receive_underflow: HasUnderflow,
                padding: u24 = 0,
            }),
            ///  FIFO configuration register 1
            fifo_config_1: mmio.Mmio(packed struct(u32) {
                ///  Count of available data in transmit FIFO
                transmit_count: u6,
                reserved8: u2 = 0,
                ///  Count of available data in receive FIFO
                receive_count: u6,
                reserved16: u2 = 0,
                ///  Transmit FIFO threshold
                ///  DMA request will not be asserted if `transmit_available` is less than this value
                transmit_threshold: u5,
                reserved24: u3 = 0,
                ///  Receive FIFO threshold
                ///  DMA request will not be asserted if `receive_available` is less than this value
                receive_threshold: u5,
                padding: u3 = 0,
            }),
            ///  FIFO write data register
            data_write: mmio.Mmio(packed struct(u32) {
                ///  Write data to FIFO
                value: u8,
                padding: u24 = 0,
            }),
            ///  FIFO read data register
            data_read: mmio.Mmio(packed struct(u32) {
                ///  Read data from FIFO
                value: u8,
                padding: u24 = 0,
            }),
            padding: [112]u8,
        };

        ///  Chip Miscellaneous control
        pub const MISC = extern struct {
            ///  ??
            todo: u32,
        };

        ///  Camera Control Interface
        pub const CCI = extern struct {
            ///  ??
            todo: u32,
        };

        ///  eFuse memory control
        pub const EFUSE = extern struct {
            ///  ??
            todo: u32,
        };

        ///  Digest, Encryption and Signing accelerator
        pub const SEC = extern struct {
            ///  ??
            todo: u32,
        };

        ///  Secure debug configuration
        pub const DEBUG = extern struct {
            ///  Unique module identifier
            identify: [2]mmio.Mmio(packed struct(u32) {
                ///  Read identifier part in word
                word: u32,
            }),
            ///  Password of debug module
            password: [4]mmio.Mmio(packed struct(u32) {
                ///  Read or write password in word
                word: u32,
            }),
            ///  Module control register
            control: mmio.Mmio(packed struct(u32) {
                ///  ??
                password_busy: u1,
                ///  ??
                password_trigger: u1,
                reserved4: u2 = 0,
                ///  ??
                password_count: u20,
                ///  ??
                debug_mode: u4,
                ///  Read if debug module is enabled
                debug_enable: u4,
            }),
        };

        ///  Automatic Gain Control
        pub const AGC = extern struct {
            ///  ??
            todo: u32,
        };

        ///  Generic DAC, ADC and ACOMP interface control
        pub const GPIP = extern struct {
            ///  ??
            todo: u32,
        };

        ///  Global configuration register
        pub const GLB = extern struct {
            pub const Uart2Mode = enum(u7) {
                ///  Universal Asynchronous Receiver/Transmitter interface
                uart = 0x0,
                ///  ISO 11898 communication protocol interface
                iso11898 = 0x1,
                _,
            };

            pub const @"uart_signal.Function" = enum(u4) {
                ///  UART0 Request-to-Send flow control
                uart0_rts = 0x0,
                ///  UART0 Clear-to-Send flow control
                uart0_cts = 0x1,
                ///  UART0 transmit data
                uart0_txd = 0x2,
                ///  UART0 receive data
                uart0_rxd = 0x3,
                ///  UART1 Request-to-Send flow control
                uart1_rts = 0x4,
                ///  UART1 Clear-to-Send flow control
                uart1_cts = 0x5,
                ///  UART1 transmit data
                uart1_txd = 0x6,
                ///  UART1 receive data
                uart1_rxd = 0x7,
                ///  UART2 Request-to-Send flow control
                uart2_rts = 0x8,
                ///  UART2 Clear-to-Send flow control
                uart2_cts = 0x9,
                ///  UART2 transmit data
                uart2_txd = 0xa,
                ///  UART2 receive data
                uart2_rxd = 0xb,
                _,
            };

            pub const PinMode = enum(u2) {
                ///  Digital input mode
                input = 0x0,
                ///  Digital output mode
                output = 0x1,
                ///  Alternate function mode
                alternate = 0x2,
                ///  Analog mode
                analog = 0x3,
            };

            pub const Alternate = enum(u5) {
                ///  Secure Digital host
                sdh = 0x0,
                ///  Serial Peripheral Interface 0
                spi0 = 0x1,
                ///  Flash control
                flash = 0x2,
                ///  Inter-IC Sound
                i2s = 0x3,
                ///  Pulse Density Modulation
                pdm = 0x4,
                ///  Inter-Integrated Circuit bus 0
                i2c0 = 0x5,
                ///  Inter-Integrated Circuit bus 1
                i2c1 = 0x6,
                ///  Universal Asynchronous Receiver/Transmitter
                uart = 0x7,
                ///  Ethernet Media Access Control
                emac = 0x8,
                ///  ??
                cam = 0x9,
                ///  ??
                analog = 0xa,
                ///  Generic Purpose Input/Output
                gpio = 0xb,
                ///  Pulse-Width Modulation module 0
                pwm0 = 0x10,
                ///  Pulse-Width Modulation module 1
                pwm1 = 0x11,
                ///  Serial Peripheral Interface 1
                spi1 = 0x12,
                ///  Inter-Integrated Circuit bus 2
                i2c2 = 0x13,
                ///  Inter-Integrated Circuit bus 3
                i2c3 = 0x14,
                ///  Multimedia subsystem Universal Asynchronous Receiver/Transmitter
                mm_uart = 0x15,
                ///  ??
                dbi_b = 0x16,
                ///  ??
                dbi_c = 0x17,
                ///  ??
                dpi = 0x18,
                ///  Low power core JTAG interface
                jtag_lp = 0x19,
                ///  M0 core JTAG interface
                jtag_m0 = 0x1a,
                ///  D0 core JTAG interface
                jtag_d0 = 0x1b,
                ///  Clock output
                clock_out = 0x1f,
                _,
            };

            ///  Chip information register
            chip_inform: u32,
            reserved80: [76]u8,
            ///  Core configuration register 16
            core_config_16: u32,
            ///  Core configuration register 17
            core_config_17: u32,
            ///  Core configuration register 18
            core_config_18: u32,
            ///  Core configuration register 19
            core_config_19: u32,
            ///  Core configuration register 20
            core_config_20: u32,
            ///  Core configuration register 21
            core_config_21: u32,
            ///  Core configuration register 22
            core_config_22: u32,
            ///  Core configuration register 23
            core_config_23: u32,
            ///  Core configuration register 24
            core_config_24: u32,
            ///  Core configuration register 25
            core_config_25: u32,
            reserved144: [24]u8,
            ///  System configuration register 0
            sys_config_0: u32,
            ///  System configuration register 1
            sys_config_1: u32,
            reserved160: [8]u8,
            ///  Bus configuration register 0
            bus_config_0: u32,
            reserved224: [60]u8,
            ///  Electromagnetic interference configuration
            emi_config: u32,
            reserved240: [12]u8,
            ///  Real-time clock configuration
            rtc_config: u32,
            reserved272: [28]u8,
            ///  General Purpose Analog-to-digital convert configuration
            gpadc_config: u32,
            reserved288: [12]u8,
            ///  General Purpose Digital-to-analog convert configuration 0
            gpdac_config_0: u32,
            ///  General Purpose Digital-to-analog convert configuration 1
            gpdac_config_1: u32,
            ///  General Purpose Digital-to-analog convert configuration 2
            gpdac_config_2: u32,
            ///  General Purpose Digital-to-analog convert configuration 3
            gpdac_config_3: u32,
            ///  Direct Memory Access configuration 0
            dma_config_0: u32,
            ///  Direct Memory Access configuration 1
            dma_config_1: u32,
            ///  Direct Memory Access configuration 2
            dma_config_2: u32,
            reserved320: [4]u8,
            ///  Infrared configuration register 0
            ir_config_0: u32,
            ///  Infrared configuration register 1
            ir_config_1: u32,
            reserved336: [8]u8,
            ///  Universal Asynchronous Receiver/Transmitter configuration
            uart_config: mmio.Mmio(packed struct(u32) {
                ///  Peripheral clock divide factor
                clock_divide: u3,
                reserved4: u1 = 0,
                ///  Peripheral level clock gate enable
                clock_enable: u1,
                reserved7: u2 = 0,
                ///  Reads clock source from hibernate registers
                hibernate_clock_source: u1,
                reserved22: u14 = 0,
                ///  Reads clock source from hibernate registers
                hibernate_clock_source_2: u1,
                reserved25: u2 = 0,
                ///  Select interface mode for UART2 peripheral
                uart2_mode: Uart2Mode,
            }),
            ///  Universal Asynchronous Receiver/Transmitter signal configuration 0
            uart_signal_0: mmio.Mmio(packed struct(u32) {
                ///  Select peripheral function for UART signal %s
                function_0: [8]u4,
            }),
            ///  Universal Asynchronous Receiver/Transmitter signal configuration 1
            uart_signal_1: mmio.Mmio(packed struct(u32) {
                ///  Select peripheral function for UART signal %s (offset by 8)
                function_1: [4]u4,
                padding: u16 = 0,
            }),
            reserved368: [20]u8,
            ///  Serial flash configuration
            flash_config: u32,
            reserved384: [12]u8,
            ///  Inter-Integrated Circuit bus configuration
            i2c_config: u32,
            reserved400: [12]u8,
            ///  Inter-IC Sound configuration
            i2s_config: u32,
            reserved432: [28]u8,
            ///  Serial Peripheral Interface configuration
            spi_config: u32,
            reserved448: [12]u8,
            ///  Quadrature decoder configuration
            quad_config: u32,
            reserved592: [140]u8,
            ///  Digital clock configuration 0
            digit_clock_0: u32,
            ///  Digital clock configuration 1
            digit_clock_1: u32,
            ///  Digital clock configuration 2
            digit_clock_2: u32,
            reserved608: [4]u8,
            ///  Radio configuration register
            radio_config: u32,
            reserved736: [124]u8,
            ///  Debug configuration register 0
            debug_config_0: u32,
            ///  Debug configuration register 1
            debug_config_1: u32,
            ///  Debug configuration register 2
            debug_config_2: u32,
            ///  Debug configuration register 3
            debug_config_3: u32,
            ///  Debug configuration register 4
            debug_config_4: u32,
            reserved768: [12]u8,
            ///  Memory Built-in Self Test mode
            test_mode: u32,
            reserved776: [4]u8,
            ///  Memory Built-in Self Test done state
            test_done: u32,
            reserved784: [4]u8,
            ///  Memory Built-in Self Test fail state
            test_fail: u32,
            reserved832: [44]u8,
            ///  Audio configuration register 0
            audio_config_0: u32,
            ///  Audio configuration register 1
            audio_config_1: u32,
            reserved912: [72]u8,
            ///  Ethernet Media Access Control register
            emac_config: u32,
            reserved1056: [140]u8,
            ///  ??
            cam_config: u32,
            reserved2244: [1184]u8,
            ///  Generic Purpose Input/Output config
            gpio_config: [46]mmio.Mmio(packed struct(u32) {
                ///  Enable input signal
                input_function: u1,
                ///  Enable schmitt trigger
                schmitt: u1,
                ///  Drive strength
                drive: u2,
                ///  Enable internal pull-up
                pull_up: u1,
                ///  Enable internal pull-down
                pull_down: u1,
                ///  Enable output signal
                output_function: u1,
                reserved8: u1 = 0,
                ///  Pin alternate function switch
                alternate: Alternate,
                reserved16: u3 = 0,
                ///  Select pin interrupt mode
                interrupt_mode: u4,
                ///  Clear pin interrupt flag
                interrupt_clear: u1,
                ///  Pin interrupt state
                interrupt_state: u1,
                ///  Pin interrupt mask
                interrupt_mask: u1,
                reserved24: u1 = 0,
                ///  Output value
                output_value: u1,
                ///  Set output value to 1
                output_set: u1,
                ///  Clear output value to 0
                output_clear: u1,
                reserved28: u1 = 0,
                ///  Input value
                input_value: u1,
                reserved30: u1 = 0,
                ///  Pin input/output mode switch
                pin_mode: PinMode,
            }),
            reserved2756: [328]u8,
            ///  Read value from Generic Purpose Input/Output pins
            gpio_input: [2]u32,
            reserved2788: [24]u8,
            ///  Write value to Generic Purpose Input/Output pins
            gpio_output: [2]u32,
            ///  Set pin output value to high
            gpio_set: [2]u32,
            ///  Set pin output value to low
            gpio_clear: [2]u32,
        };
    };
};

//======= GEN_SOURCE
