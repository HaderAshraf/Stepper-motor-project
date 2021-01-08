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
		
	START_FLAG DB  00000000B
	
	DISPLAY DB   01101101b
		DB   01110110b
		DB   01110001b



.CODE
.STARTUP

MOV AL,10000010B     ;PORTA & PORTB OUTPUT , PORTC INPUT , MODE 0
OUT CONTW,AL

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

ROTATE PROC                          ;ROTATE PROCEDURE make the rotation action by switching between steps in steps matrix
          MOV AL,ROTATION[SI]
          INC SI 
          CMP SI,8
          JNZ FINISH                 ;if we reach the final step go the first one again	
          MOV SI,0
      FINISH:
          OUT PORTA,AL               ;output the selected setp to port 'A' to rotate the motor 
          RET
 ROTATE ENDP 

CHAR_DISPLAY PROC
MOV DL,AL
MOV BX,0
MOV BL,START_FLAG
MOV AL,DISPLAY[BX]
OUT PORTC,AL
MOV AL,DL
RET
CHAR_DISPLAY ENDP

END
