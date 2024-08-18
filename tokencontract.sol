pragma solidity ^0.8.0;


contract TokenContract {

		// the token has  a name
		// it will have symbol;

		// total supply that we can mint

		// decimals


		string public name = "sanjeev";
		string public symbol = "SV";
        uint256 public totalSupply = 1000000 * (10 ** uint256(decimals));
		uint8 public decimals = 18;


		mapping(address => uint256) public balanceOf;
		mapping(address => mapping(address => uint256)) public allowance;
		// events -

		// transfer

		event Transfer(address indexed from,address indexed to,uint256 value);

		// for approval we have a external entity called spender

		event approval(address indexed owner,address indexed spender,uint256 value);

		function transfer(address _to,uint256 _value) public returns (bool success) {
			require(balanceOf[msg.sender]>=_value,"not enough balance");

			balanceOf[msg.sender] -= _value;
			balanceOf[_to] += _value;
			emit Transfer(msg.sender,_to,_value);
			return true;

		}
		// approval
		// The approve function is used to set an allowance, allowing a third-party account (the spender) to spend a specified amount of tokens on 
		// behalf of the token holder (the owner). This is particularly useful for enabling more complex interactions with tokens, 
		// such as those needed in decentralized exchanges, automated payment systems, and other smart contracts that require access to another user's tokens.




		function Approval(address _owner,address _spender,uint256 _value) public  returns(bool success) {
			allowance[msg.sender][_spender] = _value;
			emit approval(_owner,_spender,_value);

			return true;

		}



			//functions
		

		//approve

		// transfer

		//transferFrom


		function transferFrom(address _to,address _from,uint256 _value) public returns (bool success) {
			require(_value <= balanceOf[_from],"Not enough balance");
			require(_value <= allowance[_from][msg.sender],"amount exceeded");

			balanceOf[_from] -= _value;
			balanceOf[_to] += _value;
			allowance[_from][msg.sender] -= _value; 

		emit Transfer(_from, _to, _value);


		return true;


		} 


}


