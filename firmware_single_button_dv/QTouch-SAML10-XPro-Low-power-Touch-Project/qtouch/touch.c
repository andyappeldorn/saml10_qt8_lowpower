/*============================================================================
Filename : touch.c
Project : QTouch Modular Library
Purpose : Provides Initialization, Processing and ISR handler of touch library,
          Simple API functions to get/set the key touch parameters from/to the
          touch library data structures

This file is part of QTouch Modular Library Release 6.5 application.

Important Note: Do not edit this file manually.
                Use QTouch Configurator within Atmel Start to apply any
                modifications to this file.

Usage License: Refer license.h file for license information
Support: Visit http://www.microchip.com/support/hottopics.aspx
               to create MySupport case.

------------------------------------------------------------------------------
Copyright (c) 2019 Microchip. All rights reserved.
------------------------------------------------------------------------------
============================================================================*/
#ifndef TOUCH_C
#define TOUCH_C
/*----------------------------------------------------------------------------
 *     include files
 *----------------------------------------------------------------------------*/

#include <atmel_start.h>

#include "touch.h"
#include "license.h"

/*----------------------------------------------------------------------------
 *   prototypes
 *----------------------------------------------------------------------------*/

/*! \brief configure binding layer config parameter
 */
static void build_qtm_config(qtm_control_t *qtm);

/*! \brief configure keys, wheels and sliders.
 */
static touch_ret_t touch_sensors_config(void);
/*! \brief Init complete callback function prototype.
 */
static void init_complete_callback();

/*! \brief Touch measure complete callback function example prototype.
 */
static void qtm_measure_complete_callback(void);
/*! \brief Touch post process complete callback function prototype.
 */
static void qtm_post_process_complete();

/*! \brief Touch Error callback function prototype.
 */
static void qtm_error_callback(uint8_t error);

#if (DEF_TOUCH_LOWPOWER_ENABLE == 1u)
/* low power processing function */
static void touch_process_lowpower();
/* low power touch detection callback */
static void touch_measure_wcomp_match(void);
/* Cancel low-power measurement */
static void touch_cancel_autoscan(void); /* configure voltage regulator */
static void touch_enable_vreg_in_standby(void);
static void touch_enable_lowpower_measurement(void);
static void touch_disable_lowpower_measurement(void);

#endif

/*----------------------------------------------------------------------------
 *     Global Variables
 *----------------------------------------------------------------------------*/

/* Binding layer control */
qtm_control_t  qtm_control;
qtm_control_t *p_qtm_control;
qtm_state_t    qstate;

/* Flag to indicate time for touch measurement */
volatile uint8_t time_to_measure_touch_flag = 0;

/* postporcess request flag */
volatile uint8_t touch_postprocess_request = 0;

/* Measurement Done Touch Flag  */
volatile uint8_t measurement_done_touch = 0;

/* Error Handling */
uint8_t module_error_code = 0;

/* Low-power measurement variables */
uint16_t time_since_touch = 0;
/* store the drift period for comparison */
uint16_t measurement_period_store = 0;

/* Acquisition module internal data - Size to largest acquisition set */
uint16_t touch_acq_signals_raw[DEF_NUM_CHANNELS];

/* Acquisition set 1 - General settings */
qtm_acq_node_group_config_t ptc_qtlib_acq_gen1
    = {DEF_NUM_CHANNELS, DEF_SENSOR_TYPE, DEF_PTC_CAL_AUTO_TUNE, DEF_SEL_FREQ_INIT, DEF_PTC_INTERRUPT_PRIORITY};

/* Node status, signal, calibration values */
qtm_acq_node_data_t ptc_qtlib_node_stat1[DEF_NUM_CHANNELS];

/* Node configurations */
qtm_acq_saml10_node_config_t ptc_seq_node_cfg1[DEF_NUM_CHANNELS] = {NODE_0_PARAMS};

/* Container */
qtm_acquisition_control_t qtlib_acq_set1 = {&ptc_qtlib_acq_gen1, &ptc_seq_node_cfg1[0], &ptc_qtlib_node_stat1[0]};

/* Low-power autoscan related parameters */
qtm_auto_scan_config_t auto_scan_setup
    = {&qtlib_acq_set1, QTM_AUTOSCAN_NODE, QTM_AUTOSCAN_THRESHOLD, QTM_AUTOSCAN_TRIGGER_PERIOD};

