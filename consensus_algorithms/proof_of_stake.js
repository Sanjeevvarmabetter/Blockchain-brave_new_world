//first we need a block 

const sha256 = require('js-sha256')

class Block {
    constructor(index,timestamp,data,prevhash = '') {
        this.index = index;
        this.timestamp = timestamp;
        this.data = data;
        this.prevhash = prevhash;
        this.hash = this.calculateHash(); //you can use any crypt algo yout wish
    }

    calculateHash() {
        return sha256(this.index + this.prevhash + this.data + this.timestamp)
    }
}






class Blockchain {
    constructor() {
        this.chain = [this.invokegenesis()];  // <<-- this is an array
        this.diff = 2;
        this.validators = [];
    }


    invokegenesis() {

        //use the block class
        return new Block(0,"16/4/2024","Genesis block bro","0",);
    }


    getlatestblock() {
        return this.chain(this.chain.length -1);
    }


    addblock(newblock) {
        newblock.prevhash = this.getlatestblock().hash;
        newblock.hash = this.calculateHash();
        //now we need to push  this to the chain    

        this.chain.push(newblock);

    }


    validateblockwith_proof_of_stake(data) {
        const newblock = new Block(this.chain.length+1,new Date().toISOString(),data,this.getlatestblock().hash);

        //here we need to select a validator randomly based on stake

        const validatorlength = Math.floor(Math.random() * this.validators.length)

        const validator = this.validators[validatorlength];

        console.log("${validator} created this block");

        this.chain.push(newblock);
    }


}


//driver code


const hell = new Blockchain();



//this contains validatos

