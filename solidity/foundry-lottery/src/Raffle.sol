// SPDX-License-Identifier: MIT

 // i am going to use lot of commentt because i am still learning
pragma solidity ^0.8.18;


contract Raffle {

    error notenoughEth();

    uint256 private immutable enterFee;

    //use a dynamic array for storing the users
    address[] private players; 


    constructor(uint256 EnterFee){ 
    enterFee = EnterFee;
    }

    function enterRaffle() public payable {
            //the people have to pay for the ticket to enter the raffle
        //use the enterfee function to let people pay for this

        //note : require is not a gas efficent  use if statements
        // require(msg.value >= enterFee,"Not enough eth,so pls try again");
    // error and if is more gas efficeient 


        if(msg.value < enterFee) {
        revert notenoughEth();
    }

        //push into the players array

        players.push(payable(msg.sender)); //this will push






    }

    function pickWinner() public {

    }

    //getter

    function getEnterFee() external view returns (uint256) {
        return enterFee;
    }

}

