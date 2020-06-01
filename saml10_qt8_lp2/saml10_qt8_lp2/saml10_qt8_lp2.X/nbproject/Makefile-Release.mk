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
ifeq "$(wildcard nbproject/Makefile-local-Release.mk)" "nbproject/Makefile-local-Release.mk"
include nbproject/Makefile-local-Release.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=Release
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/saml10_qt8_lp2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/saml10_qt8_lp2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
SOURCEFILES_QUOTED_IF_SPACED=../Device_Startup/startup_saml10e16a.c ../Device_Startup/system_saml10e16a.c ../examples/driver_examples.c ../examples/touch_example.c ../hal/src/hal_atomic.c ../hal/src/hal_delay.c ../hal/src/hal_evsys.c ../hal/src/hal_gpio.c ../hal/src/hal_init.c ../hal/src/hal_io.c ../hal/src/hal_sleep.c ../hal/src/hal_timer.c ../hal/src/hal_usart_async.c ../hal/utils/src/utils_assert.c ../hal/utils/src/utils_event.c ../hal/utils/src/utils_list.c ../hal/utils/src/utils_ringbuffer.c ../hal/utils/src/utils_syscalls.c ../hpl/core/hpl_core_m23_base.c ../hpl/core/hpl_init.c ../hpl/dmac/hpl_dmac.c ../hpl/evsys/hpl_evsys.c ../hpl/gclk/hpl_gclk.c ../hpl/mclk/hpl_mclk.c ../hpl/osc32kctrl/hpl_osc32kctrl.c ../hpl/oscctrl/hpl_oscctrl.c ../hpl/pm/hpl_pm.c ../hpl/rtc/hpl_rtc.c ../hpl/sercom/hpl_sercom.c ../qtouch/datastreamer/kronocommadaptor.c ../qtouch/datastreamer/kronocommuart_sam.c ../qtouch/touch.c ../atmel_start.c ../driver_init.c ../main.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1301743165/startup_saml10e16a.o ${OBJECTDIR}/_ext/1301743165/system_saml10e16a.o ${OBJECTDIR}/_ext/1381494712/driver_examples.o ${OBJECTDIR}/_ext/1381494712/touch_example.o ${OBJECTDIR}/_ext/991121639/hal_atomic.o ${OBJECTDIR}/_ext/991121639/hal_delay.o ${OBJECTDIR}/_ext/991121639/hal_evsys.o ${OBJECTDIR}/_ext/991121639/hal_gpio.o ${OBJECTDIR}/_ext/991121639/hal_init.o ${OBJECTDIR}/_ext/991121639/hal_io.o ${OBJECTDIR}/_ext/991121639/hal_sleep.o ${OBJECTDIR}/_ext/991121639/hal_timer.o ${OBJECTDIR}/_ext/991121639/hal_usart_async.o ${OBJECTDIR}/_ext/447684357/utils_assert.o ${OBJECTDIR}/_ext/447684357/utils_event.o ${OBJECTDIR}/_ext/447684357/utils_list.o ${OBJECTDIR}/_ext/447684357/utils_ringbuffer.o ${OBJECTDIR}/_ext/447684357/utils_syscalls.o ${OBJECTDIR}/_ext/232825383/hpl_core_m23_base.o ${OBJECTDIR}/_ext/232825383/hpl_init.o ${OBJECTDIR}/_ext/232798043/hpl_dmac.o ${OBJECTDIR}/_ext/1374404994/hpl_evsys.o ${OBJECTDIR}/_ext/232717931/hpl_gclk.o ${OBJECTDIR}/_ext/232539185/hpl_mclk.o ${OBJECTDIR}/_ext/833842894/hpl_osc32kctrl.o ${OBJECTDIR}/_ext/1862940304/hpl_oscctrl.o ${OBJECTDIR}/_ext/1126497609/hpl_pm.o ${OBJECTDIR}/_ext/561685273/hpl_rtc.o ${OBJECTDIR}/_ext/41939163/hpl_sercom.o ${OBJECTDIR}/_ext/471950839/kronocommadaptor.o ${OBJECTDIR}/_ext/471950839/kronocommuart_sam.o ${OBJECTDIR}/_ext/864984931/touch.o ${OBJECTDIR}/_ext/1472/atmel_start.o ${OBJECTDIR}/_ext/1472/driver_init.o ${OBJECTDIR}/_ext/1472/main.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1301743165/startup_saml10e16a.o.d ${OBJECTDIR}/_ext/1301743165/system_saml10e16a.o.d ${OBJECTDIR}/_ext/1381494712/driver_examples.o.d ${OBJECTDIR}/_ext/1381494712/touch_example.o.d ${OBJECTDIR}/_ext/991121639/hal_atomic.o.d ${OBJECTDIR}/_ext/991121639/hal_delay.o.d ${OBJECTDIR}/_ext/991121639/hal_evsys.o.d ${OBJECTDIR}/_ext/991121639/hal_gpio.o.d ${OBJECTDIR}/_ext/991121639/hal_init.o.d ${OBJECTDIR}/_ext/991121639/hal_io.o.d ${OBJECTDIR}/_ext/991121639/hal_sleep.o.d ${OBJECTDIR}/_ext/991121639/hal_timer.o.d ${OBJECTDIR}/_ext/991121639/hal_usart_async.o.d ${OBJECTDIR}/_ext/447684357/utils_assert.o.d ${OBJECTDIR}/_ext/447684357/utils_event.o.d ${OBJECTDIR}/_ext/447684357/utils_list.o.d ${OBJECTDIR}/_ext/447684357/utils_ringbuffer.o.d ${OBJECTDIR}/_ext/447684357/utils_syscalls.o.d ${OBJECTDIR}/_ext/232825383/hpl_core_m23_base.o.d ${OBJECTDIR}/_ext/232825383/hpl_init.o.d ${OBJECTDIR}/_ext/232798043/hpl_dmac.o.d ${OBJECTDIR}/_ext/1374404994/hpl_evsys.o.d ${OBJECTDIR}/_ext/232717931/hpl_gclk.o.d ${OBJECTDIR}/_ext/232539185/hpl_mclk.o.d ${OBJECTDIR}/_ext/833842894/hpl_osc32kctrl.o.d ${OBJECTDIR}/_ext/1862940304/hpl_oscctrl.o.d ${OBJECTDIR}/_ext/1126497609/hpl_pm.o.d ${OBJECTDIR}/_ext/561685273/hpl_rtc.o.d ${OBJECTDIR}/_ext/41939163/hpl_sercom.o.d ${OBJECTDIR}/_ext/471950839/kronocommadaptor.o.d ${OBJECTDIR}/_ext/471950839/kronocommuart_sam.o.d ${OBJECTDIR}/_ext/864984931/touch.o.d ${OBJECTDIR}/_ext/1472/atmel_start.o.d ${OBJECTDIR}/_ext/1472/driver_init.o.d ${OBJECTDIR}/_ext/1472/main.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1301743165/startup_saml10e16a.o ${OBJECTDIR}/_ext/1301743165/system_saml10e16a.o ${OBJECTDIR}/_ext/1381494712/driver_examples.o ${OBJECTDIR}/_ext/1381494712/touch_example.o ${OBJECTDIR}/_ext/991121639/hal_atomic.o ${OBJECTDIR}/_ext/991121639/hal_delay.o ${OBJECTDIR}/_ext/991121639/hal_evsys.o ${OBJECTDIR}/_ext/991121639/hal_gpio.o ${OBJECTDIR}/_ext/991121639/hal_init.o ${OBJECTDIR}/_ext/991121639/hal_io.o ${OBJECTDIR}/_ext/991121639/hal_sleep.o ${OBJECTDIR}/_ext/991121639/hal_timer.o ${OBJECTDIR}/_ext/991121639/hal_usart_async.o ${OBJECTDIR}/_ext/447684357/utils_assert.o ${OBJECTDIR}/_ext/447684357/utils_event.o ${OBJECTDIR}/_ext/447684357/utils_list.o ${OBJECTDIR}/_ext/447684357/utils_ringbuffer.o ${OBJECTDIR}/_ext/447684357/utils_syscalls.o ${OBJECTDIR}/_ext/232825383/hpl_core_m23_base.o ${OBJECTDIR}/_ext/232825383/hpl_init.o ${OBJECTDIR}/_ext/232798043/hpl_dmac.o ${OBJECTDIR}/_ext/1374404994/hpl_evsys.o ${OBJECTDIR}/_ext/232717931/hpl_gclk.o ${OBJECTDIR}/_ext/232539185/hpl_mclk.o ${OBJECTDIR}/_ext/833842894/hpl_osc32kctrl.o ${OBJECTDIR}/_ext/1862940304/hpl_oscctrl.o ${OBJECTDIR}/_ext/1126497609/hpl_pm.o ${OBJECTDIR}/_ext/561685273/hpl_rtc.o ${OBJECTDIR}/_ext/41939163/hpl_sercom.o ${OBJECTDIR}/_ext/471950839/kronocommadaptor.o ${OBJECTDIR}/_ext/471950839/kronocommuart_sam.o ${OBJECTDIR}/_ext/864984931/touch.o ${OBJECTDIR}/_ext/1472/atmel_start.o ${OBJECTDIR}/_ext/1472/driver_init.o ${OBJECTDIR}/_ext/1472/main.o

