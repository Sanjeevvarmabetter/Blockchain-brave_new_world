// Write a Solidity function to implement a cross-chain bridge, where tokens can be transferred between different blockchains.


import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract crosschainBridge is Ownable {

    IERC20 public token;
    address public validator;

    event lock(address indexed sender,uint256  amount,uint256 targetchainId,address targetAddress);
    event  unlock(address indexed receiver,uint256 amount);


    constructor (IERC20 _token,address _validator) {
        token = _token;
        validator = _validator;
    }


    modifier onlyValidator() {
        require(msg.sender == validator,"Not validator");
        _;
    }


    function setValidator(address _validator) external onlyOwner {
        validator = _validator;
    }


    function lock(uint256 amount,uint256 targetChainId,address targetAddress)  external {
        require(token.transferFrom(msg.sender,address(this),amount),"transfer failed");

        emit Lock(msg.sender,amount,targetChainId,targetAddress);
    }

    function unlock(address receiver, uint256 amount) external onlyValidator {
        require(token.transfer(receiver, amount), "Transfer failed");

        emit Unlock(receiver, amount);
    }

}
