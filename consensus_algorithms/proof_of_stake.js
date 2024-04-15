//first we need a block 

class Block {
    constructor(index,timestamp,data,prevhash = '') {
        this.index = index;
        this.timestamp = timestamp;
        this.data = data;
        this.prevhash = prevhash;
        this.hash = this.calculateHash(); //you can use any crypt algo yout wish
    }

    calculateHash() {
        return SHA256(this.index + this.prevhash + this.data + this.timestamp)
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


}
    

//this contains validatos

