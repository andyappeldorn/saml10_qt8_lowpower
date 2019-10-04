#include <atmel_start.h>

extern volatile uint8_t measurement_done_touch;

int main(void)
{
	/* Initializes MCU, drivers and middleware */
	atmel_start_init();

	/* Replace with your application code */
	while (1) {
		touch_process();

		if (measurement_done_touch == 1) {
			measurement_done_touch = 0;
			if ((get_sensor_state(0) & 0x80)) {
				gpio_set_pin_level(LED, false);
			} else {
				gpio_set_pin_level(LED, true);
			}
		}
	}
}
