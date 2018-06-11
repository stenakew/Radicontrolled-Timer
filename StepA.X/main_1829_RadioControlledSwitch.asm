;main_1829_RadioControlledSwitch.asm
    
#include "p16f1829.inc"
 __CONFIG _CONFIG1, _FOSC_INTOSC & _WDTE_OFF & _PWRTE_OFF & _MCLRE_ON & _CP_OFF & _CPD_OFF & _BOREN_ON & _CLKOUTEN_ON & _IESO_OFF & _FCMEN_OFF
 __CONFIG _CONFIG2, _WRT_OFF & _PLLEN_OFF & _STVREN_ON & _BORV_LO & _LVP_ON

RST	code	0
	pagesel	start
	goto	start
	
INT	code	4
	retfie
	
MAIN	code
start
	
main_loop
	goto	main_loop
	
	end
	