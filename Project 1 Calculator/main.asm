INCLUDE Irvine32.inc
includelib Irvine32.lib

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, deExitCode:DWORD

.data
	introduction db "x86 assembly calculator written by Husenjan.",0
	menuItem1 db "1. Add.",0
	menuItem2 db "2. Multiply.",0
	menuItem3 db "3. Substract.",0
	menuItem4 db "4. Division.",0
	menuItem5 db "5. Quit.",0
	menuChoose db "Choose one: ", 0
	menuAnswer DWORD ?
	menuText1 db "Number 1: ",0
	menuText2 db "Number 2: ",0
	menuSum db "Sum: ",0
	QuitMessage db "Exiting Program...", 0

.code
main PROC
	call Clrscr
	mov edx, OFFSET introduction
	call WriteString
	call Crlf

	mov edx, OFFSET menuItem1
	call WriteString
	call Crlf

	mov edx, OFFSET menuItem2
	call WriteString
	call Crlf

	mov edx, OFFSET menuItem3
	call WriteString
	call Crlf

	mov edx, OFFSET menuItem4
	call WriteString
	call Crlf

	mov edx, OFFSET menuItem5
	call WriteString
	call Crlf

	mov edx, OFFSET menuChoose
	call WriteString
	call ReadInt
	
	cmp eax, 1
	je _add
	cmp eax, 2
	je _mult
	cmp eax, 3
	je _sub
	cmp eax, 4
	je _div
	cmp eax, 5
	je _exit
	jmp main

_add:
	mov edx, OFFSET menuText1
	call WriteString
	call ReadInt
	push eax

	mov edx, OFFSET menuText2
	call WriteString
	call ReadInt

	mov edx, [esp]
	add eax, edx

	mov edx, OFFSET menuSum
	call WriteString
	call WriteInt
	call Crlf
	
	add esp, 4

	mov eax, 2000
	call Delay

	jmp main
_mult:
	mov edx, OFFSET menuText1
	call WriteString
	call ReadInt
	push eax

	mov edx, OFFSET menuText2
	call WriteString
	call ReadInt

	mov ecx, [esp]
	mul ecx

	mov edx, OFFSET menuSum
	call WriteString
	call WriteInt
	call Crlf

	add esp, 4

	mov eax, 2000
	call Delay

	jmp main
_sub:
	mov edx, OFFSET menuText1
	call WriteString
	call ReadInt
	push eax

	mov edx, OFFSET menuText2
	call WriteString
	call ReadInt

	mov edx, [esp]
	sub eax, edx

	mov edx, OFFSET menuSum
	call WriteString
	call WriteInt
	call Crlf

	mov eax, 2000
	call Delay

	add esp, 4

	jmp main
_div:
	mov edx, OFFSET menuText1
	call WriteString
	call ReadInt
	push eax

	mov edx, OFFSET menuText2
	call WriteString
	call ReadInt

	xor edx, edx
	mov ebx, eax
	mov eax, [esp]
	div	ebx

	mov edx, OFFSET menuSum
	call WriteString
	call WriteInt
	call Crlf

	add esp, 4

	mov eax, 2000
	call Delay

	jmp main

_exit:
	mov edx, OFFSET QuitMessage
	call WriteString
	mov eax, 1500
	call Delay
	INVOKE ExitProcess, 0
main ENDP
END main