pragma solidity 0.8.19;

//we need to make a contract that saves the name and persons fav number 
//our contract need to store multiple persons with out any problem


contract Simplestoarage {
	uint256 favnumber;

	struct people {
	string name;
	uint256 favnumber;
	}

	People[] people;

	mapping(string => uint256) public nameTofavnumber;

	function store(uint256 _favoritenumber) public {
	
		favnumber = _favoritenumber;

	}

	function retrive() public view returns (uint256) {
		return favnumber;
	}

	function addperson(string memory _name,uint256 _favnumber) public {
		people.push(People(_favnumber, _name));
		nameTofavnumber[_name] = _favnumber;
	}
}