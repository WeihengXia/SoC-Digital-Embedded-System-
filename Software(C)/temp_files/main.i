#line 1 "main.c"










#line 1 "D:\\keil_C51\\ARM\\ARMCC\\bin\\..\\include\\stdio.h"
 
 
 





 






 













#line 38 "D:\\keil_C51\\ARM\\ARMCC\\bin\\..\\include\\stdio.h"


  
  typedef unsigned int size_t;    








 
 

 
  typedef struct __va_list __va_list;





   




 




typedef struct __fpos_t_struct {
    unsigned __int64 __pos;
    



 
    struct {
        unsigned int __state1, __state2;
    } __mbstate;
} fpos_t;
   


 


   

 

typedef struct __FILE FILE;
   






 

extern FILE __stdin, __stdout, __stderr;
extern FILE *__aeabi_stdin, *__aeabi_stdout, *__aeabi_stderr;

#line 129 "D:\\keil_C51\\ARM\\ARMCC\\bin\\..\\include\\stdio.h"
    

    

    





     



   


 


   


 

   



 

   


 




   


 





    


 






extern __declspec(__nothrow) int remove(const char *  ) __attribute__((__nonnull__(1)));
   





 
extern __declspec(__nothrow) int rename(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   








 
extern __declspec(__nothrow) FILE *tmpfile(void);
   




 
extern __declspec(__nothrow) char *tmpnam(char *  );
   











 

extern __declspec(__nothrow) int fclose(FILE *  ) __attribute__((__nonnull__(1)));
   







 
extern __declspec(__nothrow) int fflush(FILE *  );
   







 
extern __declspec(__nothrow) FILE *fopen(const char * __restrict  ,
                           const char * __restrict  ) __attribute__((__nonnull__(1,2)));
   








































 
extern __declspec(__nothrow) FILE *freopen(const char * __restrict  ,
                    const char * __restrict  ,
                    FILE * __restrict  ) __attribute__((__nonnull__(2,3)));
   








 
extern __declspec(__nothrow) void setbuf(FILE * __restrict  ,
                    char * __restrict  ) __attribute__((__nonnull__(1)));
   




 
extern __declspec(__nothrow) int setvbuf(FILE * __restrict  ,
                   char * __restrict  ,
                   int  , size_t  ) __attribute__((__nonnull__(1)));
   















 
#pragma __printf_args
extern __declspec(__nothrow) int fprintf(FILE * __restrict  ,
                    const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   


















 
#pragma __printf_args
extern __declspec(__nothrow) int _fprintf(FILE * __restrict  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   



 
#pragma __printf_args
extern __declspec(__nothrow) int printf(const char * __restrict  , ...) __attribute__((__nonnull__(1)));
   




 
#pragma __printf_args
extern __declspec(__nothrow) int _printf(const char * __restrict  , ...) __attribute__((__nonnull__(1)));
   



 
#pragma __printf_args
extern __declspec(__nothrow) int sprintf(char * __restrict  , const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   






 
#pragma __printf_args
extern __declspec(__nothrow) int _sprintf(char * __restrict  , const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   



 

#pragma __printf_args
extern __declspec(__nothrow) int snprintf(char * __restrict  , size_t  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(3)));
   















 

#pragma __printf_args
extern __declspec(__nothrow) int _snprintf(char * __restrict  , size_t  ,
                      const char * __restrict  , ...) __attribute__((__nonnull__(3)));
   



 
#pragma __scanf_args
extern __declspec(__nothrow) int fscanf(FILE * __restrict  ,
                    const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   






























 
#pragma __scanf_args
extern __declspec(__nothrow) int _fscanf(FILE * __restrict  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   



 
#pragma __scanf_args
extern __declspec(__nothrow) int scanf(const char * __restrict  , ...) __attribute__((__nonnull__(1)));
   






 
#pragma __scanf_args
extern __declspec(__nothrow) int _scanf(const char * __restrict  , ...) __attribute__((__nonnull__(1)));
   



 
#pragma __scanf_args
extern __declspec(__nothrow) int sscanf(const char * __restrict  ,
                    const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   








 
#pragma __scanf_args
extern __declspec(__nothrow) int _sscanf(const char * __restrict  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   



 

 
extern __declspec(__nothrow) int vfscanf(FILE * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) int vscanf(const char * __restrict  , __va_list) __attribute__((__nonnull__(1)));
extern __declspec(__nothrow) int vsscanf(const char * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));

extern __declspec(__nothrow) int _vfscanf(FILE * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) int _vscanf(const char * __restrict  , __va_list) __attribute__((__nonnull__(1)));
extern __declspec(__nothrow) int _vsscanf(const char * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));

extern __declspec(__nothrow) int vprintf(const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1)));
   





 
extern __declspec(__nothrow) int _vprintf(const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1)));
   



 
extern __declspec(__nothrow) int vfprintf(FILE * __restrict  ,
                    const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   






 
extern __declspec(__nothrow) int vsprintf(char * __restrict  ,
                     const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   






 

extern __declspec(__nothrow) int vsnprintf(char * __restrict  , size_t  ,
                     const char * __restrict  , __va_list  ) __attribute__((__nonnull__(3)));
   







 

extern __declspec(__nothrow) int _vsprintf(char * __restrict  ,
                      const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   



 
extern __declspec(__nothrow) int _vfprintf(FILE * __restrict  ,
                     const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   



 
extern __declspec(__nothrow) int _vsnprintf(char * __restrict  , size_t  ,
                      const char * __restrict  , __va_list  ) __attribute__((__nonnull__(3)));
   



 
extern __declspec(__nothrow) int fgetc(FILE *  ) __attribute__((__nonnull__(1)));
   







 
extern __declspec(__nothrow) char *fgets(char * __restrict  , int  ,
                    FILE * __restrict  ) __attribute__((__nonnull__(1,3)));
   










 
extern __declspec(__nothrow) int fputc(int  , FILE *  ) __attribute__((__nonnull__(2)));
   







 
extern __declspec(__nothrow) int fputs(const char * __restrict  , FILE * __restrict  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) int getc(FILE *  ) __attribute__((__nonnull__(1)));
   







 




    extern __declspec(__nothrow) int (getchar)(void);

   





 
extern __declspec(__nothrow) char *gets(char *  ) __attribute__((__nonnull__(1)));
   









 
extern __declspec(__nothrow) int putc(int  , FILE *  ) __attribute__((__nonnull__(2)));
   





 




    extern __declspec(__nothrow) int (putchar)(int  );

   



 
extern __declspec(__nothrow) int puts(const char *  ) __attribute__((__nonnull__(1)));
   





 
extern __declspec(__nothrow) int ungetc(int  , FILE *  ) __attribute__((__nonnull__(2)));
   






















 

extern __declspec(__nothrow) size_t fread(void * __restrict  ,
                    size_t  , size_t  , FILE * __restrict  ) __attribute__((__nonnull__(1,4)));
   











 

extern __declspec(__nothrow) size_t __fread_bytes_avail(void * __restrict  ,
                    size_t  , FILE * __restrict  ) __attribute__((__nonnull__(1,3)));
   











 

extern __declspec(__nothrow) size_t fwrite(const void * __restrict  ,
                    size_t  , size_t  , FILE * __restrict  ) __attribute__((__nonnull__(1,4)));
   







 

extern __declspec(__nothrow) int fgetpos(FILE * __restrict  , fpos_t * __restrict  ) __attribute__((__nonnull__(1,2)));
   








 
extern __declspec(__nothrow) int fseek(FILE *  , long int  , int  ) __attribute__((__nonnull__(1)));
   














 
extern __declspec(__nothrow) int fsetpos(FILE * __restrict  , const fpos_t * __restrict  ) __attribute__((__nonnull__(1,2)));
   










 
extern __declspec(__nothrow) long int ftell(FILE *  ) __attribute__((__nonnull__(1)));
   











 
extern __declspec(__nothrow) void rewind(FILE *  ) __attribute__((__nonnull__(1)));
   





 

extern __declspec(__nothrow) void clearerr(FILE *  ) __attribute__((__nonnull__(1)));
   




 

extern __declspec(__nothrow) int feof(FILE *  ) __attribute__((__nonnull__(1)));
   


 
extern __declspec(__nothrow) int ferror(FILE *  ) __attribute__((__nonnull__(1)));
   


 
extern __declspec(__nothrow) void perror(const char *  );
   









 

extern __declspec(__nothrow) int _fisatty(FILE *   ) __attribute__((__nonnull__(1)));
    
 

extern __declspec(__nothrow) void __use_no_semihosting_swi(void);
extern __declspec(__nothrow) void __use_no_semihosting(void);
    





 











#line 948 "D:\\keil_C51\\ARM\\ARMCC\\bin\\..\\include\\stdio.h"



 

#line 12 "main.c"
#line 1 "DES_M0_SoC.h"




typedef unsigned       char uint8;
typedef   signed       char  int8;
typedef unsigned short int  uint16;
typedef   signed short int   int16;
typedef unsigned       int  uint32;
typedef   signed       int   int32;

#pragma anon_unions
typedef struct {
	union {
		volatile uint8   RxData;
		volatile uint32  reserved0;
	};
	union {
		volatile uint8   TxData;
		volatile uint32  reserved1;
	};
	union {
		volatile uint8   Status;
		volatile uint32  reserved2;
	};
	union {
		volatile uint8   Control;
		volatile uint32  reserved3;
	};
} UART_t;












typedef struct {
	union {
		volatile uint32	Enable;
		volatile uint32	reserved0;
	};
	volatile uint32		reserved1[0x20-1];  
	union {
		volatile uint32	Disable;
		volatile uint32	reserved2;
	};
} NVIC_t;




typedef struct {
	union {
		volatile uint16  LED;
		volatile uint32  reserved0;
	};
	union {
		volatile uint16  NotConnected;
		volatile uint32  reserved1;
	};
	union {
		volatile uint16  Switches;
		volatile uint32  reserved2;
	};
	union {
		volatile uint16  Buttons;
		volatile uint32  reserved3;
	};
} GPIO_t;


typedef struct {
		volatile uint32  dataDisplayed;	
		volatile uint32  decimalPoint; 	
	
	


 
} DISPLAY_t;

typedef struct {
		volatile uint32  txData;	
		volatile uint32  rxData; 	
		volatile uint32 slaveSelect;
	  volatile uint32 spicon;
	
} SPI_t;








#line 13 "main.c"










volatile uint8  counter  = 0; 
volatile uint8  BufReady = 0; 
volatile uint8  RxBuf[100];






void UART_ISR()		
{
	char c;
	c = ((UART_t *)0x51000000)->RxData;	 
	RxBuf[counter]  = c;   
	counter++;             
	((UART_t *)0x51000000)->TxData = c;   
	
	
	
	
	if (counter == 100-1 || c == '\r')  {
		counter--;							
		RxBuf[counter] = 0;  
		BufReady       = 1;	    
	}
}





void wait_n_loops(uint32 n) {
	volatile uint32 i;
		for(i=0;i<n;i++);
}




void writeAccelerometer(uint8 regAddress, uint8 dataToWrite){
	((SPI_t *)0x53000000)->slaveSelect = 0x07;
	while((((SPI_t *)0x53000000)->spicon & 0x04) == 0x00);
	((SPI_t *)0x53000000)->txData = (0x0A<<16) + (regAddress<<8) + dataToWrite;
	while((((SPI_t *)0x53000000)->spicon & 0x04) == 0x00);
	
}




uint8 readAccelerometer(uint8 regAddress){
	((SPI_t *)0x53000000)->slaveSelect = 0x07;
	while((((SPI_t *)0x53000000)->spicon & 0x04) == 0x00);
	((SPI_t *)0x53000000)->txData = (0x0B<<16) + (regAddress<<8);
	while((((SPI_t *)0x53000000)->spicon & 0x04) == 0x00);
	return ((SPI_t *)0x53000000)->rxData;
}




void configurationAccelerometer(){
  
	writeAccelerometer(0x2C,((((GPIO_t *)0x50000000)->Switches>>8) & 0xC0) | 0x13);
	
	
	((SPI_t *)0x53000000)->spicon=0x0;
	
	
	writeAccelerometer(0x2D, 0x02);
	
	
}
 



uint16 filter(uint8 axis, uint8 index, uint16 value){
	static uint16 buffer [16][4];
	static uint32 sum[4];
	
	sum[axis] = sum[axis] - buffer[index][axis];
	buffer[index][axis] = value; 
	sum[axis] = sum[axis] + buffer[index][axis];
	return sum[axis]>>4;
}



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
		
			if((hexVal & 0x8000) == 0x8000){
				hexVal = ((~hexVal)+1)&0x7FFF;
				hexVal = filter(axis, index, hexVal);
				dec = convertToDecimal(hexVal);		
				printf("%c:%d mg\t",88+axis, hexVal);		
				dec = (0xa<<12) + (dec>>4);        
			}
			else{
				hexVal = filter(axis, index, hexVal);
				printf("%c:%d mg\t",88+axis, hexVal);
				dec = convertToDecimal(hexVal);
				dec = (0xb<<12) +(dec>>4);				 
			}
			return dec;
}






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
	
	((UART_t *)0x51000000)->Control = (1 << (3));		
  ((NVIC_t *)0xE000E100)->Enable	 = (1 << 1);								
	wait_n_loops(500000);										
	
	printf("\r\nWelcome to Digital embedded system class and now we are reading the accelerometer\r\n");			

	configurationAccelerometer();
	
	
	while(1){			
		
			switch((((GPIO_t *)0x50000000)->Switches)&0xC000){
				case 0x0000:	range=1; break;
				case 0x4000:	range=2; break;
				default:		  range=4; break;	
			}
			writeAccelerometer(0x2C,((((GPIO_t *)0x50000000)->Switches>>8) & 0xC0)+0x13);
			
			
			wait_n_loops(500000);	
			
			X = ((readAccelerometer(0x0F)<<8)+readAccelerometer(0x0E))*range; 
			Y = ((readAccelerometer(0x11)<<8)+readAccelerometer(0x10))*range; 
			Z = ((readAccelerometer(0x13)<<8)+readAccelerometer(0x12))*range; 
			T = (((readAccelerometer(0x15)<<8)+readAccelerometer(0x14))/2)-Tbias; 

			
			unsignedX = convert(0, buffer_counter,X);
			unsignedY = convert(1, buffer_counter,Y);
			unsignedZ = convert(2, buffer_counter,Z);
			
			unsignedT = filter(3, buffer_counter, T);
			printf("\t%d%cC",unsignedT,248);
			unsignedT = convertToDecimal(unsignedT);
			unsignedT = (0xbb<<8) + (unsignedT);
			
			
			printf("\r\n");
			
			
			switch((((GPIO_t *)0x50000000)->Switches) & 0x01){
				case 0: 
					displayedValue = (unsignedX<<16) | unsignedY;
				((DISPLAY_t *)0x52000000)->decimalPoint  = 0x00000044 ; 
					break;
				case 1: 
					displayedValue = (unsignedZ<<16) | unsignedT;
					((DISPLAY_t *)0x52000000)->decimalPoint  = 0x00000040 ; 
					break;
			}
			
			((DISPLAY_t *)0x52000000)->dataDisplayed = displayedValue; 
			  
			buffer_counter =(buffer_counter+1)%16;
	}
}
	
			
			
			
			



