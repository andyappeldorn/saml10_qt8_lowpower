#if 1
// RN4678 driver to enter command mode and change configurations.
// RN4678 default baud is 115200 w/ handshaking enabled
// This implementation changes baud to 38400 and disabled handshaking

#include <atmel_start.h>
#include <RN4678_init.h>

volatile uint8_t rx_string[20];
volatile uint8_t rx_index = 0;

void USART_0_setup(void)
{
	usart_async_register_callback(&USART, USART_ASYNC_TXC_CB, tx_cb_USART_0);
	usart_async_register_callback(&USART, USART_ASYNC_RXC_CB, rx_cb_USART_0);
	// usart_async_register_callback(&USART_0, USART_ASYNC_ERROR_CB, err_cb);
	usart_async_enable(&USART);
}

// Last entry in ring buffer (ring buffer found at io_descr->rx in callback).
// Can be used for parsing in the call back.
uint8_t ringbuffer_last(struct ringbuffer const *const rb)
{
	ASSERT(rb);		// debug trap if NULL
	uint8_t data = rb->buf[(rb->write_index-1) & rb->size];		// @todo: figure out how to use read_index < write_index for multi byte reads
	return data;
}

void init_rx_buffer(void){
	uint8_t count;
	for(count = 0; count < sizeof(rx_string); count++){
		rx_string[count] = NULL;
	}
	rx_index = 0;
}

static void tx_cb_USART_0(const struct usart_async_descriptor *const io_descr)
{
	/* Transfer completed */
}

static void rx_cb_USART_0(const struct usart_async_descriptor *const io_descr)
{
	/* Read transfer completed */
	rx_string[rx_index++] = ringbuffer_last(&io_descr->rx);	// grab received byte and put into array
}

struct io_descriptor *io;
void __attribute__((optimize("O0"))) RN4678_Init(void)
{
    uint32_t count = 0;
	USART_0_setup();
	usart_async_get_io_descriptor(&USART, &io);

// flush garbage from rn4678 rx buff if any
	io_write(io, "\r\n", 2);				// send cr lf to flush any potential garbage in rn4678 cue
	_delay_cycles(0xFFFF);					// wait

// exit command mode
	io_write(io, "---\r\n", 5);				// send term config sequence in case in config
	// wait sufficient amount of time to exit cmd mode, do not use strcmp() as may not already be in command mode
    for(count = 0; count <= 0xFFFF ; count ++){
        __asm("NOP");
    }

// enter command mode
	init_rx_buffer();		// init rx buffer	
	io_write(io, "$$$\r\n", 5);				// send config sequence
	while(0 != strcmp("CMD> ", &rx_string[0]));	// verify response, halt if failed

// request version number
	init_rx_buffer();		// init rx buffer
	io_write(io, "GDR\r\n", 5);				// send get version command
	while(0 != strcmp("1.13\r\nCMD> ", &rx_string[0]));	// verify response, halt if failed, this will fail if version is not supported

// set flow control to off
	init_rx_buffer();		// init rx buffer
	io_write(io, "SQ,0000\r\n", 9);			// send flow control off command
	while(0 != strcmp("AOK\r\nCMD> ", &rx_string[0]));	// verify response, halt if failed, this will fail if version is not supported

// set baud rate to new value
	init_rx_buffer();		// init rx buffer
//	io_write(io, "SU,09\r\n", 7);			// send baud rate 9600 command
	io_write(io, "SU,05\r\n", 7);			// send baud rate 38400 command
//	io_write(io, "SU,04\r\n", 7);			// send baud rate 57600 command
//	io_write(io, "SU,03\r\n", 7);			// send baud rate 115200 command
	while(0 != strcmp("AOK\r\nCMD> ", &rx_string[0]));	// verify response, halt if failed, this will fail if version is not supported

// send reset command to use updated parameters	
	init_rx_buffer();		// init rx buffer
	io_write(io, "R,1\r\n", 9);			// send reset to use updated parameters
// will not respond if baud has changed

//    uint8_t test_val = 0;
//    for(count = 0; count<0xFF; count++){
//        
//    }
    
	while(1);	// do not proceed past here, change baud in hpl_sercom_config.h to match
}

#endif