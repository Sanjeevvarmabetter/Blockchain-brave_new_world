// for signing a transaction folow the below algorithm


// create a ds consists of 9 feilds -> nonce,gasPrice,gas LImit, to,value,data,chainId,0,0


//produce an rlp-encoded serialized message of the transaction ds

//compute the keccak256 hash of the message

//compute ECDSA signature, signing the hash with the originating eoa private key

//append the ECDSA signature computed v,r,s values to the transaction



const {Transaction} = require('ethereumjs-tx');


const txData = {
    nonce: '0x0',
    gasprice: '0x09184e72a000',
    gasLimit: '0x30000',
    to: '0xb0920c523d582040f2bcb1bd7fb1c7c1ecebdb34',
    value: '0x00',
    data:'hello this is my transaction signature',
    v:"0x1c",
    r:0,
    s:0
};


tx = new Transaction(txData);

console.log('RLP-encoded tx: 0x'+tx.serialize().toString('hex'))


txHash = tx.hash();

//after converting in hex
// then sign the transaction


const privatekey = Buffer.from(
    '91c8360c4cb4b5fac45513a7213f31d4e4a7bfcb4630e9fbf074f42a203ac0b9','hex'
);

tx.sign(privatekey);


serializeTx =tx.serialize();

rawtx = 'signed raw transaction: 0x' + serializeTx.toString('hex');
console.log(rawtx)