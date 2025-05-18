//Question: Implement an Access-Controlled Smart Contract for Document Storage
/*
Problem Statement:
Write a Solidity smart contract that allows users to store documents (as string hashes, e.g., IPFS hashes).
 Only the contract owner can add new documents, and only whitelisted addresses can view the document list.

*/




// for this we can implement a modifier of onlyOwner

// a mapping to store the Whitelisted addresses

// a array to store the documents

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract DecentralizedDocumentStorage {
    address public owner;
    
    // array to store document hashes
    string[] public documents;

    mapping(address => bool) public whitelistedAddresses;
        // <address,true/false>
    // modifier to check if the caller is the owner
    modifier onlyOwner() {

        require(msg.sender == owner, "Only the owner can perform this action");
        _;  
    }



    modifier onlyWhitelisted() {
        require(whitelistedAddresses[msg.sender], "You are not whitelisted to view documents");
        _;
    }



    // now we need to specify the elements that start with the contract

    constructor() {
        owner = msg.sender;
        // the onwer can always view the docs

        whitelistedAddresses[owner] = true;


    } 


    //setting
    function addDocument(string memory _hash) external onlyOwner {
        documents.push(_hash);


    }

    // getting

    function getDocuments() external view onlyWhitelisted returns (string[] memory) {
        return documents;
    }

    function addToWhiteList(address _address) external onlyOwner {
        whitelistedAddresses[_address] = true;
    }


    function removeFromWhiteList(address _address) external onlyOwner {
        whitelistedAddresses[_address] = false;
    }


}