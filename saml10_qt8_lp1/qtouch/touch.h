/*============================================================================
Filename : touch.h
Project : QTouch Modular Library
Purpose : configuation macros for touch library

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

#ifndef TOUCH_H
#define TOUCH_H

#ifdef __cplusplus
extern "C" {
#endif // __cplusplus

/*----------------------------------------------------------------------------
 *     include files
 *----------------------------------------------------------------------------*/

#include "touch_api_ptc.h"

/**********************************************************/
/******************* Acquisition controls *****************/
/**********************************************************/
/* Defines the Measurement Time in milli seconds.
 * Range: 1 to 255.
 * Default value: 20.
 */
#define DEF_TOUCH_MEASUREMENT_PERIOD_MS 1

/* Defines the Type of sensor
 * Default value: NODE_MUTUAL.
 */
#define DEF_SENSOR_TYPE NODE_SELFCAP_SHIELD

/* Set sensor calibration mode for charge share delay ,Prescaler or series resistor.
 * Range: CAL_AUTO_TUNE_NONE / CAL_AUTO_TUNE_RSEL / CAL_AUTO_TUNE_PRSC / CAL_AUTO_TUNE_CSD
 * Default value: CAL_AUTO_TUNE_NONE.
 */
#define DEF_PTC_CAL_OPTION CAL_AUTO_TUNE_NONE

/* Defines the interrupt priority for the PTC. Set low priority to PTC interrupt for applications having interrupt time
 * constraints. Range: 0 to 2 Default: 2 (Lowest Priority)
 */
#define DEF_PTC_INTERRUPT_PRIORITY 2

/* Calibration option to ensure full charge transfer */
/* Bits 7:0 = XX | TT SELECT_TAU | X | CAL_OPTION */
#define DEF_PTC_TAU_TARGET CAL_CHRG_5TAU
#define DEF_PTC_CAL_AUTO_TUNE (uint8_t)((DEF_PTC_TAU_TARGET << CAL_CHRG_TIME_POS) | DEF_PTC_CAL_OPTION)

/* Set default bootup acquisition frequency.
 * Range: FREQ_SEL_0 - FREQ_SEL_15 , FREQ_SEL_SPREAD
 * Default value: FREQ_SEL_0.
 */
#define DEF_SEL_FREQ_INIT FREQ_SEL_0

/*----------------------------------------------------------------------------
 *     defines
 *----------------------------------------------------------------------------*/

/**********************************************************/
/***************** Node Params   ******************/
/**********************************************************/
/* Acquisition Set 1 */
/* Defines the number of sensor nodes in the acquisition set
 * Range: 1 to 65535.
 * Default value: 1
 */
#define DEF_NUM_CHANNELS (11)
#define EN_DRIVEN_SHIELD

/* Defines node parameter setting
 * {Shield line, Y-line, Charge Share Delay, Prescaler, NODE_G(Analog Gain , Digital Gain), filter level}
 */
#ifdef EN_DRIVEN_SHIELD
#pragma message ( "Driven Shield Enabled" )
#define AN_GAIN GAIN_1
#define DIG_GAIN GAIN_1
#define NODE_0_PARAMS                                                                                                  \
	{                                                                                                                  \
		Y(11) | Y(4) | Y(15) | Y(14) | Y(16) | Y(17) | Y(10) | Y(9) | Y(2) | Y(3), Y(8), 5, PRSC_DIV_SEL_1,            \
		    NODE_GAIN(AN_GAIN, DIG_GAIN), FILTER_LEVEL_16                                                                 \
	}

#define NODE_1_PARAMS                                                                                                  \
	{                                                                                                                  \
		Y(11) | Y(8) | Y(15) | Y(14) | Y(16) | Y(17) | Y(10) | Y(9) | Y(2) | Y(3), Y(4), 5, PRSC_DIV_SEL_1,            \
		    NODE_GAIN(AN_GAIN, DIG_GAIN), FILTER_LEVEL_16                                                                 \
	}
