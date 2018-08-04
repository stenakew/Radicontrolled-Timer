;EEPROM_unittest_1829_RadioControlledTimer.asm

#ifdef UNIT_TEST
        global  EEPROM_UnitTest

#include "common_1829_RadioControlledTimer.inc"
#include "UnitTest_common_1829_RadioControlledTimer.inc"
#include "UART_1829_RadioControlledTimer.inc"
#include "EEPROM_1829_RadioControlledTimer.inc"
#include "main_unittest_1829_RadioControlledTimer.inc"
#include "UnitTest_macros.inc"

EEPROM_unittest1_Data udata EEPROM_unittest1_Bank
eeprom_save_area    res	    EEPROM_LENGTH
ee_tmp		    res	    1
EEPROM_unittest2_Data udata EEPROM_unittest2_Bank
ee_data_registers   res	    EEPROM_LENGTH 
 
EEPROM_UNITTEST  code
  
EEPROM_UnitTest
        call    Print_EEP
        ;Save EEPROM for other tests
        call    Save_EEPROM
        ;run test cases
        call    UT1_ReadEEPROM
        call    UT2_WriteEEPROM
        call    UT3_WriteBytesEEPROM
        
        ;Restore EEPROM
        call    Restore_EEPROM
        return

        ;Unit tests
UT1_ReadEEPROM
        ;make sure we don't have same old data in buffer
        SetFSR0 ee_data_registers
        movlw   EEPROM_LENGTH
        call    UT_Clear_Memory
        
        SetFSR0 ee_data_registers
        movlw   EEPROM_LENGTH
        call    EEPROM_Read
        banksel ee_data_registers
        movf    ee_data_registers + DEC_SUNSET_MINUTE, W
        AssumeWREG_equal    H'16'
        
        movlw   1
        call    UT_PrintTestOK
        return

#define TEST_PATTERN_UT2    H'F5'
        
UT2_WriteEEPROM
        ;fill buffer with known values
        SetFSR0 ee_data_registers
        movlw   EEPROM_LENGTH
        banksel GeneralUnitTest_Bank
        movwf   ee_tmp
        movlw   TEST_PATTERN_UT2
UT2_WriteEEPROM_1
        movwi   FSR0++
        decfsz  ee_tmp, F
        goto    UT2_WriteEEPROM_1
        
        ;Write buffer to EEPROM
        SetFSR0 ee_data_registers
        movlw   EEPROM_LENGTH
        call    EEPROM_Write
        
        ;Scratch buffer
        SetFSR0 ee_data_registers
        movlw   EEPROM_LENGTH
        call    UT_Clear_Memory
        
        ;Read EEPROM
        SetFSR0 ee_data_registers
        movlw   EEPROM_LENGTH
        call    EEPROM_Read
        
        banksel ee_data_registers
        movf    ee_data_registers, W
        AssumeWREG_equal TEST_PATTERN_UT2

        movlw   2
        call    UT_PrintTestOK        
        return

#define UT_TEST_PATTERN_UT3 H'97'
        
UT3_WriteBytesEEPROM
        ;fill test pattern
        banksel GeneralUnitTest_Bank
        movlw   UT_TEST_PATTERN_UT3
        movwf   ee_data_registers + MAR_SUNRISE_MINUTE
        ;write to EEPROM
        SetFSR0 ee_data_registers + MAR_SUNRISE_MINUTE
        movlw   MAR_SUNRISE_MINUTE
        banksel EEPROM_Bank
        movwf   eeprom_address
        movlw   1
        call    EEPROM_WriteBytes
        ;Clear buffer, so we dont test any remaining data in buffer
        SetFSR0 ee_data_registers
        movlw   EEPROM_LENGTH
        call    UT_Clear_Memory
        ;Read EEPROM
        SetFSR0 ee_data_registers
        movlw   EEPROM_LENGTH
        call    EEPROM_Read
        
        banksel GeneralUnitTest_Bank
        movf    ee_data_registers + MAR_SUNRISE_MINUTE, W
        AssumeWREG_equal    UT_TEST_PATTERN_UT3
        
        movlw   3
        call    UT_PrintTestOK           
        return
        
        
;************
;Write to UART unit test start 'EEP', EEPROM
;
;entry  W = seconds to delay
;exit   none
        
Print_EEP
        call    UART_SendNewLine
        movlw   'E'
        call    UART_SendCharacter
        movlw   'E'
        call    UART_SendCharacter
        movlw   'P'
        call    UART_SendCharacter
        call    UART_SendNewLine
        return


;Restore saved EEPROM contents
;
;entry  none
;exit   none

Restore_EEPROM
        SetFSR0 eeprom_save_area
        movlw   EEPROM_LENGTH
        call    EEPROM_Write
        return
        
;Save EEPROM contents so it is possible to restore after all EEPROM unittests
;
;entry  none
;exit   none

Save_EEPROM
        SetFSR0 eeprom_save_area
        movlw   EEPROM_LENGTH
        call    EEPROM_Read
        return

#endif

        end