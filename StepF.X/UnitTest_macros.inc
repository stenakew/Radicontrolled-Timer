;UnitTest_macros.inc

	
;************ Assume macros ********************
	
AssumeWREG_equal macro   expected_value
	xorlw	expected_value
	btfss	STATUS, Z
	goto	UnitTest_Error
	endm

AssumeWREG_notequal  macro   expected_value
	xorlw	expected_value
	btfsc	STATUS, Z
	goto	UnitTest_Error
	endm
AssumeCarryClear    macro
	btfsc	STATUS, C
	goto	UnitTest_Error
	endm
	
AssumeCarrySet	macro
	btfss	STATUS, C
	goto	UnitTest_Error
	endm
	
AssumeBitSet	macro	register, bit
	banksel	register
	btfss	register, bit
	goto	UnitTest_Error
	endm
	
AssumeBitClear	macro	register, bit
	banksel	register, bit
	btfsc	register, bit
	goto	UnitTest_Error
	endm
	


