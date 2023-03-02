// Write your assembly program for Problem 2 (a) #1 here.

// Why is Branch prediction important and necessary
// Performs a for loop that iterates 15 times

LBI r0, 0
.INC:
ADDI r0, r0, 1


//Maybe does other stuff in the loop...


//checks if if r0 has incremented 15 times 
SUBI r1, r0, 15
BGEZ r1, .INC

HALT