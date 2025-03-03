#line 1 "D:/MikroC/Final Project/tetris_driver.c"
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
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/built_in.h"
#line 7 "D:/MikroC/Final Project/tetris_driver.c"
sbit TFT_BLED at GPIOE_ODR.B9;
sbit TFT_CS at GPIOE_ODR.B15;
unsigned int TFT_DataPort at GPIOE_ODR;
sbit TFT_RD at GPIOE_ODR.B10;
sbit TFT_RS at GPIOE_ODR.B12;
sbit TFT_RST at GPIOE_ODR.B8;
sbit TFT_WR at GPIOE_ODR.B11;



sbit DriveX_Left at GPIOB_ODR.B1;
sbit DriveX_Right at GPIOB_ODR.B8;
sbit DriveY_Up at GPIOB_ODR.B9;
sbit DriveY_Down at GPIOB_ODR.B0;



unsigned int Xcoord, Ycoord;
const ADC_THRESHOLD = 1500;
char PenDown;
typedef unsigned long TPointer;
TPointer PressedObject;
int PressedObjectType;
unsigned int caption_length, caption_height;
unsigned int display_width, display_height;

int _object_count;
unsigned short object_pressed;

static void InitializeTouchPanel() {
 TFT_Init_ILI9341_8bit(320, 240);

}



 TScreen* CurrentScreen;

 TScreen Screen1;



static void InitializeObjects() {
 Screen1.Color = 0x5AEB;
 Screen1.Width = 320;
 Screen1.Height = 240;
 Screen1.ObjectsCount = 0;

}

static char IsInsideObject (unsigned int X, unsigned int Y, unsigned int Left, unsigned int Top, unsigned int Width, unsigned int Height) {
 if ( (Left<= X) && (Left+ Width - 1 >= X) &&
 (Top <= Y) && (Top + Height - 1 >= Y) )
 return 1;
 else
 return 0;
}




void DrawScreen(TScreen *aScreen) {
 unsigned int order;
 char save_bled;

 object_pressed = 0;
 order = 0;
 CurrentScreen = aScreen;

 if ((display_width != CurrentScreen->Width) || (display_height != CurrentScreen->Height)) {
 save_bled = TFT_BLED;
 TFT_BLED = 0;
 TFT_Init_ILI9341_8bit(CurrentScreen->Width, CurrentScreen->Height);
 TFT_Fill_Screen(CurrentScreen->Color);
 display_width = CurrentScreen->Width;
 display_height = CurrentScreen->Height;
 TFT_BLED = save_bled;
 }
 else
 TFT_Fill_Screen(CurrentScreen->Color);


 while (order < CurrentScreen->ObjectsCount) {
 }
}

void Init_MCU() {
 GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_9);
 TFT_BLED = 1;
 TFT_Set_Default_Mode();
 TP_TFT_Set_Default_Mode();
}

void Start_TP() {
 Init_MCU();

 InitializeTouchPanel();
 InitializeObjects();
 display_width = Screen1.Width;
 display_height = Screen1.Height;
 DrawScreen(&Screen1);
}
