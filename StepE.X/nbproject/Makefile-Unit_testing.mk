#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-Unit_testing.mk)" "nbproject/Makefile-local-Unit_testing.mk"
include nbproject/Makefile-local-Unit_testing.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=Unit_testing
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=cof
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/StepE.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/StepE.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=LED_1829_RadioControlledTimer.asm RTC_1829_RadioControlledTimer.asm RTC_unitest_1829_RadioControlledTimer.asm UART_1829_RadioControlledTimer.asm UnitTest_common_1829_RadioControlledTimer.asm main_unittest_1829_RadioControlledTimer.asm EEPROM_1829_RadioControlledTimer.asm EEPROM_unittest_1829_RadioControlledTimer.asm

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/LED_1829_RadioControlledTimer.o ${OBJECTDIR}/RTC_1829_RadioControlledTimer.o ${OBJECTDIR}/RTC_unitest_1829_RadioControlledTimer.o ${OBJECTDIR}/UART_1829_RadioControlledTimer.o ${OBJECTDIR}/UnitTest_common_1829_RadioControlledTimer.o ${OBJECTDIR}/main_unittest_1829_RadioControlledTimer.o ${OBJECTDIR}/EEPROM_1829_RadioControlledTimer.o ${OBJECTDIR}/EEPROM_unittest_1829_RadioControlledTimer.o
POSSIBLE_DEPFILES=${OBJECTDIR}/LED_1829_RadioControlledTimer.o.d ${OBJECTDIR}/RTC_1829_RadioControlledTimer.o.d ${OBJECTDIR}/RTC_unitest_1829_RadioControlledTimer.o.d ${OBJECTDIR}/UART_1829_RadioControlledTimer.o.d ${OBJECTDIR}/UnitTest_common_1829_RadioControlledTimer.o.d ${OBJECTDIR}/main_unittest_1829_RadioControlledTimer.o.d ${OBJECTDIR}/EEPROM_1829_RadioControlledTimer.o.d ${OBJECTDIR}/EEPROM_unittest_1829_RadioControlledTimer.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/LED_1829_RadioControlledTimer.o ${OBJECTDIR}/RTC_1829_RadioControlledTimer.o ${OBJECTDIR}/RTC_unitest_1829_RadioControlledTimer.o ${OBJECTDIR}/UART_1829_RadioControlledTimer.o ${OBJECTDIR}/UnitTest_common_1829_RadioControlledTimer.o ${OBJECTDIR}/main_unittest_1829_RadioControlledTimer.o ${OBJECTDIR}/EEPROM_1829_RadioControlledTimer.o ${OBJECTDIR}/EEPROM_unittest_1829_RadioControlledTimer.o

