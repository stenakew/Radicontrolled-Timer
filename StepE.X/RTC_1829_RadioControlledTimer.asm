;RTC_1829_RadioControlledTimer.asm

        global  RTC_Init
        global  RTC_SetClockRegisters
        global  RTC_GetClockRegisters

        
#include "Common_1829_RadioControlledTimer.inc"
#include "DS1302Memory_1829_RadioControlledTimer.inc"
#include "LED_1829_RadioControlledTimer.inc"


;RTC chip enable pin connected to pin RA2, pin 17
#define CE_RTC_ANSEL    ANSELA
#define CE_RTC_TRIS     TRISA
#define CE_RTC_LAT      LATA
#define CE_RTC_PIN      2
;RTC serial clock pin connected to RC1, pin 15
#define SCLK_RTC_ANSEL  ANSELC
#define SCLK_RTC_TRIS   TRISC
#define SCLK_RTC_LAT    LATC
#define SCLK_RTC_PIN    1
;RTC I/O pin connected to RC0, pin 16
#define IO_RTC_ANSEL    ANSELC
#define IO_RTC_TRIS     TRISC
#define IO_RTC_LAT      LATC
#define IO_RTC_PORT     PORTC
#define IO_RTC_PIN      0
        
#define CLOCK_REGISTER_COUNT    8
#define RAM_REGISTER_COUNT      30
        
RTC_Data    udata   RTC_Bank

byte_counter    res 1
shift_register  res 1
tmp             res 1
    
RTC     code

;************
;Initialize RTC
;entry  none
;exit   none
     
RTC_Init
        ;set up RTC pins
        ;CE
        banksel CE_RTC_ANSEL
        bcf     CE_RTC_ANSEL, CE_RTC_PIN
        banksel CE_RTC_LAT
        bcf     CE_RTC_LAT, CE_RTC_PIN
        banksel CE_RTC_TRIS
        bcf     CE_RTC_TRIS, CE_RTC_PIN
        ;SCLK
        banksel SCLK_RTC_ANSEL
        bcf     SCLK_RTC_ANSEL, SCLK_RTC_PIN
        banksel SCLK_RTC_LAT
        bcf     SCLK_RTC_LAT, SCLK_RTC_PIN
        banksel SCLK_RTC_TRIS
        bcf     SCLK_RTC_TRIS, SCLK_RTC_PIN
        ;I/O
        banksel IO_RTC_ANSEL
        bcf     IO_RTC_ANSEL, IO_RTC_PIN
        banksel IO_RTC_LAT
        bcf     IO_RTC_LAT, IO_RTC_PIN
        ;leave I/O pin as input yet
        
        call    RTC_InitTransfer
        
        ;enable write to the 1302, clear bit 7 in CLOCK register nr 7
        movlw   B'10001110'
        call    RTC_WriteCommand
        movlw   B'00000000'
        call    RTC_WriteByte

        call    RTC_EndTransfer
        
        ;set upp trickle charger to 1 diode, 2kohm
RTC_Init_1
        call    RTC_InitTransfer
        movlw   B'10010000'         ;TRICKLE CHARGE register
        call    RTC_WriteCommand
        movlw   B'10100101' ;1 diode, 2k
        call    RTC_WriteByte
        ;clear CH (Clock Hold) flag in CLOCK register 0
        movlw   B'10000001'
        call    RTC_WriteCommand
        call    RTC_ReadByte
        movwf   tmp
        movlw   B'10000000'
        call    RTC_WriteCommand
        movf    tmp, W
        andlw   B'01111111'     ;clear CH bit
        call    RTC_WriteByte
        
        call    RTC_EndTransfer

        return
        
;************
;Set RTC clock, burst write from dedicated memory in RTC_Bank
;
;entry  FSR0 = pointer to bytes to write
;exit   none
     
RTC_SetClockRegisters
        banksel RTC_Bank
        movlw   CLOCK_REGISTER_COUNT
        movwf   byte_counter
        
        call    RTC_InitTransfer
        
        movlw   B'10111110' ;burst write clock registers
        call    RTC_WriteCommand
RTC_SetClockRegisters_1
        moviw   FSR0++
        call    RTC_WriteByte
        banksel RTC_Bank
        decfsz  byte_counter, F
        goto    RTC_SetClockRegisters_1
        
        call    RTC_EndTransfer
        
        return
        
;************
;Get RTC clock, burst read to dedicated memory in RTC_Bank
;
;entry  FSR0 = pointer to store bytes
;exit   none
     
RTC_GetClockRegisters
        banksel RTC_Bank
        movlw   CLOCK_REGISTER_COUNT
        movwf   byte_counter
        
        call    RTC_InitTransfer
        
        movlw   B'10111111'     ;Burst read clock registers
        call    RTC_WriteCommand
RTC_GetClockRegisters_1
        call    RTC_ReadByte
        movwi   FSR0++
        banksel RTC_Bank
        decfsz  byte_counter, F
        goto    RTC_GetClockRegisters_1
        
        call    RTC_EndTransfer
        return
        
