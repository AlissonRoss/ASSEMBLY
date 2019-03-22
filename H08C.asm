; Alisson Leiva Salazar
; 12/12/18
; H08C
; This program capitalizes the string.

include irvine32.inc
include M07.txt

.data						;BYTE: Array of Bytes
strg            BYTE	21 DUP(?)
msg	        BYTE    "Enter a String: ", 13,10,0
strLen		DWORD	?
i		DWORD	?
copyStrg	BYTE	SIZEOF strg DUP(?)



.code
main            proc				; START
		lea     EDX, msg
		call    WriteString		; Print "Enter a String: "
; WriteString uses EDX to point to a memory location of a String
; ReadDec and WriteDec both use the EAX register to hold an int value

		mov	ECX, SIZEOF strg	; Input strg	
		lea	EDX, strg
		call	ReadString
		mov	strLen, EAX		; strLen = strgSize

		mov	BL, ' '			; prevChar = ' '

		mov	i, 0			; i = 0
label1:		mov	EAX, strLen		; while i <= strLen
		cmp	i, EAX			
		jnle	label2

		mov	ESI, i			;   char = strg[i]
		mov	AL, strg[ESI]
		
		iswspace BL			;   if iswspace(prevChar) && isalpha(char)
		jne	label3
		isalpha	AL			
		jne	label3
		toUpper	AL			;     char = toUpper(char)
label3:						;   EndIf

		mov	copyStrg[ESI], AL	;   copyStrg[i] = char
		mov	BL, AL			;   prevChar = char
		inc	i			;   i++
		jmp	label1
label2:						; ENDWHILE

		lea	EDX, copyStrg		; Print copyStrg
		call	WriteString
		
                exit				; Stop
main		endp
		end main