// SPDX-License-Identifier: MIT


pragma solidity ^0.8.18;


contract Raffle {


    uint256 private immutable enterFee;

    constructor(uint256 EnterFee){ 
    enterFee = EnterFee;
    }

    function enterRaffle() public payable {
            //the people have to pay for the ticket to enter the raffle

    }

    function pickWinner() public {

    }

    //getter

    function getEnterFee() external view returns (uint256) {
        return enterFee;
    }

}