/**********************************************************/
/*********************** Keys Module **********************/
/**********************************************************/

/* Keys set 1 - General settings */
qtm_touch_key_group_config_t qtlib_key_grp_config_set1 = {DEF_NUM_SENSORS,
                                                          DEF_TOUCH_DET_INT,
                                                          DEF_MAX_ON_DURATION,
                                                          DEF_ANTI_TCH_DET_INT,
                                                          DEF_ANTI_TCH_RECAL_THRSHLD,
                                                          DEF_TCH_DRIFT_RATE,
                                                          DEF_ANTI_TCH_DRIFT_RATE,
                                                          DEF_DRIFT_HOLD_TIME,
                                                          DEF_REBURST_MODE};

qtm_touch_key_group_data_t qtlib_key_grp_data_set1;

/* Key data */
qtm_touch_key_data_t qtlib_key_data_set1[DEF_NUM_SENSORS];

/* Key Configurations */
qtm_touch_key_config_t qtlib_key_configs_set1[DEF_NUM_SENSORS] = {KEY_0_PARAMS};

/* Container */
qtm_touch_key_control_t qtlib_key_set1
    = {&qtlib_key_grp_data_set1, &qtlib_key_grp_config_set1, &qtlib_key_data_set1[0], &qtlib_key_configs_set1[0]};

/**********************************************************/
/****************  Binding Layer Module  ******************/
/**********************************************************/
#define LIB_MODULES_INIT_LIST                                                                                          \
	{                                                                                                                  \
		(module_init_t) & qtm_ptc_init_acquisition_module, null                                                        \
	}

#define LIB_MODULES_PROC_LIST                                                                                          \
	{                                                                                                                  \
		(module_proc_t) & qtm_key_sensors_process, null                                                                \
	}

#define LIB_INIT_DATA_MODELS_LIST                                                                                      \
	{                                                                                                                  \
		(void *)&qtlib_acq_set1, null                                                                                  \
	}

#define LIB_DATA_MODELS_PROC_LIST                                                                                      \
	{                                                                                                                  \
		(void *)&qtlib_key_set1, null                                                                                  \
	}

#define LIB_MODULES_ACQ_ENGINES_LIST                                                                                   \
	{                                                                                                                  \
		(module_acq_t) & qtm_ptc_start_measurement_seq, null                                                           \
	}

#define LIB_MODULES_ACQ_ENGINES_LIST_DM                                                                                \
	{                                                                                                                  \
		(void *)&qtlib_acq_set1, null                                                                                  \
	}

/* QTM run time options */
module_init_t library_modules_init[]            = LIB_MODULES_INIT_LIST;
module_proc_t library_modules_proc[]            = LIB_MODULES_PROC_LIST;
module_arg_t  library_module_init_data_models[] = LIB_INIT_DATA_MODELS_LIST;
module_acq_t  library_modules_acq_engines[]     = LIB_MODULES_ACQ_ENGINES_LIST;

module_arg_t library_module_acq_engine_data_model[] = LIB_MODULES_ACQ_ENGINES_LIST_DM;
module_arg_t library_module_proc_data_model[]       = LIB_DATA_MODELS_PROC_LIST;

/*----------------------------------------------------------------------------
 *   function definitions
 *----------------------------------------------------------------------------*/

/*============================================================================
static void build_qtm_config(qtm_control_t *qtm)
------------------------------------------------------------------------------
Purpose: Initialization of binding layer module
Input  : Pointer of binding layer container data structure
Output : none
Notes  :
============================================================================*/
static void build_qtm_config(qtm_control_t *qtm)
{
	/* Initialise the Flags by clearing them */
	qtm->binding_layer_flags = 0x00u;

	/*!< List of function pointers to acquisition sets */
	qtm->library_modules_init = library_modules_init;

	/*!< List of function pointers to post processing modules  */
	qtm->library_modules_proc = library_modules_proc;

	/*!< List of Acquisition Engines (Acq Modules one per AcqSet */
	qtm->library_modules_acq = library_modules_acq_engines;

	/*!< Data Model for Acquisition modules  */
	qtm->library_module_init_data_model = library_module_init_data_models;

	/*!< Data Model for post processing modules  */
	qtm->library_module_proc_data_model = library_module_proc_data_model;

	/*!< Data model for inline module processes  */
	qtm->library_modules_acq_dm = library_module_acq_engine_data_model;

	/*!< Post porcessing pointer */
	qtm->qtm_acq_pp = qtm_acquisition_process;

	/* Register Binding layer callbacks */
	qtm->qtm_init_complete_callback    = init_complete_callback;
	qtm->qtm_error_callback            = qtm_error_callback;
	qtm->qtm_measure_complete_callback = qtm_measure_complete_callback;
	qtm->qtm_pre_process_callback      = null;
	qtm->qtm_post_process_callback     = qtm_post_process_complete;
}

