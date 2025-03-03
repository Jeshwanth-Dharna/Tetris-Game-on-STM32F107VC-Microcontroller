tetris_driver_InitializeTouchPanel:
;tetris_driver.c,36 :: 		static void InitializeTouchPanel() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;tetris_driver.c,37 :: 		TFT_Init_ILI9341_8bit(320, 240);
MOVS	R1, #240
MOVW	R0, #320
BL	_TFT_Init_ILI9341_8bit+0
;tetris_driver.c,39 :: 		}
L_end_InitializeTouchPanel:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of tetris_driver_InitializeTouchPanel
tetris_driver_InitializeObjects:
;tetris_driver.c,49 :: 		static void InitializeObjects() {
;tetris_driver.c,50 :: 		Screen1.Color                     = 0x5AEB;
MOVW	R1, #23275
MOVW	R0, #lo_addr(_Screen1+0)
MOVT	R0, #hi_addr(_Screen1+0)
STRH	R1, [R0, #0]
;tetris_driver.c,51 :: 		Screen1.Width                     = 320;
MOVW	R1, #320
MOVW	R0, #lo_addr(_Screen1+2)
MOVT	R0, #hi_addr(_Screen1+2)
STRH	R1, [R0, #0]
;tetris_driver.c,52 :: 		Screen1.Height                    = 240;
MOVS	R1, #240
MOVW	R0, #lo_addr(_Screen1+4)
MOVT	R0, #hi_addr(_Screen1+4)
STRH	R1, [R0, #0]
;tetris_driver.c,53 :: 		Screen1.ObjectsCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen1+6)
MOVT	R0, #hi_addr(_Screen1+6)
STRH	R1, [R0, #0]
;tetris_driver.c,55 :: 		}
L_end_InitializeObjects:
BX	LR
; end of tetris_driver_InitializeObjects
tetris_driver_IsInsideObject:
;tetris_driver.c,57 :: 		static char IsInsideObject (unsigned int X, unsigned int Y, unsigned int Left, unsigned int Top, unsigned int Width, unsigned int Height) { // static
; Top start address is: 12 (R3)
; Left start address is: 8 (R2)
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
; Top end address is: 12 (R3)
; Left end address is: 8 (R2)
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
; Left start address is: 8 (R2)
; Top start address is: 12 (R3)
; Width start address is: 20 (R5)
LDRH	R5, [SP, #0]
; Height start address is: 24 (R6)
LDRH	R6, [SP, #4]
;tetris_driver.c,58 :: 		if ( (Left<= X) && (Left+ Width - 1 >= X) &&
CMP	R2, R0
IT	HI
BHI	L_tetris_driver_IsInsideObject14
ADDS	R4, R2, R5
UXTH	R4, R4
; Left end address is: 8 (R2)
; Width end address is: 20 (R5)
SUBS	R4, R4, #1
UXTH	R4, R4
CMP	R4, R0
IT	CC
BCC	L_tetris_driver_IsInsideObject13
; X end address is: 0 (R0)
;tetris_driver.c,59 :: 		(Top <= Y)  && (Top + Height - 1 >= Y) )
CMP	R3, R1
IT	HI
BHI	L_tetris_driver_IsInsideObject12
ADDS	R4, R3, R6
UXTH	R4, R4
; Top end address is: 12 (R3)
; Height end address is: 24 (R6)
SUBS	R4, R4, #1
UXTH	R4, R4
CMP	R4, R1
IT	CC
BCC	L_tetris_driver_IsInsideObject11
; Y end address is: 4 (R1)
L_tetris_driver_IsInsideObject10:
;tetris_driver.c,60 :: 		return 1;
MOVS	R0, #1
IT	AL
BAL	L_end_IsInsideObject
;tetris_driver.c,58 :: 		if ( (Left<= X) && (Left+ Width - 1 >= X) &&
L_tetris_driver_IsInsideObject14:
L_tetris_driver_IsInsideObject13:
;tetris_driver.c,59 :: 		(Top <= Y)  && (Top + Height - 1 >= Y) )
L_tetris_driver_IsInsideObject12:
L_tetris_driver_IsInsideObject11:
;tetris_driver.c,62 :: 		return 0;
MOVS	R0, #0
;tetris_driver.c,63 :: 		}
L_end_IsInsideObject:
BX	LR
; end of tetris_driver_IsInsideObject
_DrawScreen:
;tetris_driver.c,68 :: 		void DrawScreen(TScreen *aScreen) {
; aScreen start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; aScreen end address is: 0 (R0)
; aScreen start address is: 0 (R0)
;tetris_driver.c,72 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;tetris_driver.c,73 :: 		order = 0;
MOVS	R1, #0
STRH	R1, [SP, #4]
;tetris_driver.c,74 :: 		CurrentScreen = aScreen;
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
STR	R0, [R1, #0]
;tetris_driver.c,76 :: 		if ((display_width != CurrentScreen->Width) || (display_height != CurrentScreen->Height)) {
ADDS	R1, R0, #2
; aScreen end address is: 0 (R0)
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_width+0)
MOVT	R1, #hi_addr(_display_width+0)
LDRH	R1, [R1, #0]
CMP	R1, R2
IT	NE
BNE	L__DrawScreen17
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, R1, #4
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_height+0)
MOVT	R1, #hi_addr(_display_height+0)
LDRH	R1, [R1, #0]
CMP	R1, R2
IT	NE
BNE	L__DrawScreen16
IT	AL
BAL	L_DrawScreen6
L__DrawScreen17:
L__DrawScreen16:
;tetris_driver.c,77 :: 		save_bled = TFT_BLED;
MOVW	R2, #lo_addr(GPIOE_ODR+0)
MOVT	R2, #hi_addr(GPIOE_ODR+0)
_LX	[R2, ByteOffset(GPIOE_ODR+0)]
STRB	R1, [SP, #6]
;tetris_driver.c,78 :: 		TFT_BLED           = 0;
MOVS	R1, #0
SXTB	R1, R1
_SX	[R2, ByteOffset(GPIOE_ODR+0)]
;tetris_driver.c,79 :: 		TFT_Init_ILI9341_8bit(CurrentScreen->Width, CurrentScreen->Height);
MOVW	R3, #lo_addr(_CurrentScreen+0)
MOVT	R3, #hi_addr(_CurrentScreen+0)
LDR	R1, [R3, #0]
ADDS	R1, R1, #4
LDRH	R1, [R1, #0]
UXTH	R2, R1
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R1, R1, #2
LDRH	R1, [R1, #0]
UXTH	R0, R1
UXTH	R1, R2
BL	_TFT_Init_ILI9341_8bit+0
;tetris_driver.c,80 :: 		TFT_Fill_Screen(CurrentScreen->Color);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
LDRH	R1, [R1, #0]
UXTH	R0, R1
BL	_TFT_Fill_Screen+0
;tetris_driver.c,81 :: 		display_width = CurrentScreen->Width;
MOVW	R3, #lo_addr(_CurrentScreen+0)
MOVT	R3, #hi_addr(_CurrentScreen+0)
LDR	R1, [R3, #0]
ADDS	R1, R1, #2
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_width+0)
MOVT	R1, #hi_addr(_display_width+0)
STRH	R2, [R1, #0]
;tetris_driver.c,82 :: 		display_height = CurrentScreen->Height;
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R1, R1, #4
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_height+0)
MOVT	R1, #hi_addr(_display_height+0)
STRH	R2, [R1, #0]
;tetris_driver.c,83 :: 		TFT_BLED           = save_bled;
LDRB	R2, [SP, #6]
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
_SX	[R1, ByteOffset(GPIOE_ODR+0)]
;tetris_driver.c,84 :: 		}
IT	AL
BAL	L_DrawScreen7
L_DrawScreen6:
;tetris_driver.c,86 :: 		TFT_Fill_Screen(CurrentScreen->Color);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
LDRH	R1, [R1, #0]
UXTH	R0, R1
BL	_TFT_Fill_Screen+0
L_DrawScreen7:
;tetris_driver.c,89 :: 		while (order < CurrentScreen->ObjectsCount) {
L_DrawScreen8:
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, R1, #6
LDRH	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen9
;tetris_driver.c,90 :: 		}
IT	AL
BAL	L_DrawScreen8
L_DrawScreen9:
;tetris_driver.c,91 :: 		}
L_end_DrawScreen:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _DrawScreen
_Init_MCU:
;tetris_driver.c,93 :: 		void Init_MCU() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;tetris_driver.c,94 :: 		GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_9);
MOVW	R1, #512
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;tetris_driver.c,95 :: 		TFT_BLED = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
_SX	[R0, ByteOffset(GPIOE_ODR+0)]
;tetris_driver.c,96 :: 		TFT_Set_Default_Mode();
BL	_TFT_Set_Default_Mode+0
;tetris_driver.c,97 :: 		TP_TFT_Set_Default_Mode();
BL	_TP_TFT_Set_Default_Mode+0
;tetris_driver.c,98 :: 		}
L_end_Init_MCU:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Init_MCU
_Start_TP:
;tetris_driver.c,100 :: 		void Start_TP() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;tetris_driver.c,101 :: 		Init_MCU();
BL	_Init_MCU+0
;tetris_driver.c,103 :: 		InitializeTouchPanel();
BL	tetris_driver_InitializeTouchPanel+0
;tetris_driver.c,104 :: 		InitializeObjects();
BL	tetris_driver_InitializeObjects+0
;tetris_driver.c,105 :: 		display_width = Screen1.Width;
MOVW	R0, #lo_addr(_Screen1+2)
MOVT	R0, #hi_addr(_Screen1+2)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_display_width+0)
MOVT	R0, #hi_addr(_display_width+0)
STRH	R1, [R0, #0]
;tetris_driver.c,106 :: 		display_height = Screen1.Height;
MOVW	R0, #lo_addr(_Screen1+4)
MOVT	R0, #hi_addr(_Screen1+4)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_display_height+0)
MOVT	R0, #hi_addr(_display_height+0)
STRH	R1, [R0, #0]
;tetris_driver.c,107 :: 		DrawScreen(&Screen1);
MOVW	R0, #lo_addr(_Screen1+0)
MOVT	R0, #hi_addr(_Screen1+0)
BL	_DrawScreen+0
;tetris_driver.c,108 :: 		}
L_end_Start_TP:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Start_TP
