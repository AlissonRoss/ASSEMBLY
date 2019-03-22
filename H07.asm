; Alisson Leiva Salazar
; 11/29/18
; H07
; This program uses a loop to calculate the first n values of the Fibonacci sequence


include irvine32.inc

.data					;BYTE: Array of Bytes
n               DWORD   ?
first           DWORD   0
second          DWORD   0
next            DWORD   1

termCt          DWORD   0

inputMsg        BYTE    "Enter the number of terms : ", 0
firstMsg	BYTE    "First, ", 0
outputMsg	BYTE    " terms of Fibonacci series are: ", 0


.code
main            proc                    ; START
		lea     EDX, inputMsg
		call    WriteString     ; Print "Enter the number of terms: "
; WriteString uses EDX to point to a memory location of a String
; ReadDec and WriteDec both use the EAX register to hold an int value

		call	ReadDec
		mov     n, EAX	        ; Input n
                
                lea     EDX, firstMsg
                call    WriteString     ; print "First "

                mov     EAX, n          ; print n
                call    WriteDec

                lea     EDX, outputMsg
                call    WriteString     ; print " terms of Fibonacci series are: "

                mov     termCt, EAX     ; termCt = n
                                        
label1:                                 ; Do
                mov     EAX, next       ;       print next
                call    WriteDec
		call	CRLF	

                mov     EBX, second      ;       first= second
                mov     first, EBX

                mov     EBX, next       ;       second = next
                mov     second, EBX                
                
                mov     EAX, first	;       next = first + second
                add     EAX, second
                mov     next, EAX
                
                dec     termCt		; While --termCt > 0
                cmp     termCt, 0
                jg	label1
; if termCt is greater than 0, then jump back
                
                exit			; Stop
main		endp
		end main