# Source Files
SOURCEFILES=LED_1829_RadioControlledTimer.asm RTC_1829_RadioControlledTimer.asm RTC_unitest_1829_RadioControlledTimer.asm UART_1829_RadioControlledTimer.asm UnitTest_common_1829_RadioControlledTimer.asm main_unittest_1829_RadioControlledTimer.asm EEPROM_1829_RadioControlledTimer.asm EEPROM_unittest_1829_RadioControlledTimer.asm


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-Unit_testing.mk dist/${CND_CONF}/${IMAGE_TYPE}/StepE.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=16f1829
MP_LINKER_DEBUG_OPTION= 
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/LED_1829_RadioControlledTimer.o: LED_1829_RadioControlledTimer.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/LED_1829_RadioControlledTimer.o.d 
	@${RM} ${OBJECTDIR}/LED_1829_RadioControlledTimer.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/LED_1829_RadioControlledTimer.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_PK3=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/LED_1829_RadioControlledTimer.lst\" -e\"${OBJECTDIR}/LED_1829_RadioControlledTimer.err\" $(ASM_OPTIONS) -dUNIT_TEST   -o\"${OBJECTDIR}/LED_1829_RadioControlledTimer.o\" \"LED_1829_RadioControlledTimer.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/LED_1829_RadioControlledTimer.o"
	@${FIXDEPS} "${OBJECTDIR}/LED_1829_RadioControlledTimer.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/RTC_1829_RadioControlledTimer.o: RTC_1829_RadioControlledTimer.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/RTC_1829_RadioControlledTimer.o.d 
	@${RM} ${OBJECTDIR}/RTC_1829_RadioControlledTimer.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/RTC_1829_RadioControlledTimer.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_PK3=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/RTC_1829_RadioControlledTimer.lst\" -e\"${OBJECTDIR}/RTC_1829_RadioControlledTimer.err\" $(ASM_OPTIONS) -dUNIT_TEST   -o\"${OBJECTDIR}/RTC_1829_RadioControlledTimer.o\" \"RTC_1829_RadioControlledTimer.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/RTC_1829_RadioControlledTimer.o"
	@${FIXDEPS} "${OBJECTDIR}/RTC_1829_RadioControlledTimer.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/RTC_unitest_1829_RadioControlledTimer.o: RTC_unitest_1829_RadioControlledTimer.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/RTC_unitest_1829_RadioControlledTimer.o.d 
	@${RM} ${OBJECTDIR}/RTC_unitest_1829_RadioControlledTimer.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/RTC_unitest_1829_RadioControlledTimer.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_PK3=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/RTC_unitest_1829_RadioControlledTimer.lst\" -e\"${OBJECTDIR}/RTC_unitest_1829_RadioControlledTimer.err\" $(ASM_OPTIONS) -dUNIT_TEST   -o\"${OBJECTDIR}/RTC_unitest_1829_RadioControlledTimer.o\" \"RTC_unitest_1829_RadioControlledTimer.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/RTC_unitest_1829_RadioControlledTimer.o"
	@${FIXDEPS} "${OBJECTDIR}/RTC_unitest_1829_RadioControlledTimer.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/UART_1829_RadioControlledTimer.o: UART_1829_RadioControlledTimer.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/UART_1829_RadioControlledTimer.o.d 
	@${RM} ${OBJECTDIR}/UART_1829_RadioControlledTimer.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/UART_1829_RadioControlledTimer.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_PK3=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/UART_1829_RadioControlledTimer.lst\" -e\"${OBJECTDIR}/UART_1829_RadioControlledTimer.err\" $(ASM_OPTIONS) -dUNIT_TEST   -o\"${OBJECTDIR}/UART_1829_RadioControlledTimer.o\" \"UART_1829_RadioControlledTimer.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/UART_1829_RadioControlledTimer.o"
	@${FIXDEPS} "${OBJECTDIR}/UART_1829_RadioControlledTimer.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/UnitTest_common_1829_RadioControlledTimer.o: UnitTest_common_1829_RadioControlledTimer.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/UnitTest_common_1829_RadioControlledTimer.o.d 
	@${RM} ${OBJECTDIR}/UnitTest_common_1829_RadioControlledTimer.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/UnitTest_common_1829_RadioControlledTimer.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_PK3=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/UnitTest_common_1829_RadioControlledTimer.lst\" -e\"${OBJECTDIR}/UnitTest_common_1829_RadioControlledTimer.err\" $(ASM_OPTIONS) -dUNIT_TEST   -o\"${OBJECTDIR}/UnitTest_common_1829_RadioControlledTimer.o\" \"UnitTest_common_1829_RadioControlledTimer.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/UnitTest_common_1829_RadioControlledTimer.o"
	@${FIXDEPS} "${OBJECTDIR}/UnitTest_common_1829_RadioControlledTimer.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/main_unittest_1829_RadioControlledTimer.o: main_unittest_1829_RadioControlledTimer.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main_unittest_1829_RadioControlledTimer.o.d 
	@${RM} ${OBJECTDIR}/main_unittest_1829_RadioControlledTimer.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/main_unittest_1829_RadioControlledTimer.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_PK3=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/main_unittest_1829_RadioControlledTimer.lst\" -e\"${OBJECTDIR}/main_unittest_1829_RadioControlledTimer.err\" $(ASM_OPTIONS) -dUNIT_TEST   -o\"${OBJECTDIR}/main_unittest_1829_RadioControlledTimer.o\" \"main_unittest_1829_RadioControlledTimer.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/main_unittest_1829_RadioControlledTimer.o"
	@${FIXDEPS} "${OBJECTDIR}/main_unittest_1829_RadioControlledTimer.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/EEPROM_1829_RadioControlledTimer.o: EEPROM_1829_RadioControlledTimer.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/EEPROM_1829_RadioControlledTimer.o.d 
	@${RM} ${OBJECTDIR}/EEPROM_1829_RadioControlledTimer.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/EEPROM_1829_RadioControlledTimer.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_PK3=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/EEPROM_1829_RadioControlledTimer.lst\" -e\"${OBJECTDIR}/EEPROM_1829_RadioControlledTimer.err\" $(ASM_OPTIONS) -dUNIT_TEST   -o\"${OBJECTDIR}/EEPROM_1829_RadioControlledTimer.o\" \"EEPROM_1829_RadioControlledTimer.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/EEPROM_1829_RadioControlledTimer.o"
	@${FIXDEPS} "${OBJECTDIR}/EEPROM_1829_RadioControlledTimer.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/EEPROM_unittest_1829_RadioControlledTimer.o: EEPROM_unittest_1829_RadioControlledTimer.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/EEPROM_unittest_1829_RadioControlledTimer.o.d 
	@${RM} ${OBJECTDIR}/EEPROM_unittest_1829_RadioControlledTimer.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/EEPROM_unittest_1829_RadioControlledTimer.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -d__DEBUG -d__MPLAB_DEBUGGER_PK3=1 -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/EEPROM_unittest_1829_RadioControlledTimer.lst\" -e\"${OBJECTDIR}/EEPROM_unittest_1829_RadioControlledTimer.err\" $(ASM_OPTIONS) -dUNIT_TEST   -o\"${OBJECTDIR}/EEPROM_unittest_1829_RadioControlledTimer.o\" \"EEPROM_unittest_1829_RadioControlledTimer.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/EEPROM_unittest_1829_RadioControlledTimer.o"
	@${FIXDEPS} "${OBJECTDIR}/EEPROM_unittest_1829_RadioControlledTimer.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