/*============================================================================
static touch_ret_t touch_sensors_config(void)
------------------------------------------------------------------------------
Purpose: Initialization of touch key sensors
Input  : none
Output : none
Notes  :
============================================================================*/
/* Touch sensors config - assign nodes to buttons / wheels / sliders / surfaces / water level / etc */
static touch_ret_t touch_sensors_config(void)
{
	uint16_t    sensor_nodes;
	touch_ret_t touch_ret = TOUCH_SUCCESS;

	/* Init pointers to DMA sequence memory */
	qtm_ptc_qtlib_assign_signal_memory(&touch_acq_signals_raw[0]);

	/* Initialize sensor nodes */

	for (sensor_nodes = 0u; sensor_nodes < DEF_NUM_CHANNELS; sensor_nodes++)

	{
		/* Enable each node for measurement and mark for calibration */
		qtm_enable_sensor_node(&qtlib_acq_set1, sensor_nodes);
		qtm_calibrate_sensor_node(&qtlib_acq_set1, sensor_nodes);
	}

	/* Enable sensor keys and assign nodes */
	for (sensor_nodes = 0u; sensor_nodes < DEF_NUM_CHANNELS; sensor_nodes++) {
		qtm_init_sensor_key(&qtlib_key_set1, sensor_nodes, &ptc_qtlib_node_stat1[sensor_nodes]);
	}

	return (touch_ret);
}
/*============================================================================
static void init_complete_callback(void)
------------------------------------------------------------------------------
Purpose: Callback function from binding layer called after the completion of
         acquisition module initialization.
Input  : none
Output : none
Notes  :
============================================================================*/
static void init_complete_callback(void)
{
	/* Configure touch sensors with Application specific settings */
	touch_sensors_config();
}

/*============================================================================
static void qtm_measure_complete_callback( void )
------------------------------------------------------------------------------
Purpose: this function is called after the completion of
         measurement cycle. This function sets the post processing request
         flag to trigger the post processing.
Input  : none
Output : none
Notes  :
============================================================================*/
static void qtm_measure_complete_callback(void)
{
	touch_postprocess_request = 1u;
}
/*============================================================================
static void qtm_post_process_complete(void)
------------------------------------------------------------------------------
Purpose: Callback function from binding layer called after the completion of
         post processing. This function sets the reburst flag based on the
         key sensor group status, calls the datastreamer output function to
         display the module data.
Input  : none
Output : none
Notes  :
============================================================================*/
static void qtm_post_process_complete(void)
{
	if ((0u != (qtlib_key_set1.qtm_touch_key_group_data->qtm_keys_status & 0x80u))) {
		p_qtm_control->binding_layer_flags |= (1u << reburst_request);
	} else {
		measurement_done_touch = 1u;
	}
}
/*============================================================================
static void qtm_error_callback(uint8_t error)
------------------------------------------------------------------------------
Purpose: Callback function from binding layer called after the completion of
         post processing. This function is called only when there is error.
Input  : error code
Output : decoded module error code
Notes  :
Error Handling supported by Binding layer module:
    Acquisition Module Error codes: 0x8<error code>
    0x81 - Qtm init
    0x82 - start acq
    0x83 - cal sensors
    0x84 - cal hardware

    Post processing Modules error codes: 0x4<process_id>
    0x40, 0x41, 0x42, ...
    process_id is the sequence of process IDs listed in #define LIB_MODULES_PROC_LIST macro.
    Process IDs start from zero and maximum is 15

    Examples:
    0x40 -> error in post processing module 1
    0x42 -> error in post processing module 3

Derived Module_error_codes:
    Acquisition module error =1
    post processing module1 error = 2
    post processing module2 error = 3
    ... and so on
============================================================================*/
static void qtm_error_callback(uint8_t error)
{
	module_error_code = 0;
	if (error & 0x80) {
		module_error_code = 1;
	} else if (error & 0x40) {
		module_error_code = (error & 0x0F) + 2;
	}

#if DEF_TOUCH_DATA_STREAMER_ENABLE == 1
	datastreamer_output();
#endif
}