#define NODE_2_PARAMS                                                                                                  \
	{                                                                                                                  \
		Y(11) | Y(8) | Y(4) | Y(15) | Y(14) | Y(16) | Y(17) | Y(9) | Y(2) | Y(3), Y(10), 5, PRSC_DIV_SEL_1,            \
		    NODE_GAIN(AN_GAIN, DIG_GAIN), FILTER_LEVEL_16                                                                 \
	}
#define NODE_3_PARAMS                                                                                                  \
	{                                                                                                                  \
		Y(11) | Y(8) | Y(4) | Y(15) | Y(14) | Y(16) | Y(10) | Y(9) | Y(2) | Y(3), Y(17), 5, PRSC_DIV_SEL_1,            \
		    NODE_GAIN(AN_GAIN, DIG_GAIN), FILTER_LEVEL_16                                                                 \
	}
#define NODE_4_PARAMS                                                                                                  \
	{                                                                                                                  \
		Y(11) | Y(8) | Y(4) | Y(15) | Y(14) | Y(17) | Y(10) | Y(9) | Y(2) | Y(3), Y(16), 5, PRSC_DIV_SEL_1,            \
		    NODE_GAIN(AN_GAIN, DIG_GAIN), FILTER_LEVEL_16                                                                 \
	}
#define NODE_5_PARAMS                                                                                                  \
	{                                                                                                                  \
		Y(11) | Y(8) | Y(4) | Y(14) | Y(16) | Y(17) | Y(10) | Y(9) | Y(2) | Y(3), Y(15), 5, PRSC_DIV_SEL_1,            \
		    NODE_GAIN(AN_GAIN, DIG_GAIN), FILTER_LEVEL_16                                                                 \
	}
#define NODE_6_PARAMS                                                                                                  \
	{                                                                                                                  \
		Y(11) | Y(8) | Y(4) | Y(15) | Y(16) | Y(17) | Y(10) | Y(9) | Y(2) | Y(3), Y(14), 5, PRSC_DIV_SEL_1,            \
		    NODE_GAIN(AN_GAIN, DIG_GAIN), FILTER_LEVEL_16                                                                 \
	}
#define NODE_7_PARAMS                                                                                                  \
	{                                                                                                                  \
		Y(11) | Y(8) | Y(4) | Y(15) | Y(14) | Y(16) | Y(17) | Y(10) | Y(2) | Y(3), Y(9), 5, PRSC_DIV_SEL_1,            \
		    NODE_GAIN(AN_GAIN, DIG_GAIN), FILTER_LEVEL_16                                                                 \
	}
#define NODE_8_PARAMS                                                                                                  \
	{                                                                                                                  \
		Y(11) | Y(8) | Y(4) | Y(15) | Y(14) | Y(16) | Y(17) | Y(10) | Y(9) | Y(3), Y(2), 5, PRSC_DIV_SEL_1,            \
		    NODE_GAIN(AN_GAIN, DIG_GAIN), FILTER_LEVEL_16                                                                 \
	}
#define NODE_9_PARAMS                                                                                                  \
	{                                                                                                                  \
		Y(11) | Y(8) | Y(4) | Y(15) | Y(14) | Y(16) | Y(17) | Y(10) | Y(9) | Y(2), Y(3), 5, PRSC_DIV_SEL_1,            \
		    NODE_GAIN(AN_GAIN, DIG_GAIN), FILTER_LEVEL_16                                                                 \
	}
#define NODE_10_PARAMS                                                                                                  \
	{                                                                                                                  \
		Y(9) | Y(11) | Y(8) | Y(15) | Y(16) | Y(3) | Y(4) | Y(17) | Y(14) | Y(2), Y(10), 5, PRSC_DIV_SEL_1,            \
		NODE_GAIN(AN_GAIN, GAIN_4), FILTER_LEVEL_16                                                                 \
	}
