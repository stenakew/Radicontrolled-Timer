;main_1829_RadioControlledSwitch.asm
    
#include "common_1829_RadioControlledTimer.inc"
#include "config_1829_RadioControlledTimer.inc"
#include "LED_1829_RadioControlledTimer.inc"
#include "UART_1829_RadioControlledTimer.inc"


        udata_shr
;counters for dealy routine
delay_high  res	    1
delay_mid   res	    1
delay_low   res     1
   
RST	code	0
	pagesel	start
	goto	start
	
INT	code	4
	retfie
	
MAIN	code
start
	call	main_SetClockSpeed
	call	LED_Init
	call	UART_Init
	
main_loop
	;send some characters to verify UART transmitt
	movlw	'S'
        call    UART_SendCharacter
	movlw	'A'
	call	UART_SendCharacter
	call	UART_SendNewLine
        call    Delay_1s
	
	goto	main_loop


;************
;Delay about one second
;running on 4MHzHz clock
;Fosc/4 = 1MHz
;inner loop in delay is 3 cycles
;1M/3 = 8*200*208 (not exact but near)
;
;entry	none
;exit	none

#define DELAY_HIGH_COUNT    8
#define DELAY_MID_COUNT	    200
#define DELAY_LOW_COUNT	    208
	
Delay_1s
        movlw   DELAY_HIGH_COUNT
        movwf   delay_high
Delay_1s_1
	movlw	DELAY_MID_COUNT
	movwf	delay_mid
Delay_1s_2
        movlw   DELAY_LOW_COUNT
        movwf   delay_low
Delay_1s_3
        decfsz  delay_low, F
        goto    Delay_1s_3
	decfsz	delay_mid, F
	goto	Delay_1s_2
        decfsz  delay_high, F
        goto    Delay_1s_1
	
    return
    

;************
;Set clock speed, to 4MHz
;
;entry	none
;exit	none
    
main_SetClockSpeed
    
#define CLOCK_4MHz          B'01101000'
#define CLOCK_FOSC2_0       B'00000000'
#define CLOCK_SPLLEN_OFF    B'00000000'
        
        banksel OSCCON
        movlw   CLOCK_4MHz + CLOCK_FOSC2_0 + CLOCK_SPLLEN_OFF
        movwf   OSCCON  ;No PLL, 4MHz, clock determined by configuration bits FOSC<2:0>
        return
    
	end