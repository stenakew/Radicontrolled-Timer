;transmitter_1829_RadioControlledTimer_E.asm
    
        global  Transmitter_Init
        global  Transmitter_On_Start
        global  Transmitter_On_Stop
        global  Transmitter_Off_Start
        global  Transmitter_Off_Stop
        
#include "common_1829_RadioControlledTimer.inc"

 
;transmitter on = RC2, pin 14
#define TRANSMITTER_ON_ANSEL    ANSELC
#define TRANSMITTER_ON_TRIS     TRISC
#define TRANSMITTER_ON_LAT      LATC
#define TRANSMITTER_ON_PIN      2
;transmitter off = RB4, pin 13
#define TRANSMITTER_OFF_ANSEL   ANSELB
#define TRANSMITTER_OFF_TRIS    TRISB
#define TRANSMITTER_OFF_LAT     LATB
#define TRANSMITTER_OFF_PIN     4
        
TRANSMITTER code

;************
;Initialize transmitter pins
;entry  none
;exit   none
  
Transmitter_Init
        ;set pins to digital, zero and output
        banksel TRANSMITTER_ON_ANSEL
        bcf     TRANSMITTER_ON_ANSEL, TRANSMITTER_ON_PIN
        banksel TRANSMITTER_OFF_ANSEL
        bcf     TRANSMITTER_OFF_ANSEL, TRANSMITTER_OFF_PIN
        banksel TRANSMITTER_ON_LAT
        bcf     TRANSMITTER_ON_LAT, TRANSMITTER_ON_PIN
        banksel TRANSMITTER_OFF_LAT
        bcf     TRANSMITTER_OFF_LAT, TRANSMITTER_OFF_PIN
        banksel TRANSMITTER_ON_TRIS
        bcf     TRANSMITTER_ON_TRIS, TRANSMITTER_ON_PIN
        banksel TRANSMITTER_OFF_TRIS
        bcf     TRANSMITTER_OFF_TRIS, TRANSMITTER_OFF_PIN
        
        return

;************
;Start sending on from transmitter
;entry  none
;exit   none
        
Transmitter_On_Start
        banksel TRANSMITTER_ON_LAT
        bsf     TRANSMITTER_ON_LAT, TRANSMITTER_ON_PIN
        return
 
;************
;Stop sending on from transmitter
;entry  none
;exit   none
        
Transmitter_On_Stop
        banksel TRANSMITTER_ON_LAT
        bcf     TRANSMITTER_ON_LAT, TRANSMITTER_ON_PIN
        return
        
;************
;Start sending off from transmitter
;entry  none
;exit   none
Transmitter_Off_Start
        banksel TRANSMITTER_OFF_LAT
        bsf     TRANSMITTER_OFF_LAT, TRANSMITTER_OFF_PIN
        return
        
;************
;Stop sending off from transmitter
;entry  none
;exit   none
Transmitter_Off_Stop
        banksel TRANSMITTER_OFF_LAT
        bcf     TRANSMITTER_OFF_LAT, TRANSMITTER_OFF_PIN
        return
        
        end
