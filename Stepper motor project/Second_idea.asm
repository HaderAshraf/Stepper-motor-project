.MODEL SMALL
.DATA 
      
       PORTA  = 00H                                         ;Address of Port A
       PORTB  = 02H                                         ;Address of Port B
       PORTC  = 04H                                         ;Address of Port C
       CONTW  = 06H                                         ;Address of Control Word


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


DELAY PROC
	MOV BX, CX
	MOV CX, DELAY_TIME
     delay1:
	loop delay1
	MOV CX, BX
	RET
DELAY ENDP


READ_ADC PROC
	MOV AL,1
	OUT PORTB,AL
	MOV CX,00FFH
	D1:LOOP D1
	MOV AL,0
	OUT PORTB,AL   
	IN AL,PORTA
 	RET
READ_ADC ENDP







end
