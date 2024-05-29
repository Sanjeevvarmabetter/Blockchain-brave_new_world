// SPDX-License_Identifier: MIT

pragma solidity ^0.8.18;



// this consists of total_supply
// balanceOf
// transfer
// transferFrom
// approve

// allownce



contract Manualtoken {
	
	//hashtable for address -> balance
	mapping(address => uint256) private balance;

	string public name = "Manual token";



	function totalSupply() public pure returns (uint256) {
		return 100 ether;
	}

	function decimals() public pure returns (uint8) {
		return 18;
	}

	//function too get the balance

	function balanceOf(address _owner) public view returns (uint256) {
			return balance[_owner];
	} 

	function transfer(address _to,uint256 _amount) public {
		uint256 previousBalance = balance[msg.sender] + balanceOf[_to];

			//main transfer logic

			// balance[_from] = balance[_from] - _amount;
			balance[msg.sender] = balance[msg.sender] - _amount;
			balance[_to] = balance[_to] + _amount;
			require(balance[msg.sender] + balance[_to] == previousBalance);

	}
	


}