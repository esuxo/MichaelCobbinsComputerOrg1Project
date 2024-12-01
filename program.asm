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
