//  program that uses a zero-knowledge proof to verify the correctness of a computation.


//EXPLAINED

/* it is a method by which one party can prove to another party that something is true,without revealing 
the info apart from the fact this statement is true */
    
// these  are used for secure computations

/*

ALGORITHM:

first we need the prover(the party trying to convince the verifier) and 

verifier agree on common reference string


the prover want to convince the verifier that they know a secret value x such that the 
**statements(x) is true**

for this we need to add common reference string


the formula is 

proof = secretValue + generateCommonValueString


code it