/*============================================================================
void touch_init(void)
------------------------------------------------------------------------------
Purpose: Initialization of touch library. PTC, timer, binding layer and
         datastreamer modules are initialized in this function.
Input  : none
Output : none
Notes  :
============================================================================*/
void touch_init(void)
{

#if (DEF_TOUCH_LOWPOWER_ENABLE == 1u)

	/* configure voltage regulator to run in standby sleep mode */
	touch_enable_vreg_in_standby();

	touch_disable_lowpower_measurement();
#endif

	build_qtm_config(&qtm_control);

	qtm_binding_layer_init(&qtm_control);

	/* get a pointer to the binding layer control */
	p_qtm_control = qmt_get_binding_layer_ptr();
}

/*============================================================================
void touch_process(void)
------------------------------------------------------------------------------
Purpose: Main processing function of touch library. This function initiates the
         acquisition, calls post processing after the acquistion complete and
         sets the flag for next measurement based on the sensor status.
Input  : none
Output : none
Notes  :
============================================================================*/
void touch_process(void)
{
	touch_ret_t touch_ret;

	/* check the time_to_measure_touch_flag for Touch Acquisition */
	if (time_to_measure_touch_flag == 1) {
		/* Do the acquisition */
		touch_ret = qtm_lib_start_acquisition(0);

		/* if the Acquistion request was successful then clear the request flag */
		if (TOUCH_SUCCESS == touch_ret) {
			/* Clear the Measure request flag */
			time_to_measure_touch_flag = 0;
		}
	}

	/* check the flag for node level post processing */
	if (touch_postprocess_request == 1) {
		/* Run Acquisition moudle level post pocessing*/
		touch_ret = qtm_lib_acq_process();

		/* Check the return value */
		if (TOUCH_SUCCESS == touch_ret) {
			/* Returned with success: Start module level post processing */
			qtm_lib_post_process();
		} else {
			/* Acq module Eror Detected: Issue an Acq module common error code 0x80 */
			qtm_error_callback(0x80);
		}

		/* Reset the flags for node_level_post_processing */
		touch_postprocess_request = 0;

		if (p_qtm_control->binding_layer_flags & (1u << reburst_request)) {
			time_to_measure_touch_flag = 1;
			p_qtm_control->binding_layer_flags &= ~(1u << reburst_request);
		}
#if (DEF_TOUCH_LOWPOWER_ENABLE == 1u)
		else {
			if (0u != (qtlib_key_grp_data_set1.qtm_keys_status & QTM_KEY_DETECT)) {
				/* Something in detect */
				time_since_touch = 0u;
			}
			/* process lowpower touch measurement */
			touch_process_lowpower();
		}
#endif
	}
#if (DEF_TOUCH_LOWPOWER_ENABLE == 1u)
	if (time_to_measure_touch_flag != 1u) {
		sleep(PM_SLEEP_STANDBY);
	}
#endif
}

#if (DEF_TOUCH_LOWPOWER_ENABLE == 1u)
/*============================================================================
static void touch_enable_vreg_in_standby(void)
------------------------------------------------------------------------------
Purpose: Processing function for low-power touch measurment.
         Monitors the touch activity and if there is not touch for longer
         duration, low-power autoscan is enabled.
Input  : none
Output : none
Notes  :
============================================================================*/
static void touch_enable_vreg_in_standby(void)
{
	/* Set buck regulator as Main Voltage Regulator */
	SUPC->VREG.bit.SEL = 1;
	while (SUPC->STATUS.bit.VCORERDY != 1)
		;

	/* Enable dynamic power domain gating  */
	PM->STDBYCFG.bit.DPGPDSW = PM_STDBYCFG_DPGPDSW_1_Val;
	PM->STDBYCFG.bit.PDCFG = PM_STDBYCFG_PDCFG_PDSW_Val; // PM_STDBYCFG_PDCFG_DEFAULT_Val
	/* 4kB SRAM out of 16kB will be retained in STANDBY */
	PM->PWCFG.bit.RAMPSWC = PM_PWCFG_RAMPSWC_4KB_Val;

	/* Enable VREG to run on demand and select PL0 during standby*/
	SUPC->VREG.bit.RUNSTDBY = 1;
	SUPC->VREG.bit.LPEFF    = 1;
	SUPC->VREG.bit.STDBYPL0 = 1;
	while (!(SUPC->STATUS.reg & SUPC_STATUS_VREGRDY))
		;
}

