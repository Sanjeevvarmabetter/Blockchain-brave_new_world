//Write a Solidity function to check if a given address is a contract or not.

//inorder to code this we need to know about EXTCODESIZE checks

//  https://consensys.github.io/smart-contract-best-practices/development-recommendations/solidity-specific/extcodesize-checks/


// if we want to use the extcodesize function we need to use it in assembly
// 

//extcodesize returns the size of the address

//this is the format
//assembly {
	//size := extcodesize(address)
//}

pragma solidity ^0.8.0;


contract checker {
//this function returns bool because we just need to know  wheather the address is valid or not
	function contractchecker(address _addr) external view returns (bool)  {

	unit256 addresssize;

	assembly {
		addresssize := extcodesize(_addr);
	}
	return addresssize > 0;
}
}



