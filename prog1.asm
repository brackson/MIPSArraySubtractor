# Brandon Jackson
# CSCI 4720 (Computer Architecture and Organization)
# 4 Oct 2021
# Program 1

    # Write a MIPS assembly language program that subtracts two arrays with ten
    # elements (element-by-element subtraction) and save them in an array. Print
    # the Result Array.

.data

    A: .word 10, 5, 6, 15, 17, 19, 25, 30, 12, 56 # store A[]
    B: .word 4, 15, 16, 5, 7, 9, 15, 10, 22, 6  # store B[]
    C: .space 40 # (eventually) store C[] (10 ints = 4*10 = 40)

    consoleArrC: .asciiz "Result is "

.text
main:

    # Print consoleArrC ("Result is ")
    li $v0, 4
    la $a0, consoleArrC
    syscall

    la $t0, A # A[] address
    la $t1, B # B[] address
    la $t2, C # C[] address
    li $t3, 0 # counter (++ every iteration; endProg at 10)

    j loop

loop:

    beq $t3, 10, endProg # if our counter ($t3) == 10, end program

    # Get current vals of A[i], B[i] (or $t0[$t3], $t1[$t3]) into $t4, $t5 vars
    lw $t4, 0($t0)
    lw $t5, 0($t1)

    # Subtract them, then store in our C[] array ($t2)
    sub $t6, $t4, $t5 # $t6 = $t4 - $t5
    sw $t6, 0($t2)

    # Print the difference, then print space char (ascii: 32)
    li $v0, 1
    move $a0, $t6
    syscall
    li $a0, 32
    li $v0, 11
    syscall

    # increment $t0/$t1 to prepare for next iteration
    addi $t0, $t0, 4
    addi $t1, $t1, 4

    # increment counter by 1
    addi $t3, $t3, 1

    # go back to the beginning of loop()
    j loop

endProg:

    # Send exit (service no. 10) to register $v0
    li $v0, 10
    syscall
