//we need a to address and amount

//code it as an interface

pragma solidity ^0.8.19;


interface transferAmount {
    function transfer(address to,uint256 amount) external returns (bool);
}

contract tokenTransfer {
    address public tokenaddress;

    constructor(address _tokenaddress) {
        tokenaddress = _tokenaddress;
    }
    
     
}