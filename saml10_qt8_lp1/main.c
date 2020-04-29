#include <atmel_start.h>
#include "led_driver.h"
#include <RN4678_init.h>

#define Nop() __asm("NOP")

extern volatile uint8_t time_to_measure_touch;
extern uint8_t          led_current_action;
extern uint16_t measurement_period_store;
int main(void)
{
	/* Initializes MCU, drivers and middleware */
	atmel_start_init();
//	RN4678_Init();
//  RN4678_FactoryDefaults();
// send test string
    
	
	#if ENABLE_LED == 1u
	init_led_driver();
	#endif

	// acquisition timing gpio
	#define PA06 GPIO(GPIO_PORTA, 6)	// LED0
	#define PA07 GPIO(GPIO_PORTA, 7)	// LED1
	gpio_set_pin_level(PA06, true);
	gpio_set_pin_level(PA07, true);
	gpio_set_pin_direction(PA06, GPIO_DIRECTION_OUT);
	gpio_set_pin_direction(PA07, GPIO_DIRECTION_IN);
	
	/* Replace with your application code */
	while (1) {
		
		if ((!(time_to_measure_touch == 1u)))// && (led_current_action == LED_NO_ACTION))
		{
			sleep(PM_SLEEP_STANDBY);
		}

		touch_process();
		
		#if ENABLE_LED == 1u
		/* measurement done touch flag is not used.
		measurement_done_touch is set only after all rebust is resolved.
		There is a possibility that the surface status is changed before even measurement_done_touch flag is set.
		Correct place to call these functions is qtm_post_process_complete().
		Since in example project cannot modify touch.c these code is present here.
		*/
		//if(measurement_period_store == DEF_TOUCH_MEASUREMENT_PERIOD_MS)
		{
			led_decode_gesture();
			qtm_gestures_2d_clearGesture();
			led_process();
		}
		#endif
	}
}
