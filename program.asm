.data
    prompt: .asciiz "Enter a number (N >= 25): "
    error: .asciiz "Illegal Number!\n"
    newline: .asciiz "\n"

.text
main:
    li $v0, 4               # Print string
    la $a0, prompt          # Load the prompt string
    syscall
   
    li $v0, 5               #read integer
    syscall
    move $t0, $v0           #store input in $t0
 
check_input:
    blt $t0, 25, invalid    # If N < 25, jump to invalid
    j step2                 # If valid, go to Fibonacci logic

invalid:
    li $v0, 4               # Print error message
    la $a0, error
    syscall
    j main                  # Restart input prompt

step2:
    li $t1, 0               # First Fibonacci number
    li $t2, 1               # Second Fibonacci number
    li $t3, 0               # Counter for Fibonacci numbers

fibonacci_loop:
    beq $t3, $t0, exit      # If counter equals N, exit loop

    # Print current Fibonacci number
    move $a0, $t1
    li $v0, 1               # Print integer
    syscall
    
    li $v0, 4               # Print newline
    la $a0, newline
    syscall

    # Calculate next Fibonacci number
    add $t4, $t1, $t2       # t4 = t1 + t2
    move $t1, $t2           # Shift t2 to t1
    move $t2, $t4           # Shift t4 to t2	
    
    addi $t3, $t3, 1        # Increment counter
    j fibonacci_loop        # Repeat loop

