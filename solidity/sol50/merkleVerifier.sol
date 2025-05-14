
contract merkleVerifier {
	
	// we need a root hash
	bytes32 public merkleRoot;
		
	constructor(bytes32 _root) {
		merkleRoot = _root;	
	}

	function verify(bytes32 leaf,bytes32[] memory proof) public view returns(bool) {
		bytes32 hash = leaf;
		
		for(uint256 i=0;i<proof.length;i++) {
			bytes32 sibiling = proof[i];

			if(hash < leaf) {	
				hash = keccak256(abi.encodePacked(hash,sibiling));
			} else {
				hash = keccak256(abi.encodePacked(sibiling,hash)):
			}
		}

	return hash == merkleRoot;	
		
	}

	

}
