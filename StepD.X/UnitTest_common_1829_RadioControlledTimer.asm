;UnitTest_common_1829_RadioControlledTimer.asm
        
#include "common_1829_RadioControlledTimer.inc"
#include "UART_1829_RadioControlledTimer.inc"
#include "DS1302Memory_1829_RadioControlledTimer.inc"


        global  UT_PrintTestOK
        global  UT_Clear_Memory
	global  UT_Delay_seconds
	global  rtc_clock_registers
        
        
GeneralUnitTest_Data    udata   GeneralUnitTest_Bank
tmp             res 1
hexbytetoprint  res 1
  
rtc_clock_registers res DS1302_CLOCK_REGISTER_COUNT

delay_seconds	res 1
delay_high	res 1
delay_mid	res 1
delay_low	res 1
        
UNITTEST_COMMON code

;************        
;Clear a memory area
;
;entry  FSR0 = pointer to start of memory area
;       WREG = length of memory area
;exit   none
UT_Clear_Memory
        banksel GeneralUnitTest_Bank
        movwf   tmp
        movlw   0
UT_Clear_Memory_1
        movwi   FSR0++
        decfsz  tmp, F
        goto    UT_Clear_Memory_1
        return
	
	
;************        
;Delay a number of seconds
;
;entry  W = seconds to delay
;exit   none

;running on 4MHzHz clock
;Fosc/4 = 1MHz
;inner loop in delay is 3 cycles
;1M/3 = 8*200*208 (not exact but near)

#define DELAY_HIGH_COUNT    8
#define DELAY_MID_COUNT	    200
#define DELAY_LOW_COUNT	    208
	
UT_Delay_seconds
	banksel	GeneralUnitTest_Bank
	movwf	delay_seconds
UT_Delay_seconds_1
        movlw   DELAY_HIGH_COUNT
        movwf   delay_high
UT_Delay_seconds_2
	movlw	DELAY_MID_COUNT
	movwf	delay_mid
UT_Delay_seconds_3
        movlw   DELAY_LOW_COUNT
        movwf   delay_low
UT_Delay_seconds_4
        decfsz  delay_low, F
        goto    UT_Delay_seconds_4
	decfsz	delay_mid, F
	goto	UT_Delay_seconds_3
        decfsz  delay_high, F
        goto    UT_Delay_seconds_2
	decfsz	delay_seconds, F
	goto	UT_Delay_seconds_1
	return
	
;************        
;Print test number, in hex, to the UART and then a OK and new line
;
;entry  W = value
;exit   none

UT_PrintTestOK
        call    PrintHexValue
        movlw   ' '
        call	UART_SendCharacter
        movlw   'O'
        call	UART_SendCharacter
        movlw   'K'
        call	UART_SendCharacter
        call	UART_SendNewLine
        return
        
;************        
;Print a hex value to the UART
;
;entry  W = value
;exit   none
        
PrintHexValue
        banksel	GeneralUnitTest_Bank
        movwf   hexbytetoprint
        lsrf    WREG, W
        lsrf    WREG, W
        lsrf    WREG, W
        lsrf    WREG, W     ;W = high nibble
        call    PrintHexValue_1
        banksel GeneralUnitTest_Bank
        movf    hexbytetoprint, W
        andlw   H'0F'
PrintHexValue_1
        movwf   tmp
        sublw   9
        movf    tmp, W
        btfsc   STATUS, C
        goto    PrintHexValue_2
        addlw   'A' - '0' - 10
PrintHexValue_2
        addlw   '0'
        call	UART_SendCharacter
        return        
	
        end


