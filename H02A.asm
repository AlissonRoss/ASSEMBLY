; Alisson Leiva Salazar
; 9/11/18
; H02A
; This program adds two values. 

include irvine32.inc

.data						;BYTE: Array of Bytes
dig1Msg         BYTE    "Enter first digit: ", 0
dig2Msg         BYTE    "Enter second digit: ", 0
sumMsg          BYTE    "Sum = ",0
dig1            BYTE    ?                               
dig2            BYTE    ?
digSum          BYTE    ?

.code
main            proc                            ; start
                
                lea             EDX, dig1Msg
                call            WriteString     ; print "Enter first digit" ACTION

                call            ReadDec         ; Reads Decimal from Input
                mov             dig1, AL        ; Move input dig1 to AL                        
                
                lea             EDX, dig2Msg
                call            WriteString     ; print "Enter second digit"

                call            ReadDec                                 
                mov             dig2, AL        ; Copy AL reg into dig2

; When printing, move the value into the register before calling
; When getting input, call and then move into register

                mov             AL, dig1        ; move AL reg to dig1
                add             AL, dig2        ; add dig2 to AL
                mov             digSum, AL      ; move result into digSum

                lea             EDX, sumMsg     ; move address of message into EDX
                call            WriteString     ; print "Sum = "

                movzx           EAX, digSum     ;print the sum of the two values
                call            WriteDec                               

                exit
main            endp
                end main