#else
#pragma message ( "Driven Shield Disabled" )
#define NODE_0_PARAMS                                                                                                  \
{                                                                                                                  \
	Y(11), Y(8), 10, PRSC_DIV_SEL_1,            \
	NODE_GAIN(GAIN_1, GAIN_4), FILTER_LEVEL_16                                                                 \
}
#define NODE_1_PARAMS                                                                                                  \
{                                                                                                                  \
	Y(11), Y(4), 10, PRSC_DIV_SEL_1,            \
	NODE_GAIN(GAIN_1, GAIN_4), FILTER_LEVEL_16                                                                 \
}
#define NODE_2_PARAMS                                                                                                  \
{                                                                                                                  \
	Y(11), Y(10), 10, PRSC_DIV_SEL_1,            \
	NODE_GAIN(GAIN_1, GAIN_4), FILTER_LEVEL_16                                                                 \
}
#define NODE_3_PARAMS                                                                                                  \
{                                                                                                                  \
	Y(11), Y(17), 10, PRSC_DIV_SEL_1,            \
	NODE_GAIN(GAIN_1, GAIN_4), FILTER_LEVEL_16                                                                 \
}
#define NODE_4_PARAMS                                                                                                  \
{                                                                                                                  \
	Y(11), Y(16), 10, PRSC_DIV_SEL_1,            \
	NODE_GAIN(GAIN_1, GAIN_4), FILTER_LEVEL_16                                                                 \
}
#define NODE_5_PARAMS                                                                                                  \
{                                                                                                                  \
	Y(11), Y(15), 10, PRSC_DIV_SEL_1,            \
	NODE_GAIN(GAIN_1, GAIN_4), FILTER_LEVEL_16                                                                 \
}
#define NODE_6_PARAMS                                                                                                  \
{                                                                                                                  \
	Y(11), Y(14), 10, PRSC_DIV_SEL_1,            \
	NODE_GAIN(GAIN_1, GAIN_4), FILTER_LEVEL_16                                                                 \
}
#define NODE_7_PARAMS                                                                                                  \
{                                                                                                                  \
	Y(11), Y(9), 10, PRSC_DIV_SEL_1,            \
	NODE_GAIN(GAIN_1, GAIN_4), FILTER_LEVEL_16                                                                 \
}
#define NODE_8_PARAMS                                                                                                  \
{                                                                                                                  \
	Y(11), Y(2), 10, PRSC_DIV_SEL_1,            \
	NODE_GAIN(GAIN_1, GAIN_4), FILTER_LEVEL_16                                                                 \
}
#define NODE_9_PARAMS                                                                                                  \
{                                                                                                                  \
	Y(11), Y(3), 10, PRSC_DIV_SEL_1,            \
	NODE_GAIN(GAIN_1, GAIN_4), FILTER_LEVEL_16                                                                 \
}
#define NODE_10_PARAMS                                                                                                  \
{                                                                                                                  \
	Y(9) | Y(11) | Y(8) |  Y(15) |  Y(16) |  Y(3) | Y(4) |Y(17) |Y(14) | Y(2),Y(10)  , 10, PRSC_DIV_SEL_1,            \
	NODE_GAIN(GAIN_1, GAIN_1), FILTER_LEVEL_16                                                                 \
}
#endif

/**********************************************************/
/***************** Key Params   ******************/
/**********************************************************/
/* Defines the number of key sensors
 * Range: 1 to 65535.
 * Default value: 1
 */
#define DEF_NUM_SENSORS (11)

/* Defines Key Sensor setting
 * {Sensor Threshold, Sensor Hysterisis, Sensor AKS}
 */
#define THRESHOLD_VAL 25
#define KEY_0_PARAMS                                                                                                   \
	{                                                                                                                  \
		THRESHOLD_VAL, HYST_25, AKS_GROUP_1                                                                                       \
	}
#define KEY_1_PARAMS                                                                                                   \
	{                                                                                                                  \
		THRESHOLD_VAL, HYST_25, AKS_GROUP_1                                                                                       \
	}
