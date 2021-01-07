.MODEL SMALL
.DATA

PORTA  = 00H                                                ;Address of Port A
       PORTB  = 02H                                         ;Address of Port B
       PORTC  = 04H                                         ;Address of Port C
       CONTW  = 06H                                         ;Address of control word

.CODE
.STARTUP
MOV SI,0



MAIN PROC

MAIN ENDP

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
