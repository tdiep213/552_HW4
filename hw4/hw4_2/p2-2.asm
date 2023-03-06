// Write your assembly program for Problem 2 (a) #2 here.

// Why is Branch prediction important and necessary
// Performs a bunch of nested if statements.
// While not an optimal implementation, we can't assume that it will always be optimal at every stage.

// The deepest nested path will result in r4 = 4, and each branch not taken will lower the final value by 1.
// 
// Can add stress-test operations within each THEN label
LBI r1, 0
LBI r2, 28
LBI r3, 7
LBI r4, 0

// If 1
SLLI r3, r3, 2
SUB  r1, r2, r3
BEQZ r1, .THEN1    // taken

.ELSE1:
ADDI r4, r4, -1

.THEN1:
ADDI r4, r4,  1

// If 2
SUBI r1, r3, 27
BEQZ r1, .THEN2    // not taken

.ELSE2:
ADD r1, r1, r3     // testing computation if branch not taken

ADDI r4, r4, -1    

.THEN2:
ADDI r4, r4,  1

// If 3
SUBI r1, r1 8
BEQZ r1, .THEN3    // taken: faster if branch then2 predicted not-taken 

.ELSE3:
STU r3, r2, 32     // Store value of r3 (28) into mem[r2 + 32(signExt)] and also perform r2 + 32(signExt)

ADDI r4, r4, -1

.THEN3:
ADDI r4, r4,  1
// If 4
SUBI r1, r2, 28    // sets r1 to 0 if r2 is storing 28. If extra comp from above isn't flushed, then r1 =/= 0 
BEQZ r1, .THEN4    // taken (if above is true)

.ELSE4:
ADDI r4, r4, -1

.THEN4:
ADDI r4, r4,  1
BEQZ r1, .THEN5    // taken

.ELSE5:
ADDI r4, r4,  -1

LBI r5, 0
HALT

.THEN5:
SUBI r4, r4, 2     // r4 will equal 3 by this point. Sub 2 to get 1, then AND with r5 to ensure endpoint and path were correct
LBI r5, 1
AND r5, r5, r4
HALT