#define KEY_2_PARAMS                                                                                                   \
	{                                                                                                                  \
		THRESHOLD_VAL, HYST_25, AKS_GROUP_1                                                                                       \
	}
#define KEY_3_PARAMS                                                                                                   \
	{                                                                                                                  \
		THRESHOLD_VAL, HYST_25, AKS_GROUP_1                                                                                       \
	}
#define KEY_4_PARAMS                                                                                                   \
	{                                                                                                                  \
		THRESHOLD_VAL, HYST_25, AKS_GROUP_1                                                                                       \
	}
#define KEY_5_PARAMS                                                                                                   \
	{                                                                                                                  \
		THRESHOLD_VAL, HYST_25, AKS_GROUP_1                                                                                       \
	}
#define KEY_6_PARAMS                                                                                                   \
	{                                                                                                                  \
		THRESHOLD_VAL, HYST_25, AKS_GROUP_1                                                                                       \
	}
#define KEY_7_PARAMS                                                                                                   \
	{                                                                                                                  \
		THRESHOLD_VAL, HYST_25, AKS_GROUP_1                                                                                       \
	}
#define KEY_8_PARAMS                                                                                                   \
	{                                                                                                                  \
		THRESHOLD_VAL, HYST_25, AKS_GROUP_1                                                                                       \
	}
#define KEY_9_PARAMS                                                                                                   \
	{                                                                                                                  \
		THRESHOLD_VAL, HYST_25, AKS_GROUP_1                                                                                       \
	}
#define KEY_10_PARAMS                                                                                                   \
	{                                                                                                                  \
		THRESHOLD_VAL, HYST_25, AKS_GROUP_2                                                                                       \
	}

/* De-bounce counter for additional measurements to confirm touch detection
 * Range: 0 to 255.
 * Default value: 4.
 */
#define DEF_TOUCH_DET_INT 1

/* De-bounce counter for additional measurements to confirm away from touch signal
 * to initiate Away from touch re-calibration.
 * Range: 0 to 255.
 * Default value: 5.
 */
#define DEF_ANTI_TCH_DET_INT 5

/* Threshold beyond with automatic sensor recalibration is initiated.
 * Range: RECAL_100/ RECAL_50 / RECAL_25 / RECAL_12_5 / RECAL_6_25 / MAX_RECAL
 * Default value: RECAL_100.
 */
#define DEF_ANTI_TCH_RECAL_THRSHLD RECAL_100

/* Rate at which sensor reference value is adjusted towards sensor signal value
 * when signal value is greater than reference.
 * Units: 200ms
 * Range: 0-255
 * Default value: 20u = 4 seconds.
 */
#define DEF_TCH_DRIFT_RATE 20

/* Rate at which sensor reference value is adjusted towards sensor signal value
 * when signal value is less than reference.
 * Units: 200ms
 * Range: 0-255
 * Default value: 5u = 1 second.
 */
#define DEF_ANTI_TCH_DRIFT_RATE 5

/* Time to restrict drift on all sensor when one or more sensors are activated.
 * Units: 200ms
 * Range: 0-255
 * Default value: 20u = 4 seconds.
 */
#define DEF_DRIFT_HOLD_TIME 20

/* Set mode for additional sensor measurements based on touch activity.
 * Range: REBURST_NONE / REBURST_UNRESOLVED / REBURST_ALL
 * Default value: REBURST_UNRESOLVED
 */
#define DEF_REBURST_MODE REBURST_UNRESOLVED

/* Sensor maximum ON duration upon touch.
 * Range: 0-255
 * Default value: 0
 */
#define DEF_MAX_ON_DURATION 0

/**********************************************************/
/***************** Surface Parameters ****************/
/**********************************************************/

/*  Config:  */
/* Horizontal Start Key <0-65534>
 * Start key of horizontal axis
 * Range: 0 to 65534
 */
#define SURFACE_CS_START_KEY_H 5
/* Horizontal Number of Channel <0-255>
 * Number of Channels forming horizontal axis
 * Range: 0 to 255
 */
