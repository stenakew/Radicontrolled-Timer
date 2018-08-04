;UnitTest_common_1829_RadioControlledTimer.inc
        
;Macro - Set date and time in RTC (DS1302)
;NOTE, parameters must be specified in BCD format (use HEX)
;Example 2017 09 nov 22:23:00        SetDateTime H'17', H'11', H'09', H'22', H'23', H'00'
SetDateTime macro   year, month, date, hour, minute, second
        banksel GeneralUnitTest_Bank
        movlw   high rtc_clock_registers
        movwf   FSR0H
        movlw   low rtc_clock_registers
        movwf   FSR0L
        movlw   second
        movwi   DS1302_SECOND[FSR0]
        movlw   minute
        movwi   DS1302_MINUTE[FSR0]
        movlw   hour
        movwi   DS1302_HOUR[FSR0]
        movlw   date
        movwi   DS1302_DATE[FSR0]
        movlw   month
        movwi   DS1302_MONTH[FSR0]
        movlw   1       ;day (of week) not used but has to be specified
        movwi   DS1302_DAY[FSR0]
        movlw   year
        movwi   DS1302_YEAR[FSR0]
        movlw   0       ;Write Protect off
        movwi   DS1302_WP[FSR0]
        call	RTC_SetClockRegisters
        endm
		
	extern	UT_PrintTestOK
        extern  UT_Clear_Memory
	extern	UT_Delay_seconds
	extern  rtc_clock_registers

