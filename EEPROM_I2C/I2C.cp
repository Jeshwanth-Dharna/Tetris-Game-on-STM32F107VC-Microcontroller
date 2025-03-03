#line 1 "D:/MikroC/Final Project/I2C/I2C.c"






void InitializeUSART1();
unsigned int rcvrd;
unsigned int i;
char data_[256];



void EEPROM_24C02_WrSingle(unsigned short wAddr, unsigned short wData) {
 data_[0] = wAddr;
 data_[1] = wData;
 I2C1_Start();

 I2C1_Write(0x50,data_,2,END_MODE_STOP);
}


unsigned short EEPROM_24C02_RdSingle(unsigned short rAddr) {
data_[0] = rAddr;
I2C1_Start();
I2C1_Write(0x50,data_,1,END_MODE_RESTART);
I2C1_Read(0x50,data_,1,END_MODE_STOP);

return data_[0];
}

void main(){
 InitializeUSART1();
for(;;) {




while (!((USART1_SR & (1<<5))== 0x20)){}






rcvrd = USART1_DR;

 while (! (USART1_SR & (1<<7)) == 0x80) {}

 USART1_DR = rcvrd;
}
Delay_ms(1000);

for(i = 0; i<0x80; i++) {
EEPROM_24C02_WrSingle(i,i);
GPIOD_ODR++;
delay_ms(5);
}

Delay_ms(500);
GPIOD_ODR = 0xFFFF;
Delay_ms(1000);

for(i = 0x00; i < 0x80; i++){
GPIOD_ODR = EEPROM_24C02_RdSingle(i);
delay_ms(100);
}

}

void InitializeUSART1(){
RCC_APB2ENR |= 1;
AFIO_MAPR=0X0F000000;
RCC_APB2ENR |= 1<<2;
GPIOA_CRH &= ~(0xFF << 4);
GPIOA_CRH |= (0x0B << 4);
GPIOA_CRH |= (0x04 << 8);
RCC_APB2ENR |= 1<<14;
USART1_BRR=0X00000506;




USART1_CR1 &= ~(1<<12);
USART1_CR2 &= ~(3<<12);
USART1_CR3 &= ~(3<<8);
USART1_CR1 &= ~(3<<9);
USART1_CR1 |= 3<<2;



USART1_CR1 |= 1<<13;
Delay_ms(100);

}
