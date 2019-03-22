; Alisson Leiva Salazar
; 11/29/18
; H06
; This program reads and prints the largest five numbers


include irvine32.inc
CR		EQU	13
LF		EQU	10
.data					;BYTE: Array of Bytes
inNumMsg	BYTE	"Enter five numbers:", CR, LF, LF, 0
num		DWORD	?
numCt		BYTE	?
largeNum	DWORD	?
largeMsg	BYTE	"Largest = ", 0


.code
main            proc                    ; START
			call	Clrscr

		lea	EDX, inNumMsg		; Print "Enter five numbers:"
		call	WriteString		

		call	ReadDec			; Input num
		mov	num, EAX

		mov	EAX, num		; largeNum = num
		mov	largeNum, EAX

		mov	numCt, 1		; numCt = 1
main1:		cmp	numCt, 5 		; WHILE numCt < 5
		jnl	main2
		
		call	ReadDec			;   Input num
		mov	num, EAX

		
		mov	EAX, num		;   IF num > largeNum
		cmp	EAX, largeNum
		jng	main3
		
		mov	EAX, num		;     THEN largeNum = num
		mov	largeNum, EAX
main3:						;   ENDIF

		inc	numCt			;   numCt++
		jmp	main1
main2:						; ENDWHILE
		lea	EDX, largeMsg		; Print "Largest = ", largeNum
		call	WriteString
		mov	EAX, largeNum
		call	WriteDec

		call	CRLF
		exit				;Stop
main		ENDP
		END	main
