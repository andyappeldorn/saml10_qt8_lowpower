/*============================================================================
Filename : touch.c
Project : QTouch Modular Library
Purpose : Provides Initialization, Processing and ISR handler of touch library,
          Simple API functions to get/set the key touch parameters from/to the
          touch library data structures

This file is part of QTouch Modular Library Release 6.3 application.

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

#if KRONOCOMM_UART == 1u

#include "KronoCommuart_sam.h"

#endif

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

struct io_descriptor *uart_io_ptr;

/*----------------------------------------------------------------------------
 *     Global Variables
 *----------------------------------------------------------------------------*/
/* Flag to indicate time for touch measurement */
volatile uint8_t time_to_measure_touch = 0;

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

/**********************************************************/
/***************** Surface 2t Module ********************/
/**********************************************************/

qtm_surface_cs_config_t qtm_surface_cs_config1 = {
    /* Config: */
    SURFACE_CS_START_KEY_H,
    SURFACE_CS_NUM_KEYS_H,
    SURFACE_CS_START_KEY_V,
    SURFACE_CS_NUM_KEYS_V,
    SURFACE_CS_RESOL_DB,
    SURFACE_CS_POS_HYST,
    SURFACE_CS_FILT_CFG,
    SURFACE_CS_MIN_CONTACT,
    &qtlib_key_data_set1[0]};

/* surface Configurations */
/* Surface Data */
qtm_surface_cs2t_data_t qtm_surface_cs_data1;

/* Contact Data */
qtm_surface_contact_data_t qtm_surface_contacts[2];

/* Container */
qtm_surface_cs2t_control_t qtm_surface_cs_control1
    = {&qtm_surface_cs_data1, &qtm_surface_contacts[0], &qtm_surface_cs_config1};

/**********************************************************/
/***************** Gesture Module ********************/
/**********************************************************/

/* Gesture Configurations */
qtm_gestures_2d_config_t qtm_gestures_2d_config = {&qtm_surface_contacts[0].h_position,
                                                   &qtm_surface_contacts[0].v_position,
                                                   &qtm_surface_contacts[0].qt_contact_status,
                                                   &qtm_surface_contacts[1].h_position,
                                                   &qtm_surface_contacts[1].v_position,
                                                   &qtm_surface_contacts[1].qt_contact_status,
                                                   SCR_RESOLUTION(SURFACE_CS_RESOL_DB),
                                                   TAP_RELEASE_TIMEOUT,
                                                   TAP_HOLD_TIMEOUT,
                                                   SWIPE_TIMEOUT,
                                                   HORIZONTAL_SWIPE_DISTANCE_THRESHOLD,
                                                   VERTICAL_SWIPE_DISTANCE_THRESHOLD,
                                                   0,
                                                   TAP_AREA,
                                                   SEQ_TAP_DIST_THRESHOLD,
                                                   EDGE_BOUNDARY,
                                                   WHEEL_POSTSCALER,
                                                   WHEEL_START_QUADRANT_COUNT,
                                                   WHEEL_REVERSE_QUADRANT_COUNT,

                                                   PINCH_ZOOM_THRESHOLD

};

qtm_gestures_2d_data_t qtm_gestures_2d_data;

qtm_gestures_2d_control_t qtm_gestures_2d_control1 = {&qtm_gestures_2d_data, &qtm_gestures_2d_config};

/*============================================================================
static touch_ret_t touch_sensors_config(void)
------------------------------------------------------------------------------
Purpose: Initialization of touch key sensors
Input  : none
Output : none
Notes  :
============================================================================*/
/* Touch sensors config - assign nodes to buttons / wheels / sliders / surfaces / water level / etc */
//static touch_ret_t touch_sensors_config(void)
static __attribute__((optimize("O0")))  touch_ret_t touch_sensors_config(void)
{
	uint16_t    sensor_nodes;
	touch_ret_t touch_ret = TOUCH_SUCCESS;
	
	/* custom calibration routine for low cc value workaround */
	volatile touch_ret_t touch_return_temp;
	volatile touch_ret_t touch_return_val[10];
	
	volatile uint16_t cc_Vals[10];
	volatile uint16_t sensor_states[10];
	volatile uint16_t cal_status[10];
	volatile uint16_t u16temp;

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
		
		/* custom calibration routine for low cc value workaround */
/*		qtm_enable_sensor_node(&qtlib_acq_set1, sensor_nodes);	// enable sensor
		touch_return_temp = qtm_calibrate_sensor_node(&qtlib_acq_set1, sensor_nodes);	// calibrate sensor
		touch_return_val[sensor_nodes] = touch_return_temp;	// save return code
		
		u16temp = get_sensor_cc_val(sensor_nodes);
		cc_Vals[sensor_nodes] = u16temp;
		
		u16temp = get_sensor_state(sensor_nodes);
		sensor_states[sensor_nodes] = u16temp;
		
		_delay_cycles(1);
*/
	}

	/* Enable sensor keys and assign nodes */
	for (sensor_nodes = 0u; sensor_nodes < DEF_NUM_CHANNELS; sensor_nodes++) {
		qtm_init_sensor_key(&qtlib_key_set1, sensor_nodes, &ptc_qtlib_node_stat1[sensor_nodes]);
	}

	touch_ret |= qtm_init_surface_cs2t(&qtm_surface_cs_control1);

	touch_ret |= qtm_init_gestures_2d();

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

