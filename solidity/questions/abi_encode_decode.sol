// abi encode encodes data to bytes

// abi decode decodes bytes to data

// now we need code how both work


contrat Abi {
	
	struct MyStruct {
		string myname;
		uint256[3] nums;
	}

	function encode(uint256 x,address addr,uint256[] calldata arr, MyStruct mystruct) external pure returns (bytes memory) {
		return abi.encode(x,addr.arr,mystruct);
	}

	function decode(bytes data) external returns (uint256 x,address addr,uint256[] memory arr,MyStruct mystruct) 
	 {
		abi.decode(data,(uint256,address,uint256[],MyStruc));


}

}








