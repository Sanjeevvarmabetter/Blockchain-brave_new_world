// Write a Solidity function to implement a voting system, where each address can vote only once.


///let us assume we have two functions
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;


contract voting {

    uint256 public candidateA;
    uint256 public candidateB;
    
    
    ///added new
    mapping (address => bool) voted;


    function voteA() public {
        require(voted[msg.sender] == false,"User has already voted");
        candidateA++;
        voted[msg.sender] == true;
    }

    function voteB() public  {
        require(voted[msg.sender] == false,"User has already voted");
        candidateB++;
        voted[msg.sender] == true;

    }


    /// get candidadtea and b


    function getA() public view returns(uint256) {
        return candidateA;
    }

    function getB() public view returns(uint256) {
        return candidateB;
    }


    /// function for electral commision 

    string result;
    function coutingvotes() public {
        if(candidateA>candidateB) { 
            result = "A won the elections";
        }
        else {
            result = "B won the elections";
        }

    }


    function resultElection() public view returns(string memory) {
            return result;
    }

    // now we need to ensure that the address is going to vote for only once

    // msg.sender -> address this has to be once
    // we can use a mapping and check if the user voted or not
    // mapping (address => bool) voted;
    // require(voted[msg.sender] == false,"user has voted")
    // candidate
    // voted[msg.sender] == true


}