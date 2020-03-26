/*
 * Code generated from Atmel Start.
 *
 * This file will be overwritten when reconfiguring your Atmel Start project.
 * Please copy examples or other code you want to keep to a separate file
 * to avoid losing it when reconfiguring.
 */

#include "driver_init.h"
#include <peripheral_clk_config.h>
#include <utils.h>
#include <hal_init.h>

#include <hpl_rtc_base.h>

/*! The buffer size for USART */
#define USART_BUFFER_SIZE 128

struct timer_descriptor       Timer;
struct usart_async_descriptor USART;

static uint8_t USART_buffer[USART_BUFFER_SIZE];

struct i2c_m_sync_desc I2C_0;

/**
 * \brief Timer initialization function
 *
 * Enables Timer peripheral, clocks and initializes Timer driver
 */
static void Timer_init(void)
{
	hri_mclk_set_APBAMASK_RTC_bit(MCLK);
	timer_init(&Timer, RTC, _rtc_get_timer());
}

/**
 * \brief USART Clock initialization function
 *
 * Enables register interface and peripheral clock
 */
void USART_CLOCK_init()
{

	hri_gclk_write_PCHCTRL_reg(GCLK, SERCOM0_GCLK_ID_CORE, CONF_GCLK_SERCOM0_CORE_SRC | (1 << GCLK_PCHCTRL_CHEN_Pos));
	hri_gclk_write_PCHCTRL_reg(GCLK, SERCOM0_GCLK_ID_SLOW, CONF_GCLK_SERCOM0_SLOW_SRC | (1 << GCLK_PCHCTRL_CHEN_Pos));
	hri_mclk_set_APBCMASK_SERCOM0_bit(MCLK);
}

/**
 * \brief USART pinmux initialization function
 *
 * Set each required pin to USART functionality
 */
void USART_PORT_init()
{

	gpio_set_pin_function(PA24, PINMUX_PA24C_SERCOM0_PAD2);

	gpio_set_pin_function(PA25, PINMUX_PA25C_SERCOM0_PAD3);
}

/**
 * \brief USART initialization function
 *
 * Enables USART peripheral, clocks and initializes USART driver
 */
void USART_init(void)
{
	USART_CLOCK_init();
	usart_async_init(&USART, SERCOM0, USART_buffer, USART_BUFFER_SIZE, (void *)NULL);
	USART_PORT_init();
}

void I2C_0_PORT_init(void)
{

	gpio_set_pin_pull_mode(PA16,
	                       // <y> Pull configuration
	                       // <id> pad_pull_config
	                       // <GPIO_PULL_OFF"> Off
	                       // <GPIO_PULL_UP"> Pull-up
	                       // <GPIO_PULL_DOWN"> Pull-down
	                       GPIO_PULL_OFF);

	gpio_set_pin_function(PA16, PINMUX_PA16C_SERCOM1_PAD0);

	gpio_set_pin_pull_mode(PA17,
	                       // <y> Pull configuration
	                       // <id> pad_pull_config
	                       // <GPIO_PULL_OFF"> Off
	                       // <GPIO_PULL_UP"> Pull-up
	                       // <GPIO_PULL_DOWN"> Pull-down
	                       GPIO_PULL_OFF);

	gpio_set_pin_function(PA17, PINMUX_PA17C_SERCOM1_PAD1);
}

void I2C_0_CLOCK_init(void)
{
	hri_gclk_write_PCHCTRL_reg(GCLK, SERCOM1_GCLK_ID_CORE, CONF_GCLK_SERCOM1_CORE_SRC | (1 << GCLK_PCHCTRL_CHEN_Pos));
	hri_gclk_write_PCHCTRL_reg(GCLK, SERCOM1_GCLK_ID_SLOW, CONF_GCLK_SERCOM1_SLOW_SRC | (1 << GCLK_PCHCTRL_CHEN_Pos));
	hri_mclk_set_APBCMASK_SERCOM1_bit(MCLK);
}

void I2C_0_init(void)
{
	I2C_0_CLOCK_init();
	i2c_m_sync_init(&I2C_0, SERCOM1);
	I2C_0_PORT_init();
}

/**
 * \brief PTC initialization function
 *
 * Enables PTC peripheral, clocks and initializes PTC driver
 */
static void PTC_clock_init(void)
{
	hri_gclk_write_PCHCTRL_reg(GCLK, PTC_GCLK_ID, CONF_GCLK_PTC_SRC | (1 << GCLK_PCHCTRL_CHEN_Pos));
	hri_mclk_set_APBCMASK_PTC_bit(MCLK);
}

void EVSYS_init(void)
{
	hri_gclk_write_PCHCTRL_reg(GCLK, EVSYS_GCLK_ID_0, CONF_GCLK_EVSYS_CHANNEL_0_SRC | (1 << GCLK_PCHCTRL_CHEN_Pos));
	hri_mclk_set_APBCMASK_EVSYS_bit(MCLK);

	event_system_init();
}
#include "touch.h"

void system_init(void)
{
	init_mcu();

	Timer_init();
	
	#if KRONOCOMM_UART == 1u
	USART_init();
	#endif

	I2C_0_init();

	PTC_clock_init();

	EVSYS_init();
}
