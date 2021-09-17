; File: hw3_ex2.asm
; Assignment: Homework 3 Exercise 2
; CLASS: ICS 312 Spring 2021
; AUTHOR: Shin Saito
; DATE: Feb. 23, 2021
; This program takes in an integer and asii charater
; subtracts the asii character from the integer and negates it
; and stores the results back in memory
%include "asm_io.inc"

segment .data
  ; these labels refer to the strings used for the output
  ;
  prompt1 db "Enter a character: ", 0
  prompt2 db "Enter an integer: ", 0
  outmsg1 db "The transformed number is: '", 0
  outmsg2 db "'",0


segment.bss
  char1 resd 1 ;first ascii char
  integer1 resd 1; second integer input
  result resd 1 ; result

segment .text
	global asm_main

asm_main:
	enter	0,0
	pusha
  mov eax, prompt1 ; print the first command
  call print_string
  call read_char ; read the first input
  mov [char1], eax ; store the character into memory
  mov eax, prompt2 ; print the second command
  call print_string
  call read_int ; read the second input
  mov [integer1], eax ; store the integer input

  mov eax, [char1]
  sub eax, [integer1]

  mov [result], eax ; store the result
  mov eax, outmsg1
  call print_string
  mov eax, [result]
  call print_int
  mov eax, outmsg2
  call print_string
  call	print_nl	; print a new line
	popa
	mov	eax, 0
	leave
	ret
