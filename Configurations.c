
// Sub function which initializes the registers to enable Joysticks buttons
void joystick_configuration()
         {
        RCC_APB2ENR |= 1 << 2;  // Enabling GPIOA clock
        GPIOA_CRL |= 0X04000000; // Configure PA6 (Right) as an input

        RCC_APB2ENR |= 1 << 3;  // Enabling GPIOB clock
        GPIOB_CRL |= 0X00400000; // Configure PB5(Down) as an input

        RCC_APB2ENR |= 1 << 4;  // Enabling GPIOC clock
        GPIOC_CRL |= 0X00000004; // Configure PC0 (Potentiometer) as an input
        GPIOC_CRH |= 0X00400000; // Configure PC13 (Click) as an input

        RCC_APB2ENR |= 1 << 5;  // Enabling GPIOD clock
        GPIOD_CRL |= 0x00040400;  // Configure PD2 & PD4 (Left & up) as an input

        RCC_APB2ENR |= 1 << 6;  // Enabling GPIOE clock
        GPIOE_CRH = 0x33333333; // Configure Port E as an output
        }
        
// Sub function which initializes the registers to enable Interrupt
void External_Int_Configuration()
{
        RCC_APB2ENR.AFIOEN = 1;     // Enable clock for alternate pin function

        AFIO_EXTICR1 |= 0x00000300;       // PD2 as External interrupt
        AFIO_EXTICR2 |= 0x00000013;       // PD4,PB5,PA6 as External interrupt
        AFIO_EXTICR4 |= 0x00000020;       // PC13 as External interrupt

        EXTI_IMR |= 0x00002074;           // Interrupt on PD4,PD2,PB5, are non-maskable

        EXTI_RTSR |= 0x00002074;          // Set interrupt on rising edge for PD4,PB5
        EXTI_FTSR |= 0x00002074;          // Set interrupt on falling edge for PD4,PB5

        NVIC_ISER0.B10 = 1;               // Enable NVIC interrupt for EXTI line four (PD4)
        NVIC_ISER0.B8 = 1;                // Enable NVIC interrupt for EXTI line two (PD2)
        NVIC_ISER0.B23 = 1;

        NVIC_IntEnable(IVT_INT_EXTI15_10);   // Enable NVIC interrupt for EXTI line [15:10] (PC13)
}
// Sub function which initializes the registers to enable timer3 and timer3 interrupt
void Timer3IntConfiguration()
   {
       RCC_APB1ENR |= (1 << 1);   // Enable TIMER3 clock. RCC: Clock Configuration Register
                                  // Different clocks may use different registers.
        TIM3_CR1 = 0x0000;        // Disable timer until configuration is complete
                                  // If reset value of RCC_CFGR is used, then the 8MHz clock will
                                  // be the clock source for timer
        TIM3_PSC = 999;           // Clock to TIMx_CNT = 72000000 (clock applied to prescaler register)
                                  //7999 (Value in TIMx_PSC) + 1) = 9000
        TIM3_ARR = 9;             // Reload timer count register with this value when count register resets
                                  // to 0 after counting from zero to this value
        NVIC_ISER0.B29 =1;        // Enable global interrupt for TIMER3 in NVIC
                                  // Interrupt set enable register 0. Position of this interrupt in vector
                                  // table is 29, so set the corresponding bit in interrupt service enable
                                  // register 0. This is a 32 bit register. ISER1 is used for interrupt
                                  // numbers greater than 31.
        TIM3_DIER.UIE = 1;        // Update interrupt enable
        TIM3_CR1 = 0x0001;        // Enable TIMER3
   }
        
// Sub function which initializes the registers to enable ADC for PC0
void AdcConfiguration()
 {
        RCC_APB2ENR |= 1 << 4;      // Enable PORTC clock
        RCC_APB2ENR |= 1 << 9 ;     // Enable ADC1 Clock
        GPIOC_CRL &= ~(0xF << 0);   // Configure PC0 as an Analog Input
        ADC1_SQR1 = (0b0000 << 20); // 1 conversion
        ADC1_SQR3 = 10;             // Select Channel 10 as only one in conversion sequence
        ADC1_SMPR1 = 0b100;         // Set sample time on channel 10
        ADC1_CR2 |= (0b111 << 17);  // Set software start as external event for regular group conversion
        ADC1_CR2.ADON = 1;          // Enable ADC1
        delay_ms(10);
 }
 
unsigned int getAdcReading(){
        // Bit 20 is set to start conversion of an external channel, bit 22 starts the conversion
        ADC1_CR2 |= (1 << 22) | (1 << 20);
        while(!(ADC1_SR & 0b10));         // Wait until the ADC conversion has ended
        return ADC1_DR;                   // Read value from data register. This also clears start bit
}