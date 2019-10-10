#include <atmel_start.h>

/*----------------------------------------------------------------------------
 *   Extern variables
 *----------------------------------------------------------------------------*/
extern volatile uint8_t measurement_done_touch;

/*----------------------------------------------------------------------------
 *   Global variables
 *----------------------------------------------------------------------------*/
uint8_t my_key_status = 0;

/*----------------------------------------------------------------------------
 *   prototypes
 *----------------------------------------------------------------------------*/
void touch_status_display(void);

int main(void)
{
	/* Initializes MCU, drivers and middleware */
	atmel_start_init();
	SUPC->VREG.bit.SEL = 0;
	while (SUPC->STATUS.bit.VCORERDY != 1)
		;

	/* Replace with your application code */
	while (1) {
		touch_process();
		
		if (measurement_done_touch == 1) {
			touch_status_display();
		}
	}
}

#if 0
/*============================================================================
void touch_status_display(void)
------------------------------------------------------------------------------
Purpose: Sample code snippet to demonstrate how to check the status of the
         sensors
Input  : none
Output : none
Notes  : none
============================================================================*/
void touch_status_display(void)
{
	my_key_status = get_sensor_state(0) & KEY_TOUCHED_MASK;
	if (0u != key_status) {
		// LED_ON
	} else {
		// LED_OFF
	}
	my_key_status = get_sensor_state(1) & KEY_TOUCHED_MASK;
	if (0u != key_status) {
		// LED_ON
	} else {
		// LED_OFF
	}
	my_key_status = get_sensor_state(2) & KEY_TOUCHED_MASK;
	if (0u != key_status) {
		// LED_ON
	} else {
		// LED_OFF
	}
	my_key_status = get_sensor_state(3) & KEY_TOUCHED_MASK;
	if (0u != key_status) {
		// LED_ON
	} else {
		// LED_OFF
	}
	my_key_status = get_sensor_state(4) & KEY_TOUCHED_MASK;
	if (0u != key_status) {
		// LED_ON
	} else {
		// LED_OFF
	}
	my_key_status = get_sensor_state(5) & KEY_TOUCHED_MASK;
	if (0u != key_status) {
		// LED_ON
	} else {
		// LED_OFF
	}
	my_key_status = get_sensor_state(6) & KEY_TOUCHED_MASK;
	if (0u != key_status) {
		// LED_ON
	} else {
		// LED_OFF
	}
	my_key_status = get_sensor_state(7) & KEY_TOUCHED_MASK;
	if (0u != key_status) {
		// LED_ON
	} else {
		// LED_OFF
	}
	my_key_status = get_sensor_state(8) & KEY_TOUCHED_MASK;
	if (0u != key_status) {
		// LED_ON
	} else {
		// LED_OFF
	}
	my_key_status = get_sensor_state(9) & KEY_TOUCHED_MASK;
	if (0u != key_status) {
		// LED_ON
	} else {
		// LED_OFF
	}
}
#endif