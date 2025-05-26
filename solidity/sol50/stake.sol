//Write a Solidity contract that implements a simple staking pool where 
//users can deposit Ether, withdraw their stake, and the contract owner
// can distribute rewards proportionally to all stakers.

// for this 

// <-- data stuctures -->
// owner we need to store the owner of the contract
// an array for stakers
// mapping for stakes
// a uint for total stakes

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StakingPool {
    
    address public owner;
    mapping (address => uint256) public stakes;
    address[] public stakers;
    uint256 public totalStaked;



    modifier onlyOwner() {
        require(owner == msg.sender,"Not the contract onwer");
        _; 
    }

    constructor() {
        owner = msg.sender;

    }

    function stake() external payable {
        require(msg.value > 0,"the stake must be greater than 0");
        if(stakes[msg.sender] == 0) {
            stakers.push(msg.sender);

        }

    // recccord the stake
    stakes[msg.sender] += msg.value;
    totalStaked += msg.value;



    }

    function withdraw(uint256 amount) external {
        require(stakes[msg.sender] >= amount,"Insufficient stake");
        stakes[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);

    }

    // owner can distribute rewards to the stakers
    function distributeReqards() external payable onlyOwner {
        require(totalStaked > 0,"No stakes in pool");
        require(msg.value>0,"No reqars to distribute");

        for(uint256 i=0;i<stakers.length;i++) {
            // the reward is calculated proportionally
            // reward = userStake * msg.value / totalStakes
            address staker = stakers[i]; //fetch from array
            uint256 userStake = stakes[staker];
            uint256 reward = (msg.value * userStake) / totalStaked;
            if( userStake > 0 ) {
                payable(staker).transfer(reward); //for better optimization compute the reward only when userStake > 0
            }
 
        }
    }





 }
