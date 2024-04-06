//this contract is deployed on the sepolia test network :  0x2b26bb1E44324CA4D8FDEDd32A412A44d342256c
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19 ;

contract Simplestorage {
    //basic types : boolean, uint,int,address,bytes
    uint256 internal favoratenumber; //default 0

    //array 

    // uint256[] listoffavnumbers; 

    struct Person{
        uint256 favnumber;
        string name;
    }


    Person[] public listofpeople;

    mapping(string => uint256) public nametofavnumber;

    // Person public myfriend = Person(7,"sanjeev");

    // Person public myfriend = Person({favoratenumber: 48,name: "varma"});


    function store(uint256 _favoritenumber) public  {
        favoratenumber = _favoritenumber;
        

    }

    //view ,pure

    function retrive() public view  returns(uint256) {
        return favoratenumber;
    }


    function addPerson(string memory _name,uint256 _favoratenumber) public {
        listofpeople.push(Person(_favoratenumber,_name));
    }

 
    // calldata, memory, storage
    function addperson(string calldata _name,uint256 _favoritenumber) public  {
        listofpeople.push( Person(_favoritenumber,_name));
        nametofavnumber[_name] = _favoritenumber;

    }
    
}