# Source Files
SOURCEFILES=../Device_Startup/startup_saml10e16a.c ../Device_Startup/system_saml10e16a.c ../examples/driver_examples.c ../examples/touch_example.c ../hal/src/hal_atomic.c ../hal/src/hal_delay.c ../hal/src/hal_evsys.c ../hal/src/hal_gpio.c ../hal/src/hal_init.c ../hal/src/hal_io.c ../hal/src/hal_sleep.c ../hal/src/hal_timer.c ../hal/src/hal_usart_async.c ../hal/utils/src/utils_assert.c ../hal/utils/src/utils_event.c ../hal/utils/src/utils_list.c ../hal/utils/src/utils_ringbuffer.c ../hal/utils/src/utils_syscalls.c ../hpl/core/hpl_core_m23_base.c ../hpl/core/hpl_init.c ../hpl/dmac/hpl_dmac.c ../hpl/evsys/hpl_evsys.c ../hpl/gclk/hpl_gclk.c ../hpl/mclk/hpl_mclk.c ../hpl/osc32kctrl/hpl_osc32kctrl.c ../hpl/oscctrl/hpl_oscctrl.c ../hpl/pm/hpl_pm.c ../hpl/rtc/hpl_rtc.c ../hpl/sercom/hpl_sercom.c ../qtouch/datastreamer/kronocommadaptor.c ../qtouch/datastreamer/kronocommuart_sam.c ../qtouch/touch.c ../atmel_start.c ../driver_init.c ../main.c

