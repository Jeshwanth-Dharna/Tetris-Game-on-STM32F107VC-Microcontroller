_EEPROM_24C02_WrSingle:
;I2C.c,14 :: 		void EEPROM_24C02_WrSingle(unsigned short wAddr, unsigned short wData) {
; wData start address is: 4 (R1)
; wAddr start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; wData end address is: 4 (R1)
; wAddr end address is: 0 (R0)
; wAddr start address is: 0 (R0)
; wData start address is: 4 (R1)
;I2C.c,15 :: 		data_[0] = wAddr;
MOVW	R2, #lo_addr(_data_+0)
MOVT	R2, #hi_addr(_data_+0)
STRB	R0, [R2, #0]
; wAddr end address is: 0 (R0)
;I2C.c,16 :: 		data_[1] = wData;
MOVW	R2, #lo_addr(_data_+1)
MOVT	R2, #hi_addr(_data_+1)
STRB	R1, [R2, #0]
; wData end address is: 4 (R1)
;I2C.c,17 :: 		I2C1_Start();
BL	_I2C1_Start+0
;I2C.c,19 :: 		I2C1_Write(0x50,data_,2,END_MODE_STOP);
MOVW	R3, #1
MOVS	R2, #2
MOVW	R1, #lo_addr(_data_+0)
MOVT	R1, #hi_addr(_data_+0)
MOVS	R0, #80
BL	_I2C1_Write+0
;I2C.c,20 :: 		}//~
L_end_EEPROM_24C02_WrSingle:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _EEPROM_24C02_WrSingle
_EEPROM_24C02_RdSingle:
;I2C.c,23 :: 		unsigned short EEPROM_24C02_RdSingle(unsigned short rAddr) {
; rAddr start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; rAddr end address is: 0 (R0)
; rAddr start address is: 0 (R0)
;I2C.c,24 :: 		data_[0] = rAddr;
MOVW	R1, #lo_addr(_data_+0)
MOVT	R1, #hi_addr(_data_+0)
STRB	R0, [R1, #0]
; rAddr end address is: 0 (R0)
;I2C.c,25 :: 		I2C1_Start();              // issue I2C start signal
BL	_I2C1_Start+0
;I2C.c,26 :: 		I2C1_Write(0x50,data_,1,END_MODE_RESTART);
MOVW	R3, #0
MOVS	R2, #1
MOVW	R1, #lo_addr(_data_+0)
MOVT	R1, #hi_addr(_data_+0)
MOVS	R0, #80
BL	_I2C1_Write+0
;I2C.c,27 :: 		I2C1_Read(0x50,data_,1,END_MODE_STOP);
MOVW	R3, #1
MOVS	R2, #1
MOVW	R1, #lo_addr(_data_+0)
MOVT	R1, #hi_addr(_data_+0)
MOVS	R0, #80
BL	_I2C1_Read+0
;I2C.c,29 :: 		return data_[0];
MOVW	R1, #lo_addr(_data_+0)
MOVT	R1, #hi_addr(_data_+0)
LDRB	R0, [R1, #0]
;I2C.c,30 :: 		}
L_end_EEPROM_24C02_RdSingle:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _EEPROM_24C02_RdSingle
_main:
;I2C.c,32 :: 		void main(){
;I2C.c,33 :: 		InitializeUSART1();		// Call sub function to initialize USART1
BL	_InitializeUSART1+0
;I2C.c,34 :: 		for(;;) {
L_main0:
;I2C.c,39 :: 		while (!((USART1_SR & (1<<5))== 0x20)){} // Check RXNE in USART1 Status Register.
L_main3:
MOVW	R0, #lo_addr(USART1_SR+0)
MOVT	R0, #hi_addr(USART1_SR+0)
LDR	R0, [R0, #0]
AND	R0, R0, #32
CMP	R0, #32
IT	EQ
BEQ	L_main4
IT	AL
BAL	L_main3
L_main4:
;I2C.c,46 :: 		rcvrd = USART1_DR;    //read data from receiver data register
MOVW	R0, #lo_addr(USART1_DR+0)
MOVT	R0, #hi_addr(USART1_DR+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(_rcvrd+0)
MOVT	R0, #hi_addr(_rcvrd+0)
STRH	R1, [R0, #0]
;I2C.c,48 :: 		while (! (USART1_SR & (1<<7)) == 0x80) {}
L_main5:
MOVW	R0, #lo_addr(USART1_SR+0)
MOVT	R0, #hi_addr(USART1_SR+0)
LDR	R0, [R0, #0]
AND	R0, R0, #128
CMP	R0, #0
MOVW	R0, #0
BNE	L__main28
MOVS	R0, #1
L__main28:
UXTB	R0, R0
CMP	R0, #128
IT	NE
BNE	L_main6
IT	AL
BAL	L_main5
L_main6:
;I2C.c,50 :: 		USART1_DR = rcvrd;                // transmit the received data
MOVW	R0, #lo_addr(_rcvrd+0)
MOVT	R0, #hi_addr(_rcvrd+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(USART1_DR+0)
MOVT	R0, #hi_addr(USART1_DR+0)
STR	R1, [R0, #0]
;I2C.c,51 :: 		}
IT	AL
BAL	L_main0
;I2C.c,69 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_InitializeUSART1:
;I2C.c,71 :: 		void InitializeUSART1(){ // Sub function which initializes the registers to enable USART1
;I2C.c,72 :: 		RCC_APB2ENR |= 1;                 // Enable clock for Alt. Function. USART1 uses AF for PA9/PA10
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
STR	R1, [R0, #0]
;I2C.c,73 :: 		AFIO_MAPR=0X0F000000;             // Do not mask PA9 and PA10 (becaue we are using for USART)
MOV	R1, #251658240
MOVW	R0, #lo_addr(AFIO_MAPR+0)
MOVT	R0, #hi_addr(AFIO_MAPR+0)
STR	R1, [R0, #0]
;I2C.c,74 :: 		RCC_APB2ENR |= 1<<2;              // Enable clock for GPIOA
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #4
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
STR	R1, [R0, #0]
;I2C.c,75 :: 		GPIOA_CRH &= ~(0xFF << 4);        // Clear PA9, PA10
MOVW	R0, #lo_addr(GPIOA_CRH+0)
MOVT	R0, #hi_addr(GPIOA_CRH+0)
LDR	R1, [R0, #0]
MOVW	R0, #61455
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOA_CRH+0)
MOVT	R0, #hi_addr(GPIOA_CRH+0)
STR	R1, [R0, #0]
;I2C.c,76 :: 		GPIOA_CRH |= (0x0B << 4);         // USART1 Tx (PA9) output push-pull
MOVW	R0, #lo_addr(GPIOA_CRH+0)
MOVT	R0, #hi_addr(GPIOA_CRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #176
MOVW	R0, #lo_addr(GPIOA_CRH+0)
MOVT	R0, #hi_addr(GPIOA_CRH+0)
STR	R1, [R0, #0]
;I2C.c,77 :: 		GPIOA_CRH |= (0x04 << 8);         // USART1 Rx (PA10) input floating
MOVW	R0, #lo_addr(GPIOA_CRH+0)
MOVT	R0, #hi_addr(GPIOA_CRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1024
MOVW	R0, #lo_addr(GPIOA_CRH+0)
MOVT	R0, #hi_addr(GPIOA_CRH+0)
STR	R1, [R0, #0]
;I2C.c,78 :: 		RCC_APB2ENR |= 1<<14;             // enable clock for USART1
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #16384
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
STR	R1, [R0, #0]
;I2C.c,79 :: 		USART1_BRR=0X00000506;            // Set baud rate to 56000
MOVW	R1, #1286
MOVW	R0, #lo_addr(USART1_BRR+0)
MOVT	R0, #hi_addr(USART1_BRR+0)
STR	R1, [R0, #0]
;I2C.c,84 :: 		USART1_CR1 &= ~(1<<12);          // Force 8 data bits. M bit is set to 0.
MOVW	R0, #lo_addr(USART1_CR1+0)
MOVT	R0, #hi_addr(USART1_CR1+0)
LDR	R1, [R0, #0]
MVN	R0, #4096
ANDS	R1, R0
MOVW	R0, #lo_addr(USART1_CR1+0)
MOVT	R0, #hi_addr(USART1_CR1+0)
STR	R1, [R0, #0]
;I2C.c,85 :: 		USART1_CR2 &= ~(3<<12);          // Force 1 stop bit
MOVW	R0, #lo_addr(USART1_CR2+0)
MOVT	R0, #hi_addr(USART1_CR2+0)
LDR	R1, [R0, #0]
MVN	R0, #12288
ANDS	R1, R0
MOVW	R0, #lo_addr(USART1_CR2+0)
MOVT	R0, #hi_addr(USART1_CR2+0)
STR	R1, [R0, #0]
;I2C.c,86 :: 		USART1_CR3 &= ~(3<<8);           // Force no flow control and no DMA for USART1
MOVW	R0, #lo_addr(USART1_CR3+0)
MOVT	R0, #hi_addr(USART1_CR3+0)
LDR	R1, [R0, #0]
MVN	R0, #768
ANDS	R1, R0
MOVW	R0, #lo_addr(USART1_CR3+0)
MOVT	R0, #hi_addr(USART1_CR3+0)
STR	R1, [R0, #0]
;I2C.c,87 :: 		USART1_CR1 &= ~(3<<9);           // Force no parity and no parity control
MOVW	R0, #lo_addr(USART1_CR1+0)
MOVT	R0, #hi_addr(USART1_CR1+0)
LDR	R1, [R0, #0]
MVN	R0, #1536
ANDS	R1, R0
MOVW	R0, #lo_addr(USART1_CR1+0)
MOVT	R0, #hi_addr(USART1_CR1+0)
STR	R1, [R0, #0]
;I2C.c,88 :: 		USART1_CR1 |= 3<<2;              // RX, TX enable
MOVW	R0, #lo_addr(USART1_CR1+0)
MOVT	R0, #hi_addr(USART1_CR1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #12
MOVW	R0, #lo_addr(USART1_CR1+0)
MOVT	R0, #hi_addr(USART1_CR1+0)
STR	R1, [R0, #0]
;I2C.c,92 :: 		USART1_CR1 |= 1<<13;            // USART1 enable. This is done after configuration is complete
MOVW	R0, #lo_addr(USART1_CR1+0)
MOVT	R0, #hi_addr(USART1_CR1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8192
MOVW	R0, #lo_addr(USART1_CR1+0)
MOVT	R0, #hi_addr(USART1_CR1+0)
STR	R1, [R0, #0]
;I2C.c,93 :: 		Delay_ms(100);                  // Wait for USART to complete configuration and enable. This is
MOVW	R7, #20351
MOVT	R7, #18
NOP
NOP
L_InitializeUSART123:
SUBS	R7, R7, #1
BNE	L_InitializeUSART123
NOP
NOP
NOP
;I2C.c,95 :: 		}
L_end_InitializeUSART1:
BX	LR
; end of _InitializeUSART1
