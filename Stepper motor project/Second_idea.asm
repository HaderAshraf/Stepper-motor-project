.MODEL SMALL
.DATA 
      
       PORTA  = 00H                                         ;Address of Port A
       PORTB  = 02H                                         ;Address of Port B
       PORTC  = 04H                                         ;Address of Port C
       CONTW  = 06H                                         ;Address of Control Word


       DELAY_TIME DW 03FFH
       START_FLAG DB  00000000B
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

MOV AL,10010000B 
OUT CONTW,AL
MOV SI,0

MAIN :

   CMP START_FLAG,0
   JZ STOP  ; IF START FLAG =0 MAKE MOTOR STOP
   CALL ROTATE
   CALL DELAY 



  STOP:
   CALL READ_ADC
   CALL LINEAR_CONTROLLING




JMP MAIN

ROTATE PROC		;ROTATE PROCEDURE make the rotation action by switching between steps in steps matrix
   MOV AL,ROTATION[SI]
   INC SI 
   CMP SI,8
   JNZ FINISH		;if we reach the final step go the first one again
   MOV SI,0
   FINISH:
   OUT PORTC,AL		;output the selected setp to port 'C' to rotate the
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


READ_ADC PROC  			; READ THE ADC OUTPUT
	MOV AL,1		; MAKE WR PIN 1
	OUT PORTB,AL	
	MOV CX,00FFH
	D1:LOOP D1
	MOV AL,0
	OUT PORTB,AL	 	;MAKE WR PIN 0
	MOV AX,0
	IN AL,PORTA		; GET THE CHANGE IN OUTPUT OF ADC
 	RET
READ_ADC ENDP

LINEAR_CONTROLLING   PROC  		;change the delay_time linearly with the adc reading 
	   CMP AL,50                    ; if adc reading <=50 the stepper motor stops
	   JA L
	   MOV START_FLAG,0
	   JMP LL
	L:                              ; if adc reading >50 the motor's speed will change according to equation 
	   MOV START_FLAG,1
           
	   ;128-->07FE
	   ;255-->03FF
	   ;D=-8*ADC +3070 --> linear equation for the change in delay time according to adc reading 


	   MOV BX,-8	
	   MUL BX
	   ADD AX,3070

	   MOV DELAY_TIME,AX
	LL:
	      RET
LINEAR_CONTROLLING ENDP





end
