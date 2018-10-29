;main_1829_RadioControlledSwitch.asm
    
#include "common_1829_RadioControlledTimer.inc"
#include "config_1829_RadioControlledTimer.inc"
#include "LED_1829_RadioControlledTimer.inc"
#include "UART_1829_RadioControlledTimer.inc"
#include "transmitter_1829_RadioControlledTimer.inc"
#include "buttons_1829_RadioControlledTimer.inc"


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
        ;Clear all WPU flags. Initialization functions must set WPU as needed.
        banksel WPUA
        clrf    WPUA
        banksel WPUB
        clrf    WPUB
        banksel WPUC
        clrf    WPUC
        ;Enable global WPU
        banksel OPTION_REG
        bcf     OPTION_REG, NOT_WPUEN
        
        
	call	main_SetClockSpeed
        call    Transmitter_Init
        call    Buttons_Init
	
main_loop
        call    main_Handle_Buttons
	
	goto	main_loop


;************
;Check if On or Off button pressed. If pressed send to transmitter
;
;entry	none
;exit	none
        
main_Handle_Buttons
        ;Check on button
        call    Buttons_Get_On_State
        btfss   STATUS, C
        goto    main_Handle_Buttons_1
        ;On button pressed
        call    Transmitter_On_Start
        goto    main_Handle_Buttons_2
main_Handle_Buttons_1
        ;On button not pressed, stop sending on
        call    Transmitter_On_Stop
        
main_Handle_Buttons_2
        ;Check off button
        call    Buttons_Get_Off_State
        btfss   STATUS, C
        goto    main_Handle_Buttons_3
        ;Off button pressed
        call    Transmitter_Off_Start
        goto    main_Handle_Buttons_4
main_Handle_Buttons_3
        ;Off button not pressed, stop sending off
        call    Transmitter_Off_Stop

main_Handle_Buttons_4
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