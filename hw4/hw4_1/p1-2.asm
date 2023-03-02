// Write your assembly program for Problem 1 (a) #2 here.

// Test 2
// Checks that the jump functions properally with a register input
// $R5 == 1, test passed
// $R5 == 0, test failed

LBI r0, 0
LBI r1, 6
JALR r1, 10                  //Skips increments and goes to register checks

                            //6 instructions to be jumped over by JALR
.SKIP:                      
ADDI r0, r0, 1               //Increment R1, should be skipped if JALR works
ADDI r0, r0, 1               //Increment R1, should be skipped if JALR works
ADDI r0, r0, 1               //Increment R1, should be skipped if JALR works
ADDI r0, r0, 1               //Increment R1, should be skipped if JALR works
ADDI r0, r0, 1               //Increment R1, should be skipped if JALR works

.CHECK: 
BEQZ r0, .goodCheck
LBI r5, 0
HALT
.goodCheck:
LBI r5, 1
HALT

