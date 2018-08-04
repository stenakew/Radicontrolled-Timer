;LED_1829_RadioControlledTimer.asm
        
#include "Common_1829_RadioControlledTimer.inc"
	
	global  LED_Init
        global  Red_LED_On
        global  Red_LED_Off
        global  Green_LED_On
        global  Green_LED_Off
        global  Blue_LED_On
        global  Blue_LED_Off



;LED definitions
;       Red = RC7, PDIP pin 9
#define RED_LED_ANSEL   ANSELC
#define RED_LED_TRIS    TRISC
#define RED_LED_LAT     LATC
#define RED_LED_PIN     7
;       Green = RC3, PDIP pin 7
#define GREEN_LED_ANSEL ANSELC
#define GREEN_LED_TRIS  TRISC
#define GREEN_LED_LAT   LATC
#define GREEN_LED_PIN   3
;       Blue = RB6, PDIP pin 11
#define BLUE_LED_ANSEL  ANSELB
#define BLUE_LED_TRIS   TRISB
#define BLUE_LED_LAT    LATB
#define BLUE_LED_PIN    6


LED     code

;************
;Initialize all LED pins
;
;entry	none
;exit	none

LED_Init
        ;initialize LED pins to digital
        banksel RED_LED_ANSEL
        bcf     RED_LED_ANSEL, RED_LED_PIN
        banksel GREEN_LED_ANSEL
        bcf     GREEN_LED_ANSEL, GREEN_LED_PIN
        banksel BLUE_LED_ANSEL
        bcf     BLUE_LED_ANSEL, BLUE_LED_PIN
        ;clear LED pins
        banksel RED_LED_LAT
        bcf     RED_LED_LAT, RED_LED_PIN
        banksel GREEN_LED_LAT
        bcf     GREEN_LED_LAT, GREEN_LED_PIN
        banksel BLUE_LED_LAT
        bcf     BLUE_LED_LAT, BLUE_LED_PIN
        ;initialize LED pins to output
        banksel RED_LED_TRIS
        bcf     RED_LED_TRIS, RED_LED_PIN
        banksel GREEN_LED_TRIS
        bcf     GREEN_LED_TRIS, GREEN_LED_PIN
        banksel BLUE_LED_TRIS
        bcf     BLUE_LED_TRIS, BLUE_LED_PIN
        
        return
        
;************
;Turn on red LED
;
;entry	none
;exit	none

Red_LED_On
        banksel RED_LED_LAT
        bsf     RED_LED_LAT, RED_LED_PIN
        return

;************
;Turn off red LED
;
;entry	none
;exit	none

Red_LED_Off
        banksel RED_LED_LAT
        bcf     RED_LED_LAT, RED_LED_PIN
        return

;************
;Turn on green LED
;
;entry	none
;exit	none

Green_LED_On
        banksel GREEN_LED_LAT
        bsf     GREEN_LED_LAT, GREEN_LED_PIN
        return
        
;************
;Turn off green LED
;
;entry	none
;exit	none

Green_LED_Off
        banksel GREEN_LED_LAT
        bcf     GREEN_LED_LAT, GREEN_LED_PIN
        return
        
;************
;Turn on blue LED
;
;entry	none
;exit	none

Blue_LED_On
        banksel BLUE_LED_LAT
        bsf     BLUE_LED_LAT, BLUE_LED_PIN
        return
        
;************
;Turn off blue LED
;
;entry	none
;exit	none

Blue_LED_Off
        banksel BLUE_LED_LAT
        bcf     BLUE_LED_LAT, BLUE_LED_PIN
        return
        
        end
        
        
