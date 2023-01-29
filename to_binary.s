/*
 * to_binary
 * Input: R0 address of ASCII digits
 *        Ascii digits end with a newline character
 * Output: R0 binary number
 * If a character that is not an ASCII digit is found return -1
 */

    .global to_binary 
to_binary:
    STMFD SP!, {R4, R5, LR} @ Save R4 and R5
                        @ Push the Link Register on the stack
			@ so you know where to return
@ Do
_do:
/*
 * Register usage
 * R0 = Address of Ascii numeric characters
 * R1 = byte pointer/counter
 * R2 = Sum of digits
 * R3 = Value of 10
 * R4 = Contains Ascii character to change to binary
 * R5 = Working register
 */
 @   Initialize registers
    MOV R1, #0
    MOV R2, #0
    MOV R3, #10

@   Convert Ascii to binary
@   While character is between "0" and "9"
_while:
    LDRB R4, [R0, R1]
    CMP R4, #10
    BEQ _end_while
    CMP R4, #48
        BLT _error 
        CMP R4, #57
        BGT _error 
    SUB R4, R4, #48
    MUL R5, R2, R3 
        MOV R2, R5 
        ADD R2, R2, R4 
    ADD R1, R1, #1
    BAL _while 
    @   while end
_end_while:
    MOV R0, R2 
    BAL _exit 

_error:
    MOV R0, #-1

_exit:
    LDMFD SP!, {R4, R5, PC}

    


    
