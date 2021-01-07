.MODEL SMALL
.DATA

PORTA  = 00H                                                ;Address of Port A
       PORTB  = 02H                                         ;Address of Port B
       PORTC  = 04H                                         ;Address of Port C
       CONTW  = 06H                                         ;Address of control word
      DELAY_TIME DW 06FFH
      ROTATION DB   00000001b				    ;Complete rotation matrix 8 steps
		DB   00000011b
		DB   00000010b
		DB   00000110b
		DB   00000100b
		DB   00001100b
		DB   00001000b
		DB   00001001b




.CODE
.STARTUP
MOV SI,0



MAIN PROC

MAIN ENDP

DELAY PROC								
	 MOV BX, CX
	 MOV CX, DELAY_TIME
      delay1:
	 loop delay1
	 MOV CX, BX
	 RET
DELAY ENDP

ROTATE PROC
          MOV AL,ROTATION[SI]
          INC SI 
          CMP SI,8
          JNZ FINISH
          MOV SI,0
      FINISH:
          OUT PORTA,AL
          RET
 ROTATE ENDP 




END
