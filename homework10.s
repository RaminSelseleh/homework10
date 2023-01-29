/*
 * Ramin Selseleh
 * Homework10
 * theia
 */

.global main
main:

    @ enter name
    LDR R0, =spec
    ldr r1, =name
    BL printf
    swi 0

loops:
    @ prompting for number
    LDR R0, =spec
    ldr r1, =prompt
    BL printf
    swi 0

    @ reading input
    MOV R0, #0
	LDR R1, =inputs
	MOV R2, #40
	MOV R7, #3
	SWI 0

    @ load r3 with input
    ldr r3, =inputs

    @ checking if q is enetered or not
    ldrb r1, [r3]
    cmp r1, #'q'
    beq exit 


    @ call to-binary 
    ldr r3, =inputs

    @ checking see if error should pop or not
    mov r0, r3 
    BL to_binary
    cmp r0, #-1
    beq error 

    @ save a copy in r9 for mangle
    mov R7, r0 

    @ divide here
    BL divide_by_4

    @ display divide here
    mov r1, r0 
    ldr r0, =get_quot 
    BL printf 

    @ display remainder here
    mov r1, r4 
    ldr r0, =get_remainder
    BL printf 

    @ mangle here 
    MOV r0, R7
    BL mangle 

    @display mangle
    mov r1, r0
    ldr r0, =mang
    BL printf

    B loops


error:
    LDR r0, =spec
    LDR r1, =message
    BL printf

    B loops



_exit:
    MOV R7, #1
    SWI 0


.data

spec:
    .asciz "%s"

name:
    .asciz "Ramin Selseleh\n"

prompt:
    .asciz "Please enter a number or q to quit:\n"

inputs:
    .space 40

message:
    .asciz "\nyou did not enter a valid number\n"

get_quot:
    .asciz "quotient is: %d "

get_remainder:
    .asciz "   remainder is: %d \n"

mang:
    .asciz "mangled is: %d \n\n"

