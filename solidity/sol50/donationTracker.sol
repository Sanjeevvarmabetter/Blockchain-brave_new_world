// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DonationTracker {
    // Just like crowdfunding, we code donation tracker

    address public owner;
    uint public totalDonations;

    mapping(address => uint) public donorBalances;

    event DonationReceived(address indexed donor, uint amount);
    event Withdraw(address indexed to, uint amount);

    constructor() {
        owner = msg.sender;
    }

    function donate() external payable {
        // Make sure you donate more than 0
        require(msg.value > 0, "Donate more than 0");

        donorBalances[msg.sender] += msg.value;
        totalDonations += msg.value;

        emit DonationReceived(msg.sender, msg.value);
    }

    function getDonationOf(address donor) external view returns (uint) {
        return donorBalances[donor];
    }

    function withdraw(uint amount) external {
        require(msg.sender == owner, "Only owner can withdraw");
        require(amount <= address(this).balance, "Not enough balance");

        payable(owner).transfer(amount);

        emit Withdraw(owner, amount);
    }

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}