/*============================================================================
static void touch_disable_lowpower_measurement(void)
------------------------------------------------------------------------------
Purpose:
Input  : none
Output : none
Notes  :
============================================================================*/
static void touch_disable_lowpower_measurement(void)
{

	/* Disable event trigger during startup */
	timer_stop(&Timer);
	hri_rtcmode0_wait_for_sync(RTC, RTC_MODE0_SYNCBUSY_ENABLE);
	hri_rtcmode0_clear_INTEN_CMP0_bit(RTC);
	hri_rtcmode0_clear_EVCTRL_reg(RTC, QTM_AUTOSCAN_TRIGGER_PERIOD_EVENT);
	timer_set_clock_cycles_per_tick(&Timer, DEF_TOUCH_MEASUREMENT_PERIOD_MS);
	hri_rtcmode0_wait_for_sync(RTC, RTC_MODE0_SYNCBUSY_COMP0);
	hri_rtcmode0_set_INTEN_CMP0_bit(RTC);
	measurement_period_store = DEF_TOUCH_MEASUREMENT_PERIOD_MS;
	touch_timer_config();

	/* Disable RTC to PTC event system for now */
	event_system_disable_generator(QTM_AUTOSCAN_TRIGGER_GENERATOR, QTM_RTC_TO_PTC_EVSYS_CHANNEL);
	event_system_disable_user(QTM_AUTOSCAN_STCONV_USER, (QTM_RTC_TO_PTC_EVSYS_CHANNEL + 1u));
}

/*============================================================================
static void touch_enable_lowpower_measurement(void)
------------------------------------------------------------------------------
Purpose:
Input  : none
Output : none
Notes  :
============================================================================*/
static void touch_enable_lowpower_measurement(void)
{

	/* Enable event trigger during startup */
	event_system_enable_generator(QTM_AUTOSCAN_TRIGGER_GENERATOR, QTM_RTC_TO_PTC_EVSYS_CHANNEL);
	event_system_enable_user(QTM_AUTOSCAN_STCONV_USER, (QTM_RTC_TO_PTC_EVSYS_CHANNEL + 1u));

	/* Set up timer with periodic event output and drift period */
	timer_stop(&Timer);
	hri_rtcmode0_wait_for_sync(RTC, RTC_MODE0_SYNCBUSY_ENABLE);
	hri_rtcmode0_clear_INTEN_CMP0_bit(RTC);
	hri_rtcmode0_set_EVCTRL_reg(RTC, QTM_AUTOSCAN_TRIGGER_PERIOD_EVENT);
	timer_set_clock_cycles_per_tick(&Timer, DEF_TOUCH_DRIFT_PERIOD_MS);
	hri_rtcmode0_wait_for_sync(RTC, RTC_MODE0_SYNCBUSY_COMP0);
	hri_rtcmode0_set_INTEN_CMP0_bit(RTC);
	/* Store the measurement period */
	measurement_period_store = DEF_TOUCH_DRIFT_PERIOD_MS;
	touch_timer_config();
}

/*============================================================================
static void touch_process_lowpower(void)
------------------------------------------------------------------------------
Purpose: Processing function for low-power touch measurment.
         Monitors the touch activity and if there is not touch for longer
         duration, low-power autoscan is enabled.
Input  : none
Output : none
Notes  :
============================================================================*/
static void touch_process_lowpower(void)
{
	touch_ret_t touch_ret;

	if (time_since_touch >= DEF_TOUCH_TIMEOUT) {

		/* Start Autoscan */
		touch_ret = qtm_autoscan_sensor_node(&auto_scan_setup, touch_measure_wcomp_match);

		if ((measurement_period_store != DEF_TOUCH_DRIFT_PERIOD_MS) && (touch_ret == TOUCH_SUCCESS)) {

			/* Enable Event System */
			touch_enable_lowpower_measurement();
		}
	} else if (measurement_period_store != DEF_TOUCH_MEASUREMENT_PERIOD_MS) {

		/* Cancel node auto scan */
		qtm_autoscan_node_cancel();

		/* disable event system measurement */
		touch_disable_lowpower_measurement();
	}
}