#define SURFACE_CS_NUM_KEYS_H 5
/* Vertical Start Key <0-65534>
 * Start key of vertical axis
 * Range: 0 to 65534
 */
#define SURFACE_CS_START_KEY_V 0
/* Vertical Number of Channel <0-255>
 * Number of Channels forming vertical axis
 * Range: 0 to 255
 */
#define SURFACE_CS_NUM_KEYS_V 5
/*  Position Resolution and Deadband Percentage
 *  Full scale position resolution reported for the axis and the deadband Percentage
 *  RESOL_2_BIT - RESOL_12_BIT
 *  DB_NONE - DB_15_PERCENT
 */
#define SURFACE_CS_RESOL_DB SCR_RESOL_DEADBAND(RESOL_8_BIT, DB_1_PERCENT)
/* Median filter enable and  IIR filter Config
 * Median Filter <0-1>
 * Enable or Disable Median Filter
 * enable - 1
 * disable - 0
 * IIR filter <0-3>
 * Configure IIR filter
 *  0 - None
 *  1 - 25%
 *  2 - 50%
 *  3 - 75%
 */
#define SURFACE_CS_FILT_CFG SCR_MEDIAN_IIR(1, 3)
/* Position Hystersis <0-255>
 * The minimum travel distance to be reported after contact or direction change
 * Applicable to Horizontal and Vertical directions
 */
#define SURFACE_CS_POS_HYST 3
/* Minimum Contact <0-65534>
 * The minimum contact size measurement for persistent contact tracking.
 * Contact size is the sum of neighbouring keys' touch deltas forming the touch contact.
 */
#define SURFACE_CS_MIN_CONTACT 20

/**********************************************************/
/***************** Gesture Parameters ****************/
/**********************************************************/

/*	Tap Release timeout  <3-255>
 *	The TAP_RELEASE_TIMEOUT parameter limits the amount of time allowed between the initial finger press and the
 *liftoff. Exceeding this value will cause the firmware to not consider the gesture as a tap gesture.
 *  TAP_RELEASE_TIMEOUT should be lesser than the TAP_HOLD_TIMEOUT and SWIPE_TIMEOUT.
 *  Unit: x10 ms
 *  Example: if TAP_RELEASE_TIMEOUT is configured as 3, then the user should finish tapping within 30 ms to qualify the
 *gesture as tap.
 */
#define TAP_RELEASE_TIMEOUT 20
/*  Tap Hold timeout <0-255>
 *	If a finger stays within the bounds set by TAP_AREA and is not removed, the firmware will report a Tap Hold gesture
 *once the gesture timer exceeds the TAP_HOLD_TIMEOUT value. HOLD_TAP is a single finger gesture whereas HOLD_TAP_DUAL
 *is dual finger gesture. Ideally, TAP_HOLD_TIMEOUT should be greater than the TAP_RELEASE_TIMEOUT and SWIPE_TIMEOUT.
 *  Unit: x10 ms
 *  Example: if TAP_HOLD_TIMEOUT is configured as 6, then the user should tap and hold inside the TAP_AREA for 60 ms to
 *qualify the gesture as tap and hold.
 */
#define TAP_HOLD_TIMEOUT 100
/*  Swipe timeout <0-255>
 *	The SWIPE_TIMEOUT limits the amount of time allowed for the swipe gesture (initial finger press, moving in a
 *particular direction crossing the distance threshold and the liftoff). Ideally, SWIPE_TIMEOUT should be greater than
 *TAP_RELEASE_TIMEOUT but smaller than the TAP_HOLD_TIMEOUT. Unit: x10 ms Example: if SWIPE_TIMEOUT is configured as 5,
 *then the user should swipe in a particular direction and liftoff within 50 ms to qualify the gesture as swipe.
 */
