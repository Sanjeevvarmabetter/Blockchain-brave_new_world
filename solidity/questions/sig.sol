// for signing and verifiing

// signing
	// creating a message to sign
	// hash the message
	// sign the hash

// verify 

	// recreate the hash from the original message
	// recover the signer from the signer and hash	
	// compare recoverd signeer to claimed signer



contract verifySignature {
	function getMessageHash(address _to,uint256 _amount,string memory _message,uint256 _nonce) {
		return keccak256(abi.encodePacked(_to,_amount,_message,_nonce));
	}

	
	// sign the message hash 
	

	// using ethersjs we can sign the hash

		
	function getEthSignedMessageHash(bytes32 _messageHash) pubic pure returns (bytes32) {
	
		return keccak256(abi.encodePacked("Ethereum signed message ",_messageHash));
	}

	function verify(address _signer,address _to,uint256 _amount,string memory _message,uint256 _nonce,bytes memory signature) public pure returns (bool) {
		bytes32 messageHash = getMessageHash(_to,_amount,_message,nonce)l
		bytes32 ethSignedMessagehash = getEthSignedMessageHash(messageHash);

		return recoverSigner(ethSignedMessagehash, signature) == _signer;
	}

	
	

}

