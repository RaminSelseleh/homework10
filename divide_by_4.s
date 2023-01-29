/* 
 * divide_by_4
 * Input: R0 contains number to be divided
 * Output: R0 contains the quotient
 * Output: R1 contains the remainder
 */

.global divide_by_4

divide_by_4:
    STMFD SP!, {LR}    @ Push the Link Register on the stack

    @ get quotient here
    MOV R1, R0
    MOV r0, R0, LSR #2   

    @ get remainder here
    MOV R2, #4   
    MUL R3, R0, R2
    SUB R4, R1, R3

    LDMFD SP!, {PC}    @ POP the Link Register from the stack to get back

