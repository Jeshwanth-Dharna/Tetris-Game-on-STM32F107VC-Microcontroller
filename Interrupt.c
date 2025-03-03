#include "tetris_objects.h"
//**************************************************************************************************
// GLOBAL VARIBLES

unsigned int button1_state = 1;
unsigned int button2_state = 0;
unsigned int state_machine = 0;

unsigned int getAdcReading();        // Begins conversion and returns 12 bit value
unsigned int adcVal;
unsigned int speed_counter = 0 ;
unsigned int variable_speed = 0;

extern x0,y0;
extern boxsize;

//**************************************************************************************************
//INTERRUPT SERVICE ROUTINES
// Game Variable Speed
void TIMER3_ISR() iv IVT_INT_TIM3 {
  TIM3_SR.UIF = 0;        // Reset UIF flag so next interrupt can be recognized when UIF is set

  if(speed_counter == adcVal)
  {
    variable_speed = variable_speed + 10;
    speed_counter = 0;
  }
  speed_counter++;

}
//UP
void EXTIPD4() iv IVT_INT_EXTI4 ics ICS_AUTO
{
   EXTI_PR.B4 = 1;                 // Clear pending interrupt flag for PD4
   if(GPIOD_IDR.B4 == 0 && state_machine == 0)
   {
    button1_state = 1;
    button2_state = 0;
    button1();
   }
   else  //Erasing
   {


   }

}
//DOWN + RIGHT
void EXTIPB5PA6() iv IVT_INT_EXTI9_5 ics ICS_AUTO
{
   EXTI_PR.B5 = 1;            // Clear pending interrupt flag for PB5
   EXTI_PR.B6 = 1;           // Clear pending interrupt flag for PA6
   
   
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
//LEFT
void EXTIPD2() iv IVT_INT_EXTI2 ics ICS_AUTO
{
   EXTI_PR.B2 = 1;                 // Clear pending interrupt flag for PD2
   if(GPIOD_IDR.B2 == 0 && state_machine == 1)
    {
     Left();
    }
   else
    {

    }
}
//CLICK
void EXTIPC13() iv IVT_INT_EXTI15_10 ics ICS_AUTO
{
   EXTI_PR.B13 = 1;                 // Clear pending interrupt flag for PC13
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