;************
;Initialize transfer to/from RTC
;
;entry  none
;exit   none        

RTC_InitTransfer
        banksel CE_RTC_LAT
        bsf     CE_RTC_LAT, CE_RTC_PIN
        return
        
;************
;Terminate transfer to/from RTC
;
;entry  none
;exit   none        

RTC_EndTransfer
        banksel CE_RTC_LAT
        bcf     CE_RTC_LAT, CE_RTC_PIN
        ;reset SCLK pin if it was a read command ongoing previously
        banksel SCLK_RTC_LAT
        bcf     SCLK_RTC_LAT, SCLK_RTC_PIN
        return

;************
;Write command to RTC
;
;entry  W = command to send
;exit   none
;       if R/W flag (bit 0) = 1, SCLK = high, I/O = input
;       if R/W flag (bit 0) = 0, SCLK = low, I/O = output
        
RTC_WriteCommand
        ;set I/O pin to output
        banksel IO_RTC_TRIS
        bcf     IO_RTC_TRIS, IO_RTC_PIN
        banksel RTC_Bank
        movwf   shift_register
        
        
        movlw   7               ;bits to write, last bit need special handling
RTC_WriteCommand_1
        banksel RTC_Bank
        rrf     shift_register, F
        banksel IO_RTC_LAT
        bsf     IO_RTC_LAT, IO_RTC_PIN  ;assume a 1 to send
        btfss   STATUS, C
        bcf     IO_RTC_LAT, IO_RTC_PIN  ;was 0
        banksel SCLK_RTC_LAT
        bsf     SCLK_RTC_LAT, SCLK_RTC_PIN
        nop
        bcf     SCLK_RTC_LAT, SCLK_RTC_PIN
        banksel RTC_Bank
        decfsz  WREG, F
        goto    RTC_WriteCommand_1
        ;and last bit
        rrf     shift_register, F
        banksel IO_RTC_LAT
        bsf     IO_RTC_LAT, IO_RTC_PIN  ;assume a 1 to send
        btfss   STATUS, C
        bcf     IO_RTC_LAT, IO_RTC_PIN  ;was 0
        banksel SCLK_RTC_LAT
        bsf     SCLK_RTC_LAT, SCLK_RTC_PIN
        nop
        ;check if command was a write or a read
        ;command been rotated 8 times, original bit 0 is now bit 1 in shift_register
        banksel RTC_Bank
        btfsc   shift_register, 1
        goto    RTC_WriteCommand_2
        ;R/W bit = 0, so next will be  a write
        ;leave I/O as output, set SCLK low
        banksel SCLK_RTC_LAT
        bcf     SCLK_RTC_LAT, SCLK_RTC_PIN
        goto    RTC_WriteCommand_3  ;done
        
RTC_WriteCommand_2
        ;R/W bit = 1, so next will be a read
        ;change I/O to input
        ;leave SCLK high, RTC_ReadByte will lower it when ready to read
        banksel IO_RTC_TRIS
        bsf     IO_RTC_TRIS, IO_RTC_PIN
        
RTC_WriteCommand_3
        return
        

;************
;Write byte to RTC
;
;entry  W = byte to send
;exit   none, I/O pin = input
;       I/O = output and SCLK = low, ready for more write

RTC_WriteByte       
        ;set I/O pin to output
        banksel IO_RTC_TRIS
        bcf     IO_RTC_TRIS, IO_RTC_PIN
        ;save byte to send
        banksel RTC_Bank
        movwf   shift_register
        
        movlw   8
RTC_WriteByte_1
        banksel RTC_Bank
        rrf     shift_register, F
        banksel IO_RTC_LAT
        bsf     IO_RTC_LAT, IO_RTC_PIN  ;assume a 1 to send
        btfss   STATUS, C
        bcf     IO_RTC_LAT, IO_RTC_PIN  ;was 0
        banksel SCLK_RTC_LAT
        bsf     SCLK_RTC_LAT, SCLK_RTC_PIN
        nop
        bcf     SCLK_RTC_LAT, SCLK_RTC_PIN
        banksel RTC_Bank
        decfsz  WREG, F
        goto    RTC_WriteByte_1

        return
 
;************
;Read byte from RTC
;
;entry  none, I/O set to input and SCLK = high,
;exit   W = byte read
;       I/O = input, SCLK = high, ready for more read

RTC_ReadByte
        movlw   8       ;8 bits to read
RTC_ReadByte_1
        banksel SCLK_RTC_LAT
        bcf     SCLK_RTC_LAT, SCLK_RTC_PIN
        nop
        banksel IO_RTC_PORT
        bsf     STATUS, C   ;assume a 1 to receive
        btfss   IO_RTC_PORT, IO_RTC_PIN
        bcf     STATUS, C   ;was 0
        banksel SCLK_RTC_LAT
        bsf     SCLK_RTC_LAT, SCLK_RTC_PIN
        banksel RTC_Bank
        rrf     shift_register, F
        decfsz  WREG, F
        goto    RTC_ReadByte_1

        banksel RTC_Bank
        movf    shift_register, W
        return
        
        
        end
        
