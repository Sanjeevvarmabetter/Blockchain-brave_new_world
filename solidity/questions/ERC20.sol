pragma solidity ^0.8.24;


//these are interfaces

interface IERC20 {

	function totalSupply() external view returns (uint256);
	function balanceOf(address account) external view returns (uint256);
	function Transfer(address recipient,uint256 amount) extrenal returns(bool);

	function Allowance(address owner,address spender) external returns(bool);

	function Approve(address spender,uint256 amount) external returns(bool);

	function transferFrom(address sender,address recipient,uint256 amont) external returns(bool);

}




contract ERC20 is IERC20 {
	
	event transfer(address indexed from ,address indexed to, uint256 value);

	event approval(address indexed owner,address indexed spender,uint256 value);

	uint256 public totalSupply;
	mapping(address => uint256) public balanceOf;
	mapping(address => mapping(address => uint256)) public allowance;

	string name;
	string symbol;
	uint8 decimals;


	constructor(string _name,string _symbol,uint8 _decimals) {
		name = _name;
		symbol = _symbol;
		decimals = _decimals;
	}

	function transfer(address to,uint256 amount) external returns(bool) {
		balanceOf[msg.sender] -= amount;
		balanceOf[to] += amount;
		emit transfer(msg.sender,to,amount);
		return true;
	}


	function approve(address spender,uint256 amount) external returns(bool) {
		allowance[msg.sender][spender] = amount;

		emit approval(msg.sender,spender,amount);
		return true; 
	}

	// minting means process of creating new tokens and adding to the total supply

	function _mint(address to,uint256 amount) internal {
		balanceOf[to] += amount;
		totalSupply += amount;
		emit transfer(address(0),to,amount);
	}
