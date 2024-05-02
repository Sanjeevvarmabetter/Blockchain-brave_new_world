const SHA256 = require("crypto-js/sha256");

class CryptoBlock {
	constructor(index,timestamp,data,previoushash = " ") {
		this.index = index;  //this keyword is a way to access and work with the properties 
		this.timestamp = timestamp;
		this.data = data;
		this.previoushash = previoushash;
		this.hash = this.computehash();
		this.nonce = 0;
	}
	computehash() {
		return SHA256 (
			this.index + this.previoushash + this.timestamp + 
				JSON.stringify(this.data) + 
				this.nonce
		).toString();
	}


		proofofwork(difficulty) {
			while (
				this.hash.substring(0, difficulty) != Array(difficulty + 1).join("0")
			) {
				this.nonce++;
				this.hash = this.computehash();
			}
		}
}

class Cryptoblockchain {
	constructor() {
		this.blockchain = [this.startGenesisBlock()];
		this.difficulty = 4;
	}

	startGenesisBlock() {
		return new CryptoBlock(0, "01/01/2020","init blockchain","0");
	}

	obtainLatestBlock() {
		return this.blockchain[this.blockchain.length - 1];
	}

	addNewBlock(newBlock) {
		newBlock.previoushash = this.obtainLatestBlock().hash;
		newBlock.proofofwork(this.difficulty);
		this.blockchain.push(newBlock);
	}


	//here we are wrting a function to check validity 
	checkChainValid() {
		for(let i=1;i<this.blockchain.length;i++) {
			const currentblock = this.blockchain[i];
			const previousblock = this.blockchain[i-1];

			if(currentblock.hash !== currentblock.computeHash()) {
				return false;
			}

			if(currentblock.previoushash !== previousblock.hash) {
				return false;
			}
		return true;
	}
	}
}


let blockchaincoder = new Cryptoblockchain();

console.log("The Blockchain is running");

blockchaincoder.addNewBlock (
	new CryptoBlock(1,"2/2/2021", {
		sender: "sanjeev varma",
		recipient: "varma",
		quantity: 100,
	})
);

console.log("The Blockchain is running");

blockchaincoder.addNewBlock (
	new CryptoBlock(2,"2/2/2021", {
		sender: "varma",
		recipient: "mike",
		quantity: 10,
	})
);

console.log(JSON.stringify(blockchaincoder, null,4))



