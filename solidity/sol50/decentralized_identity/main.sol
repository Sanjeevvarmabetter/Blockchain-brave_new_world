pragma solidity  ^0.8.21;

//Write a Solidity function to implement a decentralized identity system, where users can prove their identity without relying on a centralized authority.


contract identity {

//generally we use ssn for identity proof

//in the decentralized world we can use a 

// the contract should allow user to register their identity,specifying 
    // details like name,dob,and gov issued id

    struct Identity {
        string name;
        uint256 dob;
        string govId;
        bool verified;
    }



    mapping(address => identity) public identities;

    function registeridentity(string memory _fullname,uint256 _idnumber) public  {
        require(_idnumber > 0,"Id must be greater than zero");
        require(bytes(_fullname).length >0,"Full name cannot be empty");

        //now we need to create an object

        Identity memory identity = Identity({
            name: _fullname,
            dob 


        
        })
    
    }



}