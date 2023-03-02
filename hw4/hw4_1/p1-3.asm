// Write your assembly program for Problem 1 (a) #3 here.
// Test 3
// Checks that the jump function fails when targeting an out-of-bounds address
// $R5 == 1, test passed
// $R5 == 0, test failed

LBI r5, 0
LBI r1, 225
JALR r1, 10

//If Halt runs, the exception handler did not take control properally
HALT