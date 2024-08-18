ethers is used to connect to any node in a blockchain

## Fetch wallet balance

import { ethers } from 'ethers';

async function fetchBalance() {
	const provider = new ethers.provider.Web3Provider(window.ethereum);
	const balance = await provider.getBalance("wallet address");
}

fectchBalance()


## create signer


### what is a signer?
a signer is an abstraction of a blockchain account that is used to sign messages and send transactions on the blockchain.



const signer = provider.getSigner();


## Sending transactions

we can use the signer to send transactions 

the transaction object contains from and to address 
token value, gas price and gas limit

const transaction = {
	from : "",
	to : "".
	value: ethers.util.parseEther("0.05"),
	gasLimit: ethers.utils.hexlify(1000),
	gasPrice: ethers.utils.hexlify(parseInt(await provider.getGasPrice())) // this is how you  can get the gas price


}

	signer.sendTransaction(transaction).then(result => console.log("send transaction"));
}


sendTransaction();



### how to interact with the smart contract

we can connect to the smart contract and invoke methods specified in contract ABI using signer.
this ABI is json format
this ABI s  contain details of smart contratcs such as what functions are available, how to use them, and how to retrieve data from them.





import { ethers } from "ethers";


const abi = [
	"put the application binary interface here "

]


const provider = new ethers.providers.Web3Provider(window.ethereum);
const signer = provider.getSigner();

const contract = new ethers.Contract("Contract_Address",abi,signer);
const transaction = await contract.balanceOf(signer.getAddress());

await transaction.wait();






### generate random wallet

const randomwallet = ethers.wallet.createRandom();
console.log(randomWallet.address);

	







