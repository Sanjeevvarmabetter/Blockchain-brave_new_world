// SPDX-License-Identifier: MIT

 // i am going to use lot of commentt because i am still learning
pragma solidity ^0.8.18;

import {VRFCoordinatorV2Interface} from "@chainlink/contracts/src/v0.8/vrf/interfaces/VRFCoordinatorV2Interface.sol";
//download cmd $ forge install smartcontractkit/chainlink-brownie-contracts@0.6.1 --no-commit

contract Raffle {

    error notenoughEth();


    // state variable

    uint256 private constant request_conformations = 3;
    uint256 private constant num_words = 1;



    uint256 private immutable enterFee;
    uint256 private immutable lottery_interval;
    uint256 private lasttimestamp;
    uint256 private immutable vrf_coordinator;
    uint256 private immutable my_gaslane;
    uint256 private immutable my_subsciptionid;
    uint32 private immutable my_callbackgaslimit;
    
    //use a dynamic array for storing the users
    
    address[] private players; 


    // EVENTS

    event enteredRaffle(address indexed player);

    constructor(uint256 EnterFee,uint256 interval,address vrfcoordinator,bytes32 gasLane,uint64 subid,uint32 callbackgaslimit
    ){ 
    enterFee = EnterFee;
    lottery_interval = interval;
    vrf_coordinator =VRFCoordinatorV2Interface(vrfcoordinator); //typecasting the interface
    lasttimestamp = block.timestamp;    
    my_gaslane = gasLane;
    my_subsciptionid = subid;
    my_callbackgaslimit = callbackgaslimit;

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

        emit enteredRaffle(msg.sender);

    }

    // get a random winner
    // use the random number to pick a player
    // be automatically called  

    
    function pickWinner() public {
            //check if some time has passed

        //to check

        // to get the current time
        // the time has to be greater than lottery_interval


        if(block.timestamp - lasttimestamp < lottery_interval) {
            revert();
        }


        uint256 requestId = vrf_coordinator.requestRandomWords( //
        my_gaslane,
        my_subsciptionid,
        request_conformations,
        my_callbackgaslimit,
        num_words
    );
    }


        //now we need to get a random number
        
    
    //getter

    function getEnterFee() external view returns (uint256) {
        return enterFee;
    }

}

