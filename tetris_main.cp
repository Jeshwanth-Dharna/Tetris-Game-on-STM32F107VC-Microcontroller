#line 1 "D:/MikroC/Final Project/tetris_main.c"
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
#line 18 "D:/MikroC/Final Project/tetris_main.c"
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
