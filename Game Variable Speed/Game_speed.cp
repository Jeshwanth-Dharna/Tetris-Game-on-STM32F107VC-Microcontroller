#line 1 "D:/MikroC/Final Project/Game Variable Speed/Game_speed.c"


void PinConfiguration();
void Timer3Intconfiguration();
void AdcConfiguration();
unsigned int getAdcReading();
unsigned int adcVal;
unsigned int counter = 0 ;




void PinConfiguration() {


RCC_APB2ENR |=1<<4;
GPIOC_CRL = 0x00000004;
GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_ALL);
}


void AdcConfiguration(){
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


void Timer3IntConfiguration(){
 RCC_APB1ENR |= (1 << 1);

 TIM3_CR1 = 0x0000;


 TIM3_PSC = 999;

 TIM3_ARR =9;

 NVIC_ISER0.B29 =1;




 TIM3_DIER.UIE = 1;
 TIM3_CR1 = 0x0001;
 }





void TIMER3_ISR() iv IVT_INT_TIM3 {
 TIM3_SR.UIF = 0;

 if(counter == adcVal){
 GPIOE_ODR = ~GPIOE_ODR;
 counter = 0;
 }
 counter++;

}



void main () {
 PinConfiguration();
 AdcConfiguration();
 Timer3IntConfiguration();


 GPIOE_ODR=0X0000;



 for(;;){
 adcVal = getAdcReading();

 delay_ms(100);
 }
}
