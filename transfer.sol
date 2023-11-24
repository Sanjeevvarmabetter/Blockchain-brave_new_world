pragma solidity ^0.8.0;


interface IERC20 {
	function transfer(address to, uint256 amount) external returns (bool);
}

contract tokentransfer {

	address public tokenaddress;

	constructor(address _tokenaddress) {
		tokenaddress = _tokenaddress;

	function trasfertoken(address to, uint256 amount) external {
		IERC20 token = IERC20 (tokenaddress);
	
	require(token.transfer(to,amount),"Token trasfer failed");

	}
//
	//if (token.trasfer(to,amount) {
	//}
	//else {
		//"token transaction failed";
	//}

}

