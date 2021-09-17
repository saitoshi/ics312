; File: hw3_ex2.asm
; Assignment: Homework 3 Exercise 2
; CLASS: ICS 312 Spring 2021
; AUTHOR: Shin Saito
; DATE: Feb. 23, 2021

; Takes two user inputs one 3 letter and one 4 letter strings and produces an scrambled modified output
%include "asm_io.inc"

segment .data
	cmd1		db	"Enter a 3-character lower-case string: ", 0
	cmd2		db	"Enter a 4-character string: ", 0
	output	db	"The encoded string is: xxxxxxxxxx", 0

segment .bss
	string1_1		resb     1	; first inputted string part 1
	string1_2   resb     1	; first inputted string 2
	string1_3		resb     1	; first inputted string p3
	string2_1		resb     1	; second inputted string
	string2_2		resb     1	; second inputted string
	string2_3		resb     1	; second inputted string
	string2_4		resb     1	; second inputted string



segment .text
        global  asm_main

asm_main:
	enter	0,0			; setup
	pusha				; setup

  mov eax, cmd1 ; move eax to cmd1
  call print_string ; print the cmd1

  call read_char ; call on read char for the first input
  mov [string1_1] , al ; move the char into ebx
  inc ebx ; increment ebx

  call read_char ; read in second char
  mov [string1_2] , al
  inc ebx

  call read_char ; read in the third char
  mov [string1_3], al

  call read_char

  mov eax, cmd2 ; point eax to the next command
  call print_string ; print the command


  call read_char ; read the first input
  mov [string2_1], al ; mov al to to store the first input


  call read_char ;secnd input
  mov [string2_2], al

  call read_char ; third input
  mov [string2_3], al

  call read_char ; the fourth input
  mov [string2_4], al
  call read_char; act as a buffer

  mov eax, output ; eax points to the output string
	add eax, 23; eax = output[23] the first out put char

	mov bl, [string2_4] ; bl = string2_4
	mov [eax], bl ; container eax = bl
	inc eax ; eax++

	mov bl, [string1_1] ; bl = string1_1
	sub bl, 020h ; make bl to upper case
	mov [eax], bl ; eax = bl
	inc eax ; eax++
	; repeat the character again
	mov [eax], bl ; eax = bl
	inc eax ; eax++

	; print the third letter for the second input similar to the last
	mov bl, [string2_3] ; bl = string2_3
	mov [eax], bl ; container eax = bl
	inc eax ; eax++


	mov bl, [string1_2] ; bl = string1_2
	sub bl, 020h ; make bl to upper case
	mov [eax], bl ; eax = bl
	inc eax ; eax++
	; repeat the character again
	mov [eax], bl ; eax = bl
	inc eax ; eax++

	; print the third letter for the second input similar to the last
	mov bl, [string2_2] ; bl = string2_2
	mov [eax], bl ; container eax = bl
	inc eax ; eax++

	mov bl, [string1_3] ; bl = string1_3
	sub bl, 020h ; make bl to upper case
	mov [eax], bl ; eax = bl
	inc eax ; eax++
	; repeat the character again
	mov [eax], bl ; eax = bl
	inc eax ; eax++

	; print the third letter for the second input similar to the last
	mov bl, [string2_1] ; bl = string2_1
	mov [eax], bl ; container eax = bl


	mov eax, output ; point eax to output
  call print_string ; print the out put string

  call	print_nl	; print a new line
  popa
  mov	eax, 0
  leave
  ret

	find_index:
	mov ebx , count
	add ebx, index ; ebx = ebx + index
	inc [ebx] ; increment the value at ebx
		;b
		sub [input], 'a' ; input = input - a
		mov

	; input = 8


	01 00 00 00 03 00 00 00 07 00 00 00
