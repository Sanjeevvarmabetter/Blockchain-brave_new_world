// program that uses a homomorphic encryption scheme to perform secure computations on encrypted data.


// homomorphic encryption: this is a type of encrytion algorithm that allows users to perform mathematical operations 
//                         on encrypted data without decrypting it 


// npm install paillier-bigint
// 


const paillierBigint = require('paillier-bigint');


//generating key pairs
const { publicKey, privateKey } = paillierBigint.generateRandomKeys(2048)



///encryptts using the provied public key
function encrypt(number,publicKey) {
    return publicKey.encrypt(number);
}

function decrypt(encryptedNumber,privateKey) {
    return privateKey.decrypt(encryptedNumber);
}




function homomorphicAddition(encryptedNumber1,encryptedNumber2,publicKey) {
    return publicKey.addition(encryptedNumber1,encryptedNumber2); //without decrypting the number i am adding
}


const plaintext1 = BigInt(4);
const plaintext2 = BigInt(3);

const encrypted1  = encrypt(plaintext1,publicKey);
const encrypted2 = encrypt(plaintext2,publicKey);


//now perform the homomorphic encryption

const encryptedResult = homomorphicAddition(encrypted1,encrypted2,publicKey);


const decryptedResult = decrypt(encryptedResult);

console.log(`Homomorphic encryption = ${encryptedResult}`);

console.log(`decrypted result = ${decryptedResult}`);