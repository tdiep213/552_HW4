// Write your assembly program for Problem 1 (a) #1 here.

// Group 17 -> JALR
// Jump and link register 
// Register 7 for link
// immediate R7 <- PC + 2
// PC <- Rs + I(sign ext.)


// Test 1
// Checks that PC is stored correctly and that a jump happens correctly
// $R5 == 1, test passed
// $R5 == 0, test failed

/*------Register setups-------*/
LBI r0, 0
JAL 0                       //Loads PC into R7
ADDI r1, r7, 4

JALR r1, 2                  //Skips next increment and goes to register checks

/*------Register check setup-------*/
ADDI r0, r0 1               //Increment R1, should be skipped if JALR works
ADDI r1, r7, 6              //Prepares comparison register              
JAL 0                       //Loads new PC into R7


/*------Checks that jump was done correctly-------*/
BEQZ r0, .goodJump          //Skips Halt if increment $R1 was skipped 
HALT
.goodJump:
LBI r5, 1                   //Loads 1 into $R5 so we know that everything executed correctly


/*------Checks that PC is stored correctly-------*/
SUB r2, r1, r7
BEQZ r2, .goodStore         //skips HALT if PC was stored correctly
HALT                        //Stops the program if pc wasnt stored correctly

.goodStore:
ADDI r5, r5, 1
HALT