#define SWIPE_TIMEOUT 70
/*  Horizontal Swipe distance threshold <0-255>
 *	HORIZONTAL_SWIPE_DISTANCE_THRESHOLD controls the distance travelled in the X axis direction for detecting Left and
 *Right Swipe gestures. Unit: X-coordinate Example: If HORIZONTAL_SWIPE_DISTANCE_THRESHOLD is configured as 50, and a
 *user places their finger at x-coordinate 100, they must move to at least x-coordinate 50 to record a left swipe
 *gesture.
 */
#define HORIZONTAL_SWIPE_DISTANCE_THRESHOLD 20
/* 	Vertical swipe distance threshold <0-255>
 *	VERTICAL_SWIPE_DISTANCE_THRESHOLD controls the distance travelled in the Y axis direction for detecting Up and Down
 *Swipe gestures. Unit: Y-coordinate Example: if VERTICAL_SWIPE_DISTANCE_THRESHOLD is configured as 30, and a user
 *places their finger at y-coordinate 100, they must move to at least y-coordinate 70 to record a down swipe gesture.
 */
#define VERTICAL_SWIPE_DISTANCE_THRESHOLD 20
/* 	Tap area <0-255>
 *	The TAP_AREA bounds the finger to an area it must stay within to be considered a tap gesture when the finger is
 *removed and tap and hold gesture if the finger is not removed for sometime. Unit: coordinates Example: if TAP_AREA is
 *configured as 20, then user should tap within 20 coordinates to detect the tap gesture.
 */
#define TAP_AREA 20
/* 	Seq Tap distance threshold <0-255>
 *	The SEQ_TAP_DIST_THRESHOLD parameter limits the allowable distance of the current touch's initial press from the
 *liftoff position of the previous touch. It is used for multiple taps (double-tap, triple-tap etc). If the taps
 *following the first are within this threshold, then the tap counter will be incremented. If the following tap
 *gestures exceed this threshold, the previous touch is sent as a single tap and the current touch will reset the tap
 *counter. Unit: coordinates Example: if SEQ_TAP_DIST_THRESHOLD is configured as 20, after the first tap, if the user
 *taps again within 20 coordinates, it is considered as double tap gesture.
 */
#define SEQ_TAP_DIST_THRESHOLD 50
/* 	Edge Boundary <0-255>
 *	The firmware can also be modified to define an edge region along the border of the touch sensor.
 *	With Edge Boundary defined, swipe gestures that start in an edge region will be reported as edge swipe gestures in
 *place of normal swipe gestures. To create an edge region, the EDGE_BOUNDARY is set with the size (in touch
 *coordinates) of the edge region. Unit: coordinates Example: Setting the EDGE_BOUNDARY parameter to 100 will designate
 *the area 100 units in from each edge as the edge region.
 */
#define EDGE_BOUNDARY 0
/*  Wheel Post-scaler <0-255>
 *	The clockwise wheel is performed with 4 swipes (right->down->left->up). Similarly, the anti-clockwise wheel is
 *performed with 4 swipes (left->down->right->up). To detect a wheel, the minimum number of swipe required is wheel
 *start quadrant count + wheel post scaler. Once the wheel is detected, for post scaler number of swipe detections, the
 *wheel counter will be incremented by 1. Example: if wheel post scaler is 2, then for each two swipe detection, the
 *wheel counter will be incremented by 1.
 */
#define WHEEL_POSTSCALER 1
/* 	Wheel Start Quadrant count <2-255>
 *	The wheel gesture movement can be broken down into 90 degree arcs.
 *	The firmware watches for a certain number of arcs to occur in a circular pattern before starting to report wheel
 *gesture information. The number of arcs that must be first detected is determined by the WHEEL_START_QUADRANT_COUNT
 *parameter. Lower values for this parameter make it faster to start a wheel gesture, but it also makes the firmware
 *prone to prematurely reporting wheel gesture information. Example: if WHEEL_START_QUADRANT_COUNT is configured as 2,
 *then after 180 degree, the gesture is updated as Wheel.
 */
