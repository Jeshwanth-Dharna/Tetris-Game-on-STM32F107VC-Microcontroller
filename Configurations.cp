#line 1 "D:/MikroC/Final Project/Configurations.c"


void joystick_configuration()
 {
 RCC_APB2ENR |= 1 << 2;
 GPIOA_CRL |= 0X04000000;

 RCC_APB2ENR |= 1 << 3;
 GPIOB_CRL |= 0X00400000;

 RCC_APB2ENR |= 1 << 4;
 GPIOC_CRL |= 0X00000004;
 GPIOC_CRH |= 0X00400000;

 RCC_APB2ENR |= 1 << 5;
 GPIOD_CRL |= 0x00040400;

 RCC_APB2ENR |= 1 << 6;
 GPIOE_CRH = 0x33333333;
 }


void External_Int_Configuration()
{
 RCC_APB2ENR.AFIOEN = 1;

 AFIO_EXTICR1 |= 0x00000300;
 AFIO_EXTICR2 |= 0x00000013;
 AFIO_EXTICR4 |= 0x00000020;

 EXTI_IMR |= 0x00002074;

 EXTI_RTSR |= 0x00002074;
 EXTI_FTSR |= 0x00002074;

 NVIC_ISER0.B10 = 1;
 NVIC_ISER0.B8 = 1;
 NVIC_ISER0.B23 = 1;

 NVIC_IntEnable(IVT_INT_EXTI15_10);
}

void Timer3IntConfiguration()
 {
 RCC_APB1ENR |= (1 << 1);

 TIM3_CR1 = 0x0000;


 TIM3_PSC = 999;

 TIM3_ARR = 9;

 NVIC_ISER0.B29 =1;




 TIM3_DIER.UIE = 1;
 TIM3_CR1 = 0x0001;
 }


void AdcConfiguration()
 {
 RCC_APB2ENR |= 1 << 4;
 RCC_APB2ENR |= 1 << 9 ;
 GPIOC_CRL &= ~(0xF << 0);
 ADC1_SQR1 = (0b0000 << 20);
 ADC1_SQR3 = 10;
 ADC1_SMPR1 = 0b100;
 ADC1_CR2 |= (0b111 << 17);
 ADC1_CR2.ADON = 1;
 delay_ms(10);
 }

unsigned int getAdcReading(){

 ADC1_CR2 |= (1 << 22) | (1 << 20);
 while(!(ADC1_SR & 0b10));
 return ADC1_DR;
}
