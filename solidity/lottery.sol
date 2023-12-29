// Write a Solidity function to implement a lottery, where users can buy tickets for a chance to win a prize.
pragma Solidity ^ 0.8.23;


contract lottery {
    //these are variable across the contract
    uint256 lotteryid;
    uint256 starttime;
    uint256 endtime;
    bool isCompleted;
    bool isCreated;
    bool isactive;

    //now  we need to distribute the tickets

    struct distributetickets {
        
        address playeraddress;
        uint256 startindex;
        uint256 endindex;
    }

    struct winningticket {
        address addr;
        uint256 currentlotteryid;
        uint256 winningindex;
    }

    //we are basically stating a lottery ticket window
    //where people can only buy in that


    //got that we need to set some constraints

    //no of people
    //min amount
    //no of hours

    uint256 no_of_hours = 100;
    uint256 min_drawing = 1000000000000000;
    uint256 maxplayersallowed = 1000;
    
     



}
