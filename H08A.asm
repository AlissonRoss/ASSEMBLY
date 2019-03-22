; Alisson Leiva Salazar
; 12/12/18
; H08A
; This program reverses the characters in a string.


include irvine32.inc

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
                
		dec	i			;i--
main1:						;Do
		mov	ESI, i
		mov	AL, strg[ESI]
		mov	ESI, j
		mov	copyStrg[ESI], AL

		dec	i
		inc	j

		cmp	i, 0			;while i > 0
		jnl	main1

		mov	ESI, j			;copyStrg[strgSize] = 0
		mov	copyStrg[ESI], 0

		lea	EDX, copyStrg		; Print copyStrg
		call	WriteString
		
                
                exit			; Stop
main		endp
		end main