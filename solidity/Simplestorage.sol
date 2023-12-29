//first we need to write the solidity version

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19 ;

contract Simplestorage {
    //basic types : boolean, uint,int,address,bytes
    uint256 internal favoratenumber; //default 0

    //arrays and structs

    // uint256[] listoffavnumbers; 

    struct Person{
        uint256 favnumber;
        string name;
    }


    Person[] public listofpeople;




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






}
