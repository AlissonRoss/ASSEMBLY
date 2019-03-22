; Alisson Leiva Salazar
; 10/24/18
; H05B
; This program prints the largest of three values. 

include irvine32.inc

.data					;BYTE: Array of Bytes
curYear		DWORD	2018
curMonth	DWORD	9
curDay		DWORD	30

yearMsg         BYTE    "Enter the year of your birth : ", 0
monthMsg	BYTE    "Enter the month of your birth : ", 0
dayMsg		BYTE    "Enter the day of your birth : ", 0
outMsg1		BYTE	"You are ", 0
outMsg2		BYTE	" years old", 0
lessThanMsg	BYTE	"You are less than 1 year old.", 0
outMsgHappy	BYTE	", Happy Birthday!", 0
notBornMsg	BYTE	"you haven't been born yet", 0
tooOldMsg	BYTE	"You are too old. Thank you for using my program.",0

year		DWORD	?
month		DWORD	?
day		DWORD	?
age		DWORD	?

.code
main            proc                    ; start
		lea     EDX, yearMsg
		call    WriteString     ; Print "Enter birth year: "
; WriteString uses EDX to point to a memory location of a String
; ReadDec and WriteDec both use the EAX register to hold an int value

		call	ReadDec
		mov     year, EAX	; Input Year

L0:		mov	EAX, year	; WHILE	
		cmp	EAX, 0
		je	L8

		cmp	EAX, curYear	; IF year = curYear THEN
		jne	L1		
; If AL and curYear not equal, then skip the lessThanMsg instructions		
		lea	EDX, lessThanMsg;	Print "you are less than 1 year old."
		call	WriteString

L1:					; ENDIF
		cmp	EAX, curYear	; IF year != curYear THEN
		je	L2 
		
		lea	EDX, monthMsg	;	Print "Enter birth month: "
		call	WriteString

		call	ReadDec
		mov	month, EAX	;	Input month
					
		mov	EBX, curYear	;	age = curYear - year
		sub	EBX, year
		mov	age, EBX	

		cmp	EAX, curMonth	;	IF month > curMonth THEN
		jbe	L3

		mov	EAX, age	;		age = age - 1
		sub	EAX, 1
		mov	age, EAX

		lea	EDX, outMsg1	;		Print "you are "; age; " years old."
		call	WriteString
		mov	EAX, age
		call	WriteDec
		lea	EDX, outMsg2
		call	WriteString
		jmp	L4
L3:					;	ELSE
		cmp	EAX, curMonth	;		IF month < curMonth THEN
		jae	L5
		lea	EDX, outMsg1	;			Print "you are "; age; " years old."
		call	WriteString
		mov	EAX, age
		call	WriteDec
		lea	EDX, outMsg2
		call	WriteString
		jmp	L4
L5:					;		ELSE
		
		lea	EDX, dayMsg	;			Print "Enter birth day: "
		call	WriteString

		call	ReadDec		;			Input day
		mov	day, EAX

		cmp	EAX, curDay	;			IF day > curDay THEN
		jbe	L6
		mov	EBX, age	;				age  = age - 1
		sub	EBX, 1
		mov	age, EBX

		lea	EDX, outMsg1	;				Print "you are "; age; " years old."
		call	WriteString
		mov	EAX, age
		call	WriteDec
		lea	EDX, outMsg2
		call	WriteString
		jmp	L4
L6:					;			ELSE

		mov	EAX, day	;				IF day < curDay THEN
		cmp	EAX, curDay
		jae	L7
		
		lea	EDX, outMsg1	;				Print "you are "; age; " years old."
		call	WriteString
		mov	EAX, age
		call	WriteDec
		lea	EDX, outMsg2
		call	WriteString
		jmp	L4;
L7:					;				ELSE
		lea	EDX, outMsg1	;					Print "you are "; age; "years old, Happy Birthday!"
		call	WriteString
		mov	EAX, age
		call	WriteDec
		lea	EDX, outMsg2
		call	WriteString
		lea	EDX, outMsgHappy
		call	WriteString
		jmp	L4
					;				ENDIF
					;			ENDIF
					;		ENDIF
					;	ENDIF
L2:					;ELSE
		lea	EDX, notBornMsg	;	Print "you haven't been born yet."
		call	WriteString
L4:					;ENDIF

		call	CRLF

		lea     EDX, yearMsg
		call    WriteString     ; Print "Enter birth year: "
		call	ReadDec
		mov     year, EAX	; Input Year
		jmp	L0
L8:					; endWhile
		lea	EDX, tooOldMsg
		call	WriteString
		

		exit
main		endp			;stop
		end main