; Alisson Leiva Salazar
; 9/30/18
; H04
; This program inputs two hex digits and outputs the sum. 

include irvine32.inc

.data
hex1Msg	BYTE	"Enter first digit: ", 0
hex2Msg	BYTE	"Enter second digit: ", 0
hexSumMsg	BYTE	"Hex sum = ", 0
hexDig1	BYTE	?
hexDig2	BYTE	?
hexSum		BYTE	?
			
.code
main		proc			;start
		lea     EDX, hex1Msg
		call    WriteString     ; Print "Enter first digit: "

		call	ReadHex		; Input hexDig1
		mov	hexDig1, AL

		lea     EDX, hex2Msg
		call    WriteString     ; Print "Enter second digit: "

		call	ReadHex		; Input hexDig2
		mov	hexDig2, AL

		mov	AL, hexDig1	;hexSum = hexDig1 + hexDig2
		add	AL, hexDig2
		mov	hexSum, AL

		lea     EDX, hexSumMsg
		call    WriteString     ; Print "Hex sum = "
		movzx	EAX, hexSum	; Print hexSum
		call	WriteHex

		call	CRLF

		exit
main		endp			;stop
		end main