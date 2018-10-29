;OnOff_1829_RadioControlledTimer.asm
    
        global  OnOff_Check

#include "common_1829_RadioControlledTimer.inc"
#include "RTC_1829_RadioControlledTimer.inc"
#include "DS1302Memory_1829_RadioControlledTimer.inc"
#include "EEPROM_1829_RadioControlledTimer.inc"
#define	INCUDED_IN_ASM
#include "OnOff_1829_RadioControlledTimer.inc"

OnOff_Data udata   OnOff_Bank

clock_registers  res DS1302_CLOCK_REGISTER_COUNT
eeprom_registers res EEPROM_LENGTH
   
tmp             res 1
bcd_to_convert  res 1
current_month   res 1   ;as a 8bit integer
 
             
        
ONOFF  code

;************
;Check if current time matches any action time
;
;entry  none
;exit   W = GOOD_MORNING/SUNRISE/SUNSET/GOOD_NIGHT/NOTHING

OnOff_Check
        ;Read current RTC clock
        SetFSR0 clock_registers
        call    RTC_GetClockRegisters
        
        ;No check if current second <> 0
        banksel OnOff_Bank
        movf    clock_registers + DS1302_SECOND, W
        btfss   STATUS, Z
        goto    OnOff_Check_6      ;second <> 0
        ;second = 0        
        ;Save current month (as 8 bit integer)
        movf    clock_registers + DS1302_MONTH, W
        call    Convert_BCD_to_Int
        decf    WREG, W         ;make it zero based
        movwf   current_month
        
        ;Read on/off table from EEPROM
        SetFSR0 eeprom_registers
        movlw   EEPROM_LENGTH
        call    EEPROM_Read
        
        ;Set up pointer to current month in month table
        banksel OnOff_Bank
        SetFSR0 eeprom_registers + JAN_SUNRISE_HOUR
        movf    current_month, W
        lslf    WREG, W
        lslf    WREG, W     ;four bytes per month in table
        addwf   FSR0L, F    ;no overflow
        
        ;Check i sunrise
        moviw   JAN_SUNRISE_HOUR[FSR0]
        subwf   clock_registers + DS1302_HOUR, W
        btfss   STATUS, Z
        goto    OnOff_Check_1   ;sunrise hour not equal current
        moviw   JAN_SUNRISE_MINUTE[FSR0]
        subwf   clock_registers + DS1302_MINUTE, W
        btfss   STATUS, Z
        goto    OnOff_Check_1   ;sunrise minute not equal current
        movlw   SUNRISE
        return
        
        ;Check if sunset
OnOff_Check_1
        moviw   JAN_SUNSET_HOUR[FSR0]
        subwf   clock_registers + DS1302_HOUR, W
        btfss   STATUS, Z
        goto    OnOff_Check_2   ;sunset hour not equal current
        moviw   JAN_SUNSET_MINUTE[FSR0]
        subwf   clock_registers + DS1302_MINUTE, W
        btfss   STATUS, Z
        goto    OnOff_Check_2   ;sunset minute not equal current
        movlw   SUNSET
        return

        ;Set up pointer to GOOD_MORNING/GOOD_NIGHT for current month
        ;(diffrent if month has daylight saving or not)
OnOff_Check_2
        SetFSR0 eeprom_registers + DAYLIGHT_SAVING_JAN
        movf    current_month, W
        addwf   FSR0L, F
        moviw   0[FSR0]
        btfss   STATUS, Z
        goto    OnOff_Check_3   ;TRUE, month is a dayligth saving month
        ;FALSE, month not a dayligth saving month
        SetFSR0 eeprom_registers + NO_D_SAVING_MORNING_HOUR
        goto    OnOff_Check_4
OnOff_Check_3
        SetFSR0 eeprom_registers + D_SAVING_MORNING_HOUR
        
        ;Check if good morning
OnOff_Check_4
        moviw   0[FSR0] ;morning hour
        subwf   clock_registers + DS1302_HOUR, W
        btfss   STATUS, Z
        goto    OnOff_Check_5 ;morning hour not equal current
        moviw   1[FSR0] ;morning minute
        subwf   clock_registers + DS1302_MINUTE, W
        btfss   STATUS, Z
        goto    OnOff_Check_5    ;morning minute not equal current
        movlw   GOOD_MORNING
        return
        
        ;Check if good night
OnOff_Check_5
        moviw   2[FSR0]     ;night hour
        subwf   clock_registers + DS1302_HOUR, W
        btfss   STATUS, Z
        goto    OnOff_Check_6   ;night hour not equal current
        moviw   3[FSR0]     ;night minute
        subwf   clock_registers + DS1302_MINUTE, W
        btfss   STATUS, Z
        goto    OnOff_Check_6   ;night minute not equal current
        movlw   GOOD_NIGHT
        return
        
        ;return nothing
OnOff_Check_6
        movlw   NOTHING
        return
 
;************
;Convert a BCD coded value to 8 bit integer
;entry  W = BCD value
;       selected bank = OnOff_Bank
;exit   W = binary value
       
Convert_BCD_to_Int
        movwf   bcd_to_convert
        swapf   WREG, W
        andlw   H'0F'   ;W=high BCD digit
        ;multiply by 10
        movwf   tmp
        lslf    WREG, W    ;*2
        lslf    WREG, W    ;*4
        lslf    WREG, W    ;*8
        addwf   tmp, W  ;*9
        addwf   tmp, F  ;*10
        movf    bcd_to_convert, W
        andlw   H'0F'
        addwf   tmp, W
        return
        
        end
        