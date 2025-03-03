_joystick_configuration:
;Configurations.c,3 :: 		void joystick_configuration()
;Configurations.c,5 :: 		RCC_APB2ENR |= 1 << 2;  // Enabling GPIOA clock
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #4
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
STR	R1, [R0, #0]
;Configurations.c,6 :: 		GPIOA_CRL |= 0X04000000; // Configure PA6 (Right) as an input
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #67108864
MOVW	R0, #lo_addr(GPIOA_CRL+0)
MOVT	R0, #hi_addr(GPIOA_CRL+0)
STR	R1, [R0, #0]
;Configurations.c,8 :: 		RCC_APB2ENR |= 1 << 3;  // Enabling GPIOB clock
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #8
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
STR	R1, [R0, #0]
;Configurations.c,9 :: 		GPIOB_CRL |= 0X00400000; // Configure PB5(Down) as an input
MOVW	R0, #lo_addr(GPIOB_CRL+0)
MOVT	R0, #hi_addr(GPIOB_CRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #4194304
MOVW	R0, #lo_addr(GPIOB_CRL+0)
MOVT	R0, #hi_addr(GPIOB_CRL+0)
STR	R1, [R0, #0]
;Configurations.c,11 :: 		RCC_APB2ENR |= 1 << 4;  // Enabling GPIOC clock
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #16
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
STR	R1, [R0, #0]
;Configurations.c,12 :: 		GPIOC_CRL |= 0X00000004; // Configure PC0 (Potentiometer) as an input
MOVW	R0, #lo_addr(GPIOC_CRL+0)
MOVT	R0, #hi_addr(GPIOC_CRL+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #4
MOVW	R0, #lo_addr(GPIOC_CRL+0)
MOVT	R0, #hi_addr(GPIOC_CRL+0)
STR	R1, [R0, #0]
;Configurations.c,13 :: 		GPIOC_CRH |= 0X00400000; // Configure PC13 (Click) as an input
MOVW	R0, #lo_addr(GPIOC_CRH+0)
MOVT	R0, #hi_addr(GPIOC_CRH+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #4194304
MOVW	R0, #lo_addr(GPIOC_CRH+0)
MOVT	R0, #hi_addr(GPIOC_CRH+0)
STR	R1, [R0, #0]
;Configurations.c,15 :: 		RCC_APB2ENR |= 1 << 5;  // Enabling GPIOD clock
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #32
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
STR	R1, [R0, #0]
;Configurations.c,16 :: 		GPIOD_CRL |= 0x00040400;  // Configure PD2 & PD4 (Left & up) as an input
MOVW	R0, #lo_addr(GPIOD_CRL+0)
MOVT	R0, #hi_addr(GPIOD_CRL+0)
LDR	R1, [R0, #0]
MOVW	R0, #1024
MOVT	R0, #4
ORRS	R1, R0
MOVW	R0, #lo_addr(GPIOD_CRL+0)
MOVT	R0, #hi_addr(GPIOD_CRL+0)
STR	R1, [R0, #0]
;Configurations.c,18 :: 		RCC_APB2ENR |= 1 << 6;  // Enabling GPIOE clock
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #64
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
STR	R1, [R0, #0]
;Configurations.c,19 :: 		GPIOE_CRH = 0x33333333; // Configure Port E as an output
MOV	R1, #858993459
MOVW	R0, #lo_addr(GPIOE_CRH+0)
MOVT	R0, #hi_addr(GPIOE_CRH+0)
STR	R1, [R0, #0]
;Configurations.c,20 :: 		}
L_end_joystick_configuration:
BX	LR
; end of _joystick_configuration
_External_Int_Configuration:
;Configurations.c,23 :: 		void External_Int_Configuration()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Configurations.c,25 :: 		RCC_APB2ENR.AFIOEN = 1;     // Enable clock for alternate pin function
MOVS	R2, #1
SXTB	R2, R2
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
_SX	[R0, ByteOffset(RCC_APB2ENR+0)]
;Configurations.c,27 :: 		AFIO_EXTICR1 |= 0x00000300;       // PD2 as External interrupt
MOVW	R0, #lo_addr(AFIO_EXTICR1+0)
MOVT	R0, #hi_addr(AFIO_EXTICR1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #768
MOVW	R0, #lo_addr(AFIO_EXTICR1+0)
MOVT	R0, #hi_addr(AFIO_EXTICR1+0)
STR	R1, [R0, #0]
;Configurations.c,28 :: 		AFIO_EXTICR2 |= 0x00000013;       // PD4,PB5,PA6 as External interrupt
MOVW	R0, #lo_addr(AFIO_EXTICR2+0)
MOVT	R0, #hi_addr(AFIO_EXTICR2+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #19
MOVW	R0, #lo_addr(AFIO_EXTICR2+0)
MOVT	R0, #hi_addr(AFIO_EXTICR2+0)
STR	R1, [R0, #0]
;Configurations.c,29 :: 		AFIO_EXTICR4 |= 0x00000020;       // PC13 as External interrupt
MOVW	R0, #lo_addr(AFIO_EXTICR4+0)
MOVT	R0, #hi_addr(AFIO_EXTICR4+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #32
MOVW	R0, #lo_addr(AFIO_EXTICR4+0)
MOVT	R0, #hi_addr(AFIO_EXTICR4+0)
STR	R1, [R0, #0]
;Configurations.c,31 :: 		EXTI_IMR |= 0x00002074;           // Interrupt on PD4,PD2,PB5, are non-maskable
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
LDR	R1, [R0, #0]
MOVW	R0, #8308
ORRS	R1, R0
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
STR	R1, [R0, #0]
;Configurations.c,33 :: 		EXTI_RTSR |= 0x00002074;          // Set interrupt on rising edge for PD4,PB5
MOVW	R0, #lo_addr(EXTI_RTSR+0)
MOVT	R0, #hi_addr(EXTI_RTSR+0)
LDR	R1, [R0, #0]
MOVW	R0, #8308
ORRS	R1, R0
MOVW	R0, #lo_addr(EXTI_RTSR+0)
MOVT	R0, #hi_addr(EXTI_RTSR+0)
STR	R1, [R0, #0]
;Configurations.c,34 :: 		EXTI_FTSR |= 0x00002074;          // Set interrupt on falling edge for PD4,PB5
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
LDR	R1, [R0, #0]
MOVW	R0, #8308
ORRS	R1, R0
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
STR	R1, [R0, #0]
;Configurations.c,36 :: 		NVIC_ISER0.B10 = 1;               // Enable NVIC interrupt for EXTI line four (PD4)
MOVW	R1, #lo_addr(NVIC_ISER0+0)
MOVT	R1, #hi_addr(NVIC_ISER0+0)
LDR	R0, [R1, #0]
BFI	R0, R2, #10, #1
STR	R0, [R1, #0]
;Configurations.c,37 :: 		NVIC_ISER0.B8 = 1;                // Enable NVIC interrupt for EXTI line two (PD2)
MOVW	R1, #lo_addr(NVIC_ISER0+0)
MOVT	R1, #hi_addr(NVIC_ISER0+0)
LDR	R0, [R1, #0]
BFI	R0, R2, #8, #1
STR	R0, [R1, #0]
;Configurations.c,38 :: 		NVIC_ISER0.B23 = 1;
MOVW	R1, #lo_addr(NVIC_ISER0+0)
MOVT	R1, #hi_addr(NVIC_ISER0+0)
LDR	R0, [R1, #0]
BFI	R0, R2, #23, #1
STR	R0, [R1, #0]
;Configurations.c,40 :: 		NVIC_IntEnable(IVT_INT_EXTI15_10);   // Enable NVIC interrupt for EXTI line [15:10] (PC13)
MOVW	R0, #56
BL	_NVIC_IntEnable+0
;Configurations.c,41 :: 		}
L_end_External_Int_Configuration:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _External_Int_Configuration
_Timer3IntConfiguration:
;Configurations.c,43 :: 		void Timer3IntConfiguration()
;Configurations.c,45 :: 		RCC_APB1ENR |= (1 << 1);   // Enable TIMER3 clock. RCC: Clock Configuration Register
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #2
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;Configurations.c,47 :: 		TIM3_CR1 = 0x0000;        // Disable timer until configuration is complete
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;Configurations.c,50 :: 		TIM3_PSC = 999;           // Clock to TIMx_CNT = 72000000 (clock applied to prescaler register)
MOVW	R1, #999
MOVW	R0, #lo_addr(TIM3_PSC+0)
MOVT	R0, #hi_addr(TIM3_PSC+0)
STR	R1, [R0, #0]
;Configurations.c,52 :: 		TIM3_ARR = 9;             // Reload timer count register with this value when count register resets
MOVS	R1, #9
MOVW	R0, #lo_addr(TIM3_ARR+0)
MOVT	R0, #hi_addr(TIM3_ARR+0)
STR	R1, [R0, #0]
;Configurations.c,54 :: 		NVIC_ISER0.B29 =1;        // Enable global interrupt for TIMER3 in NVIC
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(NVIC_ISER0+0)
MOVT	R1, #hi_addr(NVIC_ISER0+0)
LDR	R0, [R1, #0]
BFI	R0, R2, #29, #1
STR	R0, [R1, #0]
;Configurations.c,59 :: 		TIM3_DIER.UIE = 1;        // Update interrupt enable
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
_SX	[R0, ByteOffset(TIM3_DIER+0)]
;Configurations.c,60 :: 		TIM3_CR1 = 0x0001;        // Enable TIMER3
MOVS	R1, #1
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;Configurations.c,61 :: 		}
L_end_Timer3IntConfiguration:
BX	LR
; end of _Timer3IntConfiguration
_AdcConfiguration:
;Configurations.c,64 :: 		void AdcConfiguration()
;Configurations.c,66 :: 		RCC_APB2ENR |= 1 << 4;      // Enable PORTC clock
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #16
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
STR	R1, [R0, #0]
;Configurations.c,67 :: 		RCC_APB2ENR |= 1 << 9 ;     // Enable ADC1 Clock
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #512
MOVW	R0, #lo_addr(RCC_APB2ENR+0)
MOVT	R0, #hi_addr(RCC_APB2ENR+0)
STR	R1, [R0, #0]
;Configurations.c,68 :: 		GPIOC_CRL &= ~(0xF << 0);   // Configure PC0 as an Analog Input
MOVW	R0, #lo_addr(GPIOC_CRL+0)
MOVT	R0, #hi_addr(GPIOC_CRL+0)
LDR	R1, [R0, #0]
MVN	R0, #15
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOC_CRL+0)
MOVT	R0, #hi_addr(GPIOC_CRL+0)
STR	R1, [R0, #0]
;Configurations.c,69 :: 		ADC1_SQR1 = (0b0000 << 20); // 1 conversion
MOVW	R1, #0
MOVW	R0, #lo_addr(ADC1_SQR1+0)
MOVT	R0, #hi_addr(ADC1_SQR1+0)
STR	R1, [R0, #0]
;Configurations.c,70 :: 		ADC1_SQR3 = 10;             // Select Channel 10 as only one in conversion sequence
MOVS	R1, #10
MOVW	R0, #lo_addr(ADC1_SQR3+0)
MOVT	R0, #hi_addr(ADC1_SQR3+0)
STR	R1, [R0, #0]
;Configurations.c,71 :: 		ADC1_SMPR1 = 0b100;         // Set sample time on channel 10
MOVS	R1, #4
MOVW	R0, #lo_addr(ADC1_SMPR1+0)
MOVT	R0, #hi_addr(ADC1_SMPR1+0)
STR	R1, [R0, #0]
;Configurations.c,72 :: 		ADC1_CR2 |= (0b111 << 17);  // Set software start as external event for regular group conversion
MOVW	R0, #lo_addr(ADC1_CR2+0)
MOVT	R0, #hi_addr(ADC1_CR2+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC1_CR2+0)
MOVT	R0, #hi_addr(ADC1_CR2+0)
STR	R1, [R0, #0]
;Configurations.c,73 :: 		ADC1_CR2.ADON = 1;          // Enable ADC1
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ADC1_CR2+0)
MOVT	R0, #hi_addr(ADC1_CR2+0)
_SX	[R0, ByteOffset(ADC1_CR2+0)]
;Configurations.c,74 :: 		delay_ms(10);
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
;Configurations.c,75 :: 		}
L_end_AdcConfiguration:
BX	LR
; end of _AdcConfiguration
_getAdcReading:
;Configurations.c,77 :: 		unsigned int getAdcReading(){
;Configurations.c,79 :: 		ADC1_CR2 |= (1 << 22) | (1 << 20);
MOVW	R0, #lo_addr(ADC1_CR2+0)
MOVT	R0, #hi_addr(ADC1_CR2+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(ADC1_CR2+0)
MOVT	R0, #hi_addr(ADC1_CR2+0)
STR	R1, [R0, #0]
;Configurations.c,80 :: 		while(!(ADC1_SR & 0b10));         // Wait until the ADC conversion has ended
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
;Configurations.c,81 :: 		return ADC1_DR;                   // Read value from data register. This also clears start bit
MOVW	R0, #lo_addr(ADC1_DR+0)
MOVT	R0, #hi_addr(ADC1_DR+0)
LDR	R0, [R0, #0]
;Configurations.c,82 :: 		}
L_end_getAdcReading:
BX	LR
; end of _getAdcReading