# Pack Options 
PACK_COMMON_OPTIONS=-I "${DFP_DIR}/include"  -I "${CMSIS_DIR}/CMSIS/Core/Include"



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
	${MAKE}  -f nbproject/Makefile-Release.mk dist/${CND_CONF}/${IMAGE_TYPE}/saml10_qt8_lp2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=SAML10E16A
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1301743165/startup_saml10e16a.o: ../Device_Startup/startup_saml10e16a.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1301743165" 
	@${RM} ${OBJECTDIR}/_ext/1301743165/startup_saml10e16a.o.d 
	@${RM} ${OBJECTDIR}/_ext/1301743165/startup_saml10e16a.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23 -g -D__DEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1301743165/startup_saml10e16a.o.d" -o ${OBJECTDIR}/_ext/1301743165/startup_saml10e16a.o ../Device_Startup/startup_saml10e16a.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1301743165/startup_saml10e16a.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1301743165/system_saml10e16a.o: ../Device_Startup/system_saml10e16a.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1301743165" 
	@${RM} ${OBJECTDIR}/_ext/1301743165/system_saml10e16a.o.d 
	@${RM} ${OBJECTDIR}/_ext/1301743165/system_saml10e16a.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23 -g -D__DEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1301743165/system_saml10e16a.o.d" -o ${OBJECTDIR}/_ext/1301743165/system_saml10e16a.o ../Device_Startup/system_saml10e16a.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1301743165/system_saml10e16a.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1381494712/driver_examples.o: ../examples/driver_examples.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1381494712" 
	@${RM} ${OBJECTDIR}/_ext/1381494712/driver_examples.o.d 
	@${RM} ${OBJECTDIR}/_ext/1381494712/driver_examples.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23 -g -D__DEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1381494712/driver_examples.o.d" -o ${OBJECTDIR}/_ext/1381494712/driver_examples.o ../examples/driver_examples.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1381494712/driver_examples.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1381494712/touch_example.o: ../examples/touch_example.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1381494712" 
	@${RM} ${OBJECTDIR}/_ext/1381494712/touch_example.o.d 
	@${RM} ${OBJECTDIR}/_ext/1381494712/touch_example.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23 -g -D__DEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1381494712/touch_example.o.d" -o ${OBJECTDIR}/_ext/1381494712/touch_example.o ../examples/touch_example.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1381494712/touch_example.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/991121639/hal_atomic.o: ../hal/src/hal_atomic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/991121639" 
	@${RM} ${OBJECTDIR}/_ext/991121639/hal_atomic.o.d 
	@${RM} ${OBJECTDIR}/_ext/991121639/hal_atomic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23 -g -D__DEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/991121639/hal_atomic.o.d" -o ${OBJECTDIR}/_ext/991121639/hal_atomic.o ../hal/src/hal_atomic.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/991121639/hal_atomic.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/991121639/hal_delay.o: ../hal/src/hal_delay.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/991121639" 
	@${RM} ${OBJECTDIR}/_ext/991121639/hal_delay.o.d 
	@${RM} ${OBJECTDIR}/_ext/991121639/hal_delay.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23 -g -D__DEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/991121639/hal_delay.o.d" -o ${OBJECTDIR}/_ext/991121639/hal_delay.o ../hal/src/hal_delay.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/991121639/hal_delay.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/991121639/hal_evsys.o: ../hal/src/hal_evsys.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/991121639" 
	@${RM} ${OBJECTDIR}/_ext/991121639/hal_evsys.o.d 
	@${RM} ${OBJECTDIR}/_ext/991121639/hal_evsys.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23 -g -D__DEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/991121639/hal_evsys.o.d" -o ${OBJECTDIR}/_ext/991121639/hal_evsys.o ../hal/src/hal_evsys.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/991121639/hal_evsys.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/991121639/hal_gpio.o: ../hal/src/hal_gpio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/991121639" 
	@${RM} ${OBJECTDIR}/_ext/991121639/hal_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/991121639/hal_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23 -g -D__DEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/991121639/hal_gpio.o.d" -o ${OBJECTDIR}/_ext/991121639/hal_gpio.o ../hal/src/hal_gpio.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/991121639/hal_gpio.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/991121639/hal_init.o: ../hal/src/hal_init.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/991121639" 
	@${RM} ${OBJECTDIR}/_ext/991121639/hal_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/991121639/hal_init.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23 -g -D__DEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/991121639/hal_init.o.d" -o ${OBJECTDIR}/_ext/991121639/hal_init.o ../hal/src/hal_init.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/991121639/hal_init.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/991121639/hal_io.o: ../hal/src/hal_io.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/991121639" 
	@${RM} ${OBJECTDIR}/_ext/991121639/hal_io.o.d 
	@${RM} ${OBJECTDIR}/_ext/991121639/hal_io.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23 -g -D__DEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/991121639/hal_io.o.d" -o ${OBJECTDIR}/_ext/991121639/hal_io.o ../hal/src/hal_io.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/991121639/hal_io.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/991121639/hal_sleep.o: ../hal/src/hal_sleep.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/991121639" 
	@${RM} ${OBJECTDIR}/_ext/991121639/hal_sleep.o.d 
	@${RM} ${OBJECTDIR}/_ext/991121639/hal_sleep.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23 -g -D__DEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/991121639/hal_sleep.o.d" -o ${OBJECTDIR}/_ext/991121639/hal_sleep.o ../hal/src/hal_sleep.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/991121639/hal_sleep.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/991121639/hal_timer.o: ../hal/src/hal_timer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/991121639" 
	@${RM} ${OBJECTDIR}/_ext/991121639/hal_timer.o.d 
	@${RM} ${OBJECTDIR}/_ext/991121639/hal_timer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23 -g -D__DEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/991121639/hal_timer.o.d" -o ${OBJECTDIR}/_ext/991121639/hal_timer.o ../hal/src/hal_timer.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/991121639/hal_timer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/991121639/hal_usart_async.o: ../hal/src/hal_usart_async.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/991121639" 
	@${RM} ${OBJECTDIR}/_ext/991121639/hal_usart_async.o.d 
	@${RM} ${OBJECTDIR}/_ext/991121639/hal_usart_async.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23 -g -D__DEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/991121639/hal_usart_async.o.d" -o ${OBJECTDIR}/_ext/991121639/hal_usart_async.o ../hal/src/hal_usart_async.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/991121639/hal_usart_async.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/447684357/utils_assert.o: ../hal/utils/src/utils_assert.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/447684357" 
	@${RM} ${OBJECTDIR}/_ext/447684357/utils_assert.o.d 
	@${RM} ${OBJECTDIR}/_ext/447684357/utils_assert.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23 -g -D__DEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/447684357/utils_assert.o.d" -o ${OBJECTDIR}/_ext/447684357/utils_assert.o ../hal/utils/src/utils_assert.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/447684357/utils_assert.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/447684357/utils_event.o: ../hal/utils/src/utils_event.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/447684357" 
	@${RM} ${OBJECTDIR}/_ext/447684357/utils_event.o.d 
	@${RM} ${OBJECTDIR}/_ext/447684357/utils_event.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23 -g -D__DEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/447684357/utils_event.o.d" -o ${OBJECTDIR}/_ext/447684357/utils_event.o ../hal/utils/src/utils_event.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/447684357/utils_event.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/447684357/utils_list.o: ../hal/utils/src/utils_list.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/447684357" 
	@${RM} ${OBJECTDIR}/_ext/447684357/utils_list.o.d 
	@${RM} ${OBJECTDIR}/_ext/447684357/utils_list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23 -g -D__DEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/447684357/utils_list.o.d" -o ${OBJECTDIR}/_ext/447684357/utils_list.o ../hal/utils/src/utils_list.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/447684357/utils_list.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/447684357/utils_ringbuffer.o: ../hal/utils/src/utils_ringbuffer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/447684357" 
	@${RM} ${OBJECTDIR}/_ext/447684357/utils_ringbuffer.o.d 
	@${RM} ${OBJECTDIR}/_ext/447684357/utils_ringbuffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23 -g -D__DEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/447684357/utils_ringbuffer.o.d" -o ${OBJECTDIR}/_ext/447684357/utils_ringbuffer.o ../hal/utils/src/utils_ringbuffer.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/447684357/utils_ringbuffer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/447684357/utils_syscalls.o: ../hal/utils/src/utils_syscalls.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/447684357" 
	@${RM} ${OBJECTDIR}/_ext/447684357/utils_syscalls.o.d 
	@${RM} ${OBJECTDIR}/_ext/447684357/utils_syscalls.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23 -g -D__DEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/447684357/utils_syscalls.o.d" -o ${OBJECTDIR}/_ext/447684357/utils_syscalls.o ../hal/utils/src/utils_syscalls.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/447684357/utils_syscalls.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/232825383/hpl_core_m23_base.o: ../hpl/core/hpl_core_m23_base.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/232825383" 
	@${RM} ${OBJECTDIR}/_ext/232825383/hpl_core_m23_base.o.d 
	@${RM} ${OBJECTDIR}/_ext/232825383/hpl_core_m23_base.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23 -g -D__DEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/232825383/hpl_core_m23_base.o.d" -o ${OBJECTDIR}/_ext/232825383/hpl_core_m23_base.o ../hpl/core/hpl_core_m23_base.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/232825383/hpl_core_m23_base.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/232825383/hpl_init.o: ../hpl/core/hpl_init.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/232825383" 
	@${RM} ${OBJECTDIR}/_ext/232825383/hpl_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/232825383/hpl_init.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23 -g -D__DEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/232825383/hpl_init.o.d" -o ${OBJECTDIR}/_ext/232825383/hpl_init.o ../hpl/core/hpl_init.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/232825383/hpl_init.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/232798043/hpl_dmac.o: ../hpl/dmac/hpl_dmac.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/232798043" 
	@${RM} ${OBJECTDIR}/_ext/232798043/hpl_dmac.o.d 
	@${RM} ${OBJECTDIR}/_ext/232798043/hpl_dmac.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23 -g -D__DEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/232798043/hpl_dmac.o.d" -o ${OBJECTDIR}/_ext/232798043/hpl_dmac.o ../hpl/dmac/hpl_dmac.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/232798043/hpl_dmac.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1374404994/hpl_evsys.o: ../hpl/evsys/hpl_evsys.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1374404994" 
	@${RM} ${OBJECTDIR}/_ext/1374404994/hpl_evsys.o.d 
	@${RM} ${OBJECTDIR}/_ext/1374404994/hpl_evsys.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23 -g -D__DEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1374404994/hpl_evsys.o.d" -o ${OBJECTDIR}/_ext/1374404994/hpl_evsys.o ../hpl/evsys/hpl_evsys.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1374404994/hpl_evsys.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/232717931/hpl_gclk.o: ../hpl/gclk/hpl_gclk.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/232717931" 
	@${RM} ${OBJECTDIR}/_ext/232717931/hpl_gclk.o.d 
	@${RM} ${OBJECTDIR}/_ext/232717931/hpl_gclk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23 -g -D__DEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/232717931/hpl_gclk.o.d" -o ${OBJECTDIR}/_ext/232717931/hpl_gclk.o ../hpl/gclk/hpl_gclk.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/232717931/hpl_gclk.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/232539185/hpl_mclk.o: ../hpl/mclk/hpl_mclk.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/232539185" 
	@${RM} ${OBJECTDIR}/_ext/232539185/hpl_mclk.o.d 
	@${RM} ${OBJECTDIR}/_ext/232539185/hpl_mclk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23 -g -D__DEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/232539185/hpl_mclk.o.d" -o ${OBJECTDIR}/_ext/232539185/hpl_mclk.o ../hpl/mclk/hpl_mclk.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/232539185/hpl_mclk.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/833842894/hpl_osc32kctrl.o: ../hpl/osc32kctrl/hpl_osc32kctrl.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/833842894" 
	@${RM} ${OBJECTDIR}/_ext/833842894/hpl_osc32kctrl.o.d 
	@${RM} ${OBJECTDIR}/_ext/833842894/hpl_osc32kctrl.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23 -g -D__DEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/833842894/hpl_osc32kctrl.o.d" -o ${OBJECTDIR}/_ext/833842894/hpl_osc32kctrl.o ../hpl/osc32kctrl/hpl_osc32kctrl.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/833842894/hpl_osc32kctrl.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1862940304/hpl_oscctrl.o: ../hpl/oscctrl/hpl_oscctrl.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1862940304" 
	@${RM} ${OBJECTDIR}/_ext/1862940304/hpl_oscctrl.o.d 
	@${RM} ${OBJECTDIR}/_ext/1862940304/hpl_oscctrl.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23 -g -D__DEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1862940304/hpl_oscctrl.o.d" -o ${OBJECTDIR}/_ext/1862940304/hpl_oscctrl.o ../hpl/oscctrl/hpl_oscctrl.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1862940304/hpl_oscctrl.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1126497609/hpl_pm.o: ../hpl/pm/hpl_pm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1126497609" 
	@${RM} ${OBJECTDIR}/_ext/1126497609/hpl_pm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1126497609/hpl_pm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23 -g -D__DEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1126497609/hpl_pm.o.d" -o ${OBJECTDIR}/_ext/1126497609/hpl_pm.o ../hpl/pm/hpl_pm.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1126497609/hpl_pm.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/561685273/hpl_rtc.o: ../hpl/rtc/hpl_rtc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/561685273" 
	@${RM} ${OBJECTDIR}/_ext/561685273/hpl_rtc.o.d 
	@${RM} ${OBJECTDIR}/_ext/561685273/hpl_rtc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23 -g -D__DEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/561685273/hpl_rtc.o.d" -o ${OBJECTDIR}/_ext/561685273/hpl_rtc.o ../hpl/rtc/hpl_rtc.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/561685273/hpl_rtc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/41939163/hpl_sercom.o: ../hpl/sercom/hpl_sercom.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/41939163" 
	@${RM} ${OBJECTDIR}/_ext/41939163/hpl_sercom.o.d 
	@${RM} ${OBJECTDIR}/_ext/41939163/hpl_sercom.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23 -g -D__DEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/41939163/hpl_sercom.o.d" -o ${OBJECTDIR}/_ext/41939163/hpl_sercom.o ../hpl/sercom/hpl_sercom.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/41939163/hpl_sercom.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/471950839/kronocommadaptor.o: ../qtouch/datastreamer/kronocommadaptor.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/471950839" 
	@${RM} ${OBJECTDIR}/_ext/471950839/kronocommadaptor.o.d 
	@${RM} ${OBJECTDIR}/_ext/471950839/kronocommadaptor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23 -g -D__DEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/471950839/kronocommadaptor.o.d" -o ${OBJECTDIR}/_ext/471950839/kronocommadaptor.o ../qtouch/datastreamer/kronocommadaptor.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/471950839/kronocommadaptor.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/471950839/kronocommuart_sam.o: ../qtouch/datastreamer/kronocommuart_sam.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/471950839" 
	@${RM} ${OBJECTDIR}/_ext/471950839/kronocommuart_sam.o.d 
	@${RM} ${OBJECTDIR}/_ext/471950839/kronocommuart_sam.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23 -g -D__DEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/471950839/kronocommuart_sam.o.d" -o ${OBJECTDIR}/_ext/471950839/kronocommuart_sam.o ../qtouch/datastreamer/kronocommuart_sam.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/471950839/kronocommuart_sam.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/864984931/touch.o: ../qtouch/touch.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/864984931" 
	@${RM} ${OBJECTDIR}/_ext/864984931/touch.o.d 
	@${RM} ${OBJECTDIR}/_ext/864984931/touch.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23 -g -D__DEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/864984931/touch.o.d" -o ${OBJECTDIR}/_ext/864984931/touch.o ../qtouch/touch.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/864984931/touch.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1472/atmel_start.o: ../atmel_start.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/atmel_start.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/atmel_start.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23 -g -D__DEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1472/atmel_start.o.d" -o ${OBJECTDIR}/_ext/1472/atmel_start.o ../atmel_start.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/atmel_start.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1472/driver_init.o: ../driver_init.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/driver_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/driver_init.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23 -g -D__DEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1472/driver_init.o.d" -o ${OBJECTDIR}/_ext/1472/driver_init.o ../driver_init.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/driver_init.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1472/main.o: ../main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23 -g -D__DEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1472/main.o.d" -o ${OBJECTDIR}/_ext/1472/main.o ../main.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
