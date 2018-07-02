;EEPROM_1829_RadioControlledTimer.asm
    
        global  EEPROM_Read
        global  EEPROM_Write
        global  EEPROM_WriteBytes
        global  eeprom_address
        global  eeprom_data

#include "common_1829_RadioControlledTimer.inc"
#define INCLUDE_IN_ASM
#include "EEPROM_1829_RadioControlledTimer.inc"
        
EEPROM_Data udata   EEPROM_Bank
eeprom_address  res 1
eeprom_count    res 1
eeprom_data     res EEPROM_LENGTH

EEPROM  code
  
;************
;Read data from 1829 EEPROM
;(start at EEPROM address 0)
;entry  W = number of bytes to read
;       FSR0 = pointer to where to store data read
;exit   none
     
EEPROM_Read
        ;save count
        banksel EEPROM_Bank
        movwf   eeprom_count
        clrf    eeprom_address  ;start at EEPROM address 0
EEPROM_Read_1
        movf    eeprom_address, W
        banksel EEADRL
        movwf   EEADRL
        banksel EECON1
        bcf     EECON1, CFGS
        bcf     EECON1, EEPGD
        bsf     EECON1, RD
        banksel EEDATL
        movf    EEDATL, W
        movwi   FSR0++
        ;next byte
        banksel EEPROM_Bank
        incf    eeprom_address, F
        decfsz  eeprom_count, F
        goto    EEPROM_Read_1
        
        return
        
;************
;Write data to 1829 EEPROM
;(start at EEPROM address 0)
;entry  W = number of bytes to write
;       FSR0 = pointer to write data
;exit   none
;NOTE, write takes 5ms for every byte
     
EEPROM_Write
        ;save count
        banksel EEPROM_Bank
        movwf   eeprom_count
        clrf    eeprom_address  ;start at EEPROM address 0
        
EEPROM_Write_1
        movf    eeprom_address, W
        banksel EEADRL
        movwf   EEADRL
        moviw   FSR0++
        banksel EEDATL
        movwf   EEDATL  ;byte to write
        banksel EECON1
        bcf     EECON1, CFGS
        bcf     EECON1, EEPGD
        bsf     EECON1, WREN
        ;write magic sequence
        ;EECON2 = same bank as EECON1
        movlw   H'55'
        movwf   EECON2
        movlw   H'AA'
        movwf   EECON2
        bsf     EECON1, WR
        bcf     EECON1, WREN
        ;wait for write to complete
EEPROM_Write_2
        btfsc   EECON1, WR
        goto    EEPROM_Write_2
        ;next byte
        banksel EEPROM_Bank
        incf    eeprom_address, F
        decfsz  eeprom_count, F
        goto    EEPROM_Write_1
        
        return

;************
;Write bytes to 1829 EEPROM
;(start at EEPROM address 0)
;entry  W = number of bytes to write
;       FSR0 = pointer to write data
;       EEPROM_Data:eeprom_address = start address in EEPROM
;exit   none
;NOTE, write takes 5ms for every byte
        
EEPROM_WriteBytes
        ;save count
        banksel EEPROM_Bank
        movwf   eeprom_count
        goto    EEPROM_Write_1
        
;DEEPROM' not documented in MPASM/MPLINK manual or PIC16F1829 datsasheet
;but can be found in the default linker script "16f1829_g.lkr" included in MPLAB X
DEEPROM code
 
;Define default values stored in EEPROM
        ;Jan
        de      H'09'     ;Sunrise hour
        de      H'16'     ;Sunrise minute
        de      H'15'     ;Sunset hour
        de      H'04'     ;Sunset minute
        ;Feb
        de      H'07'     ;Sunrise hour
        de      H'51'     ;Sunrise minute
        de      H'16'     ;Sunset hour
        de      H'38'     ;Sunset minute
        ;Mar
        de      H'06'     ;Sunrise hour
        de      H'25'     ;Sunrise minute
        de      H'18'     ;Sunset hour
        de      H'02'     ;Sunset minute
        ;Apr
        de      H'04'     ;Sunrise hour
        de      H'32'     ;Sunrise minute
        de      H'19'     ;Sunset hour
        de      H'29'     ;Sunset minute
        ;May
        de      H'02'     ;Sunrise hour
        de      H'53'     ;Sunrise minute
        de      H'21'     ;Sunset hour
        de      H'01'     ;Sunset minute
        ;Jun
        de      H'01'     ;Sunrise hour
        de      H'51'     ;Sunrise minute
        de      H'22'     ;Sunset hour
        de      H'11'     ;Sunset minute
        ;Jul
        de      H'02'     ;Sunrise hour
        de      H'33'     ;Sunrise minute
        de      H'21'     ;Sunset hour
        de      H'41'     ;Sunset minute
        ;Aug
        de      H'04'     ;Sunrise hour
        de      H'01'     ;Sunrise minute
        de      H'20'     ;Sunset hour
        de      H'09'     ;Sunset minute
        ;Sep
        de      H'05'     ;Sunrise hour
        de      H'26'     ;Sunrise minute
        de      H'18'     ;Sunset hour
        de      H'25'     ;Sunset minute
        ;Oct
        de      H'07'     ;Sunrise hour
        de      H'51'     ;Sunrise minute
        de      H'16'     ;Sunset hour
        de      H'00'     ;Sunset minute
        ;Nov
        de      H'08'     ;Sunrise hour
        de      H'23'     ;Sunrise minute
        de      H'15'     ;Sunset hour
        de      H'07'     ;Sunset minute
        ;Dec
        de      H'09'     ;Sunrise hour
        de      H'36'     ;Sunrise minute
        de      H'14'     ;Sunset hour
        de      H'16'     ;Sunset minute
        ;Daylight saving
        de      H'05'     ;Good morning hour
        de      H'00'     ;Good morning minute
        de      H'21'     ;Good evening hour
        de      H'30'     ;Good evening minute
        ;No daylight saving
        de      H'06'     ;Good morning hour
        de      H'00'     ;Good morning minute
        de      H'22'     ;Good evening hour
        de      H'30'     ;Good evening minute

        ;Dayligt saving per month
        de      FALSE   ;Jan
        de      FALSE
        de      FALSE
        de      TRUE    ;Apr
        de      TRUE
        de      TRUE
        de      TRUE
        de      TRUE
        de      TRUE
        de      TRUE
        de      FALSE   ;Nov
        de      FALSE
        
        end
        