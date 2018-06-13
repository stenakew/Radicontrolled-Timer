;main_1829_RadioControlledSwitch.asm
    
#include "common_1829_RadioControlledTimer.inc"
#include "config_1829_RadioControlledTimer.inc"
#include "LED_1829_RadioControlledTimer.inc"

        udata_shr
;counters for dealy routine
delay_high  res	    1
delay_low   res     1
   
RST	code	0
	pagesel	start
	goto	start
	
INT	code	4
	retfie
	
MAIN	code
start
	call	LED_Init
	
main_loop
	;blink LED's, start with RED
        call    Red_LED_On
        call    Delay_1s
        call    Red_LED_Off
	
        call    Green_LED_On
        call    Delay_1s
        call    Green_LED_Off
	
        call    Blue_LED_On
        call    Delay_1s
        call    Blue_LED_Off
	
	goto	main_loop


;************
;Delay about one second
;running on 500kHz, default internal clock
;Fosc/4 = 125kHz
;inner loop in delay is 3 cycles
;125/3 = 420000 = 200*210
;
;entry	none
;exit	none

#define DELAY_HIGH_COUNT    200
#define DELAY_LOW_COUNT	    210
	
Delay_1s
        movlw   DELAY_HIGH_COUNT
        movwf   delay_high
Delay_1s_1
        movlw   DELAY_LOW_COUNT
        movwf   delay_low
Delay_1s_2
        decfsz  delay_low, F
        goto    Delay_1s_2
        decfsz  delay_high, F
        goto    Delay_1s_1
	
    return
	
	end
	