// # Algorithm to check if a block is valid

// 1. Check if the previous block referenced by the block exists and is valid.
// 2. Check that the timestamp of the block is greater than that of the previous block and less than 2 hours into the future
    
//     [fn2](https://ethereum.org/en/whitepaper/#notes)
    
// 3. Check that the proof-of-work on the block is valid.
// 4. Let `S[0]` be the state at the end of the previous block.
// 5. Suppose `TX` is the block's transaction list with `n` transactions. For all `i` in `0...n-1`, set `S[i+1] = APPLY(S[i],TX[i])` If any application returns an error, exit and return false.
// 6. Return true, and register `S[n]` as the state at the end of this block.


//first we need to create a block

const sha256 = require("crypto-js/sha256");

class Block {
    constructor(prevHash,timestamp,nonce,transactions, hash) {
        this.prevHash = prevHash;
        this.timestamp = timestamp;
        this.nonce = nonce;
        this.transactions = transactions;
        this.hash = hash;
    }
}





class blockchain {
    constructor() {
        chain = [this.createGenesisblock()];
        difficulty = 2;
    }


    createGenesisblock() {   //in sol block.timestamp
        return new Block("0",Date.now(),[],0,"0"); //this is genesis block
    }

    getLatestBlock() {
        return this.chain[this.chain.length - 1];
    }


    applyTransaction(state,transaction) {

    } 

    isValidProof(block,difficulty) {

    }


    calculatehash(block) {
        return sha256(this.prevHash+this.timestamp+this.nonce+this.transactions).toString();
    }

    //start of the algorithm

    // 1. Check if the previous block referenced by the block exists and is valid.
    
    // we need to generate the previos block hash and check with previous hash
// 2. Check that the timestamp of the block is greater than that of the previous block and less than 2 hours into the future



    validateBlock(newBlock) {
        const previousblock = this.getLatestBlock();

        if(previousblock.hash != newBlock.prevHash) {
            console.log("Invalid previous hash");
            return false;
        }

        

        /// 2. Check that the timestamp of the block is greater than that of the previous block and less than 2 hours into the future

        //checking timestamp

        if(newBlock.timestamp <= previousblock.timestamp || newBlock.timestamp > Date.now() + 2 * 60 * 60 *1000 ) {
            console.log("Invalid block");
            return false;
        }

        // 3. Check that the proof-of-work on the block is valid.



     //   4. Let `S[0]` be the state at the end of the previous block.
    // 5. Suppose `TX` is the block's transaction list with `n` transactions. For all `i` in `0...n-1`, set `S[i+1] = APPLY(S[i],TX[i])` If any application returns an error, exit and return false.

//         The state transition function APPLY(S,TX) -> S' can be defined roughly as follows:

// For each input in TX:
// If the referenced UTXO is not in S, return an error.
// If the provided signature does not match the owner of the UTXO, return an error.
// If the sum of the denominations of all input UTXO is less than the sum of the denominations of all output UTXO, return an error.
// Return S with all input UTXO removed and all output UTXO added.

        

}

}