#define WHEEL_START_QUADRANT_COUNT 2
/* 	Wheel Reverse Quadrant count <2-255>
 *	The WHEEL_REVERSE_QUADRANT_COUNT performs a similar function as WHEEL_START_QUADRANT_COUNT except it is used when
 *changing the direction of the wheel instead of starting it new. This is used to prevent quick toggling between
 *directions. Example: If WHEEL_REVERSE_QUADRANT_COUNT is set as 4 and after some wheel gestures, if the user changes
 *the direction of rotation, then only after 360 degree, it will be detected as one wheel gesture.
 */
#define WHEEL_REVERSE_QUADRANT_COUNT 2

/* Pinch Zoom Threshold <0-255>
 * The PINCH_ZOOM_THRESHOLD limits the allowable distance between the two fingers to detect the pinch and the zoom
 * gestures. After crossing the PINCH_ZOOM_THRESHOLD, if the distance between the contacts is reducing, then the gesture
 * is reported as 'PINCH'. After crossing the PINCH_ZOOM_THRESHOLD, if the distance between the contacts is increasing,
 * then the gesture is reported as 'ZOOM'. Unit: coordinates Example: if PINCH_ZOOM_THRESHOLD is configured as 20, then
 * after crossing 20 coordinates, it will be reported as the pinch gesture or the zoom gesture.
 */
#define PINCH_ZOOM_THRESHOLD 50

#define DEF_GESTURE_TIME_BASE_MS 10u

/* Sleep Modes */
#define PM_SLEEP_IDLE 2u
#define PM_SLEEP_STANDBY 4u
#define PM_SLEEP_OFF 6u

/* Event system parameters */
#define QTM_AUTOSCAN_TRIGGER_GENERATOR (QTM_AUTOSCAN_TRIGGER_PERIOD + 4u)
#define QTM_AUTOSCAN_STCONV_USER 19u
#define QTM_RTC_TO_PTC_EVSYS_CHANNEL 0u
#define QTM_AUTOSCAN_TRIGGER_PERIOD_EVENT (1u << QTM_AUTOSCAN_TRIGGER_PERIOD)

/**********************************************************/
/******************* Low-power parameters *****************/
/**********************************************************/
/* Enable or disable low-power scan
 * Range: 0 or 1.
 * Default value: 1
 */
#define DEF_TOUCH_LOWPOWER_ENABLE 1u

/* Node selection for Low-power scan.
 * Range: 0 to (DEF_NUM_CHANNELS-1).
 * Default value: 0
 */
#define QTM_AUTOSCAN_NODE 10

/* Touch detection threshold for Low-power node.
 * Range: 0 to 255.
 * Default value:
 */
#define QTM_AUTOSCAN_THRESHOLD 15

/* Defines the Auto scan trigger period.
 * The Low-power measurement period determine the interval between low-power touch measurement.
 * Range: NODE_SCAN_8MS to NODE_SCAN_1024MS
 * Default value: NODE_SCAN_64MS
 */
#define QTM_AUTOSCAN_TRIGGER_PERIOD NODE_SCAN_64MS		// JC was 64

/* Waiting time (in millisecond) for the application to switch to low-power measurement after the last touch.
 * Range: 1 to 65535
 * Default value: 5000
 */
#define DEF_TOUCH_TIMEOUT 5000

/* Defines drift measurement period
 * During low-power measurement, it is recommended to perfrom periodic active measurement to perform drifting.
 * This parameter defines the measurement interval to perform drifting.
 * Range: 1 to 65535 ( should be more than QTM_AUTOSCAN_TRIGGER_PERIOD)
 * Default value: 2000
 */
#define DEF_TOUCH_DRIFT_PERIOD_MS 20000		// JC was 2000

/**********************************************************/
/***************** Communication - Surface Utility ******************/
/**********************************************************/

#define KRONOCOMM_UART 0u
#define KRONOCOMM_ENABLE 0u

#define KRONO_GESTURE_ENABLE 0u

#ifdef __cplusplus
}
#endif // __cplusplus
#endif // TOUCH_C
