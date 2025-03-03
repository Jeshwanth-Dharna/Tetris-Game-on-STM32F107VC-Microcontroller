#line 1 "D:/MikroC/Final Project/tetris_shapes.c"
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
