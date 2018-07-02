;common_1829_RadioControlledSwitch.inc
    
#include "p16f1829.inc"
	radix   dec
	errorlevel  -302
	
;Memory bank definitions
#define	RTC_Bank		H'0A0'
#define EEPROM_Bank		H'120'
	
;last memory banks used for unit tests
#define GeneralUnitTest_Bank	H'5A0'
#define EEPROM_unittest1_Bank   H'520'
#define EEPROM_unittest2_Bank	H'4A0'
	
#define	FALSE	0
#define TRUE	1
	
	


