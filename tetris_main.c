/*
 * Project name:
     tetris.mcpar
 * Generated by:
     Visual TFT
 * Date of creation
     12/5/2022
 * Test configuration:
     MCU:             STM32F107VC
     Dev.Board:       EasyMx_PRO_v7_for_STM32_ARM_9A
     Oscillator:      72000000 Hz
     SW:              mikroC PRO for ARM
                      http://www.mikroe.com/mikroc/arm/
 */

#include "tetris_objects.h"

extern state_machine;

extern x0,y0,y1;
extern boxsize;
extern counter;
extern adcval;




void main() {

  Start_TP();
  joystick_configuration();
  External_Int_Configuration();
  AdcConfiguration();
  Timer3IntConfiguration();
  
  Random();

  Home_Screen();

  while(1)
  {
   if(state_machine == 1)
   {
   Game_Field();
   }

   adcVal = getAdcReading();
   delay_ms(500);
   }

}
