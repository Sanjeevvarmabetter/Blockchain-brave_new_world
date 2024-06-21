
// this is linear vesting
// this is a way to gradually release or distribute tokens over a period of time instead of giving them all at once.


// recipiets
// amounts
// start time
// duration

// the recipiets can claim tokens with the following equation
// released = amouunt * (startTime+duration-currentTime) / duration



import "@openzeppelin/contracts/token/ERC20.sol";

// creating a token


contract Token is ERC20 {
    constructor(string memory _name,string memory _symbol,uint _totalsupply) ERC(_name,_symbol) {
        _mint(msg.sender,_totalsupply); // mintinh is a process of producing something new

    }
}


contract LinearVesting {
    using SafeERC20 for IERC20;

    IERC20 public token;

    constructor(IERC20 _token) {
        token = _token;
    }
}