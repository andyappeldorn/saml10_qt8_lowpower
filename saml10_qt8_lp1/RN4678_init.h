#include <atmel_start.h>

void USART_0_setup(void);
uint8_t ringbuffer_last(struct ringbuffer const *const rb);
static void tx_cb_USART_0(const struct usart_async_descriptor *const io_descr);
static void rx_cb_USART_0(const struct usart_async_descriptor *const io_descr);
void RN4678_Init(void);
