#line 1 "D:/MikroC/Final Project/tetris_events_code.c"
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
#line 1 "d:/mikroc/final project/tetris_resources.h"
const code char HandelGothic_BT21x22_Regular[];
const code char HandelGothic_BT19x22_Regular[];
const code char Impact26x39_Regular[];
const code char Tahoma11x13_Regular[];
const code char Verdana12x13_Regular[];
#line 6 "D:/MikroC/Final Project/tetris_events_code.c"
void Home_Screen()
 {

 TFT_Fill_Screen(CL_WHITE);
 TFT_Write_Text("WELCOME!", 132, 107);


 delay_mS(1000);
 TFT_Fill_Screen(CL_WHITE);
 TFT_Set_Pen(CL_BLACK, 1);
 TFT_Line(20, 46, 300, 46);
 TFT_Line(20, 220, 300, 220);
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

 delay_ms(500);
 TFT_Fill_Screen(CL_BLACK);
 TFT_Set_Pen(CL_BLACK, 1);
 TFT_Set_Brush(1, CL_SILVER, 0, 0, 0, 0);
 TFT_Rectangle(0, 0, 10, 240);
 TFT_Rectangle(310, 0, 320, 240);
 TFT_Rectangle(210, 0, 220, 240);
 TFT_Rectangle(10, 230, 210, 240);
 TFT_Rectangle(220, 230, 320, 240);
 TFT_Rectangle(220, 0, 310, 10);
 TFT_Rectangle(10, 0, 210, 10);
 TFT_Set_Font(TFT_defaultFont, CL_RED, FO_HORIZONTAL);
 TFT_Write_Text("HIGH SCORE", 230, 75);
 TFT_Write_Text("SCORE", 230, 130);

 }
void HighScore_Screen()
 {

 delay_ms(200);
 TFT_Fill_Screen(CL_WHITE);
 TFT_Set_Pen(CL_BLACK, 1);
 TFT_Line(20, 46, 300, 46);

 TFT_Set_Font(&Impact26x39_Regular, CL_GREEN, FO_HORIZONTAL);
 TFT_Write_Text("HIGH  SCORE", 100, 10);
 }
void button1()
 {

 TFT_Set_Pen(CL_WHITE, 1);
 TFT_Set_Brush(1, CL_BLACK, 0, 0, 0, 0);
 TFT_Circle(110, 111, 4);

 TFT_Set_Brush(1, CL_WHITE, 0, 0, 0, 0);
 TFT_Circle(110,158 , 4);
 }
void button2()
 {

 TFT_Set_Pen(CL_WHITE, 1);
 TFT_Set_Brush(1, CL_BLACK, 0, 0, 0, 0);
 TFT_Circle(110, 158, 4);

 TFT_Set_Brush(1, CL_WHITE, 0, 0, 0, 0);
 TFT_Circle(110,111 , 4);

 }
