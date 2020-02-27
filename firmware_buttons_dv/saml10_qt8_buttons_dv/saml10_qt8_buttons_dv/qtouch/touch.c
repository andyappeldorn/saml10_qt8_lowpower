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

#include "datastreamer.h"

/*----------------------------------------------------------------------------
 *   prototypes
 *----------------------------------------------------------------------------*/

/*! \brief configure keys, wheels and sliders.
 */
static touch_ret_t touch_sensors_config(void);

/*! \brief Touch measure complete callback function example prototype.
 */
static void qtm_measure_complete_callback(void);

/*! \brief Touch Error callback function prototype.
 */
static void qtm_error_callback(uint8_t error);

/*----------------------------------------------------------------------------
 *     Global Variables
 *----------------------------------------------------------------------------*/

/* Flag to indicate time for touch measurement */
volatile uint8_t time_to_measure_touch_flag = 0;

/* postporcess request flag */
volatile uint8_t touch_postprocess_request = 0;

/* Measurement Done Touch Flag  */
volatile uint8_t measurement_done_touch = 0;

/* Error Handling */
uint8_t module_error_code = 0;

/* Acquisition module internal data - Size to largest acquisition set */
uint16_t touch_acq_signals_raw[DEF_NUM_CHANNELS];

/* Acquisition set 1 - General settings */
qtm_acq_node_group_config_t ptc_qtlib_acq_gen1
    = {DEF_NUM_CHANNELS, DEF_SENSOR_TYPE, DEF_PTC_CAL_AUTO_TUNE, DEF_SEL_FREQ_INIT, DEF_PTC_INTERRUPT_PRIORITY};

/* Node status, signal, calibration values */
qtm_acq_node_data_t ptc_qtlib_node_stat1[DEF_NUM_CHANNELS];

/* Node configurations */
qtm_acq_saml10_node_config_t ptc_seq_node_cfg1[DEF_NUM_CHANNELS] = {NODE_0_PARAMS,
                                                                    NODE_1_PARAMS,
                                                                    NODE_2_PARAMS,
                                                                    NODE_3_PARAMS,
                                                                    NODE_4_PARAMS,
                                                                    NODE_5_PARAMS,
                                                                    NODE_6_PARAMS,
                                                                    NODE_7_PARAMS,
                                                                    NODE_8_PARAMS,
                                                                    NODE_9_PARAMS,
                                                                    NODE_10_PARAMS};

/* Container */
qtm_acquisition_control_t qtlib_acq_set1 = {&ptc_qtlib_acq_gen1, &ptc_seq_node_cfg1[0], &ptc_qtlib_node_stat1[0]};

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
qtm_touch_key_config_t qtlib_key_configs_set1[DEF_NUM_SENSORS] = {KEY_0_PARAMS,
                                                                  KEY_1_PARAMS,
                                                                  KEY_2_PARAMS,
                                                                  KEY_3_PARAMS,
                                                                  KEY_4_PARAMS,
                                                                  KEY_5_PARAMS,
                                                                  KEY_6_PARAMS,
                                                                  KEY_7_PARAMS,
                                                                  KEY_8_PARAMS,
                                                                  KEY_9_PARAMS,
                                                                  KEY_10_PARAMS};

/* Container */
qtm_touch_key_control_t qtlib_key_set1
    = {&qtlib_key_grp_data_set1, &qtlib_key_grp_config_set1, &qtlib_key_data_set1[0], &qtlib_key_configs_set1[0]};

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

	/* Init acquisition module */
	qtm_ptc_init_acquisition_module(&qtlib_acq_set1);

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
	// @appel - acquisition timing output I/O toggle
} /*============================================================================
 static void qtm_error_callback(uint8_t error)
 ------------------------------------------------------------------------------
 Purpose: this function is used to report error in the modules.
 Input  : error code
 Output : decoded module error code
 Notes  :
 Derived Module_error_codes:
     Acquisition module error =1
     post processing module1 error = 2
     post processing module2 error = 3
     ... and so on
 ============================================================================*/
static void qtm_error_callback(uint8_t error)
{
	module_error_code = error + 1u;

#if DEF_TOUCH_DATA_STREAMER_ENABLE == 1
	datastreamer_output();
#endif
}

/*============================================================================
void touch_init(void)
------------------------------------------------------------------------------
Purpose: Initialization of touch library. PTC, timer, and
         datastreamer modules are initialized in this function.
Input  : none
Output : none
Notes  :
============================================================================*/
void touch_init(void)
{

	touch_timer_config();

	/* Configure touch sensors with Application specific settings */
	touch_sensors_config();

#if DEF_TOUCH_DATA_STREAMER_ENABLE == 1
	datastreamer_init();
#endif
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

	/* check the time_to_measure_touch_flag flag for Touch Acquisition */
	if (time_to_measure_touch_flag == 1u) {
		/* Do the acquisition */
		touch_ret = qtm_ptc_start_measurement_seq(&qtlib_acq_set1, qtm_measure_complete_callback);

		/* if the Acquistion request was successful then clear the request flag */
		if (TOUCH_SUCCESS == touch_ret) {
			/* Clear the Measure request flag */
			time_to_measure_touch_flag = 0u;
		}
	}

	/* check the flag for node level post processing */
	if (touch_postprocess_request == 1u) {
		/* Reset the flags for node_level_post_processing */
		touch_postprocess_request = 0u;

		/* Run Acquisition module level post processing*/
		touch_ret = qtm_acquisition_process();

		/* Check the return value */
		if (TOUCH_SUCCESS == touch_ret) {
			/* Returned with success: Start module level post processing */
			touch_ret = qtm_key_sensors_process(&qtlib_key_set1);
			if (TOUCH_SUCCESS != touch_ret) {
				qtm_error_callback(1);
			}
		} else {
			/* Acq module Eror Detected: Issue an Acq module common error code 0x80 */
			qtm_error_callback(0);
		}

		if ((0u != (qtlib_key_set1.qtm_touch_key_group_data->qtm_keys_status & 0x80u))) {
			time_to_measure_touch_flag = 1u;
		} else {
			measurement_done_touch = 1u;
		}

#if DEF_TOUCH_DATA_STREAMER_ENABLE == 1
		datastreamer_output();
#endif
	}
}

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
	qtm_update_qtlib_timer(DEF_TOUCH_MEASUREMENT_PERIOD_MS);
}

void Timer_task_cb(const struct timer_task *const timer_task)
{
	touch_timer_handler();
}

void touch_timer_config(void)
{
	static struct timer_task Timer_task;
#if (KRONO_GESTURE_ENABLE == 1u)
	Timer_task.interval = 1;
#else
	Timer_task.interval = DEF_TOUCH_MEASUREMENT_PERIOD_MS;
#endif
	Timer_task.cb   = Timer_task_cb;
	Timer_task.mode = TIMER_TASK_REPEAT;

	timer_add_task(&Timer, &Timer_task);
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
