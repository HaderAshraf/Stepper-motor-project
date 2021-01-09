.MODEL SMALL
.DATA 

      DELAY_TIME DW 03FFH


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














end
