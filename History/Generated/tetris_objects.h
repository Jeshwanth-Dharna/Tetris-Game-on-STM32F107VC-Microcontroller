typedef struct Screen TScreen;

struct Screen {
  unsigned int           Color;
  unsigned int           Width;
  unsigned int           Height;
  unsigned int           ObjectsCount;
};

extern   TScreen                Screen1;


/////////////////////////
// Events Code Declarations
/////////////////////////

/////////////////////////////////
// Caption variables Declarations
/////////////////////////////////

void DrawScreen(TScreen *aScreen);
void Check_TP();
void Start_TP();