// erc 20 token -> ethereum request for comment

//https://www.quicknode.com/guides/ethereum-development/smart-contracts/how-to-create-and-deploy-an-erc20-token



// thee mandatory functions of erc20 tokens are 

// totalsupply
//balanceOf
//trasfer
//transferFrom
// appprove
// allowance



pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract mytoken is ERC20 {
    constructor() ERC20("MyToken","MT") {
        _mint(msg.sender,100000 * (10**uint256(decimals(()))));
    }
}


// the erc20 tokens allow

// transfer tokens
// allow others to transfer token on behalf of the token holder

// interface of erc20;


// this is like a blueprint for the erc20
interface ierc20 {
    function totalSupply() external view returns  (uint256);
    function balanceOf(address account) external view returns(uint256);
    //transfer
        // we need to address and from address

    function transfer(address to,uint256 amount) external returns(bool);


    function allowance(address owner,address spender) external view returns (uint256);

    function approve(address spender,uint256 amount) external returns (bool);

    function transferFrom(address sender,address recipient,uint256 amount) external returns (bool);



}



contract erc20 is ierc20 {
    event transfer(addr)
}
