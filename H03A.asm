; Alisson Leiva Salazar
; 9/18/18
; H03A
; This program reads two values and prints the larger one of the two. 

include irvine32.inc

.data						;BYTE: Array of Bytes
val1Msg         BYTE    "Enter first number: ", 0
val2Msg         BYTE    "Enter second number: ", 0
largerMsg		BYTE	"Larger Number is ",0
val1            BYTE    ?                               
val2            BYTE    ?


.code
main            proc                            ; start
                
                lea             EDX, val1Msg
                call            WriteString     ; print "Enter first number: " ACTION

                call            ReadDec         ; Reads Decimal from Input
                mov             val1, AL        ; Move input val1 to AL                        
                
                lea             EDX, val2Msg
                call            WriteString     ; print "Enter second number: "

                call            ReadDec                                 
                mov             val2, AL        ; Copy AL reg into val2

				lea				EDX, largerMsg	; print largerMsg
				call			WriteString

				mov				AL, val1
				mov				AH, val2
				cmp				AL, AH			; compare both values
				ja				val1Larger		; if val1 is larger
				jmp				val2Larger		; jmp if val2 is larger

; When printing, move the value into the register before calling
; When getting input, call and then move into register
				val1Larger:
                movzx           EAX, val1       ; move val1 to EAX
				jmp				PrintVal
                
				val2Larger:
                movzx           EAX, val2		; move larger val
                
				PrintVal:
                
                call            WriteDec        ; print larger val from EAX
				call			CRLF			; new line feed

                exit
main            endp
                end main