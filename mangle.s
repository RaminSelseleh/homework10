/* 
 * mangle
 * Input: R0 contains number to mangle
 * Output: R0 contains mangled number
 */

 .global mangle

mangle:
	STMFD SP!, {LR}	

@ Add 7
    ADD R0, R0, #7

@ Multiply by 8
    MOV R2, #8
    MUL R1, R0, R2
    MOV R0, R1

@ Subtract 15
    SUB R0, R0, #15

    LDMFD SP!, {PC}