else
${OBJECTDIR}/LED_1829_RadioControlledTimer.o: LED_1829_RadioControlledTimer.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/LED_1829_RadioControlledTimer.o.d 
	@${RM} ${OBJECTDIR}/LED_1829_RadioControlledTimer.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/LED_1829_RadioControlledTimer.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/LED_1829_RadioControlledTimer.lst\" -e\"${OBJECTDIR}/LED_1829_RadioControlledTimer.err\" $(ASM_OPTIONS) -dUNIT_TEST   -o\"${OBJECTDIR}/LED_1829_RadioControlledTimer.o\" \"LED_1829_RadioControlledTimer.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/LED_1829_RadioControlledTimer.o"
	@${FIXDEPS} "${OBJECTDIR}/LED_1829_RadioControlledTimer.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/RTC_1829_RadioControlledTimer.o: RTC_1829_RadioControlledTimer.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/RTC_1829_RadioControlledTimer.o.d 
	@${RM} ${OBJECTDIR}/RTC_1829_RadioControlledTimer.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/RTC_1829_RadioControlledTimer.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/RTC_1829_RadioControlledTimer.lst\" -e\"${OBJECTDIR}/RTC_1829_RadioControlledTimer.err\" $(ASM_OPTIONS) -dUNIT_TEST   -o\"${OBJECTDIR}/RTC_1829_RadioControlledTimer.o\" \"RTC_1829_RadioControlledTimer.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/RTC_1829_RadioControlledTimer.o"
	@${FIXDEPS} "${OBJECTDIR}/RTC_1829_RadioControlledTimer.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/RTC_unitest_1829_RadioControlledTimer.o: RTC_unitest_1829_RadioControlledTimer.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/RTC_unitest_1829_RadioControlledTimer.o.d 
	@${RM} ${OBJECTDIR}/RTC_unitest_1829_RadioControlledTimer.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/RTC_unitest_1829_RadioControlledTimer.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/RTC_unitest_1829_RadioControlledTimer.lst\" -e\"${OBJECTDIR}/RTC_unitest_1829_RadioControlledTimer.err\" $(ASM_OPTIONS) -dUNIT_TEST   -o\"${OBJECTDIR}/RTC_unitest_1829_RadioControlledTimer.o\" \"RTC_unitest_1829_RadioControlledTimer.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/RTC_unitest_1829_RadioControlledTimer.o"
	@${FIXDEPS} "${OBJECTDIR}/RTC_unitest_1829_RadioControlledTimer.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/UART_1829_RadioControlledTimer.o: UART_1829_RadioControlledTimer.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/UART_1829_RadioControlledTimer.o.d 
	@${RM} ${OBJECTDIR}/UART_1829_RadioControlledTimer.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/UART_1829_RadioControlledTimer.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/UART_1829_RadioControlledTimer.lst\" -e\"${OBJECTDIR}/UART_1829_RadioControlledTimer.err\" $(ASM_OPTIONS) -dUNIT_TEST   -o\"${OBJECTDIR}/UART_1829_RadioControlledTimer.o\" \"UART_1829_RadioControlledTimer.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/UART_1829_RadioControlledTimer.o"
	@${FIXDEPS} "${OBJECTDIR}/UART_1829_RadioControlledTimer.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/UnitTest_common_1829_RadioControlledTimer.o: UnitTest_common_1829_RadioControlledTimer.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/UnitTest_common_1829_RadioControlledTimer.o.d 
	@${RM} ${OBJECTDIR}/UnitTest_common_1829_RadioControlledTimer.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/UnitTest_common_1829_RadioControlledTimer.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/UnitTest_common_1829_RadioControlledTimer.lst\" -e\"${OBJECTDIR}/UnitTest_common_1829_RadioControlledTimer.err\" $(ASM_OPTIONS) -dUNIT_TEST   -o\"${OBJECTDIR}/UnitTest_common_1829_RadioControlledTimer.o\" \"UnitTest_common_1829_RadioControlledTimer.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/UnitTest_common_1829_RadioControlledTimer.o"
	@${FIXDEPS} "${OBJECTDIR}/UnitTest_common_1829_RadioControlledTimer.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/main_unittest_1829_RadioControlledTimer.o: main_unittest_1829_RadioControlledTimer.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main_unittest_1829_RadioControlledTimer.o.d 
	@${RM} ${OBJECTDIR}/main_unittest_1829_RadioControlledTimer.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/main_unittest_1829_RadioControlledTimer.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/main_unittest_1829_RadioControlledTimer.lst\" -e\"${OBJECTDIR}/main_unittest_1829_RadioControlledTimer.err\" $(ASM_OPTIONS) -dUNIT_TEST   -o\"${OBJECTDIR}/main_unittest_1829_RadioControlledTimer.o\" \"main_unittest_1829_RadioControlledTimer.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/main_unittest_1829_RadioControlledTimer.o"
	@${FIXDEPS} "${OBJECTDIR}/main_unittest_1829_RadioControlledTimer.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/EEPROM_1829_RadioControlledTimer.o: EEPROM_1829_RadioControlledTimer.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/EEPROM_1829_RadioControlledTimer.o.d 
	@${RM} ${OBJECTDIR}/EEPROM_1829_RadioControlledTimer.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/EEPROM_1829_RadioControlledTimer.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/EEPROM_1829_RadioControlledTimer.lst\" -e\"${OBJECTDIR}/EEPROM_1829_RadioControlledTimer.err\" $(ASM_OPTIONS) -dUNIT_TEST   -o\"${OBJECTDIR}/EEPROM_1829_RadioControlledTimer.o\" \"EEPROM_1829_RadioControlledTimer.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/EEPROM_1829_RadioControlledTimer.o"
	@${FIXDEPS} "${OBJECTDIR}/EEPROM_1829_RadioControlledTimer.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
