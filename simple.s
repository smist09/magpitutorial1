@
@ Assembly Language program to perform an addition
@ and then print "Hello World!" to stdout.
@
@ R0    - used to add 17 and 2
@ R0-R2 - parameters to Linux function services
@ R7    - Linux function number
@

.global _start              @ Provide program starting address to linker

_start: MOV     R0, #17     @ Use 17 for test example
        ADD     R0, #2      @ Add 2 to R0
        BL      prntHW      @ Call subroutine to print hello world
        MOV     R7, #1      @ Service command code 1 terminates this program
        MOV     R0, #0      @ 0 return code from program
        SVC     0           @ Linux command to terminate program

prntHW: PUSH    {R7}        @ save R7
        MOV     R0, #1      @ param 1 is stdout
        LDR     R1, =helloworld @ string to print
        MOV     R2, #13     @ length of string
        MOV     R7, #4      @ Linux command to print
        SVC     0           @ Call Linux to print
        POP     {R7}        @ restore R7
        BX      LR          @ Return from subroutine
helloworld: .ASCII  "Hello World!\n"
