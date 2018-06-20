;RTC_unittest_1829_RadioControlledTimer.asm

#include "common_1829_RadioControlledTimer.inc"
#include "RTC_1829_RadioControlledTimer.inc"
#include "UART_1829_RadioControlledTimer.inc"
#include "UnitTest_common_1829_RadioControlledTimer.inc"
#include "main_unittest_1829_RadioControlledTimer.inc"
#include "DS1302Memory_1829_RadioControlledTimer.inc"
        
         global RTC_UnitTest
            
RTC_UNIT_TEST   code
   
RTC_UnitTest
        call    PrintRTC       ;show RTC unit test started
        call	RTC_Init
        
        call    UT1_SetClock_Wait_ReadClock

        return
        

;****** Unit tests ***********
        
UT1_SetClock_Wait_ReadClock
        ;Set RTC to known values
        ;21:01:20 (24h format),  1 Nov 2017, Wednesday
        SetDateTime H'17', H'11', H'01', H'21', H'01', H'20'
	
        ;Wait for clock to tick at least one second
        movlw   2
        call UT_Delay_seconds
        
        ;Read clock from DS1302
        movlw   high rtc_clock_registers
        movwf   FSR0H
        movlw   low rtc_clock_registers
        movwf   FSR0L
        call RTC_GetClockRegisters
        
        ;Verify
        banksel GeneralUnitTest_Bank
        movf    rtc_clock_registers + DS1302_SECOND, W
        AssumeWREG_notequal H'20'  ;it should have ticked on to 21, 22 or 23
        movf    rtc_clock_registers + DS1302_MINUTE, W
        AssumeWREG_equal    1      ;but still minute = 01
       
	movlw   1
        call    UT_PrintTestOK
	
        return
        
       
;************  
;Print the string 'RTC' to UART
;
;entry  none
;exit   none

PrintRTC
        call	UART_SendNewLine
        movlw   'R'
        call	UART_SendCharacter
        movlw   'T'
        call	UART_SendCharacter
        movlw   'C'
        call	UART_SendCharacter
        call	UART_SendNewLine
        return

        
        end
        

