; Alisson Leiva Salazar
; 12/12/18
; H08B
; This program gets the input string and uppercases it.


include irvine32.inc
include M07.txt

.data						;BYTE: Array of Bytes
strg            BYTE	21 DUP(?)
msg	        BYTE    "Enter a String: ", 13,10,0
i		DWORD	?
copyStrg	BYTE	SIZEOF strg DUP(?)
j		DWORD	?



.code
main            proc				; START
		lea     EDX, msg
		call    WriteString		; Print "Enter a String: "
; WriteString uses EDX to point to a memory location of a String
; ReadDec and WriteDec both use the EAX register to hold an int value

		mov	ECX, SIZEOF strg	; Input strg	
		lea	EDX, strg
		call	ReadString
		mov	i, EAX			; i = strgSize

		mov	ESI, i			;copyStrg[i] = 0
		mov	copyStrg[ESI], 0

label1:		cmp	i, 0			; while i > 0
		jng	label2
		dec	i			; i--

		mov	ESI, i			; char = strg[i]
		mov	AL, strg[ESI]
		
		isalpha	AL			; if alpha(char)
		jne	label3
		toUpper	AL			; char = toUpper(char)
label3:						; EndIf

		mov	copyStrg[ESI], AL	; copyStrg[i] = char

		jmp	label1
label2:						;ENDWHILE

		lea	EDX, copyStrg		; Print copyStrg
		call	WriteString
		
                
                exit				; Stop
main		endp
		end main