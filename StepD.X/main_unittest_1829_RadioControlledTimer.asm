;main_unittest_1829_RadioControlledTimer.asm

#include "common_1829_RadioControlledTimer.inc"
#include "config_1829_RadioControlledTimer.inc"
#include "LED_1829_RadioControlledTimer.inc"
#include "UART_1829_RadioControlledTimer.inc"
#include "RTC_unittest_1829_RadioControlledTimer.inc"
#include "UnitTest_common_1829_RadioControlledTimer.inc"
        

        global  UnitTest_Error

RST	code    0
        pagesel start
        goto    start
	
INT	code    4
        retfie
	
MAIN_UNITTEST	code
start
        call    SetClockSpeed
        call	LED_Init
	call	UART_Init
        call    ClearScreen_ANSI

        ;run unit tests
        
        call    RTC_UnitTest
        
        ;arrive here if all tests OK
        call Green_LED_On
        
main_loop

        goto main_loop


;************
;Assuming an ANSI terminal connected to UART
;Send clear screen and cursor home
;
;entry  none
;exit   none
        
#define ESC 27        
ClearScreen_ANSI
        ;clear screen
        movlw   ESC
        call	UART_SendCharacter
        movlw   '['
        call	UART_SendCharacter
        movlw   '2'
        call	UART_SendCharacter
        movlw   'J'
        call	UART_SendCharacter
        ;home cursor
        movlw   ESC
        call	UART_SendCharacter
        movlw   '['
        call	UART_SendCharacter
        movlw   ';'
        call	UART_SendCharacter
        movlw   'H'
        call	UART_SendCharacter
        return
        

;************
;Arrive here if any unit test fails
;
;entry  none
;exit   never
        
UnitTest_Error
        call	Red_LED_On
UnitTest_Error_1       
        goto    UnitTest_Error_1
        
;************
;Set clock speed to 4MHz
;
;entry  none
;exit   none

SetClockSpeed
#define CLOCK_4MHz          B'01101000'
#define CLOCK_FOSC2_0       B'00000000'
#define CLOCK_SPLLEN_OFF    B'00000000'
        
        banksel OSCCON
        movlw   CLOCK_4MHz + CLOCK_FOSC2_0 + CLOCK_SPLLEN_OFF
        movwf   OSCCON  ;No PLL, 4MHz, clock determined by configuration bits FOSC<2:0>
        return
        
        end
        