//------------------------------------------------------------------------------------------------------
// Demonstration program for Cortex-M0 SoC design
// 1)Enable the interrupt for UART - interrupt when character received
// 2)Go to sleep mode
// 3)On interruption, echo character back to the UART and collect into buffer
// 4)When a whole sentence has been received, invert the case and send it back
// 5)Loop forever doing the above.
//
// Version 4 - October 2015
//------------------------------------------------------------------------------------------------------
#include <stdio.h>
#include "DES_M0_SoC.h"

#define BUF_SIZE						100
#define ASCII_CR						'\r'
#define CASE_BIT						('A' ^ 'a')
#define nLOOPS_per_DELAY		500000

#define INVERT_LEDS					(pt2GPIO->LED ^= 0xff)

#define ARRAY_SIZE(__x__)       (sizeof(__x__)/sizeof(__x__[0]))

volatile uint8  counter  = 0; // current number of char received on UART currently in RxBuf[]
volatile uint8  BufReady = 0; // Flag to indicate if there is a sentence worth of data in RxBuf
volatile uint8  RxBuf[BUF_SIZE];



//////////////////////////////////////////////////////////////////
// Interrupt service routine, runs when UART interrupt occurs - see cm0dsasm.s
//////////////////////////////////////////////////////////////////
void UART_ISR()		
{
	char c;
	c = pt2UART->RxData;	 // read a character from UART - interrupt only occurs when character waiting
	RxBuf[counter]  = c;   // Store in buffer
	counter++;             // Increment counter to indicate that there is now 1 more character in buffer
	pt2UART->TxData = c;   // write (echo) the character to UART (assuming transmit queue not full!)
	// counter is now the position that the next character should go into
	// If this is the end of the buffer, i.e. if counter==BUF_SIZE-1, then null terminate
	// and indicate the a complete sentence has been received.
	// If the character just put in was a carriage return, do likewise.
	if (counter == BUF_SIZE-1 || c == ASCII_CR)  {
		counter--;							// decrement counter (CR will be over-written)
		RxBuf[counter] = NULL;  // Null terminate
		BufReady       = 1;	    // Indicate to rest of code that a full "sentence" has being received (and is in RxBuf)
	}
}


//////////////////////////////////////////////////////////////////
// Software delay function
//////////////////////////////////////////////////////////////////
void wait_n_loops(uint32 n) {
	volatile uint32 i;
		for(i=0;i<n;i++);
}

//////////////////////////////////////////////////////////////////
// Writing function to an spi slave 
//////////////////////////////////////////////////////////////////
void writeAccelerometer(uint8 regAddress, uint8 dataToWrite){
	pt2SPI->slaveSelect = 0x07;
	while((pt2SPI->spicon & 0x04) == 0x00);//mask 0x04 to look only at the status/idle bit, waiting for it to be one
	pt2SPI->txData = (0x0A<<16) + (regAddress<<8) + dataToWrite;
	while((pt2SPI->spicon & 0x04) == 0x00);//transmission is over
	
}

//////////////////////////////////////////////////////////////////
// Reading function from an spi slave 
//////////////////////////////////////////////////////////////////
uint8 readAccelerometer(uint8 regAddress){
	pt2SPI->slaveSelect = 0x07;
	while((pt2SPI->spicon & 0x04) == 0x00);
	pt2SPI->txData = (0x0B<<16) + (regAddress<<8);
	while((pt2SPI->spicon & 0x04) == 0x00);//mask 0x04 to look only at the status/idle bit, 
	return pt2SPI->rxData;
}

//////////////////////////////////////////////////////////////////
// Configuration for registers
//////////////////////////////////////////////////////////////////
void configurationAccelerometer(){
  //<0A><2C><switch_01 0000> we can switch measurement range from 2g,4g,8g using the leftmost switches (5 and 4)
	writeAccelerometer(0x2C,((pt2GPIO->Switches>>8) & 0xC0) | 0x13);
	
	//config spicon as cpol=cpha=0	
	pt2SPI->spicon=0x0;
	
	//<0A><2D><02>    " measurement mode "	
	writeAccelerometer(0x2D, 0x02);
	
	//other registers just remain default
}
 

////////////////////////////////////////////////////////////////

uint16 filter(uint8 axis, uint8 index, uint16 value){
	static uint16 buffer [16][4];
	static uint32 sum[4];
	
	sum[axis] = sum[axis] - buffer[index][axis];
	buffer[index][axis] = value; 
	sum[axis] = sum[axis] + buffer[index][axis];
	return sum[axis]>>4;
}


