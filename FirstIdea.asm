.MODEL SMALL
.DATA

       PORTA  = 00H                                         ;Address of Port A
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
		
	START_FLAG DB  00000000B				;Initializing START_FLAG
	
	DISPLAY DB   01101101b                             	;Display matrix for seven segment
		DB   01110110b
		DB   01110001b

.CODE
.STARTUP

MOV AL,10000010B     ;PORT A & PORT C OUTPUT , PORT B INPUT , MODE 0
OUT CONTW,AL
CALL CHAR_DISPLAY    ;Display 'S' char at the beginning START_FLAG=0
MOV SI,0

MAIN:
CMP START_FLAG,0	;check the stop condition
JZ STOP			
CALL ROTATE		; rotate one step
CALL DELAY 
STOP:   
CALL TEST_SWITCHES	;check the input switches
JMP MAIN		;loop for ever

HALF_SPEED PROC			;Defining Motor HALF_SPEED Function
	 MOV START_FLAG,1
	 CALL CHAR_DISPLAY	;Display 'H' Char
	 MOV BX,07FEH
	 MOV DELAY_TIME,BX
	 RET
HALF_SPEED ENDP

FULL_SPEED PROC			;Defining Motor FULL_SPEED Function
	 MOV START_FLAG,2
	 CALL CHAR_DISPLAY	;Display 'F' Char 
	 MOV BX,03FFH
	 MOV DELAY_TIME,BX
	 RET
FULL_SPEED ENDP

STOPING PROC			;Defining STOPING Function
	 MOV START_FLAG,0
	 CALL CHAR_DISPLAY	;Display 'S' Char
	 RET
STOPING ENDP

DELAY PROC			;Delay specific time depends on DELAY_TIME variable					
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

TEST_SWITCHES PROC    	             ;check the input switches if it is half speed , full speed or stop switch
IN AL,PORTB

TEST AL,00000001B 		      ;check if the half speed switch has been pressed 
JNZ LL 	
CALL HALF_SPEED
LL:

TEST AL,00000010B		      ;check if the full speed switch has been pressed 
JNZ LLL
CALL FULL_SPEED
LLL:

TEST AL,00000100B		     ;check if the stop switch has been pressed 
JNZ LLLL
CALL STOPING
LLLL:
RET
TEST_SWITCHES ENDP 

CHAR_DISPLAY PROC                   ;display (s) for stop or (f) for full speed or (h) for half speed
MOV DL,AL
MOV BX,0
MOV BL,START_FLAG
MOV AL,DISPLAY[BX]
OUT PORTC,AL
MOV AL,DL
RET
CHAR_DISPLAY ENDP

END
