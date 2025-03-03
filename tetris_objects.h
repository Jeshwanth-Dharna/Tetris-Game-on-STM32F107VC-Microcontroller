typedef struct Screen TScreen;

struct Screen {
  unsigned int           Color;
  unsigned int           Width;
  unsigned int           Height;
  unsigned int           ObjectsCount;
};

extern   TScreen         Screen1;


/////////////////////////
// Events Code Declarations
/////////////////////////

/////////////////////////////////
// Caption variables Declarations
/////////////////////////////////

//GLOBAL VARIABLES


void DrawScreen(TScreen *aScreen);
void Check_TP();
void Start_TP();

void joystick_configuration();
void External_Int_Configuration();
void Timer3Intconfiguration();  // sub function used for TIMER3 configuration

void button1();
void button2();

void Home_Screen();
void Game_Layout();
void HighScore_Screen();
void Game_Field();

//Game Varible Speed
void AdcConfiguration();        // Function to configure ADC on PC0
unsigned int getAdcReading();   // Begins conversion and returns 12 bit value
//Movement
void Down();
void Right();
void left();
//Random
void Random();