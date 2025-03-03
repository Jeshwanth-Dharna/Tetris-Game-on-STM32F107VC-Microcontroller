#line 1 "D:/MikroC/Final Project/Interrupt.c"
#line 1 "d:/mikroc/final project/tetris_objects.h"
typedef struct Screen TScreen;

struct Screen {
 unsigned int Color;
 unsigned int Width;
 unsigned int Height;
 unsigned int ObjectsCount;
};

extern TScreen Screen1;
#line 24 "d:/mikroc/final project/tetris_objects.h"
void DrawScreen(TScreen *aScreen);
void Check_TP();
void Start_TP();

void joystick_configuration();
void External_Int_Configuration();
void Timer3Intconfiguration();

void button1();
void button2();

void Home_Screen();
void Game_Layout();
void HighScore_Screen();
void Game_Field();


void AdcConfiguration();
unsigned int getAdcReading();

void Down();
void Right();
void left();

void Random();
#line 5 "D:/MikroC/Final Project/Interrupt.c"
unsigned int button1_state = 1;
unsigned int button2_state = 0;
unsigned int state_machine = 0;

unsigned int getAdcReading();
unsigned int adcVal;
unsigned int speed_counter = 0 ;
unsigned int variable_speed = 0;

extern x0,y0;
extern boxsize;




void TIMER3_ISR() iv IVT_INT_TIM3 {
 TIM3_SR.UIF = 0;

 if(speed_counter == adcVal)
 {
 variable_speed = variable_speed + 10;
 speed_counter = 0;
 }
 speed_counter++;

}

void EXTIPD4() iv IVT_INT_EXTI4 ics ICS_AUTO
{
 EXTI_PR.B4 = 1;
 if(GPIOD_IDR.B4 == 0 && state_machine == 0)
 {
 button1_state = 1;
 button2_state = 0;
 button1();
 }
 else
 {


 }

}

void EXTIPB5PA6() iv IVT_INT_EXTI9_5 ics ICS_AUTO
{
 EXTI_PR.B5 = 1;
 EXTI_PR.B6 = 1;


 if(GPIOB_IDR.B5 == 0 && state_machine == 0)
 {
 button1_state = 0;
 button2_state = 1;
 button2();
 }
 if(GPIOB_IDR.B5 == 0 && state_machine == 1)
 {
 Down();
 }
 else if(GPIOA_IDR.B6 == 0 && state_machine == 1)
 {
 Right();
 }
 else
 {


 }
}

void EXTIPD2() iv IVT_INT_EXTI2 ics ICS_AUTO
{
 EXTI_PR.B2 = 1;
 if(GPIOD_IDR.B2 == 0 && state_machine == 1)
 {
 Left();
 }
 else
 {

 }
}

void EXTIPC13() iv IVT_INT_EXTI15_10 ics ICS_AUTO
{
 EXTI_PR.B13 = 1;
 if(GPIOC_IDR.B13 == 0 && button1_state == 1)
 {
 Game_Layout();
 button1_state = 0;
 state_machine = 1;
 }
 if(GPIOC_IDR.B13 == 0 && button2_state == 1)
 {
 HighScore_Screen();
 button2_state = 0;
 state_machine = 2;
 }
}
