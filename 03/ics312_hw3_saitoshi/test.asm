%include "asm_io.inc"

segment .data
	cmd1		db	"Enter a 3-character lower-case string: ", 0
	cmd2		db	"Enter a 4-character string: ", 0
	output	dd	"The encoded string is:", 0


segment .bss
	string1		resd     1	; first inputted string
	string2		resd     1	; second inputted string



segment .text
        global  asm_main

asm_main:
	enter	0,0			; setup
	pusha				; setup

  mov eax, cmd1 ; move eax to cmd1
  call print_string
  mov ebx, string1

  call read_char
  mov [ebx] , al ; move the char into ebx
  inc ebx ; increment ebx

  call read_char ; read in second char
  mov [ebx] , al
  inc ebx

  call read_char ; read in the third char
  mov [ebx], al

  call read_char

  mov eax, cmd2 ; point eax to the next command
  call print_string
  mov ecx, string2 ; have ecx point to the next input

  call read_char
  mov [ecx], al
  inc ecx

  call read_char
  mov [ecx], al
  inc ecx

  call read_char
  mov [ecx], al
  inc ecx

  call read_char
  mov [ecx], al

  call read_char

  mov al, [ecx]
  call print_char


  sub ebx, 2 ; ebx = ebx - 2 ;string1[0]
  mov al, [ebx] ;
  sub al, 20H ; make it upper case
  mov [output], al
  mov [output], al

  dec ecx ; ecx = ecx - 1
  mov al, [ecx] ; move a byte of ecx
  mov [output], al

  inc ebx ; ebx = ebx + 1
  mov al, [ebx]
  sub al, 20H ; make it upper case
  mov [output], al
  mov [output], al

  dec ecx ; ecx = ecx - 1
  mov al, [ecx]
  mov [output], al

  inc ebx ; ebx = ebx + 1
  mov al, [ebx]
  sub al, 20H ; make it upper case
  mov [output], al
  mov [output], al

  dec ecx ; ecx = ecx - 1
  mov al, [ecx]
  mov [output], al

	mov eax, output
  call print_string

  call	print_nl	; print a new line
  popa
  mov	eax, 0
  leave
  ret