/*============================================================================
static void touch_measure_wcomp_match(void)
------------------------------------------------------------------------------
Purpose: callback of autoscan function
Input  : none
Output : none
Notes  :
============================================================================*/
void touch_measure_wcomp_match(void)
{
	if (measurement_period_store != DEF_TOUCH_MEASUREMENT_PERIOD_MS) {
		touch_cancel_autoscan();
		time_to_measure_touch_flag = 1u;
		time_since_touch           = 0u;
	}
}
/*============================================================================
static void touch_cancel_autoscan(void)
------------------------------------------------------------------------------
Purpose: cancelling of autoscan functionality
Input  : none
Output : none
Notes  :
============================================================================*/
static void touch_cancel_autoscan(void)
{

	/* disable event system measurement */
	touch_disable_lowpower_measurement();
}

#endif

/*============================================================================
void touch_timer_handler(void)
------------------------------------------------------------------------------
Purpose: This function updates the time elapsed to the touch key module to
         synchronize the internal time counts used by the module.
Input  : none
Output : none
Notes  :
============================================================================*/
void touch_timer_handler(void)
{
	/* Count complete - Measure touch sensors */
	time_to_measure_touch_flag = 1u;
#if (DEF_TOUCH_LOWPOWER_ENABLE == 1u)
	qtm_update_qtlib_timer(measurement_period_store);
	if (time_since_touch < (65535u - measurement_period_store)) {
		time_since_touch += measurement_period_store;
	} else {
		time_since_touch = 65535;
	}
#else
	qtm_update_qtlib_timer(DEF_TOUCH_MEASUREMENT_PERIOD_MS);
#endif
}

void Timer_task_cb(const struct timer_task *const timer_task)
{
	touch_timer_handler();
}

void touch_timer_config(void)
{
	static struct timer_task Timer_task;
	static uint8_t           timer_task_added = 0;

	if (timer_task_added) {
		timer_remove_task(&Timer, &Timer_task);
	}
#if (DEF_TOUCH_LOWPOWER_ENABLE == 1u)
	Timer_task.interval = 1;
#else
	Timer_task.interval = DEF_TOUCH_MEASUREMENT_PERIOD_MS;
#endif
	Timer_task.cb   = Timer_task_cb;
	Timer_task.mode = TIMER_TASK_REPEAT;

	timer_add_task(&Timer, &Timer_task);
	timer_task_added = 1;
	timer_start(&Timer);
}

uint16_t get_sensor_node_signal(uint16_t sensor_node)
{
	return (ptc_qtlib_node_stat1[sensor_node].node_acq_signals);
}

void update_sensor_node_signal(uint16_t sensor_node, uint16_t new_signal)
{
	ptc_qtlib_node_stat1[sensor_node].node_acq_signals = new_signal;
}

uint16_t get_sensor_node_reference(uint16_t sensor_node)
{
	return (qtlib_key_data_set1[sensor_node].channel_reference);
}

void update_sensor_node_reference(uint16_t sensor_node, uint16_t new_reference)
{
	qtlib_key_data_set1[sensor_node].channel_reference = new_reference;
}

uint16_t get_sensor_cc_val(uint16_t sensor_node)
{
	return (ptc_qtlib_node_stat1[sensor_node].node_comp_caps);
}

void update_sensor_cc_val(uint16_t sensor_node, uint16_t new_cc_value)
{
	ptc_qtlib_node_stat1[sensor_node].node_comp_caps = new_cc_value;
}

uint8_t get_sensor_state(uint16_t sensor_node)
{
	return (qtlib_key_set1.qtm_touch_key_data[sensor_node].sensor_state);
}

void update_sensor_state(uint16_t sensor_node, uint8_t new_state)
{
	qtlib_key_set1.qtm_touch_key_data[sensor_node].sensor_state = new_state;
}

void calibrate_node(uint16_t sensor_node)
{
	/* Calibrate Node */
	qtm_calibrate_sensor_node(&qtlib_acq_set1, sensor_node);
	/* Initialize key */
	qtm_init_sensor_key(&qtlib_key_set1, sensor_node, &ptc_qtlib_node_stat1[sensor_node]);
}

/*============================================================================
void PTC_Handler_EOC(void)
------------------------------------------------------------------------------
Purpose: Interrupt service handler for PTC EOC interrupt
Input  : none
Output : none
Notes  : none
============================================================================*/
void PTC_Handler(void)
{
	qtm_ptc_clear_interrupt();
	qtm_saml10_ptc_handler_eoc();
}

#endif /* TOUCH_C */