// Write a Solidity function to implement a prediction market, where users can bet on the outcome of future events.


// we need yes bets and no bets


// we need a boolean for ressult


// yes bets address => uint256

// no bets address => uint256

// counter yes bets

// counter no bets

// an event for bet
// an event for marker resolved


// onlyOwner should call a function


// function for placing the bet

// yees -> true
// no -> false


//market resolved -> just show the result of the market


pragma solidity ^0.8.19;

contract future_bet {
    address public owner;
    bool marketResolve;
    uint256 yesBetscount;
    uint256 noBetscount;
    mapping(address => uint256) yesbets;
    mapping(address => uint256) nobets;
    bool outcome;

    event betPlaced(address user,bool outcome,uint256 amount);
    event marketResolved(bool outcome);


    constructor () {
        owner = msg.sender;
        marketResolve = false;
        yesBetscount = 0;
        noBetscount = 0;

    }   

    modifier onlyOwner() {
        require(msg.sender == owner,"you are not owner, you cant call this function");
        _;
    } 




    modifier markerNotResolved {
        require(!marketResolve,"Market already resolved");
        _;
    }


    function placeBet(bool _outcome) external payable markerNotResolved {
            if(_outcome == true) {
                yesbets[msg.sender]  = yesbets[msg.sender] + msg.value;
                yesBetscount = yesBetscount + msg.value;

            }
            else {
                nobets[msg.sender] = nobets[msg.sender] + msg.value;
            noBetscount = noBetscount + msg.value;
            }
    
            emit betPlaced(msg.sender,_outcome,msg.value);
    }

    // after placing bets we need to close the marker

    function marketResol(bool _outcome) external onlyOwner markerNotResolved {
            marketResolve = true;

            outcome = _outcome;

            emit marketResolved(_outcome);
    }


    // how to claim winnings

    //we need to check the marketresolved = true


    function claimWinnings() external {
        require(marketResolve,"market not resolved");

        uint256 betamount;
        uint256 totalWinningbets;


        if(outcome) {
            betamount = yesbets[msg.sender];
            totalWinningbets = yesBetscount;
        }
        else {
            betamount = nobets[msg.sender];
            totalWinningbets = noBetscount;
        }
    

        require(betamount>0,"no winnig to claim");

    uint256 winnings = (betamount * address(this).balance) / totalWinningbets;

    yesbets[msg.sender] = 0;
    nobets[msg.sender] = 0;

    payable(msg.sender).transfer(winnings);
    
    } 




}