else
${OBJECTDIR}/_ext/1301743165/startup_saml10e16a.o: ../Device_Startup/startup_saml10e16a.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1301743165" 
	@${RM} ${OBJECTDIR}/_ext/1301743165/startup_saml10e16a.o.d 
	@${RM} ${OBJECTDIR}/_ext/1301743165/startup_saml10e16a.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1301743165/startup_saml10e16a.o.d" -o ${OBJECTDIR}/_ext/1301743165/startup_saml10e16a.o ../Device_Startup/startup_saml10e16a.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1301743165/startup_saml10e16a.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1301743165/system_saml10e16a.o: ../Device_Startup/system_saml10e16a.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1301743165" 
	@${RM} ${OBJECTDIR}/_ext/1301743165/system_saml10e16a.o.d 
	@${RM} ${OBJECTDIR}/_ext/1301743165/system_saml10e16a.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1301743165/system_saml10e16a.o.d" -o ${OBJECTDIR}/_ext/1301743165/system_saml10e16a.o ../Device_Startup/system_saml10e16a.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1301743165/system_saml10e16a.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1381494712/driver_examples.o: ../examples/driver_examples.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1381494712" 
	@${RM} ${OBJECTDIR}/_ext/1381494712/driver_examples.o.d 
	@${RM} ${OBJECTDIR}/_ext/1381494712/driver_examples.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1381494712/driver_examples.o.d" -o ${OBJECTDIR}/_ext/1381494712/driver_examples.o ../examples/driver_examples.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1381494712/driver_examples.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1381494712/touch_example.o: ../examples/touch_example.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1381494712" 
	@${RM} ${OBJECTDIR}/_ext/1381494712/touch_example.o.d 
	@${RM} ${OBJECTDIR}/_ext/1381494712/touch_example.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1381494712/touch_example.o.d" -o ${OBJECTDIR}/_ext/1381494712/touch_example.o ../examples/touch_example.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1381494712/touch_example.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/991121639/hal_atomic.o: ../hal/src/hal_atomic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/991121639" 
	@${RM} ${OBJECTDIR}/_ext/991121639/hal_atomic.o.d 
	@${RM} ${OBJECTDIR}/_ext/991121639/hal_atomic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/991121639/hal_atomic.o.d" -o ${OBJECTDIR}/_ext/991121639/hal_atomic.o ../hal/src/hal_atomic.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/991121639/hal_atomic.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/991121639/hal_delay.o: ../hal/src/hal_delay.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/991121639" 
	@${RM} ${OBJECTDIR}/_ext/991121639/hal_delay.o.d 
	@${RM} ${OBJECTDIR}/_ext/991121639/hal_delay.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/991121639/hal_delay.o.d" -o ${OBJECTDIR}/_ext/991121639/hal_delay.o ../hal/src/hal_delay.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/991121639/hal_delay.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/991121639/hal_evsys.o: ../hal/src/hal_evsys.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/991121639" 
	@${RM} ${OBJECTDIR}/_ext/991121639/hal_evsys.o.d 
	@${RM} ${OBJECTDIR}/_ext/991121639/hal_evsys.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/991121639/hal_evsys.o.d" -o ${OBJECTDIR}/_ext/991121639/hal_evsys.o ../hal/src/hal_evsys.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/991121639/hal_evsys.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/991121639/hal_gpio.o: ../hal/src/hal_gpio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/991121639" 
	@${RM} ${OBJECTDIR}/_ext/991121639/hal_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/991121639/hal_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/991121639/hal_gpio.o.d" -o ${OBJECTDIR}/_ext/991121639/hal_gpio.o ../hal/src/hal_gpio.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/991121639/hal_gpio.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/991121639/hal_init.o: ../hal/src/hal_init.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/991121639" 
	@${RM} ${OBJECTDIR}/_ext/991121639/hal_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/991121639/hal_init.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/991121639/hal_init.o.d" -o ${OBJECTDIR}/_ext/991121639/hal_init.o ../hal/src/hal_init.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/991121639/hal_init.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/991121639/hal_io.o: ../hal/src/hal_io.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/991121639" 
	@${RM} ${OBJECTDIR}/_ext/991121639/hal_io.o.d 
	@${RM} ${OBJECTDIR}/_ext/991121639/hal_io.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/991121639/hal_io.o.d" -o ${OBJECTDIR}/_ext/991121639/hal_io.o ../hal/src/hal_io.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/991121639/hal_io.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/991121639/hal_sleep.o: ../hal/src/hal_sleep.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/991121639" 
	@${RM} ${OBJECTDIR}/_ext/991121639/hal_sleep.o.d 
	@${RM} ${OBJECTDIR}/_ext/991121639/hal_sleep.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/991121639/hal_sleep.o.d" -o ${OBJECTDIR}/_ext/991121639/hal_sleep.o ../hal/src/hal_sleep.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/991121639/hal_sleep.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/991121639/hal_timer.o: ../hal/src/hal_timer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/991121639" 
	@${RM} ${OBJECTDIR}/_ext/991121639/hal_timer.o.d 
	@${RM} ${OBJECTDIR}/_ext/991121639/hal_timer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/991121639/hal_timer.o.d" -o ${OBJECTDIR}/_ext/991121639/hal_timer.o ../hal/src/hal_timer.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/991121639/hal_timer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/991121639/hal_usart_async.o: ../hal/src/hal_usart_async.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/991121639" 
	@${RM} ${OBJECTDIR}/_ext/991121639/hal_usart_async.o.d 
	@${RM} ${OBJECTDIR}/_ext/991121639/hal_usart_async.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/991121639/hal_usart_async.o.d" -o ${OBJECTDIR}/_ext/991121639/hal_usart_async.o ../hal/src/hal_usart_async.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/991121639/hal_usart_async.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/447684357/utils_assert.o: ../hal/utils/src/utils_assert.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/447684357" 
	@${RM} ${OBJECTDIR}/_ext/447684357/utils_assert.o.d 
	@${RM} ${OBJECTDIR}/_ext/447684357/utils_assert.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/447684357/utils_assert.o.d" -o ${OBJECTDIR}/_ext/447684357/utils_assert.o ../hal/utils/src/utils_assert.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/447684357/utils_assert.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/447684357/utils_event.o: ../hal/utils/src/utils_event.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/447684357" 
	@${RM} ${OBJECTDIR}/_ext/447684357/utils_event.o.d 
	@${RM} ${OBJECTDIR}/_ext/447684357/utils_event.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/447684357/utils_event.o.d" -o ${OBJECTDIR}/_ext/447684357/utils_event.o ../hal/utils/src/utils_event.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/447684357/utils_event.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/447684357/utils_list.o: ../hal/utils/src/utils_list.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/447684357" 
	@${RM} ${OBJECTDIR}/_ext/447684357/utils_list.o.d 
	@${RM} ${OBJECTDIR}/_ext/447684357/utils_list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/447684357/utils_list.o.d" -o ${OBJECTDIR}/_ext/447684357/utils_list.o ../hal/utils/src/utils_list.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/447684357/utils_list.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/447684357/utils_ringbuffer.o: ../hal/utils/src/utils_ringbuffer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/447684357" 
	@${RM} ${OBJECTDIR}/_ext/447684357/utils_ringbuffer.o.d 
	@${RM} ${OBJECTDIR}/_ext/447684357/utils_ringbuffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/447684357/utils_ringbuffer.o.d" -o ${OBJECTDIR}/_ext/447684357/utils_ringbuffer.o ../hal/utils/src/utils_ringbuffer.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/447684357/utils_ringbuffer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/447684357/utils_syscalls.o: ../hal/utils/src/utils_syscalls.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/447684357" 
	@${RM} ${OBJECTDIR}/_ext/447684357/utils_syscalls.o.d 
	@${RM} ${OBJECTDIR}/_ext/447684357/utils_syscalls.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/447684357/utils_syscalls.o.d" -o ${OBJECTDIR}/_ext/447684357/utils_syscalls.o ../hal/utils/src/utils_syscalls.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/447684357/utils_syscalls.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/232825383/hpl_core_m23_base.o: ../hpl/core/hpl_core_m23_base.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/232825383" 
	@${RM} ${OBJECTDIR}/_ext/232825383/hpl_core_m23_base.o.d 
	@${RM} ${OBJECTDIR}/_ext/232825383/hpl_core_m23_base.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/232825383/hpl_core_m23_base.o.d" -o ${OBJECTDIR}/_ext/232825383/hpl_core_m23_base.o ../hpl/core/hpl_core_m23_base.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/232825383/hpl_core_m23_base.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/232825383/hpl_init.o: ../hpl/core/hpl_init.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/232825383" 
	@${RM} ${OBJECTDIR}/_ext/232825383/hpl_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/232825383/hpl_init.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/232825383/hpl_init.o.d" -o ${OBJECTDIR}/_ext/232825383/hpl_init.o ../hpl/core/hpl_init.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/232825383/hpl_init.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/232798043/hpl_dmac.o: ../hpl/dmac/hpl_dmac.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/232798043" 
	@${RM} ${OBJECTDIR}/_ext/232798043/hpl_dmac.o.d 
	@${RM} ${OBJECTDIR}/_ext/232798043/hpl_dmac.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/232798043/hpl_dmac.o.d" -o ${OBJECTDIR}/_ext/232798043/hpl_dmac.o ../hpl/dmac/hpl_dmac.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/232798043/hpl_dmac.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1374404994/hpl_evsys.o: ../hpl/evsys/hpl_evsys.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1374404994" 
	@${RM} ${OBJECTDIR}/_ext/1374404994/hpl_evsys.o.d 
	@${RM} ${OBJECTDIR}/_ext/1374404994/hpl_evsys.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1374404994/hpl_evsys.o.d" -o ${OBJECTDIR}/_ext/1374404994/hpl_evsys.o ../hpl/evsys/hpl_evsys.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1374404994/hpl_evsys.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/232717931/hpl_gclk.o: ../hpl/gclk/hpl_gclk.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/232717931" 
	@${RM} ${OBJECTDIR}/_ext/232717931/hpl_gclk.o.d 
	@${RM} ${OBJECTDIR}/_ext/232717931/hpl_gclk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/232717931/hpl_gclk.o.d" -o ${OBJECTDIR}/_ext/232717931/hpl_gclk.o ../hpl/gclk/hpl_gclk.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/232717931/hpl_gclk.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/232539185/hpl_mclk.o: ../hpl/mclk/hpl_mclk.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/232539185" 
	@${RM} ${OBJECTDIR}/_ext/232539185/hpl_mclk.o.d 
	@${RM} ${OBJECTDIR}/_ext/232539185/hpl_mclk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/232539185/hpl_mclk.o.d" -o ${OBJECTDIR}/_ext/232539185/hpl_mclk.o ../hpl/mclk/hpl_mclk.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/232539185/hpl_mclk.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/833842894/hpl_osc32kctrl.o: ../hpl/osc32kctrl/hpl_osc32kctrl.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/833842894" 
	@${RM} ${OBJECTDIR}/_ext/833842894/hpl_osc32kctrl.o.d 
	@${RM} ${OBJECTDIR}/_ext/833842894/hpl_osc32kctrl.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/833842894/hpl_osc32kctrl.o.d" -o ${OBJECTDIR}/_ext/833842894/hpl_osc32kctrl.o ../hpl/osc32kctrl/hpl_osc32kctrl.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/833842894/hpl_osc32kctrl.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1862940304/hpl_oscctrl.o: ../hpl/oscctrl/hpl_oscctrl.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1862940304" 
	@${RM} ${OBJECTDIR}/_ext/1862940304/hpl_oscctrl.o.d 
	@${RM} ${OBJECTDIR}/_ext/1862940304/hpl_oscctrl.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1862940304/hpl_oscctrl.o.d" -o ${OBJECTDIR}/_ext/1862940304/hpl_oscctrl.o ../hpl/oscctrl/hpl_oscctrl.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1862940304/hpl_oscctrl.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1126497609/hpl_pm.o: ../hpl/pm/hpl_pm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1126497609" 
	@${RM} ${OBJECTDIR}/_ext/1126497609/hpl_pm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1126497609/hpl_pm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1126497609/hpl_pm.o.d" -o ${OBJECTDIR}/_ext/1126497609/hpl_pm.o ../hpl/pm/hpl_pm.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1126497609/hpl_pm.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/561685273/hpl_rtc.o: ../hpl/rtc/hpl_rtc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/561685273" 
	@${RM} ${OBJECTDIR}/_ext/561685273/hpl_rtc.o.d 
	@${RM} ${OBJECTDIR}/_ext/561685273/hpl_rtc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/561685273/hpl_rtc.o.d" -o ${OBJECTDIR}/_ext/561685273/hpl_rtc.o ../hpl/rtc/hpl_rtc.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/561685273/hpl_rtc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/41939163/hpl_sercom.o: ../hpl/sercom/hpl_sercom.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/41939163" 
	@${RM} ${OBJECTDIR}/_ext/41939163/hpl_sercom.o.d 
	@${RM} ${OBJECTDIR}/_ext/41939163/hpl_sercom.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/41939163/hpl_sercom.o.d" -o ${OBJECTDIR}/_ext/41939163/hpl_sercom.o ../hpl/sercom/hpl_sercom.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/41939163/hpl_sercom.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/471950839/kronocommadaptor.o: ../qtouch/datastreamer/kronocommadaptor.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/471950839" 
	@${RM} ${OBJECTDIR}/_ext/471950839/kronocommadaptor.o.d 
	@${RM} ${OBJECTDIR}/_ext/471950839/kronocommadaptor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/471950839/kronocommadaptor.o.d" -o ${OBJECTDIR}/_ext/471950839/kronocommadaptor.o ../qtouch/datastreamer/kronocommadaptor.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/471950839/kronocommadaptor.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/471950839/kronocommuart_sam.o: ../qtouch/datastreamer/kronocommuart_sam.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/471950839" 
	@${RM} ${OBJECTDIR}/_ext/471950839/kronocommuart_sam.o.d 
	@${RM} ${OBJECTDIR}/_ext/471950839/kronocommuart_sam.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/471950839/kronocommuart_sam.o.d" -o ${OBJECTDIR}/_ext/471950839/kronocommuart_sam.o ../qtouch/datastreamer/kronocommuart_sam.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/471950839/kronocommuart_sam.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/864984931/touch.o: ../qtouch/touch.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/864984931" 
	@${RM} ${OBJECTDIR}/_ext/864984931/touch.o.d 
	@${RM} ${OBJECTDIR}/_ext/864984931/touch.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/864984931/touch.o.d" -o ${OBJECTDIR}/_ext/864984931/touch.o ../qtouch/touch.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/864984931/touch.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1472/atmel_start.o: ../atmel_start.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/atmel_start.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/atmel_start.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1472/atmel_start.o.d" -o ${OBJECTDIR}/_ext/1472/atmel_start.o ../atmel_start.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/atmel_start.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1472/driver_init.o: ../driver_init.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/driver_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/driver_init.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1472/driver_init.o.d" -o ${OBJECTDIR}/_ext/1472/driver_init.o ../driver_init.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/driver_init.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1472/main.o: ../main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1472" 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -mcpu=cortex-m23  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -mthumb ${PACK_COMMON_OPTIONS}  -Os -ffunction-sections -mlong-calls -DNDEBUG -I "../Config" -I "../" -I "../examples" -I "../hal/include" -I "../hal/utils/include" -I "../hpl/core" -I "../hpl/dmac" -I "../hpl/evsys" -I "../hpl/gclk" -I "../hpl/mclk" -I "../hpl/osc32kctrl" -I "../hpl/oscctrl" -I "../hpl/pm" -I "../hpl/port" -I "../hpl/rtc" -I "../hpl/sercom" -I "../hri" -I "../documentation" -I "../qtouch" -I "../qtouch/datastreamer" -I "../qtouch/include" -Wall -MMD -MF "${OBJECTDIR}/_ext/1472/main.o.d" -o ${OBJECTDIR}/_ext/1472/main.o ../main.c  -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD) 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1472/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/saml10_qt8_lp2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=cortex-m23   -gdwarf-2  -D__$(MP_PROCESSOR_OPTION)__    -mthumb --specs=nano.specs -Wl,-Map="dist\${CND_CONF}\${IMAGE_TYPE}\saml10_qt8_lp2.X.${IMAGE_TYPE}.map"  -o dist/${CND_CONF}/${IMAGE_TYPE}/saml10_qt8_lp2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}      -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1  -L"../qtouch/lib/gcc" -L"../Device_Startup" -Wl,--gc-sections  -Wl,-lqtm_touch_key_cm23_0x0002 -Wl,-lqtm_surface_gestures_cm23_0x0023 -Wl,-lqtm_surface_cs_cm23_0x0021 -Wl,-lqtm_binding_layer_cm23_0x0005 -Wl,-lqtm_acq_saml10_0x0027 -Wl,-lm  -Tsaml10e16a_flash.ld
	${MP_CC_DIR}\\arm-none-eabi-objcopy -O binary "dist/${CND_CONF}/${IMAGE_TYPE}/saml10_qt8_lp2.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}" "dist/${CND_CONF}/${IMAGE_TYPE}/saml10_qt8_lp2.X.${IMAGE_TYPE}.bin"
	
	${MP_CC_DIR}\\arm-none-eabi-objcopy -j .eeprom --set-section-flags=.eeprom=alloc,load --change-section-lma .eeprom=0 --no-change-warnings -O binary "dist/${CND_CONF}/${IMAGE_TYPE}/saml10_qt8_lp2.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}" "dist/${CND_CONF}/${IMAGE_TYPE}/saml10_qt8_lp2.X.${IMAGE_TYPE}.eep" || exit 0
	${MP_CC_DIR}\\arm-none-eabi-objdump -h -S "dist/${CND_CONF}/${IMAGE_TYPE}/saml10_qt8_lp2.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}" > "dist/${CND_CONF}/${IMAGE_TYPE}/saml10_qt8_lp2.X.${IMAGE_TYPE}.lss"
	${MP_CC_DIR}\\arm-none-eabi-objcopy -O srec -R .eeprom -R .fuse -R .lock -R .signature "dist/${CND_CONF}/${IMAGE_TYPE}/saml10_qt8_lp2.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}" "dist/${CND_CONF}/${IMAGE_TYPE}/saml10_qt8_lp2.X.${IMAGE_TYPE}.srec"
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/saml10_qt8_lp2.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=cortex-m23  -D__$(MP_PROCESSOR_OPTION)__    -mthumb --specs=nano.specs -Wl,-Map="dist\${CND_CONF}\${IMAGE_TYPE}\saml10_qt8_lp2.X.${IMAGE_TYPE}.map"  -o dist/${CND_CONF}/${IMAGE_TYPE}/saml10_qt8_lp2.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}      -DXPRJ_Release=$(CND_CONF)  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION)  -L"../qtouch/lib/gcc" -L"../Device_Startup" -Wl,--gc-sections  -Wl,-lqtm_touch_key_cm23_0x0002 -Wl,-lqtm_surface_gestures_cm23_0x0023 -Wl,-lqtm_surface_cs_cm23_0x0021 -Wl,-lqtm_binding_layer_cm23_0x0005 -Wl,-lqtm_acq_saml10_0x0027 -Wl,-lm  -Tsaml10e16a_flash.ld
	${MP_CC_DIR}\\arm-none-eabi-objcopy -O binary "dist/${CND_CONF}/${IMAGE_TYPE}/saml10_qt8_lp2.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}" "dist/${CND_CONF}/${IMAGE_TYPE}/saml10_qt8_lp2.X.${IMAGE_TYPE}.bin"
	${MP_CC_DIR}\\arm-none-eabi-objcopy -O ihex -R .eeprom -R .fuse -R .lock -R .signature "dist/${CND_CONF}/${IMAGE_TYPE}/saml10_qt8_lp2.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}" "dist/${CND_CONF}/${IMAGE_TYPE}/saml10_qt8_lp2.X.${IMAGE_TYPE}.hex"
	${MP_CC_DIR}\\arm-none-eabi-objcopy -j .eeprom --set-section-flags=.eeprom=alloc,load --change-section-lma .eeprom=0 --no-change-warnings -O binary "dist/${CND_CONF}/${IMAGE_TYPE}/saml10_qt8_lp2.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}" "dist/${CND_CONF}/${IMAGE_TYPE}/saml10_qt8_lp2.X.${IMAGE_TYPE}.eep" || exit 0
	${MP_CC_DIR}\\arm-none-eabi-objdump -h -S "dist/${CND_CONF}/${IMAGE_TYPE}/saml10_qt8_lp2.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}" > "dist/${CND_CONF}/${IMAGE_TYPE}/saml10_qt8_lp2.X.${IMAGE_TYPE}.lss"
	${MP_CC_DIR}\\arm-none-eabi-objcopy -O srec -R .eeprom -R .fuse -R .lock -R .signature "dist/${CND_CONF}/${IMAGE_TYPE}/saml10_qt8_lp2.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}" "dist/${CND_CONF}/${IMAGE_TYPE}/saml10_qt8_lp2.X.${IMAGE_TYPE}.srec"
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/Release
	${RM} -r dist/Release

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
