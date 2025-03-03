//GLOBAL VARIABLES
void PinConfiguration();    // Forward declaration of sub function used for pin configuration
void Timer3Intconfiguration();  //  Forward declaration of sub function used for TIMER3 configuration
void AdcConfiguration();                // Function to configure ADC on PC0
unsigned int getAdcReading();        // Begins conversion and returns 12 bit value
unsigned int adcVal;
unsigned int  counter = 0 ;

//**************************************************************************************************
//**************************************************************************************************
//SUB FUNCTIONS
void PinConfiguration() {


RCC_APB2ENR |=1<<4;       //ENABLE PORT C CLOCK
GPIOC_CRL = 0x00000004; //  CONFIGURING PC0 AS INPUT FOR  PC0  CLICK
GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_ALL);
}


void AdcConfiguration(){                   // ADC for PC0
        RCC_APB2ENR |= 1 << 4;                 // Enable PORTC clock
        RCC_APB2ENR |= 1 << 9 ;     // Enable ADC1 Clock
        GPIOC_CRL &= ~(0xF << 0);        // Configure PC0 as an Analog Input
        ADC1_SQR1 = (0b0000 << 20);        // 1 conversion
        ADC1_SQR3 = 10;                                // Select Channel 10 as only one in conversion sequence
        ADC1_SMPR1 = 0b100;                        // Set sample time on channel 10
        ADC1_CR2 |= (0b111 << 17);         // Set software start as external event for regular group conversion
        ADC1_CR2.ADON = 1;                        // Enable ADC1
        delay_ms(10);
}
unsigned int getAdcReading(){
        // Bit 20 is set to start conversion of an external channel, bit 22 starts the conversion
        ADC1_CR2 |= (1 << 22) | (1 << 20);
        while(!(ADC1_SR & 0b10));         // Wait until the ADC conversion has ended
        return ADC1_DR;                                // Read value from data register. This also clears start bit
}


void Timer3IntConfiguration(){
       RCC_APB1ENR |= (1 << 1);   // Enable TIMER3 clock. RCC: Clock Configuration Register
                                                                // Different clocks may use different registers.
        TIM3_CR1 = 0x0000;          // Disable timer until configuration is complete
                                                        // If reset value of RCC_CFGR is used, then the 8MHz clock will
                                                        // be the clock source for timer
        TIM3_PSC = 999;            // Clock to TIMx_CNT = 72000000 (clock applied to prescaler register) /
                                                        //                     7999 (Value in TIMx_PSC) + 1) = 9000
        TIM3_ARR =9;                // Reload timer count register with this value when count register resets
                                                        // to 0 after counting from zero to this value
        NVIC_ISER0.B29 =1;         // Enable global interrupt for TIMER3 in NVIC
                                                        // Interrupt set enable register 0. Position of this interrupt in vector
                                                        // table is 29, so set the corresponding bit in interrupt service enable
                                                        // register 0. This is a 32 bit register. ISER1 is used for interrupt
                                                        // numbers greater than 31.
        TIM3_DIER.UIE = 1;          // Update interrupt enable
        TIM3_CR1 = 0x0001;                 // Enable TIMER3
        }

//*************************************************************************************************************
//INTERRUPT SERVICE ROUTINE


void TIMER3_ISR() iv IVT_INT_TIM3 {
  TIM3_SR.UIF = 0;        // Reset UIF flag so next interrupt can be recognized when UIF is set

  if(counter == adcVal){
    GPIOE_ODR = ~GPIOE_ODR;   // toggle PORTE LEDs
     counter = 0;
  }
  counter++;

}
//**************************************************************************************************
//**************************************************************************************************
//MAIN FUNCTION
void main () {
        PinConfiguration();
        AdcConfiguration();
        Timer3IntConfiguration();


        GPIOE_ODR=0X0000;                // Initialize GPIOE LEDs as on

        // You can write your main program from this point on. In this example, the program will
        // execute in an endless loop to keep the program active
        for(;;){
             adcVal = getAdcReading();

             delay_ms(100);
        }
}