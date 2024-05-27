// for this we need to create a block 

//the block contains index,nonce,timestamp,prevhash,data,hash


//this proof of work,miners calculate a complex matheatical problem called nonce

//basically we need to just guess the nonce value


//the only thing i hate about this algorithm is it eats power like a hippo

//sorry switzerland

const sha256 = require("crypto-js/sha256");


class Block{
    constructor(index,timestamp,hash,previous_hash=' ') {
        this.index = index;
        this.timestamp = timestamp;
        this.hash = generateHash();
        this.previous_hash = previous_hash;
    }

    computehash() {
        return sha256(this.index + this.timestamp + this.previous_hash + JSON.stringify(this.hash))
    }
}