#if (DEF_TOUCH_LOWPOWER_ENABLE == 1u)

	/* configure voltage regulator to run in standby sleep mode */
	touch_enable_vreg_in_standby();

	touch_disable_lowpower_measurement();
#endif

	/* Configure touch sensors with Application specific settings */
	touch_sensors_config();

#if (KRONOCOMM_UART == 1u)
	usart_async_register_callback(&USART, USART_ASYNC_TXC_CB, (usart_cb_t)krono_tx_complete_callback);
	usart_async_register_callback(&USART, USART_ASYNC_RXC_CB, (usart_cb_t)krono_rx_complete_callback);
	usart_async_enable(&USART);
	usart_async_get_io_descriptor(&USART, &uart_io_ptr);
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

	/* check the time_to_measure_touch flag for Touch Acquisition */
	if (time_to_measure_touch == 1u) {
		/* Do the acquisition */
		touch_ret = qtm_ptc_start_measurement_seq(&qtlib_acq_set1, qtm_measure_complete_callback);

		/* if the Acquistion request was successful then clear the request flag */
		if (TOUCH_SUCCESS == touch_ret) {
			/* Clear the Measure request flag */
			time_to_measure_touch = 0u;
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
			touch_ret = qtm_surface_cs2t_process(&qtm_surface_cs_control1);
			if (TOUCH_SUCCESS != touch_ret) {
				qtm_error_callback(2);
			}
			touch_ret = qtm_gestures_2d_process(&qtm_gestures_2d_control1);
			if (TOUCH_SUCCESS != touch_ret) {
				qtm_error_callback(3);
			}
		} else {
			/* Acq module Eror Detected: Issue an Acq module common error code 0x80 */
			qtm_error_callback(0);
		}

		if ((0u != (qtlib_key_set1.qtm_touch_key_group_data->qtm_keys_status & 0x80u))) {
			time_to_measure_touch = 1u;
		} else {
			measurement_done_touch = 1u;
		}

#if KRONOCOMM_ENABLE == 1u
		Krono_UpdateBuffer();
#endif

	}
#if (DEF_TOUCH_LOWPOWER_ENABLE == 1u)
	//else 
	{
		if (0u != (qtlib_key_grp_data_set1.qtm_keys_status & QTM_KEY_DETECT))  {
			/* Something in detect */
			time_since_touch = 0u;
		}
		/* process lowpower touch measurement */
		touch_process_lowpower();
	}
#endif

#if KRONOCOMM_ENABLE == 1u
	uart_process();
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
	SUPC->VREG.bit.SEL = 0;
	while (SUPC->STATUS.bit.VCORERDY != 1)
		;

	/* Enable dynamic power domain gating  */
	PM->STDBYCFG.bit.DPGPDSW = PM_STDBYCFG_DPGPDSW_1_Val;
	PM->STDBYCFG.bit.PDCFG = PM_STDBYCFG_PDCFG_PDSW_Val; // PM_STDBYCFG_PDCFG_DEFAULT_Val
	/* 4kB SRAM out of 16kB will be retained in STANDBY */
	PM->PWCFG.bit.RAMPSWC = PM_PWCFG_RAMPSWC_4KB_Val;

	/* Enable VREG to run on demand and select PL0 during standby*/
	SUPC->VREG.bit.RUNSTDBY = 0;
	SUPC->VREG.bit.LPEFF    = 0;
	SUPC->VREG.bit.STDBYPL0 = 0;
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
		time_to_measure_touch = 1u;
		time_since_touch      = 0u;
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
uint8_t interrupt_cnt = 0;
uint8_t interrupt_cnt_led = 0;
void touch_timer_handler(void)
{
	interrupt_cnt+=measurement_period_store;
	
	if(measurement_period_store == DEF_TOUCH_MEASUREMENT_PERIOD_MS)
	{
		interrupt_cnt_led+=measurement_period_store;
	}
	
	if (interrupt_cnt >= DEF_GESTURE_TIME_BASE_MS) {
		qtm_update_gesture_2d_timer(interrupt_cnt/10);
		
		interrupt_cnt = interrupt_cnt%10;
	}
	//if (interrupt_cnt >= DEF_TOUCH_MEASUREMENT_PERIOD_MS)
	{
		//interrupt_cnt = 0;
		/* Count complete - Measure touch sensors */
		time_to_measure_touch = 1u;
		qtm_update_qtlib_timer(measurement_period_store);
	}
	
	if (time_since_touch < (65535u - measurement_period_store)) {
		time_since_touch += measurement_period_store;
	} else {
		time_since_touch = 65535;
	}
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
	Timer_task.interval = 1;

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
