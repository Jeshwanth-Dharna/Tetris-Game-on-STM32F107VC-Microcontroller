_main:
;tetris_main.c,28 :: 		void main() {
;tetris_main.c,30 :: 		Start_TP();
BL	_Start_TP+0
;tetris_main.c,31 :: 		joystick_configuration();
BL	_joystick_configuration+0
;tetris_main.c,32 :: 		External_Int_Configuration();
BL	_External_Int_Configuration+0
;tetris_main.c,33 :: 		AdcConfiguration();
BL	_AdcConfiguration+0
;tetris_main.c,34 :: 		Timer3IntConfiguration();
BL	_Timer3Intconfiguration+0
;tetris_main.c,36 :: 		Random();
BL	_Random+0
;tetris_main.c,38 :: 		Home_Screen();
BL	_Home_Screen+0
;tetris_main.c,40 :: 		while(1)
L_main0:
;tetris_main.c,42 :: 		if(state_machine == 1)
MOVW	R0, #lo_addr(_state_machine+0)
MOVT	R0, #hi_addr(_state_machine+0)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_main2
;tetris_main.c,44 :: 		Game_Field();
BL	_Game_Field+0
;tetris_main.c,45 :: 		}
L_main2:
;tetris_main.c,47 :: 		adcVal = getAdcReading();
BL	_getAdcReading+0
MOVW	R1, #lo_addr(_adcval+0)
MOVT	R1, #hi_addr(_adcval+0)
STRH	R0, [R1, #0]
;tetris_main.c,48 :: 		delay_ms(500);
MOVW	R7, #36223
MOVT	R7, #91
NOP
NOP
L_main3:
SUBS	R7, R7, #1
BNE	L_main3
NOP
NOP
NOP
;tetris_main.c,49 :: 		}
IT	AL
BAL	L_main0
;tetris_main.c,51 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
