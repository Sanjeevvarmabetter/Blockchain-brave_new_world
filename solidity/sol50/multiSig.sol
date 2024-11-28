// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleMultiSigWallet {
    address[] public owners;
    uint public requiredConfirmations;

    mapping(address => bool) public isOwner;
    mapping(uint => bool) public executed;

    event TransactionExecuted(uint indexed transactionId);

    constructor(address[] memory _owners, uint _requiredConfirmations) {
        require(_owners.length > 0, "Owners array must not be empty");
        require(_requiredConfirmations <= _owners.length, "Required confirmations must be less than or equal to the number of owners");

        for (uint i; i < _owners.length; i++) {
            require(_owners[i] != address(0), "Owners array cannot contain the zero address");
            isOwner[_owners[i]] = true;
            owners.push(_owners[i]);
        }
        requiredConfirmations = _requiredConfirmations;
    }

    function submitTransaction(address _to, uint _value, bytes calldata _data) external onlyOwner returns (uint transactionId) {
        transactionId = block.timestamp;
        require(!executed[transactionId], "Transaction already executed");

        (bool success, ) = _to.call{value: _value}(_data);
        require(success, "Transaction failed");

        executed[transactionId] = true;
        emit TransactionExecuted(transactionId);
    }

    modifier onlyOwner() {
        require(isOwner[msg.sender], "Sender is not an owner");
        _;
    }
}
