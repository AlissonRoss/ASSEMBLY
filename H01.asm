;Alisson Leiva Salazar
;9/6/18
;H01
;This Program prints Hello World

include irvine32.inc

CR =    13					; CHARACTER TERM LINING
LF EQU	10					; ASCII CODE PER CHARACTER

;Question: What is the difference between = and EQU?
;Answer: The EQU pseudo-op defines a constant that cannot be changed unlike =.

msg             TEXTEQU         <"Hello World", CR, LF, 0>

;Question: What about TEXTEQU?
;Answer:   TEXTEQU creates a text macro.

.data
helloMsg	BYTE    msg	

.code
main	        PROC				; Start
        	call	Clrscr
	
	        mov	EDX, OFFSET helloMsg	; Print "Hello World"
	        call	WriteString

	        call	CRLF			; CALL TO MAKE AN EXTRA NEW LINE
        	
                exit				; Stop
main		ENDP

                END     main