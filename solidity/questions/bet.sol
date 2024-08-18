// the users can bet


pragma solidity ^0.8.0;


contract PredictBetting {
	address public owner;
	event eventDescription;
	bool public eventResolved;
	uint public outcome;


struct bet {
	uint amount;
	uint outcome;
}

	mapping(address => bet) public bets;
	mapping(uint => uint) public totalBets;
	uint public totalBetamount;

	event betplaced(addreess indexed user,uint amoount,uint outcome);
	event eventResolved(uint outcome);
	event Payout(address indexed user,uint amount);

	

	//now we  need to 3 modifierd only onwer nd beforee evenet resolved
	// and after event resolve



	modifier onlyOwner() {
		require(msg.sender == owner,"only owner can call");
	_;
	}

	modifier beforeEventResolved() {
		require(!eventResolved,"event already resolved");
	_;

	}
	modifier aftereventresolved() {
		require(!eventResolved,"event not resoled");
		_;

	}
    constructor(string memory _eventDescription) {
	          owner = msg.sender;
		  eventDescription = _eventDescription;
		 eventResolved = false;
	         totalBets[1] = 0;
		totalBets[2] = 0;
		 totalBetAmount = 0;
							        }
	}

	
	function placeBet() 

	function resolveevent()

	function claimreward()

	function getbet()
}
