;EEPROM_1829_RadioControlledTimer.inc
        
        ifndef  INCLUDE_IN_ASM
        extern  EEPROM_Read
        extern  EEPROM_Write
        extern  EEPROM_WriteBytes
        extern  eeprom_address
        extern  eeprom_data
        endif
 
;define byte usage in EEPROM
#define JAN_SUNRISE_HOUR    0
#define JAN_SUNRISE_MINUTE  1
#define JAN_SUNSET_HOUR     2
#define JAN_SUNSET_MINUTE   3
#define FEB_SUNRISE_HOUR    4
#define FEB_SUNRISE_MINUTE  5
#define FEB_SUNSET_HOUR     6
#define FEB_SUNSET_MINUTE   7
#define MAR_SUNRISE_HOUR    8
#define MAR_SUNRISE_MINUTE  9
#define MAR_SUNSET_HOUR    10
#define MAR_SUNSET_MINUTE  11
#define APR_SUNRISE_HOUR   12
#define APR_SUNRISE_MINUTE 13
#define APR_SUNSET_HOUR    14
#define APR_SUNSET_MINUTE  15
#define MAY_SUNRISE_HOUR   16
#define MAY_SUNRISE_MINUTE 17
#define MAY_SUNSET_HOUR    18
#define MAY_SUNSET_MINUTE  19
#define JUN_SUNRISE_HOUR   20
#define JUN_SUNRISE_MINUTE 21
#define JUN_SUNSET_HOUR    22
#define JUN_SUNSET_MINUTE  23
#define JUL_SUNRISE_HOUR   24
#define JUL_SUNRISE_MINUTE 25
#define JUL_SUNSET_HOUR    26
#define JUL_SUNSET_MINUTE  27
#define AUG_SUNRISE_HOUR   28
#define AUG_SUNRISE_MINUTE 29
#define AUG_SUNSET_HOUR    30
#define AUG_SUNSET_MINUTE  31
#define SEP_SUNRISE_HOUR   32
#define SEP_SUNRISE_MINUTE 33
#define SEP_SUNSET_HOUR    34
#define SEP_SUNSET_MINUTE  35
#define OCT_SUNRISE_HOUR   36
#define OCT_SUNRISE_MINUTE 37
#define OCT_SUNSET_HOUR    38
#define OCT_SUNSET_MINUTE  39
#define NOV_SUNRISE_HOUR   40
#define NOV_SUNRISE_MINUTE 41
#define NOV_SUNSET_HOUR    42
#define NOV_SUNSET_MINUTE  43
#define DEC_SUNRISE_HOUR   44
#define DEC_SUNRISE_MINUTE 45
#define DEC_SUNSET_HOUR    46
#define DEC_SUNSET_MINUTE  47

#define D_SAVING_MORNING_HOUR      48
#define D_SAVING_MORNING_MINUTE    49
#define D_SAVING_NIGHT_HOUR        50       
#define D_SAVING_NIGHT_MINUTE      51
#define NO_D_SAVING_MORNING_HOUR   52
#define NO_D_SAVING_MORNING_MINUTE 53
#define NO_D_SAVING_NIGHT_HOUR     54
#define NO_D_SAVING_NIGHT_MINUTE   55
        
;define the maximum EEPROM address possible to change from PC confuguration
#define EEPROM_WRITE_LENGTH     56

;Daylight saving per month (TRUE/FALSE)
#define DAYLIGHT_SAVING_JAN     56
#define DAYLIGHT_SAVING_FEB     57
#define DAYLIGHT_SAVING_MAR     58
#define DAYLIGHT_SAVING_APR     59
#define DAYLIGHT_SAVING_MAY     60
#define DAYLIGHT_SAVING_JUN     61
#define DAYLIGHT_SAVING_JUL     62
#define DAYLIGHT_SAVING_AUG     63
#define DAYLIGHT_SAVING_SEP     64
#define DAYLIGHT_SAVING_OCT     65
#define DAYLIGHT_SAVING_NOV     66
#define DAYLIGHT_SAVING_DEC     67

#define EEPROM_LENGTH           68