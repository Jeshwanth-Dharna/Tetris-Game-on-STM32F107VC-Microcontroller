_PinConfiguration:
;Game_speed.c,13 :: 		void PinConfiguration() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Game_speed.c,16 :: 		RCC_APB2ENR |=1<<4;       //ENABLE PORT C CLOCK
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #16
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
STR	R1, [R0, #0]
;Game_speed.c,17 :: 		GPIOC_CRL = 0x00000004; //  CONFIGURING PC0 AS INPUT FOR  PC0  CLICK
MOVS	R1, #4
MOVW	R0, #lo_addr(GPIOC_CRL+0)
MOVT	R0, #hi_addr(GPIOC_CRL+0)
STR	R1, [R0, #0]
;Game_speed.c,18 :: 		GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;Game_speed.c,19 :: 		}
L_end_PinConfiguration:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _PinConfiguration
_AdcConfiguration:
;Game_speed.c,22 :: 		void AdcConfiguration(){                   // ADC for PC0
;Game_speed.c,23 :: 		RCC_APB2ENR |= 1 << 4;                 // Enable PORTC clock
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #16
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
STR	R1, [R0, #0]
;Game_speed.c,24 :: 		RCC_APB2ENR |= 1 << 9 ;     // Enable ADC1 Clock
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #512
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
STR	R1, [R0, #0]
;Game_speed.c,25 :: 		GPIOC_CRL &= ~(0xF << 0);        // Configure PC0 as an Analog Input
MOVW	R0, #lo_addr(GPIOC_CRL+0)
MOVT	R0, #hi_addr(GPIOC_CRL+0)
LDR	R1, [R0, #0]
MVN	R0, #15
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_CRL+0)
MOVT	R0, #hi_addr(GPIOC_CRL+0)
STR	R1, [R0, #0]
;Game_speed.c,26 :: 		ADC1_SQR1 = (0b0000 << 20);        // 1 conversion
MOVW	R1, #0
MOVW	R0, #lo_addr(ADC1_SQR1+0)
MOVT	R0, #hi_addr(ADC1_SQR1+0)
STR	R1, [R0, #0]
;Game_speed.c,27 :: 		ADC1_SQR3 = 10;                                // Select Channel 10 as only one in conversion sequence
MOVS	R1, #10
MOVW	R0, #lo_addr(ADC1_SQR3+0)
MOVT	R0, #hi_addr(ADC1_SQR3+0)
STR	R1, [R0, #0]
;Game_speed.c,28 :: 		ADC1_SMPR1 = 0b100;                        // Set sample time on channel 10
MOVS	R1, #4
MOVW	R0, #lo_addr(ADC1_SMPR1+0)
MOVT	R0, #hi_addr(ADC1_SMPR1+0)
STR	R1, [R0, #0]
;Game_speed.c,29 :: 		ADC1_CR2 |= (0b111 << 17);         // Set software start as external event for regular group conversion
MOVW	R0, #lo_addr(ADC1_CR2+0)
MOVT	R0, #hi_addr(ADC1_CR2+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC1_CR2+0)
MOVT	R0, #hi_addr(ADC1_CR2+0)
STR	R1, [R0, #0]
;Game_speed.c,30 :: 		ADC1_CR2.ADON = 1;                        // Enable ADC1
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ADC1_CR2+0)
MOVT	R0, #hi_addr(ADC1_CR2+0)
_SX	[R0, ByteOffset(ADC1_CR2+0)]
;Game_speed.c,31 :: 		delay_ms(10);
MOVW	R7, #54463
MOVT	R7, #1
NOP
NOP
L_AdcConfiguration0:
SUBS	R7, R7, #1
BNE	L_AdcConfiguration0
NOP
NOP
NOP
;Game_speed.c,32 :: 		}
L_end_AdcConfiguration:
BX	LR
; end of _AdcConfiguration
_getAdcReading:
;Game_speed.c,33 :: 		unsigned int getAdcReading(){
;Game_speed.c,35 :: 		ADC1_CR2 |= (1 << 22) | (1 << 20);
MOVW	R0, #lo_addr(ADC1_CR2+0)
MOVT	R0, #hi_addr(ADC1_CR2+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC1_CR2+0)
MOVT	R0, #hi_addr(ADC1_CR2+0)
STR	R1, [R0, #0]
;Game_speed.c,36 :: 		while(!(ADC1_SR & 0b10));         // Wait until the ADC conversion has ended
L_getAdcReading2:
MOVW	R0, #lo_addr(ADC1_SR+0)
MOVT	R0, #hi_addr(ADC1_SR+0)
LDR	R0, [R0, #0]
AND	R0, R0, #2
CMP	R0, #0
IT	NE
BNE	L_getAdcReading3
IT	AL
BAL	L_getAdcReading2
L_getAdcReading3:
;Game_speed.c,37 :: 		return ADC1_DR;                                // Read value from data register. This also clears start bit
MOVW	R0, #lo_addr(ADC1_DR+0)
MOVT	R0, #hi_addr(ADC1_DR+0)
LDR	R0, [R0, #0]
;Game_speed.c,38 :: 		}
L_end_getAdcReading:
BX	LR
; end of _getAdcReading
_Timer3IntConfiguration:
;Game_speed.c,41 :: 		void Timer3IntConfiguration(){
;Game_speed.c,42 :: 		RCC_APB1ENR |= (1 << 1);   // Enable TIMER3 clock. RCC: Clock Configuration Register
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;Game_speed.c,44 :: 		TIM3_CR1 = 0x0000;          // Disable timer until configuration is complete
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;Game_speed.c,47 :: 		TIM3_PSC = 999;            // Clock to TIMx_CNT = 72000000 (clock applied to prescaler register) /
MOVW	R1, #999
MOVW	R0, #lo_addr(TIM3_PSC+0)
MOVT	R0, #hi_addr(TIM3_PSC+0)
STR	R1, [R0, #0]
;Game_speed.c,49 :: 		TIM3_ARR =9;                // Reload timer count register with this value when count register resets
MOVS	R1, #9
MOVW	R0, #lo_addr(TIM3_ARR+0)
MOVT	R0, #hi_addr(TIM3_ARR+0)
STR	R1, [R0, #0]
;Game_speed.c,51 :: 		NVIC_ISER0.B29 =1;         // Enable global interrupt for TIMER3 in NVIC
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(NVIC_ISER0+0)
MOVT	R1, #hi_addr(NVIC_ISER0+0)
LDR	R0, [R1, #0]
BFI	R0, R2, #29, #1
STR	R0, [R1, #0]
;Game_speed.c,56 :: 		TIM3_DIER.UIE = 1;          // Update interrupt enable
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
_SX	[R0, ByteOffset(TIM3_DIER+0)]
;Game_speed.c,57 :: 		TIM3_CR1 = 0x0001;                 // Enable TIMER3
MOVS	R1, #1
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;Game_speed.c,58 :: 		}
L_end_Timer3IntConfiguration:
BX	LR
; end of _Timer3IntConfiguration
_TIMER3_ISR:
;Game_speed.c,64 :: 		void TIMER3_ISR() iv IVT_INT_TIM3 {
;Game_speed.c,65 :: 		TIM3_SR.UIF = 0;        // Reset UIF flag so next interrupt can be recognized when UIF is set
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_SR+0)
MOVT	R0, #hi_addr(TIM3_SR+0)
_SX	[R0, ByteOffset(TIM3_SR+0)]
;Game_speed.c,67 :: 		if(counter == adcVal){
MOVW	R0, #lo_addr(_adcVal+0)
MOVT	R0, #hi_addr(_adcVal+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_counter+0)
MOVT	R0, #hi_addr(_counter+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L_TIMER3_ISR4
;Game_speed.c,68 :: 		GPIOE_ODR = ~GPIOE_ODR;   // toggle PORTE LEDs
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
LDR	R0, [R0, #0]
MVN	R1, R0
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;Game_speed.c,69 :: 		counter = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_counter+0)
MOVT	R0, #hi_addr(_counter+0)
STRH	R1, [R0, #0]
;Game_speed.c,70 :: 		}
L_TIMER3_ISR4:
;Game_speed.c,71 :: 		counter++;
MOVW	R1, #lo_addr(_counter+0)
MOVT	R1, #hi_addr(_counter+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;Game_speed.c,73 :: 		}
L_end_TIMER3_ISR:
BX	LR
; end of _TIMER3_ISR
_main:
;Game_speed.c,77 :: 		void main () {
;Game_speed.c,78 :: 		PinConfiguration();
BL	_PinConfiguration+0
;Game_speed.c,79 :: 		AdcConfiguration();
BL	_AdcConfiguration+0
;Game_speed.c,80 :: 		Timer3IntConfiguration();
BL	_Timer3IntConfiguration+0
;Game_speed.c,83 :: 		GPIOE_ODR=0X0000;                // Initialize GPIOE LEDs as on
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;Game_speed.c,87 :: 		for(;;){
L_main5:
;Game_speed.c,88 :: 		adcVal = getAdcReading();
BL	_getAdcReading+0
MOVW	R1, #lo_addr(_adcVal+0)
MOVT	R1, #hi_addr(_adcVal+0)
STRH	R0, [R1, #0]
;Game_speed.c,90 :: 		delay_ms(100);
MOVW	R7, #20351
MOVT	R7, #18
NOP
NOP
L_main8:
SUBS	R7, R7, #1
BNE	L_main8
NOP
NOP
NOP
;Game_speed.c,91 :: 		}
IT	AL
BAL	L_main5
;Game_speed.c,92 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
