/*


what is vesting?
A Token Vesting Contract ensures that tokens are released 
to a beneficiary in a controlled manner over time.
 This is particularly useful for scenarios like rewarding 
 team members, investors, or advisors, ensuring they have a 
 long-term stake in the project.


Vested Amount=( Total Tokens/duration)×(Current Time−Start Time)


*/

interface IERC20 {
        function transfer(address recipient,uint256 amount) external returns (bool);
        function balanceOf(address account) external view returns (uint256);
}

contract tokenVesting {
    IERC20 public token;
    address public beneficiary;
    uint256 public start;
    uint256 public cliff;
    uint256 public duration;
    uint256 public released;

    event TokensReleased(uint256 amount);


    constructor(
        IERC20 _token,
        address _beneficiary,
        uint256 _start,
        uint256 _cliff,
        uint256 _duration
    )

    {
        require(_beneficiary != address(0),"Beneficiary cannot be zero");
        require(_cliff <= _duration,"Cliff must be <= duration");

        require(_duration>0,"Duration should be greater than 0");



        token = _token;
        beneficiary = _beneficiary;
        start = _start;
        cliff = _cliff;
        duration = _duration;
        released = 0;

    }


    function release() public {
        uint256 vested = _vestedAmount(block.timestamp);    
        uint256 unreleased = vested -  released;
        released = released + unreleased;
                require(token.transfer(beneficiary, unreleased), "Token transfer failed");

    emit TokensReleased(unreleased);
    
    }


    function _vestedAmount(uint256 timestamp) internal view returns (uint256) {
        if(timestamp < start+cliff) {
            return 0;

        }
    
        else if(timestamp >= start + duration) {
            return token.balanceOf(address(this)) + released;
        }
        else {
            uint256 timeElapsed = timestamp - start;
        
                    return (token.balanceOf(address(this)) + released) * timeElapsed / duration;

        }

    }


}
