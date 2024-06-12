pragma solidity ^0.8.19;

contract getbalance{
    
    function balance() public returns (uint256) {
        return payable(address(this)).balance;
    }


    //another implementation

    function balance(address owner) public view returns(uint accountbalance) {
        accountbalance = owner.balance;

    }

    // to get balance of any contract or person in the blockchain 
    
    function getanybalance(address contractAddress) public view returns(uint) {
        return contractAddress.balance;
    }

    

}
