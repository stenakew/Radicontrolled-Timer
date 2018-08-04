;OnOff_unittest_1829_RadioControlledTimer.asm
        ifdef   UNIT_TEST
        global  OnOff_UnitTest

#include "common_1829_RadioControlledTimer.inc"
#include "OnOff_1829_RadioControlledTimer.inc"
#include "RTC_1829_RadioControlledTimer.inc"
#include "LED_1829_RadioControlledTimer.inc"
#include "UART_1829_RadioControlledTimer.inc"
#include "main_unittest_1829_RadioControlledTimer.inc"
;#include "Delay_1829_RadioControlledTimer.inc"
#include "UnitTest_common_1829_RadioControlledTimer.inc"
#include "UnitTest_macros.inc"
#include "DS1302Memory_1829_RadioControlledTimer.inc"
#include "EEPROM_1829_RadioControlledTimer.inc"

ONOFF_UNITTEST code

OnOff_UnitTest
            ;initialize test
            ;create a test table with ON/OFF times for every month
            call    PrintO_O        ;On/Off
            ;run test cases
            call    UT1_Evening_On
            call    UT2_Morning_Off
            call    UT3_Nothing_to_do
            call    UT4_GoodMorning
            call    UT5_GoodNight
            
            return

           
;*********** Unit tests *******************

UT1_Evening_On
            SetDateTime H'17', H'11', H'02', H'15', H'07', H'00'
            call    OnOff_Check
            AssumeWREG_equal  SUNSET
            movlw   1
            call    UT_PrintTestOK
            return
            
UT2_Morning_Off
            SetDateTime H'17', H'02', H'10', H'07', H'51', H'00'
            call    OnOff_Check
            AssumeWREG_equal  SUNRISE
            movlw   2
            call    UT_PrintTestOK
            return
            
UT3_Nothing_to_do
            SetDateTime H'17', H'01', H'10', H'07', H'50', H'00'
            call    OnOff_Check
            AssumeWREG_equal  NOTHING
            movlw   3
            call    UT_PrintTestOK
            return

UT4_GoodMorning
            SetDateTime H'17', H'07', H'10', H'05', H'00', H'00'
            call    OnOff_Check
            AssumeWREG_equal  GOOD_MORNING
            movlw   4
            call    UT_PrintTestOK
            return

UT5_GoodNight
            SetDateTime H'17', H'09', H'10', H'21', H'30', H'00'
            call    OnOff_Check
            AssumeWREG_equal  GOOD_NIGHT
            movlw   5
            call    UT_PrintTestOK
            return

;************
;Write to UART unit test start 'O/O' On Off
;
;entry  W = seconds to delay
;exit   none
        
PrintO_O
        call    UART_SendNewLine
        movlw   'O'
        call    UART_SendCharacter
        movlw   '/'
        call    UART_SendCharacter
        movlw   'O'
        call    UART_SendCharacter
        call    UART_SendNewLine
        return

  

        endif   ;UNIT_TEST
        end
        