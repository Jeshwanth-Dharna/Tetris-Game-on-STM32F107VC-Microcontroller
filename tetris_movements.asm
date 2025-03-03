_Left:
;tetris_movements.c,13 :: 		void Left()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;tetris_movements.c,16 :: 		TFT_Set_Pen(CL_BLACK, 1);
MOVS	R1, #1
MOVW	R0, #0
BL	_TFT_Set_Pen+0
;tetris_movements.c,17 :: 		TFT_Set_Brush(1, CL_BLACK, 0, 0, 0, 0);
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
;tetris_movements.c,18 :: 		TFT_Rectangle(x0, y0, x0+boxsize, y0+boxsize);
MOVW	R2, #lo_addr(_boxsize+0)
MOVT	R2, #hi_addr(_boxsize+0)
LDRH	R1, [R2, #0]
MOVW	R5, #lo_addr(_y0+0)
MOVT	R5, #hi_addr(_y0+0)
LDR	R0, [R5, #0]
ADDS	R4, R0, R1
MOV	R0, R2
LDRH	R1, [R0, #0]
MOVW	R3, #lo_addr(_x0+0)
MOVT	R3, #hi_addr(_x0+0)
LDR	R0, [R3, #0]
ADDS	R2, R0, R1
MOV	R0, R5
LDR	R1, [R0, #0]
MOV	R0, R3
LDR	R0, [R0, #0]
SXTH	R3, R4
SXTH	R2, R2
BL	_TFT_Rectangle+0
;tetris_movements.c,20 :: 		if((x0) > 10) // boundary condition
MOVW	R0, #lo_addr(_x0+0)
MOVT	R0, #hi_addr(_x0+0)
LDR	R0, [R0, #0]
CMP	R0, #10
IT	LS
BLS	L_Left0
;tetris_movements.c,22 :: 		x0 = x0 - counter; //only change x direction left side
MOVW	R0, #lo_addr(_counter+0)
MOVT	R0, #hi_addr(_counter+0)
LDRH	R2, [R0, #0]
MOVW	R1, #lo_addr(_x0+0)
MOVT	R1, #hi_addr(_x0+0)
LDR	R0, [R1, #0]
SUB	R0, R0, R2
STR	R0, [R1, #0]
;tetris_movements.c,23 :: 		}
L_Left0:
;tetris_movements.c,25 :: 		TFT_Set_Brush(1, CL_RED, 0, 0, 0, 0);
MOVS	R1, #0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #0
MOVW	R1, #63488
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;tetris_movements.c,26 :: 		TFT_Rectangle(x0, y0, x0+boxsize, y0+boxsize);
MOVW	R2, #lo_addr(_boxsize+0)
MOVT	R2, #hi_addr(_boxsize+0)
LDRH	R1, [R2, #0]
MOVW	R5, #lo_addr(_y0+0)
MOVT	R5, #hi_addr(_y0+0)
LDR	R0, [R5, #0]
ADDS	R4, R0, R1
MOV	R0, R2
LDRH	R1, [R0, #0]
MOVW	R3, #lo_addr(_x0+0)
MOVT	R3, #hi_addr(_x0+0)
LDR	R0, [R3, #0]
ADDS	R2, R0, R1
MOV	R0, R5
LDR	R1, [R0, #0]
MOV	R0, R3
LDR	R0, [R0, #0]
SXTH	R3, R4
SXTH	R2, R2
BL	_TFT_Rectangle+0
;tetris_movements.c,27 :: 		}
L_end_Left:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Left
_Right:
;tetris_movements.c,28 :: 		void Right()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;tetris_movements.c,31 :: 		TFT_Set_Pen(CL_BLACK, 1);
MOVS	R1, #1
MOVW	R0, #0
BL	_TFT_Set_Pen+0
;tetris_movements.c,32 :: 		TFT_Set_Brush(1, CL_BLACK, 0, 0, 0, 0);
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
;tetris_movements.c,33 :: 		TFT_Rectangle(x0, y0, x0+boxsize, y0+boxsize);
MOVW	R2, #lo_addr(_boxsize+0)
MOVT	R2, #hi_addr(_boxsize+0)
LDRH	R1, [R2, #0]
MOVW	R5, #lo_addr(_y0+0)
MOVT	R5, #hi_addr(_y0+0)
LDR	R0, [R5, #0]
ADDS	R4, R0, R1
MOV	R0, R2
LDRH	R1, [R0, #0]
MOVW	R3, #lo_addr(_x0+0)
MOVT	R3, #hi_addr(_x0+0)
LDR	R0, [R3, #0]
ADDS	R2, R0, R1
MOV	R0, R5
LDR	R1, [R0, #0]
MOV	R0, R3
LDR	R0, [R0, #0]
SXTH	R3, R4
SXTH	R2, R2
BL	_TFT_Rectangle+0
;tetris_movements.c,34 :: 		if((x0+boxsize) < 210) // boundary condition
MOVW	R0, #lo_addr(_boxsize+0)
MOVT	R0, #hi_addr(_boxsize+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_x0+0)
MOVT	R0, #hi_addr(_x0+0)
LDR	R0, [R0, #0]
ADDS	R0, R0, R1
CMP	R0, #210
IT	CS
BCS	L_Right1
;tetris_movements.c,36 :: 		x0 = x0 + counter; //only change x direction right side
MOVW	R0, #lo_addr(_counter+0)
MOVT	R0, #hi_addr(_counter+0)
LDRH	R2, [R0, #0]
MOVW	R1, #lo_addr(_x0+0)
MOVT	R1, #hi_addr(_x0+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, R2
STR	R0, [R1, #0]
;tetris_movements.c,37 :: 		}
L_Right1:
;tetris_movements.c,39 :: 		TFT_Set_Brush(1, CL_RED, 0, 0, 0, 0);
MOVS	R1, #0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #0
MOVW	R1, #63488
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;tetris_movements.c,40 :: 		TFT_Rectangle(x0, y0, x0+boxsize, y0+boxsize);
MOVW	R2, #lo_addr(_boxsize+0)
MOVT	R2, #hi_addr(_boxsize+0)
LDRH	R1, [R2, #0]
MOVW	R5, #lo_addr(_y0+0)
MOVT	R5, #hi_addr(_y0+0)
LDR	R0, [R5, #0]
ADDS	R4, R0, R1
MOV	R0, R2
LDRH	R1, [R0, #0]
MOVW	R3, #lo_addr(_x0+0)
MOVT	R3, #hi_addr(_x0+0)
LDR	R0, [R3, #0]
ADDS	R2, R0, R1
MOV	R0, R5
LDR	R1, [R0, #0]
MOV	R0, R3
LDR	R0, [R0, #0]
SXTH	R3, R4
SXTH	R2, R2
BL	_TFT_Rectangle+0
;tetris_movements.c,41 :: 		}
L_end_Right:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Right
_Down:
;tetris_movements.c,42 :: 		void Down()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;tetris_movements.c,46 :: 		TFT_Set_Pen(CL_BLACK, 1);
MOVS	R1, #1
MOVW	R0, #0
BL	_TFT_Set_Pen+0
;tetris_movements.c,47 :: 		TFT_Set_Brush(1, CL_BLACK, 0, 0, 0, 0);
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
;tetris_movements.c,48 :: 		TFT_Rectangle(x0, y0, x0+boxsize, y0+boxsize);
MOVW	R2, #lo_addr(_boxsize+0)
MOVT	R2, #hi_addr(_boxsize+0)
LDRH	R1, [R2, #0]
MOVW	R5, #lo_addr(_y0+0)
MOVT	R5, #hi_addr(_y0+0)
LDR	R0, [R5, #0]
ADDS	R4, R0, R1
MOV	R0, R2
LDRH	R1, [R0, #0]
MOVW	R3, #lo_addr(_x0+0)
MOVT	R3, #hi_addr(_x0+0)
LDR	R0, [R3, #0]
ADDS	R2, R0, R1
MOV	R0, R5
LDR	R1, [R0, #0]
MOV	R0, R3
LDR	R0, [R0, #0]
SXTH	R3, R4
SXTH	R2, R2
BL	_TFT_Rectangle+0
;tetris_movements.c,50 :: 		if((y0+boxsize) < 230) // boundary condition
MOVW	R0, #lo_addr(_boxsize+0)
MOVT	R0, #hi_addr(_boxsize+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_y0+0)
MOVT	R0, #hi_addr(_y0+0)
LDR	R0, [R0, #0]
ADDS	R0, R0, R1
CMP	R0, #230
IT	CS
BCS	L_Down2
;tetris_movements.c,52 :: 		if((y0) < (y0+boxsize-1))//check other objects
MOVW	R0, #lo_addr(_boxsize+0)
MOVT	R0, #hi_addr(_boxsize+0)
LDRH	R1, [R0, #0]
MOVW	R2, #lo_addr(_y0+0)
MOVT	R2, #hi_addr(_y0+0)
LDR	R0, [R2, #0]
ADDS	R0, R0, R1
SUBS	R1, R0, #1
MOV	R0, R2
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Down3
;tetris_movements.c,54 :: 		y0 = y0 + counter; //only change y direction
MOVW	R0, #lo_addr(_counter+0)
MOVT	R0, #hi_addr(_counter+0)
LDRH	R2, [R0, #0]
MOVW	R1, #lo_addr(_y0+0)
MOVT	R1, #hi_addr(_y0+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, R2
STR	R0, [R1, #0]
;tetris_movements.c,55 :: 		}
L_Down3:
;tetris_movements.c,56 :: 		}
L_Down2:
;tetris_movements.c,58 :: 		TFT_Set_Brush(1, CL_RED, 0, 0, 0, 0);
MOVS	R1, #0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #0
MOVW	R1, #63488
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;tetris_movements.c,59 :: 		TFT_Rectangle(x0, y0, x0+boxsize, y0+boxsize);
MOVW	R2, #lo_addr(_boxsize+0)
MOVT	R2, #hi_addr(_boxsize+0)
LDRH	R1, [R2, #0]
MOVW	R5, #lo_addr(_y0+0)
MOVT	R5, #hi_addr(_y0+0)
LDR	R0, [R5, #0]
ADDS	R4, R0, R1
MOV	R0, R2
LDRH	R1, [R0, #0]
MOVW	R3, #lo_addr(_x0+0)
MOVT	R3, #hi_addr(_x0+0)
LDR	R0, [R3, #0]
ADDS	R2, R0, R1
MOV	R0, R5
LDR	R1, [R0, #0]
MOV	R0, R3
LDR	R0, [R0, #0]
SXTH	R3, R4
SXTH	R2, R2
BL	_TFT_Rectangle+0
;tetris_movements.c,60 :: 		}
L_end_Down:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Down
_Game_Field:
;tetris_movements.c,61 :: 		void Game_Field()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;tetris_movements.c,79 :: 		if((y0+boxsize) < 230) // boundary condition
MOVW	R0, #lo_addr(_boxsize+0)
MOVT	R0, #hi_addr(_boxsize+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_y0+0)
MOVT	R0, #hi_addr(_y0+0)
LDR	R0, [R0, #0]
ADDS	R0, R0, R1
CMP	R0, #230
IT	CS
BCS	L_Game_Field4
;tetris_movements.c,82 :: 		TFT_Set_Pen(CL_BLACK, 1);
MOVS	R1, #1
MOVW	R0, #0
BL	_TFT_Set_Pen+0
;tetris_movements.c,83 :: 		TFT_Set_Brush(1, CL_BLACK, 0, 0, 0, 0);
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
;tetris_movements.c,84 :: 		TFT_Rectangle(x0, y0, x0+boxsize, y0+boxsize);
MOVW	R2, #lo_addr(_boxsize+0)
MOVT	R2, #hi_addr(_boxsize+0)
LDRH	R1, [R2, #0]
MOVW	R5, #lo_addr(_y0+0)
MOVT	R5, #hi_addr(_y0+0)
LDR	R0, [R5, #0]
ADDS	R4, R0, R1
MOV	R0, R2
LDRH	R1, [R0, #0]
MOVW	R3, #lo_addr(_x0+0)
MOVT	R3, #hi_addr(_x0+0)
LDR	R0, [R3, #0]
ADDS	R2, R0, R1
MOV	R0, R5
LDR	R1, [R0, #0]
MOV	R0, R3
LDR	R0, [R0, #0]
SXTH	R3, R4
SXTH	R2, R2
BL	_TFT_Rectangle+0
;tetris_movements.c,86 :: 		if((y0) < (y0+boxsize-1))//check other objects
MOVW	R0, #lo_addr(_boxsize+0)
MOVT	R0, #hi_addr(_boxsize+0)
LDRH	R1, [R0, #0]
MOVW	R2, #lo_addr(_y0+0)
MOVT	R2, #hi_addr(_y0+0)
LDR	R0, [R2, #0]
ADDS	R0, R0, R1
SUBS	R1, R0, #1
MOV	R0, R2
LDR	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L_Game_Field5
;tetris_movements.c,88 :: 		y0 = y0 + counter; //only change y direction
MOVW	R0, #lo_addr(_counter+0)
MOVT	R0, #hi_addr(_counter+0)
LDRH	R2, [R0, #0]
MOVW	R1, #lo_addr(_y0+0)
MOVT	R1, #hi_addr(_y0+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, R2
STR	R0, [R1, #0]
;tetris_movements.c,89 :: 		}
L_Game_Field5:
;tetris_movements.c,90 :: 		}
L_Game_Field4:
;tetris_movements.c,91 :: 		TFT_Set_Brush(1, CL_RED, 0, 0, 0, 0);
MOVS	R1, #0
MOVS	R0, #0
PUSH	(R1)
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #0
MOVW	R1, #63488
MOVS	R0, #1
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;tetris_movements.c,92 :: 		TFT_Rectangle(x0, y0, x0+boxsize, y0+boxsize);
MOVW	R2, #lo_addr(_boxsize+0)
MOVT	R2, #hi_addr(_boxsize+0)
LDRH	R1, [R2, #0]
MOVW	R5, #lo_addr(_y0+0)
MOVT	R5, #hi_addr(_y0+0)
LDR	R0, [R5, #0]
ADDS	R4, R0, R1
MOV	R0, R2
LDRH	R1, [R0, #0]
MOVW	R3, #lo_addr(_x0+0)
MOVT	R3, #hi_addr(_x0+0)
LDR	R0, [R3, #0]
ADDS	R2, R0, R1
MOV	R0, R5
LDR	R1, [R0, #0]
MOV	R0, R3
LDR	R0, [R0, #0]
SXTH	R3, R4
SXTH	R2, R2
BL	_TFT_Rectangle+0
;tetris_movements.c,94 :: 		if(y0+boxsize >= 230)
MOVW	R0, #lo_addr(_boxsize+0)
MOVT	R0, #hi_addr(_boxsize+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_y0+0)
MOVT	R0, #hi_addr(_y0+0)
LDR	R0, [R0, #0]
ADDS	R0, R0, R1
CMP	R0, #230
IT	CC
BCC	L_Game_Field6
;tetris_movements.c,96 :: 		x0 = 10;//rand_pos;
MOVS	R1, #10
MOVW	R0, #lo_addr(_x0+0)
MOVT	R0, #hi_addr(_x0+0)
STR	R1, [R0, #0]
;tetris_movements.c,97 :: 		y0 = 10; //we have use random x-axis and constant y axis
MOVS	R1, #10
MOVW	R0, #lo_addr(_y0+0)
MOVT	R0, #hi_addr(_y0+0)
STR	R1, [R0, #0]
;tetris_movements.c,98 :: 		}
L_Game_Field6:
;tetris_movements.c,99 :: 		}
L_end_Game_Field:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Game_Field
_Random:
;tetris_movements.c,100 :: 		void Random()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;tetris_movements.c,102 :: 		rand_pos = rand();
BL	_rand+0
MOVW	R2, #lo_addr(_rand_pos+0)
MOVT	R2, #hi_addr(_rand_pos+0)
STRH	R0, [R2, #0]
;tetris_movements.c,103 :: 		rand_pos = rand_pos / 180; //Set it with in 210 pixel width
UXTH	R1, R0
MOVS	R0, #180
UDIV	R0, R1, R0
STRH	R0, [R2, #0]
;tetris_movements.c,104 :: 		}
L_end_Random:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Random
