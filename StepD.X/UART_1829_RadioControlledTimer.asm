;UART_1829_RadioControlledTimer.asm
    
#include "common_1829_RadioControlledTimer.inc"

        global  UART_Init
        global  UART_SendCharacter
        global  UART_SendNewLine
        
        
UART    code
    
;************
;Initialize UART to 9600 baud, 8 bit, no parity and one stop bit
;Assuming Fosc = 4MHz
;TX = (alternate) RC4 (pin 6, PDIP)
;
;entry  none
;exit   none
    
UART_Init
        ;set TX pin (RC4) to digital
        banksel ANSELC
        bcf     ANSELC, 4
        ;change TX pin to alternate pin (RC4)
        banksel APFCON0
        bsf     APFCON0, TXCKSEL
        ;set baud rate generator to 9600
        banksel SPBRGH
        clrf    SPBRGH
        banksel SPBRGL
        movlw   103         ;103 according to 1829 datasheet, but for my "PC & 1829" combination, 103 gives some garbage characters
        movwf   SPBRGL
        banksel BAUDCON
        bsf     BAUDCON, BRG16
        
        ;initialize transmitter
        banksel TXSTA
        bsf     TXSTA, BRGH
        bsf     TXSTA, TXEN
        
        ;enable serial port
        banksel RCSTA
        bsf     RCSTA, SPEN
        return
        
;************
;Send a character
;
;entry  W=character to send
;exit   none
        
UART_SendCharacter
        ;wait for transmitter ready
        banksel PIR1
UART_SendCharacter_1
        btfss   PIR1, TXIF
        goto    UART_SendCharacter_1
        ;ready, send character
        banksel TXREG
        movwf   TXREG
        return
 
;************
;Send a new line sequence
;
;entry  none
;exit   none

UART_SendNewLine
#define CR  13
#define LF  10
        
        movlw   CR
        call    UART_SendCharacter
        movlw   LF
        call    UART_SendCharacter
        return
                
        end
        
        


