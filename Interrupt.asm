_TIMER3_ISR:
;Interrupt.c,20 :: 		void TIMER3_ISR() iv IVT_INT_TIM3 {
;Interrupt.c,21 :: 		TIM3_SR.UIF = 0;        // Reset UIF flag so next interrupt can be recognized when UIF is set
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_SR+0)
MOVT	R0, #hi_addr(TIM3_SR+0)
_SX	[R0, ByteOffset(TIM3_SR+0)]
;Interrupt.c,23 :: 		if(speed_counter == adcVal)
MOVW	R0, #lo_addr(_adcVal+0)
MOVT	R0, #hi_addr(_adcVal+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_speed_counter+0)
MOVT	R0, #hi_addr(_speed_counter+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L_TIMER3_ISR0
;Interrupt.c,25 :: 		variable_speed = variable_speed + 10;
MOVW	R1, #lo_addr(_variable_speed+0)
MOVT	R1, #hi_addr(_variable_speed+0)
LDRH	R0, [R1, #0]
ADDS	R0, #10
STRH	R0, [R1, #0]
;Interrupt.c,26 :: 		speed_counter = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_speed_counter+0)
MOVT	R0, #hi_addr(_speed_counter+0)
STRH	R1, [R0, #0]
;Interrupt.c,27 :: 		}
L_TIMER3_ISR0:
;Interrupt.c,28 :: 		speed_counter++;
MOVW	R1, #lo_addr(_speed_counter+0)
MOVT	R1, #hi_addr(_speed_counter+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;Interrupt.c,30 :: 		}
L_end_TIMER3_ISR:
BX	LR
; end of _TIMER3_ISR
_EXTIPD4:
;Interrupt.c,32 :: 		void EXTIPD4() iv IVT_INT_EXTI4 ics ICS_AUTO
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Interrupt.c,34 :: 		EXTI_PR.B4 = 1;                 // Clear pending interrupt flag for PD4
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
_SX	[R0, ByteOffset(EXTI_PR+0)]
;Interrupt.c,35 :: 		if(GPIOD_IDR.B4 == 0 && state_machine == 0)
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
_LX	[R0, ByteOffset(GPIOD_IDR+0)]
CMP	R0, #0
IT	NE
BNE	L__EXTIPD428
MOVW	R0, #lo_addr(_state_machine+0)
MOVT	R0, #hi_addr(_state_machine+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__EXTIPD427
L__EXTIPD426:
;Interrupt.c,37 :: 		button1_state = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_button1_state+0)
MOVT	R0, #hi_addr(_button1_state+0)
STRH	R1, [R0, #0]
;Interrupt.c,38 :: 		button2_state = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_button2_state+0)
MOVT	R0, #hi_addr(_button2_state+0)
STRH	R1, [R0, #0]
;Interrupt.c,39 :: 		button1();
BL	_button1+0
;Interrupt.c,40 :: 		}
IT	AL
BAL	L_EXTIPD44
;Interrupt.c,35 :: 		if(GPIOD_IDR.B4 == 0 && state_machine == 0)
L__EXTIPD428:
L__EXTIPD427:
;Interrupt.c,45 :: 		}
L_EXTIPD44:
;Interrupt.c,47 :: 		}
L_end_EXTIPD4:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _EXTIPD4
_EXTIPB5PA6:
;Interrupt.c,49 :: 		void EXTIPB5PA6() iv IVT_INT_EXTI9_5 ics ICS_AUTO
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Interrupt.c,51 :: 		EXTI_PR.B5 = 1;            // Clear pending interrupt flag for PB5
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
_SX	[R0, ByteOffset(EXTI_PR+0)]
;Interrupt.c,52 :: 		EXTI_PR.B6 = 1;           // Clear pending interrupt flag for PA6
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
_SX	[R0, ByteOffset(EXTI_PR+0)]
;Interrupt.c,55 :: 		if(GPIOB_IDR.B5 == 0 && state_machine == 0)
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
_LX	[R0, ByteOffset(GPIOB_IDR+0)]
CMP	R0, #0
IT	NE
BNE	L__EXTIPB5PA633
MOVW	R0, #lo_addr(_state_machine+0)
MOVT	R0, #hi_addr(_state_machine+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__EXTIPB5PA632
L__EXTIPB5PA631:
;Interrupt.c,57 :: 		button1_state = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_button1_state+0)
MOVT	R0, #hi_addr(_button1_state+0)
STRH	R1, [R0, #0]
;Interrupt.c,58 :: 		button2_state = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_button2_state+0)
MOVT	R0, #hi_addr(_button2_state+0)
STRH	R1, [R0, #0]
;Interrupt.c,59 :: 		button2();
BL	_button2+0
;Interrupt.c,55 :: 		if(GPIOB_IDR.B5 == 0 && state_machine == 0)
L__EXTIPB5PA633:
L__EXTIPB5PA632:
;Interrupt.c,61 :: 		if(GPIOB_IDR.B5 == 0 && state_machine == 1)
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
_LX	[R0, ByteOffset(GPIOB_IDR+0)]
CMP	R0, #0
IT	NE
BNE	L__EXTIPB5PA635
MOVW	R0, #lo_addr(_state_machine+0)
MOVT	R0, #hi_addr(_state_machine+0)
LDRH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__EXTIPB5PA634
L__EXTIPB5PA630:
;Interrupt.c,63 :: 		Down();
BL	_Down+0
;Interrupt.c,64 :: 		}
IT	AL
BAL	L_EXTIPB5PA611
;Interrupt.c,61 :: 		if(GPIOB_IDR.B5 == 0 && state_machine == 1)
L__EXTIPB5PA635:
L__EXTIPB5PA634:
;Interrupt.c,65 :: 		else if(GPIOA_IDR.B6 == 0 && state_machine == 1)
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
_LX	[R0, ByteOffset(GPIOA_IDR+0)]
CMP	R0, #0
IT	NE
BNE	L__EXTIPB5PA637
MOVW	R0, #lo_addr(_state_machine+0)
MOVT	R0, #hi_addr(_state_machine+0)
LDRH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__EXTIPB5PA636
L__EXTIPB5PA629:
;Interrupt.c,67 :: 		Right();
BL	_Right+0
;Interrupt.c,68 :: 		}
IT	AL
BAL	L_EXTIPB5PA615
;Interrupt.c,65 :: 		else if(GPIOA_IDR.B6 == 0 && state_machine == 1)
L__EXTIPB5PA637:
L__EXTIPB5PA636:
;Interrupt.c,73 :: 		}
L_EXTIPB5PA615:
L_EXTIPB5PA611:
;Interrupt.c,74 :: 		}
L_end_EXTIPB5PA6:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _EXTIPB5PA6
_EXTIPD2:
;Interrupt.c,76 :: 		void EXTIPD2() iv IVT_INT_EXTI2 ics ICS_AUTO
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Interrupt.c,78 :: 		EXTI_PR.B2 = 1;                 // Clear pending interrupt flag for PD2
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
_SX	[R0, ByteOffset(EXTI_PR+0)]
;Interrupt.c,79 :: 		if(GPIOD_IDR.B2 == 0 && state_machine == 1)
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
_LX	[R0, ByteOffset(GPIOD_IDR+0)]
CMP	R0, #0
IT	NE
BNE	L__EXTIPD240
MOVW	R0, #lo_addr(_state_machine+0)
MOVT	R0, #hi_addr(_state_machine+0)
LDRH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__EXTIPD239
L__EXTIPD238:
;Interrupt.c,81 :: 		Left();
BL	_left+0
;Interrupt.c,82 :: 		}
IT	AL
BAL	L_EXTIPD219
;Interrupt.c,79 :: 		if(GPIOD_IDR.B2 == 0 && state_machine == 1)
L__EXTIPD240:
L__EXTIPD239:
;Interrupt.c,86 :: 		}
L_EXTIPD219:
;Interrupt.c,87 :: 		}
L_end_EXTIPD2:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _EXTIPD2
_EXTIPC13:
;Interrupt.c,89 :: 		void EXTIPC13() iv IVT_INT_EXTI15_10 ics ICS_AUTO
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Interrupt.c,91 :: 		EXTI_PR.B13 = 1;                 // Clear pending interrupt flag for PC13
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
_SX	[R0, ByteOffset(EXTI_PR+0)]
;Interrupt.c,92 :: 		if(GPIOC_IDR.B13 == 0 && button1_state == 1)
MOVW	R0, #lo_addr(GPIOC_IDR+0)
MOVT	R0, #hi_addr(GPIOC_IDR+0)
_LX	[R0, ByteOffset(GPIOC_IDR+0)]
CMP	R0, #0
IT	NE
BNE	L__EXTIPC1344
MOVW	R0, #lo_addr(_button1_state+0)
MOVT	R0, #hi_addr(_button1_state+0)
LDRH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__EXTIPC1343
L__EXTIPC1342:
;Interrupt.c,94 :: 		Game_Layout();
BL	_Game_Layout+0
;Interrupt.c,95 :: 		button1_state = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_button1_state+0)
MOVT	R0, #hi_addr(_button1_state+0)
STRH	R1, [R0, #0]
;Interrupt.c,96 :: 		state_machine = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_state_machine+0)
MOVT	R0, #hi_addr(_state_machine+0)
STRH	R1, [R0, #0]
;Interrupt.c,92 :: 		if(GPIOC_IDR.B13 == 0 && button1_state == 1)
L__EXTIPC1344:
L__EXTIPC1343:
;Interrupt.c,98 :: 		if(GPIOC_IDR.B13 == 0 && button2_state == 1)
MOVW	R0, #lo_addr(GPIOC_IDR+0)
MOVT	R0, #hi_addr(GPIOC_IDR+0)
_LX	[R0, ByteOffset(GPIOC_IDR+0)]
CMP	R0, #0
IT	NE
BNE	L__EXTIPC1346
MOVW	R0, #lo_addr(_button2_state+0)
MOVT	R0, #hi_addr(_button2_state+0)
LDRH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__EXTIPC1345
L__EXTIPC1341:
;Interrupt.c,100 :: 		HighScore_Screen();
BL	_HighScore_Screen+0
;Interrupt.c,101 :: 		button2_state = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_button2_state+0)
MOVT	R0, #hi_addr(_button2_state+0)
STRH	R1, [R0, #0]
;Interrupt.c,102 :: 		state_machine = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_state_machine+0)
MOVT	R0, #hi_addr(_state_machine+0)
STRH	R1, [R0, #0]
;Interrupt.c,98 :: 		if(GPIOC_IDR.B13 == 0 && button2_state == 1)
L__EXTIPC1346:
L__EXTIPC1345:
;Interrupt.c,104 :: 		}
L_end_EXTIPC13:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _EXTIPC13
