; Alisson Leiva Salazar
; 9/11/18
; H02B
; This program adds two values. 

include irvine32.inc

CR              EQU     13 
LF              EQU     10 
.data   
                                                        ; BYTE: Array of Bytes
currentYear     DWORD   2018
yearMsg         BYTE    "Enter a year: ", 0
year            DWORD    ?
yearCountMsg    BYTE    " years have passed", CR, LF, 0

.code
main            proc                                    ; start
                
                lea             EDX, yearMsg            ; move address of message
                call            WriteString             ; print "Enter a year: "

                call            ReadDec                 ; Reads Decimal from Input
                mov             year, EAX               ; Move input year to EAX            
                call            CRLF                    ; New Line
                mov             EAX, currentYear        ; Move currentYear to EAX
                sub             EAX, year               ; Subtract year from EAX

                call            WriteDec                ; print the difference
                                                                      
                 
                lea             EDX, yearCountMsg            
                call            WriteString                               

                call            CRLF 
                exit
main            endp
                end main