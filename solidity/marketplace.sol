// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Marketplace {
    address public seller;
    address public buyer;
    mapping(address => uint) public balances;

    event ListItem(uint price);
    event PurchasedItem(address seller, address buyer, uint price);

    enum StateType {
        ItemAvailable,
        ItemPurchased
    }

    StateType public State;

    constructor() {
        seller = msg.sender;
        State = StateType.ItemAvailable;
    }
        function purchase(address person,uint price) public payable  {
        require(person == msg.sender,"use your own account");
        balances[person] += price;
    }

    function buy(uint price) public payable {
        require(State == StateType.ItemAvailable, "Item not available");
        require(msg.value >= price, "Insufficient payment");

        buyer = msg.sender;
        State = StateType.ItemPurchased;
        balances[buyer] -= msg.value;
        balances[seller] += msg.value;

        emit PurchasedItem(seller, buyer, price);
    }

}