//convert to decimal
uint16 convertToDecimal(uint16 heximal){
	uint8 i;
	uint16 digit=0;
	
	for(i=0;i<4;i++){
		digit = digit + ((heximal%10)<<(4*i)) ;
		heximal = heximal / 10 ;
	}
	return digit;
}


uint16 convert(uint8 axis, uint8 index,int16 hexVal){	
	uint16 dec;
		//check if the value is negative '-'  and convert it into decimal
			if((hexVal & 0x8000) == 0x8000){
				hexVal = ((~hexVal)+1)&0x7FFF;//then we need to complement the value
				hexVal = filter(axis, index, hexVal);
				dec = convertToDecimal(hexVal);		//convert the heximal into decimal
				printf("%c:%d mg\t",88+axis, hexVal);		
				dec = (0xa<<12) + (dec>>4);        //put '-' to the most significant bit and shift the rest of it to right side, by 4 bits
			}
			else{
				hexVal = filter(axis, index, hexVal);
				printf("%c:%d mg\t",88+axis, hexVal);
				dec = convertToDecimal(hexVal);//	blank instead of most significant zero, positive value
				dec = (0xb<<12) +(dec>>4);				 //convert the heximal into decimal to display
			}
			return dec;
}



//////////////////////////////////////////////////////////////////
// Main Function
//////////////////////////////////////////////////////////////////
int main(void) {
	uint16 Tbias = 32700;
	uint32 displayedValue=0; 
	uint16 range = 1; 
	int16 X=0;
	int16 Y=0;
	int16 Z=0;
	int16 T=0;
	
	uint16 unsignedX=0;
	uint16 unsignedY=0;
	uint16 unsignedZ=0;
	uint16 unsignedT=0;
	
	uint8 buffer_counter = 0;
	
	pt2UART->Control = (1 << UART_RX_FIFO_EMPTY_BIT_INT_POS);		// Enable rx data available interrupt, and no others.
  pt2NVIC->Enable	 = (1 << NVIC_UART_BIT_POS);								// Enable interrupts for UART in the NVIC
	wait_n_loops(nLOOPS_per_DELAY);										// wait a little
	
	printf("\r\nWelcome to Digital embedded system class and now we are reading the accelerometer\r\n");			// output welcome message

	configurationAccelerometer();
	
	
	while(1){			// loop forever
		
			switch((pt2GPIO->Switches)&0xC000){
				case 0x0000:	range=1; break;
				case 0x4000:	range=2; break;
				default:		  range=4; break;	
			}
			writeAccelerometer(0x2C,((pt2GPIO->Switches>>8) & 0xC0)+0x13);
			
			//Delay 		
			wait_n_loops(nLOOPS_per_DELAY);	
			
			X = ((readAccelerometer(0x0F)<<8)+readAccelerometer(0x0E))*range; //Read and combine XDATA_H and XDATA_L
			Y = ((readAccelerometer(0x11)<<8)+readAccelerometer(0x10))*range; //Read and combine YDATA_H and YDATA_L
			Z = ((readAccelerometer(0x13)<<8)+readAccelerometer(0x12))*range; //Read and combine ZDATA_H and ZDATA_L
			T = (((readAccelerometer(0x15)<<8)+readAccelerometer(0x14))/2)-Tbias; //Read and combine TEMP_H and TEMP_L						

			
			unsignedX = convert(0, buffer_counter,X);
			unsignedY = convert(1, buffer_counter,Y);
			unsignedZ = convert(2, buffer_counter,Z);
			
			unsignedT = filter(3, buffer_counter, T);
			printf("\t%d%cC",unsignedT,248);
			unsignedT = convertToDecimal(unsignedT);//	blank instead of most significant zero, positive value
			unsignedT = (0xbb<<8) + (unsignedT);
			
			
			printf("\r\n");
			
			//display on the 7 segments screen
			switch((pt2GPIO->Switches) & 0x01){
				case 0: 
					displayedValue = (unsignedX<<16) | unsignedY;//display X and Y
				pt2DISPLAY->decimalPoint  = 0x00000044 ; // desplayed decimalpoint
					break;
				case 1: 
					displayedValue = (unsignedZ<<16) | unsignedT;//display Z and T
					pt2DISPLAY->decimalPoint  = 0x00000040 ; // desplayed decimalpoint				
					break;
			}
			
			pt2DISPLAY->dataDisplayed = displayedValue; // desplayed data
			  
			buffer_counter =(buffer_counter+1)%16;
	}
}
	
			
			
			
			



