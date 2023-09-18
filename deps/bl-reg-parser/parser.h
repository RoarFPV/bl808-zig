// #define __attribute__(x)
// #define __asm__(x)
// #define volatile(...) ()
// #define __extension__

#define CPU_M0
#define ARCH_RISCV
#define BL808

typedef char * __builtin_va_list;

#include "bl808_memorymap.h"
#include "aon_reg.h"
#include "cci_reg.h" 
#include "codec_misc_reg.h" 
#include "ef_ctrl_reg.h" 
//#include "ef_data_0_reg.h" 
//#include "ef_data_1_reg.h" 
#include "glb_reg.h" 
#include "gpip_reg.h" 
#include "hbn_reg.h" 
#include "ipc_reg.h" 
#include "mcu_misc_reg.h" 
#include "mm_glb_reg.h" 
#include "mm_misc_reg.h" 
#include "pds_reg.h" 
#include "psram_reg.h" 
#include "psram_uhs_reg.h" 
#include "sdh_reg.h" 
#include "sf_ctrl_reg.h" 
#include "tzc_nsec_reg.h" 
#include "tzc_sec_reg.h"


#include "acomp_reg.h"
#include "adc_reg.h"
#include "auadc_reg.h"
#include "audac_reg.h"
#include "cam_front_reg.h"
#include "cam_reg.h"
#include "cks_reg.h"
#include "csi_reg.h"
#include "dac_reg.h"
#include "dbi_reg.h"
#include "dma_reg.h"
#include "dtsrc_reg.h"
#include "ef_ctrl_reg.h"
#include "emac_reg.h"
#include "gpio_reg.h"
#include "i2c_reg.h"
#include "i2s_reg.h"
#include "ir_reg.h"
#include "kys_reg.h"
#include "mjpeg_reg.h"
#include "platform_dma_reg.h"
#include "pwm_v1_reg.h"
#include "pwm_v2_reg.h"
#include "rtc_reg.h"
#include "sdio2_reg.h"
#include "sec_eng_reg.h"
#include "sf_ctrl_reg.h"
#include "spi_reg.h"
#include "timer_reg.h"
#include "uart_reg.h"
#include "usb_v1_reg.h"
#include "usb_v2_reg.h"
#include "wo_reg.h"

//#include "lhal/config/bl808/device_table.c"