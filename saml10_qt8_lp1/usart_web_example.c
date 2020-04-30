// from https://community.atmel.com/comment/2375141#comment-2375141
#include <atmel_start.h>

#include "driver_init.h"
#include "utils.h"
#include <stdlib.h>
#include <string.h>

// "FIXES" missing from library....    (NOT Required....., library works if define RXC CB.)

// HPL (Hardware Proxy Layer) interface for setting RXC interrupt enable. (Missing from hpl_usart_async.h)
void _usart_async_enable_rx_done_irq(struct _usart_async_device *const device)
{
    hri_sercomusart_set_INTEN_RXC_bit(device->hw);	// This function is present in Hardware Register Interface file.
}

// HAL (Hardware Abstraction Layer) interface for setting RXC interrupt enable. (Missing from hal_usart_async.h, .c)
// NOTE this needs to be called during initialization of the USART async functionality after (or in) usart_async_enable.
// For use here we leave as a separate call, since the file containing usart_async_enable may be regenerated from "Start".
int32_t usart_async_enable_rx_done_irq(struct usart_async_descriptor *const descr)
{
    ASSERT(descr);
    _usart_async_enable_rx_done_irq(&descr->device);

    return ERR_NONE;
}

// NON-FIXES, but potentially useful routines...

// Useful routine, could be at HAL level.
int32_t usart_async_wait_tx_buffer_done(struct usart_async_descriptor *const descr)
{
    int32_t err;
    for(err=usart_async_get_status(descr,NULL);
            err==ERR_BUSY;
            err=usart_async_get_status(descr,NULL))
        ;
    return err;	// Error if not ERR_NONE (0).
}

// Last entry in ring buffer (ring buffer found at io_descr->rx in callback).
// Can be used for parsing in the call back.
uint8_t ringbuffer_last(struct ringbuffer const *const rb)
{
    ASSERT(rb);

    uint8_t data = rb->buf[(rb->write_index-1) & rb->size];

    return data;
}

// Note this is a callback during interrupt.
static void tx_cb_USART_0(const struct usart_async_descriptor *const io_descr)
{
    /* Write transfer completed */
}

// Note this is a callback during interrupt.
// NOTE this routine is required, even if it is empty! Setting this
// call back also initializes the RXC interrupt, in the ASF4 library of the date
// of this edit!
volatile bool line_available = false;
static void rx_cb_USART_0(const struct usart_async_descriptor *const io_descr)
{
    /* Read transfer completed */
    if( ringbuffer_last(&io_descr->rx) == '\n' )
        line_available = true;
}

void USART_0_setup(void)
{
    usart_async_register_callback(&USART_0, USART_ASYNC_TXC_CB, tx_cb_USART_0);
    usart_async_register_callback(&USART_0, USART_ASYNC_RXC_CB, rx_cb_USART_0);  // REQUIRED for RX to work!
    //usart_async_register_callback(&USART_0, USART_ASYNC_ERROR_CB, err_cb);
    usart_async_enable(&USART_0);
    // NOTE that the "fix" was not required -- RXC is enabled in above RXC CB setup.
    //usart_async_enable_rx_done_irq(&USART_0);	// Here "fix" to enable RXC interrupt.

}

/**
 * Example of using USART_0 to write "Hello World" using the IO abstraction.
 *
 * Since the driver is asynchronous we need to use statically allocated memory for string
 * because driver initiates transfer and then returns before the transmission is completed.
 *
 * Once transfer has been completed the tx_cb function will be called.
 */

static const uint8_t example_USART_0[] = "Hello World!\n";
static uint8_t char_string[] = "Character '_' hit in reverse order.\n";	// Not "const" (for ROM) since modifying the '_'
#define CHHITPOS 11
static const uint8_t clicked_string[] = "Button clicked\n";
static uint8_t buffer[15];
static uint32_t errcount = 0;
int32_t nread = 0;
int32_t numclicks = 0;

// This prints "Hello World!" on a separate line, or any of several messages depending
// upon input.
// NOTE not a demonstration of good LOGIC. Rather the purpose of this is to demonstrate
// capabilities of the existing ASF4 library with regard to async read and write to USART,
// and that they work correctly when understood.
void USART_0_output(void)
{
    int32_t err=0;
    struct io_descriptor *io;
    usart_async_get_io_descriptor(&USART_0, &io);	// Get the pointer to statically allocated io_descriptor structure.

    if( usart_async_get_status(&USART_0,NULL) != ERR_BUSY ) {
        if( nread > 0 ) {
            if( buffer[nread-1] == '\n' )
                --nread;
            else {
                char_string[CHHITPOS] = buffer[nread-1];
                err = io_write(io, char_string, sizeof(char_string));	// Print "Character 'n' hit first." in reverse order received.
                if(err>0)
                    --nread;
            }
        } else if(numclicks > 0) {
            err = io_write(io, clicked_string, sizeof(clicked_string));	// DO NOT call with non-statically allocated data memory!
            if(err>0)
                --numclicks;
        } else {
            err = io_write(io, example_USART_0, sizeof(example_USART_0));	// DO NOT call with non-statically allocated data memory!
            // (Output interrupts will continue to use after this function has returned.)
        }
    }

    if(err<0)
        ++errcount;
}

//
void USART_0_input(void)
{
    struct io_descriptor *io;
    bool willRead = false;
    usart_async_get_io_descriptor(&USART_0, &io);	// Get the pointer to statically allocated io_descriptor structure.

    if( nread <= 0 ) {
        // Here need a semaphore (counts only to 1 in interrupt):
        CRITICAL_SECTION_ENTER()
        if(line_available) {
            willRead = true;			// Acepting the semaphore count.
            line_available = false;		// Decrementing the semaphore count from 1 to 0.
        }								// Fast in and out with interrupts disabled.
        CRITICAL_SECTION_LEAVE()
        if( willRead )
            nread = io_read(io, buffer, sizeof(buffer));	// Returns count of characters read (or negative error flag).
    }
}

bool nowButton=false;
bool wasButton=false;

int main(void)
{
    /* Initializes MCU, drivers and middleware */
    atmel_start_init();			// General Atmel Start configurations...

    /* Replace with your application code */
    USART_0_setup();			// Set up the specifics
    while (1) {
        nowButton = !gpio_get_pin_level(BUTTON);	// Invert of input signal, button shorts to ground.
        if( nowButton && !wasButton )
            ++numclicks;							// Register a click transition
        wasButton = nowButton;

        // Comment next line for full speed operation...
        //usart_async_wait_tx_buffer_done(&USART_0);	// This will cause a delay in loop response, visible in button to LED delay!

        USART_0_output();							// Process may make an output, depending upon state.
        gpio_set_pin_level(LED,nowButton);			// Put to LED.
        USART_0_input();							// Process character input.

    }
}

/* Statistics on 16K/4K processor (ATSAMD10D14):
                Program Memory Usage 	:	3760 bytes   22.9 % Full
                Data Memory Usage 		:	1232 bytes   30.1 % Full
*/