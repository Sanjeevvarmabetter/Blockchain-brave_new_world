// Write a Solidity function to implement a crowdsale, where tokens are sold in exchange for ether.



///we have tokens and we need to exchange with ether

/// @title A title that should describe the contract/interface
/// @author The name of the author
/// @notice Explain to an end user what this does
/// @dev Explain to a developer any extra details



/// use the ierc20 token
// i want to access the wallet

// descibe the rate of the token
// 

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20";


contract crowdsale {
    IERC20 public token;
    address payable public wallet;
    uint256 public rate;
    uint256 public weiraised;

    event TokensPurchased(address indexed purchaser, address indexed beneficiary, uint256 value, uint256 amount);

    constructor (uint256 _rate,address payable _wallet,IERC20 _token) {
        require(_rate>0 ,"the rate should be greater than 0");
        require(_wallet != address(0),"wallet is zero address");
        require(address(_token) != address(0),"token is zero address");

    rate = _rate;
    wallet = _wallet;
    token = _token;

    }


    receive() external payable {
        buyTokens(msg.sender);
    } 

    function buyTokens(address beneficiary) public payable {
        uint256 weiamount = msg.value;

        require(weiamount !=0,"crowdsale amount is 0");
    
        uint256 tokens = getTokenAmount(weiamount);

        weiraised  = weiraised + amount;

        //transfer tokens to the beneficiary

        token.transfer(weiamount);

        emit TokensPurchased(msg.sender,beneficiary,weiamount,tokens);

    }


    function getTokenAmount(uint256 weiamount) internal view returns(uint256) {
        return rate * weiamount;
    }


}