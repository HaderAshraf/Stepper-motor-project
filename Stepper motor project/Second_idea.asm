.MODEL SMALL
.DATA 

       DELAY_TIME DW 03FFH

       ROTATION DB   00000001b				    ;Complete rotation matrix
		DB   00000011b
		DB   00000010b
		DB   00000110b
		DB   00000100b
		DB   00001100b
		DB   00001000b
		DB   00001001b





.code
.startup




MAIN:

DELAY PROC
	MOV BX, CX
	MOV CX, DELAY_TIME
     delay1:
	loop delay1
	MOV CX, BX
	RET
DELAY ENDP



JMP MAIN


ROTATE PROC
   MOV AL,ROTATION[SI]
   INC SI 
   CMP SI,8
   JNZ FINISH
   MOV SI,0
   FINISH:
   OUT PORTC,AL
   RET
   ROTATE ENDP











end