${OBJECTDIR}/EEPROM_unittest_1829_RadioControlledTimer.o: EEPROM_unittest_1829_RadioControlledTimer.asm  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/EEPROM_unittest_1829_RadioControlledTimer.o.d 
	@${RM} ${OBJECTDIR}/EEPROM_unittest_1829_RadioControlledTimer.o 
	@${FIXDEPS} dummy.d -e "${OBJECTDIR}/EEPROM_unittest_1829_RadioControlledTimer.err" $(SILENT) -c ${MP_AS} $(MP_EXTRA_AS_PRE) -q -p$(MP_PROCESSOR_OPTION)  -l\"${OBJECTDIR}/EEPROM_unittest_1829_RadioControlledTimer.lst\" -e\"${OBJECTDIR}/EEPROM_unittest_1829_RadioControlledTimer.err\" $(ASM_OPTIONS) -dUNIT_TEST   -o\"${OBJECTDIR}/EEPROM_unittest_1829_RadioControlledTimer.o\" \"EEPROM_unittest_1829_RadioControlledTimer.asm\" 
	@${DEP_GEN} -d "${OBJECTDIR}/EEPROM_unittest_1829_RadioControlledTimer.o"
	@${FIXDEPS} "${OBJECTDIR}/EEPROM_unittest_1829_RadioControlledTimer.o.d" $(SILENT) -rsi ${MP_AS_DIR} -c18 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/StepE.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_LD} $(MP_EXTRA_LD_PRE)   -p$(MP_PROCESSOR_OPTION)  -w -x -u_DEBUG -z__ICD2RAM=1 -m"${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map"   -z__MPLAB_BUILD=1  -z__MPLAB_DEBUG=1 -z__MPLAB_DEBUGGER_PK3=1 $(MP_LINKER_DEBUG_OPTION) -odist/${CND_CONF}/${IMAGE_TYPE}/StepE.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
else
dist/${CND_CONF}/${IMAGE_TYPE}/StepE.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_LD} $(MP_EXTRA_LD_PRE)   -p$(MP_PROCESSOR_OPTION)  -w  -m"${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map"   -z__MPLAB_BUILD=1  -odist/${CND_CONF}/${IMAGE_TYPE}/StepE.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/Unit_testing
	${RM} -r dist/Unit_testing

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
