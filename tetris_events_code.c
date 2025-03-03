#include "tetris_objects.h"
#include "tetris_resources.h"

//--------------------- User code ---------------------//

void Home_Screen()
  {
  // Screen 1
  TFT_Fill_Screen(CL_WHITE);
  TFT_Write_Text("WELCOME!", 132, 107);

  //screen 2(Home page)
  delay_mS(1000);                               // wait 1sec
  TFT_Fill_Screen(CL_WHITE);
  TFT_Set_Pen(CL_BLACK, 1);
  TFT_Line(20,  46, 300,  46); // top line
  TFT_Line(20, 220, 300, 220); // bottom line
  TFT_Set_Font(&Impact26x39_Regular, CL_RED, FO_HORIZONTAL);
  TFT_Write_Text("TETRIS", 120, 10);
  delay_ms(200);
  
  button1();
  TFT_Set_Font(TFT_defaultFont, CL_BLACK, FO_HORIZONTAL);
  TFT_Write_Text("NEW  GAME", 125, 103);

  delay_ms(500);
  TFT_Write_Text("HIGH  SCORE", 125, 150);
  delay_ms(500);

  }
  
  
 void Game_Layout()
  {
   //Screen 3 ( play Screen)
   delay_ms(500);
   TFT_Fill_Screen(CL_BLACK);
   TFT_Set_Pen(CL_BLACK, 1);
   TFT_Set_Brush(1, CL_SILVER, 0, 0, 0, 0);
   TFT_Rectangle(0, 0, 10, 240);// left side
   TFT_Rectangle(310, 0, 320, 240); // right side
   TFT_Rectangle(210, 0, 220, 240);  // center
   TFT_Rectangle(10, 230, 210, 240);  // bottom
   TFT_Rectangle(220, 230, 320, 240);
   TFT_Rectangle(220, 0, 310, 10);  // center box
   TFT_Rectangle(10, 0, 210, 10);
   TFT_Set_Font(TFT_defaultFont, CL_RED, FO_HORIZONTAL);
   TFT_Write_Text("HIGH SCORE", 230, 75);
   TFT_Write_Text("SCORE", 230, 130);

   }
void HighScore_Screen()
 {
  //Screen4 ( high score Screen)
  delay_ms(200);                               // wait 1sec
  TFT_Fill_Screen(CL_WHITE);
  TFT_Set_Pen(CL_BLACK, 1);
  TFT_Line(20,  46, 300,  46); // top line

  TFT_Set_Font(&Impact26x39_Regular, CL_GREEN, FO_HORIZONTAL);
  TFT_Write_Text("HIGH  SCORE", 100, 10);
  }
void button1()
 {
  // Button1 for New Game
  TFT_Set_Pen(CL_WHITE, 1);
  TFT_Set_Brush(1, CL_BLACK, 0, 0, 0, 0);
  TFT_Circle(110, 111, 4);
  // Erasing Button 2
  TFT_Set_Brush(1, CL_WHITE, 0, 0, 0, 0);
  TFT_Circle(110,158 , 4);
  }
void button2()
 {
  // Button2 for HIGH Score
  TFT_Set_Pen(CL_WHITE, 1);
  TFT_Set_Brush(1, CL_BLACK, 0, 0, 0, 0);
  TFT_Circle(110, 158, 4);
  // Erasing Button 1
  TFT_Set_Brush(1, CL_WHITE, 0, 0, 0, 0);
  TFT_Circle(110,111 , 4);

  }

//----------------- End of User code ------------------//

// Event Handlers