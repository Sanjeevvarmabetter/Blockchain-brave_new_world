//time based contract 

/// this contract should execute when it meets a specific time
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;


contract timelock {

    // each contract contains an owner

    address public owner;
    uint256 public unlockTime;

    constructor(address _owner,uint256 _unlockTime) {
        owner = _owner;
        unlockTime = _unlockTime;
    }

    function recieve() external payable {
        require(msg.sender == owner,"Only owner can deposite the funds");

    }


    function withdraw() external {
        // thee owner should only access
        /// and the current timestamp should be greater than speified

        require(msg.sender  == owner,"only owner can withdraw");
        require(block.timestamp >= unlockTime,"Funds are not released until the time gets passed");
        //if the time is passed;

        payable(owner).transfer(address(this).balance);

    }

}