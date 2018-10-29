;buttons_1829_RadioControlledTimer.asm

        global  Buttons_Init
        global  Buttons_Get_On_State
        global  Buttons_Get_Off_State

#include "common_1829_RadioControlledTimer.inc"

;(pin nr = PDIP package)
;ON button = RB7, pin 10
#define ON_BUTTON_ANSEL ANSELB
#define ON_BUTTON_WPU   WPUB
#define ON_BUTTON_PORT  PORTB
#define ON_BUTTON_PIN   7
;OFF button = RA5, pin 2
#define OFF_BUTTON_ANSEL    ANSELA
#define OFF_BUTTON_WPU      WPUA
#define OFF_BUTTON_PORT     PORTA
#define OFF_BUTTON_PIN      5
        
BUTTONS code

;************
;Initialize buttons pins
;entry  none
;exit   none

Buttons_Init
        ;initialize button pins : digital, WPU enabled
        banksel ON_BUTTON_ANSEL
        bcf     ON_BUTTON_ANSEL, ON_BUTTON_PIN
        banksel OFF_BUTTON_ANSEL
        bcf     OFF_BUTTON_ANSEL, OFF_BUTTON_PIN
        banksel ON_BUTTON_WPU
        bsf     ON_BUTTON_WPU, ON_BUTTON_PIN
        banksel OFF_BUTTON_WPU
        bsf     OFF_BUTTON_WPU, OFF_BUTTON_PIN
        ;global WPU enabled in main
        return
        
;************
;Get button ON state
;entry  none
;exit   C = On button state, Set = pressed
  
Buttons_Get_On_State
        banksel ON_BUTTON_PORT
        bsf     STATUS, C   ;assume pressed
        btfsc   ON_BUTTON_PORT, ON_BUTTON_PIN
        bcf     STATUS, C   ;not pressed
        return
        
;************
;Get button OFF state
;entry  none
;exit   C = Off button state, Set = pressed
  
Buttons_Get_Off_State
        banksel OFF_BUTTON_PORT
        bsf     STATUS, C   ;assume pressed
        btfsc   OFF_BUTTON_PORT, OFF_BUTTON_PIN
        bcf     STATUS, C   ;not pressed
        return
        
 
        end
        