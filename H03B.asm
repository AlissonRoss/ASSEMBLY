; Alisson Leiva Salazar
; 9/24/18
; H03B
; This program prints the largest of three values. 

include irvine32.inc

.data					;BYTE: Array of Bytes
val1Msg         BYTE    "Enter first number: ", 0
val2Msg         BYTE    "Enter second number: ", 0
val3Msg         BYTE    "Enter third number: ", 0
largerMsg	BYTE	"Larger Number is ", 0
val1            BYTE    ?                               
val2            BYTE    ?
val3		BYTE	?


.code
main            proc                    ; start
                
		lea     EDX, val1Msg
		call    WriteString     ; print "Enter first number: " ACTION

		call    ReadDec         ; Reads Decimal from Input
		mov     val1, AL        ; Move input val1 to AL                        
                
		lea     EDX, val2Msg
		call    WriteString     ; print "Enter second number: "

		call    ReadDec                                 
		mov     val2, AL        ; Copy AL reg into val2

		lea     EDX, val1Msg
		call    WriteString     ; print "Enter third number: " 

		call    ReadDec         ; Reads Decimal from Input
		mov     val3, AL        ; Move input val3 to AL 

		lea	EDX, largerMsg	; print "Larger Number is "
		call	WriteString

		mov	AL, val1
		cmp	AL, val2	; if val1 is larger
		ja	L1		; then

		mov	BL, val2	; else
		jmp	L2

L1:		mov	BL, val1
                
;compare the largest num against the third num
L2:
		cmp	val3, BL	;if val3 < min(val1, val2)
		jb	L3
		mov	BL, val3	;then
                
;print the largest value (BL)
L3:
                movzx	EAX, BL
		call    WriteDec        ; print larger val
		call	CRLF		; new line feed

		exit
main		endp
		end main