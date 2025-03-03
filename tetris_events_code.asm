_Home_Screen:
;tetris_events_code.c,6 :: 		void Home_Screen()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;tetris_events_code.c,9 :: 		TFT_Fill_Screen(CL_WHITE);
MOVW	R0, #65535
BL	_TFT_Fill_Screen+0
;tetris_events_code.c,10 :: 		TFT_Write_Text("WELCOME!", 132, 107);
MOVW	R0, #lo_addr(?lstr1_tetris_events_code+0)
MOVT	R0, #hi_addr(?lstr1_tetris_events_code+0)
MOVS	R2, #107
MOVS	R1, #132
BL	_TFT_Write_Text+0
;tetris_events_code.c,13 :: 		delay_mS(1000);                               // wait 1sec
MOVW	R7, #6911
MOVT	R7, #183
NOP
NOP
L_Home_Screen0:
SUBS	R7, R7, #1
BNE	L_Home_Screen0
NOP
NOP
NOP
;tetris_events_code.c,14 :: 		TFT_Fill_Screen(CL_WHITE);
MOVW	R0, #65535
BL	_TFT_Fill_Screen+0
;tetris_events_code.c,15 :: 		TFT_Set_Pen(CL_BLACK, 1);
MOVS	R1, #1
MOVW	R0, #0
BL	_TFT_Set_Pen+0
;tetris_events_code.c,16 :: 		TFT_Line(20,  46, 300,  46); // top line
MOVS	R3, #46
SXTH	R3, R3
MOVW	R2, #300
SXTH	R2, R2
MOVS	R1, #46
SXTH	R1, R1
MOVS	R0, #20
SXTH	R0, R0
BL	_TFT_Line+0
;tetris_events_code.c,17 :: 		TFT_Line(20, 220, 300, 220); // bottom line
MOVS	R3, #220
SXTH	R3, R3
MOVW	R2, #300
SXTH	R2, R2
MOVS	R1, #220
SXTH	R1, R1
MOVS	R0, #20
SXTH	R0, R0
BL	_TFT_Line+0
;tetris_events_code.c,18 :: 		TFT_Set_Font(&Impact26x39_Regular, CL_RED, FO_HORIZONTAL);
MOVW	R0, #lo_addr(_Impact26x39_Regular+0)
MOVT	R0, #hi_addr(_Impact26x39_Regular+0)
MOVS	R2, #0
MOVW	R1, #63488
BL	_TFT_Set_Font+0
;tetris_events_code.c,19 :: 		TFT_Write_Text("TETRIS", 120, 10);
MOVW	R0, #lo_addr(?lstr2_tetris_events_code+0)
MOVT	R0, #hi_addr(?lstr2_tetris_events_code+0)
MOVS	R2, #10
MOVS	R1, #120
BL	_TFT_Write_Text+0
;tetris_events_code.c,20 :: 		delay_ms(200);
MOVW	R7, #40703
MOVT	R7, #36
NOP
NOP
L_Home_Screen2:
SUBS	R7, R7, #1
BNE	L_Home_Screen2
NOP
NOP
NOP
;tetris_events_code.c,22 :: 		button1();
BL	_button1+0
;tetris_events_code.c,23 :: 		TFT_Set_Font(TFT_defaultFont, CL_BLACK, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #0
MOVW	R0, #lo_addr(_TFT_defaultFont+0)
MOVT	R0, #hi_addr(_TFT_defaultFont+0)
BL	_TFT_Set_Font+0
;tetris_events_code.c,24 :: 		TFT_Write_Text("NEW  GAME", 125, 103);
MOVW	R0, #lo_addr(?lstr3_tetris_events_code+0)
MOVT	R0, #hi_addr(?lstr3_tetris_events_code+0)
MOVS	R2, #103
MOVS	R1, #125
BL	_TFT_Write_Text+0
;tetris_events_code.c,26 :: 		delay_ms(500);
MOVW	R7, #36223
MOVT	R7, #91
NOP
NOP
L_Home_Screen4:
SUBS	R7, R7, #1
BNE	L_Home_Screen4
NOP
NOP
NOP
;tetris_events_code.c,27 :: 		TFT_Write_Text("HIGH  SCORE", 125, 150);
MOVW	R0, #lo_addr(?lstr4_tetris_events_code+0)
MOVT	R0, #hi_addr(?lstr4_tetris_events_code+0)
MOVS	R2, #150
MOVS	R1, #125
BL	_TFT_Write_Text+0
;tetris_events_code.c,28 :: 		delay_ms(500);
MOVW	R7, #36223
MOVT	R7, #91
NOP
NOP
L_Home_Screen6:
SUBS	R7, R7, #1
BNE	L_Home_Screen6
NOP
NOP
NOP
;tetris_events_code.c,30 :: 		}
L_end_Home_Screen:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Home_Screen
_Game_Layout:
;tetris_events_code.c,33 :: 		void Game_Layout()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;tetris_events_code.c,36 :: 		delay_ms(500);
MOVW	R7, #36223
MOVT	R7, #91
NOP
NOP
L_Game_Layout8:
SUBS	R7, R7, #1
BNE	L_Game_Layout8
NOP
NOP
NOP
;tetris_events_code.c,37 :: 		TFT_Fill_Screen(CL_BLACK);
MOVW	R0, #0
BL	_TFT_Fill_Screen+0
;tetris_events_code.c,38 :: 		TFT_Set_Pen(CL_BLACK, 1);
MOVS	R1, #1
MOVW	R0, #0
BL	_TFT_Set_Pen+0
;tetris_events_code.c,39 :: 		TFT_Set_Brush(1, CL_SILVER, 0, 0, 0, 0);
MOVS	R1, #0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #0
MOVW	R1, #50712
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;tetris_events_code.c,40 :: 		TFT_Rectangle(0, 0, 10, 240);// left side
MOVS	R3, #240
SXTH	R3, R3
MOVS	R2, #10
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Rectangle+0
;tetris_events_code.c,41 :: 		TFT_Rectangle(310, 0, 320, 240); // right side
MOVS	R3, #240
SXTH	R3, R3
MOVW	R2, #320
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #310
SXTH	R0, R0
BL	_TFT_Rectangle+0
;tetris_events_code.c,42 :: 		TFT_Rectangle(210, 0, 220, 240);  // center
MOVS	R3, #240
SXTH	R3, R3
MOVS	R2, #220
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #210
SXTH	R0, R0
BL	_TFT_Rectangle+0
;tetris_events_code.c,43 :: 		TFT_Rectangle(10, 230, 210, 240);  // bottom
MOVS	R3, #240
SXTH	R3, R3
MOVS	R2, #210
SXTH	R2, R2
MOVS	R1, #230
SXTH	R1, R1
MOVS	R0, #10
SXTH	R0, R0
BL	_TFT_Rectangle+0
;tetris_events_code.c,44 :: 		TFT_Rectangle(220, 230, 320, 240);
MOVS	R3, #240
SXTH	R3, R3
MOVW	R2, #320
SXTH	R2, R2
MOVS	R1, #230
SXTH	R1, R1
MOVS	R0, #220
SXTH	R0, R0
BL	_TFT_Rectangle+0
;tetris_events_code.c,45 :: 		TFT_Rectangle(220, 0, 310, 10);  // center box
MOVS	R3, #10
SXTH	R3, R3
MOVW	R2, #310
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #220
SXTH	R0, R0
BL	_TFT_Rectangle+0
;tetris_events_code.c,46 :: 		TFT_Rectangle(10, 0, 210, 10);
MOVS	R3, #10
SXTH	R3, R3
MOVS	R2, #210
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #10
SXTH	R0, R0
BL	_TFT_Rectangle+0
;tetris_events_code.c,47 :: 		TFT_Set_Font(TFT_defaultFont, CL_RED, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #63488
MOVW	R0, #lo_addr(_TFT_defaultFont+0)
MOVT	R0, #hi_addr(_TFT_defaultFont+0)
BL	_TFT_Set_Font+0
;tetris_events_code.c,48 :: 		TFT_Write_Text("HIGH SCORE", 230, 75);
MOVW	R0, #lo_addr(?lstr5_tetris_events_code+0)
MOVT	R0, #hi_addr(?lstr5_tetris_events_code+0)
MOVS	R2, #75
MOVS	R1, #230
BL	_TFT_Write_Text+0
;tetris_events_code.c,49 :: 		TFT_Write_Text("SCORE", 230, 130);
MOVW	R0, #lo_addr(?lstr6_tetris_events_code+0)
MOVT	R0, #hi_addr(?lstr6_tetris_events_code+0)
MOVS	R2, #130
MOVS	R1, #230
BL	_TFT_Write_Text+0
;tetris_events_code.c,51 :: 		}
L_end_Game_Layout:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Game_Layout
_HighScore_Screen:
;tetris_events_code.c,52 :: 		void HighScore_Screen()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;tetris_events_code.c,55 :: 		delay_ms(200);                               // wait 1sec
MOVW	R7, #40703
MOVT	R7, #36
NOP
NOP
L_HighScore_Screen10:
SUBS	R7, R7, #1
BNE	L_HighScore_Screen10
NOP
NOP
NOP
;tetris_events_code.c,56 :: 		TFT_Fill_Screen(CL_WHITE);
MOVW	R0, #65535
BL	_TFT_Fill_Screen+0
;tetris_events_code.c,57 :: 		TFT_Set_Pen(CL_BLACK, 1);
MOVS	R1, #1
MOVW	R0, #0
BL	_TFT_Set_Pen+0
;tetris_events_code.c,58 :: 		TFT_Line(20,  46, 300,  46); // top line
MOVS	R3, #46
SXTH	R3, R3
MOVW	R2, #300
SXTH	R2, R2
MOVS	R1, #46
SXTH	R1, R1
MOVS	R0, #20
SXTH	R0, R0
BL	_TFT_Line+0
;tetris_events_code.c,60 :: 		TFT_Set_Font(&Impact26x39_Regular, CL_GREEN, FO_HORIZONTAL);
MOVW	R0, #lo_addr(_Impact26x39_Regular+0)
MOVT	R0, #hi_addr(_Impact26x39_Regular+0)
MOVS	R2, #0
MOVW	R1, #1024
BL	_TFT_Set_Font+0
;tetris_events_code.c,61 :: 		TFT_Write_Text("HIGH  SCORE", 100, 10);
MOVW	R0, #lo_addr(?lstr7_tetris_events_code+0)
MOVT	R0, #hi_addr(?lstr7_tetris_events_code+0)
MOVS	R2, #10
MOVS	R1, #100
BL	_TFT_Write_Text+0
;tetris_events_code.c,62 :: 		}
L_end_HighScore_Screen:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _HighScore_Screen
_button1:
;tetris_events_code.c,63 :: 		void button1()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;tetris_events_code.c,66 :: 		TFT_Set_Pen(CL_WHITE, 1);
MOVS	R1, #1
MOVW	R0, #65535
BL	_TFT_Set_Pen+0
;tetris_events_code.c,67 :: 		TFT_Set_Brush(1, CL_BLACK, 0, 0, 0, 0);
MOVS	R1, #0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #0
MOVW	R1, #0
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;tetris_events_code.c,68 :: 		TFT_Circle(110, 111, 4);
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #111
SXTH	R1, R1
MOVS	R0, #110
SXTH	R0, R0
BL	_TFT_Circle+0
;tetris_events_code.c,70 :: 		TFT_Set_Brush(1, CL_WHITE, 0, 0, 0, 0);
MOVS	R1, #0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #0
MOVW	R1, #65535
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;tetris_events_code.c,71 :: 		TFT_Circle(110,158 , 4);
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #158
SXTH	R1, R1
MOVS	R0, #110
SXTH	R0, R0
BL	_TFT_Circle+0
;tetris_events_code.c,72 :: 		}
L_end_button1:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _button1
_button2:
;tetris_events_code.c,73 :: 		void button2()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;tetris_events_code.c,76 :: 		TFT_Set_Pen(CL_WHITE, 1);
MOVS	R1, #1
MOVW	R0, #65535
BL	_TFT_Set_Pen+0
;tetris_events_code.c,77 :: 		TFT_Set_Brush(1, CL_BLACK, 0, 0, 0, 0);
MOVS	R1, #0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #0
MOVW	R1, #0
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;tetris_events_code.c,78 :: 		TFT_Circle(110, 158, 4);
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #158
SXTH	R1, R1
MOVS	R0, #110
SXTH	R0, R0
BL	_TFT_Circle+0
;tetris_events_code.c,80 :: 		TFT_Set_Brush(1, CL_WHITE, 0, 0, 0, 0);
MOVS	R1, #0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #0
MOVW	R1, #65535
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;tetris_events_code.c,81 :: 		TFT_Circle(110,111 , 4);
MOVS	R2, #4
SXTH	R2, R2
MOVS	R1, #111
SXTH	R1, R1
MOVS	R0, #110
SXTH	R0, R0
BL	_TFT_Circle+0
;tetris_events_code.c,83 :: 		}
L_end_button2:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _button2
