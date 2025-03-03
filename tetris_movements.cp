#line 1 "D:/MikroC/Final Project/tetris_movements.c"
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
#line 4 "D:/MikroC/Final Project/tetris_movements.c"
unsigned long int x0 = 10, y0 = 10;
unsigned long int x1 = 0, y1 = 10;
unsigned int boxsize = 20;
unsigned int counter = 20;

unsigned int rand_pos = 0, rand_posx = 0;



void Left()
{

 TFT_Set_Pen(CL_BLACK, 1);
 TFT_Set_Brush(1, CL_BLACK, 0, 0, 0, 0);
 TFT_Rectangle(x0, y0, x0+boxsize, y0+boxsize);

 if((x0) > 10)
 {
 x0 = x0 - counter;
 }

 TFT_Set_Brush(1, CL_RED, 0, 0, 0, 0);
 TFT_Rectangle(x0, y0, x0+boxsize, y0+boxsize);
 }
void Right()
{

 TFT_Set_Pen(CL_BLACK, 1);
 TFT_Set_Brush(1, CL_BLACK, 0, 0, 0, 0);
 TFT_Rectangle(x0, y0, x0+boxsize, y0+boxsize);
 if((x0+boxsize) < 210)
 {
 x0 = x0 + counter;
 }

 TFT_Set_Brush(1, CL_RED, 0, 0, 0, 0);
 TFT_Rectangle(x0, y0, x0+boxsize, y0+boxsize);
 }
void Down()
{


 TFT_Set_Pen(CL_BLACK, 1);
 TFT_Set_Brush(1, CL_BLACK, 0, 0, 0, 0);
 TFT_Rectangle(x0, y0, x0+boxsize, y0+boxsize);

 if((y0+boxsize) < 230)
 {
 if((y0) < (y0+boxsize-1))
 {
 y0 = y0 + counter;
 }
 }

 TFT_Set_Brush(1, CL_RED, 0, 0, 0, 0);
 TFT_Rectangle(x0, y0, x0+boxsize, y0+boxsize);
 }
void Game_Field()
 {
#line 79 "D:/MikroC/Final Project/tetris_movements.c"
 if((y0+boxsize) < 230)
 {

 TFT_Set_Pen(CL_BLACK, 1);
 TFT_Set_Brush(1, CL_BLACK, 0, 0, 0, 0);
 TFT_Rectangle(x0, y0, x0+boxsize, y0+boxsize);

 if((y0) < (y0+boxsize-1))
 {
 y0 = y0 + counter;
 }
 }
 TFT_Set_Brush(1, CL_RED, 0, 0, 0, 0);
 TFT_Rectangle(x0, y0, x0+boxsize, y0+boxsize);

 if(y0+boxsize >= 230)
 {
 x0 = 10;
 y0 = 10;
 }
 }
void Random()
 {
 rand_pos = rand();
 rand_pos = rand_pos / 180;
 }
