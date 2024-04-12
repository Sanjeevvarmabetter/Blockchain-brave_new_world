const web3 = require('web3');

web3.eth.defaultAccount =  '0xEA29129049A8B3fB0b2318b4aF2c2B45f459Eea7';
const reciver_address = '0x7030aab4523EEDeB6562d22CA9F21F9b258fE0d9';

const eth_amount = '0.1';

//transaction object


const transaction = {
    from:web3.eth.defaultAccount,
    to:reciver_address,
    //note :In Web3.js, you need to convert ether to wei to send ether from one account to another.
    value:web3.utils.toWei(eth_amount,'ether'),
    gasprice:web3.utils.toWei('20','gwei'),
    gas:21000
};


//now we need to sign the transaction

web3.eth.signTransaction(transaction) 
    .then(signedTx => {
        web3.eth.sendSignedTrasaction(signedTx.transaction)
        .on('receipt', receipt => {
            console.log("Ether send,now enjoy sanjeev bro");
            console.log(receipt);
        })
        .on('error',error => {
            console.log("error sending ether: ",error);
        });
    });