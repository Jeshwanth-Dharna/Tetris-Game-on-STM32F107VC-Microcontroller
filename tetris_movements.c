#include "tetris_objects.h"
//**************************************************************************************************
// GLOBAL VARIBLES
unsigned long int x0 = 10, y0 = 10;
unsigned long int x1 = 0, y1 = 10;
unsigned int boxsize = 20;
unsigned int counter = 20;

unsigned int rand_pos = 0, rand_posx = 0;


//**************************************************************************************************
void Left()
{
   // Erasing
    TFT_Set_Pen(CL_BLACK, 1);
    TFT_Set_Brush(1, CL_BLACK, 0, 0, 0, 0);
    TFT_Rectangle(x0, y0, x0+boxsize, y0+boxsize);

    if((x0) > 10) // boundary condition
    {
    x0 = x0 - counter; //only change x direction left side
    }
    //redrawing
    TFT_Set_Brush(1, CL_RED, 0, 0, 0, 0);
    TFT_Rectangle(x0, y0, x0+boxsize, y0+boxsize);
   }
void Right()
{
   // Erasing
    TFT_Set_Pen(CL_BLACK, 1);
    TFT_Set_Brush(1, CL_BLACK, 0, 0, 0, 0);
    TFT_Rectangle(x0, y0, x0+boxsize, y0+boxsize);
    if((x0+boxsize) < 210) // boundary condition
     {
     x0 = x0 + counter; //only change x direction right side
     }
    //redrawing
    TFT_Set_Brush(1, CL_RED, 0, 0, 0, 0);
    TFT_Rectangle(x0, y0, x0+boxsize, y0+boxsize);
   }
void Down()
{

   // Erasing
    TFT_Set_Pen(CL_BLACK, 1);
    TFT_Set_Brush(1, CL_BLACK, 0, 0, 0, 0);
    TFT_Rectangle(x0, y0, x0+boxsize, y0+boxsize);

    if((y0+boxsize) < 230) // boundary condition
    {
     if((y0) < (y0+boxsize-1))//check other objects
      {
       y0 = y0 + counter; //only change y direction
      }
    }
    //redrawing
    TFT_Set_Brush(1, CL_RED, 0, 0, 0, 0);
    TFT_Rectangle(x0, y0, x0+boxsize, y0+boxsize);
   }
void Game_Field()
 {
     /*//Erasing
     TFT_Set_Pen(CL_BLACK, 1);
     TFT_Set_Brush(1, CL_BLACK, 0, 0, 0, 0);
     TFT_Rectangle(x1+rand_posx, y1, x1+rand_posx+boxsize, y1+boxsize);
     if((y1+boxsize) < 230) // boundary condition
     {
     if((y1) < (y1+boxsize-1))//check other objects
      {
       y1 = y1 + counter; //only change y direction
      }
     }
     TFT_Set_Brush(1, CL_RED, 0, 0, 0, 0);
     Random();
     TFT_Rectangle(x1+rand_posx, y1, x1+rand_posx+boxsize, y1+boxsize);
     */
     //Erasing
     if((y0+boxsize) < 230) // boundary condition
    {
     //Erasing
     TFT_Set_Pen(CL_BLACK, 1);
     TFT_Set_Brush(1, CL_BLACK, 0, 0, 0, 0);
     TFT_Rectangle(x0, y0, x0+boxsize, y0+boxsize);

      if((y0) < (y0+boxsize-1))//check other objects
       {
        y0 = y0 + counter; //only change y direction
       }
     }
   TFT_Set_Brush(1, CL_RED, 0, 0, 0, 0);
   TFT_Rectangle(x0, y0, x0+boxsize, y0+boxsize);
   // regenarting new blocks
   if(y0+boxsize >= 230)
    {
    x0 = 10;//rand_pos;
    y0 = 10; //we have use random x-axis and constant y axis
    }
 }
void Random()
 {
  rand_pos = rand();
  rand_pos = rand_pos / 180; //Set it with in 210 pixel width
 }