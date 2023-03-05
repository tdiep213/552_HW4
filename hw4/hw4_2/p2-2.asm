// Write your assembly program for Problem 2 (a) #2 here.

// Why is Branch prediction important and necessary
// Performs a bunch of nested if statements.
// While not an optimal implementation, we can't assume that it will always be optimal at every stage.

// The deepest nested path will result in r4 = 4, and each missed if-branch will lower the final value by 1.
//
// Can add stress-test operations within each THEN label

LBI r4, 0
// If 1
BEQZ Rs, .THEN1
.ELSE1:
ADDI r4, r4, -1

.THEN1:
ADDI r4, r4,  1
// If 2
BEQZ Rs, .THEN2

.ELSE2:
ADDI r4, r4, -1

.THEN2:
ADDI r4, r4,  1
// If 3
BEQZ Rs, .THEN3

.ELSE3:
ADDI r4, r4, -1

.THEN3:
ADDI r4, r4,  1
// If 4
BEQZ Rs, .THEN4  

.ELSE4:
ADDI r4, r4, -1

.THEN4:
ADDI r4, r4,  1
BEQZ Rs, .THEN5  

.ELSE5:
ADDI r4, r4,  -1

.THEN5:


