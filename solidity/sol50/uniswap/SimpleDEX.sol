// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// We need an IERC20 interface
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract SimpleDEX {

    // Typically one smart contract swaps for two tokens
    IERC20 public tokenA;
    IERC20 public tokenB;

    // We need to have reserves for each token
    uint public reserveA;
    uint public reserveB;

    address public owner;

    constructor(address _tokenA, address _tokenB) {
        tokenA = IERC20(_tokenA);
        tokenB = IERC20(_tokenB);
        owner = msg.sender;
    }

    function addLiquidity(uint amountA, uint amountB) external {
        // Transfer tokens from user to this contract
        tokenA.transferFrom(msg.sender, address(this), amountA);
        tokenB.transferFrom(msg.sender, address(this), amountB);

        // Update reserves
        reserveA += amountA;
        reserveB += amountB;
    }

    /// Now we handle swapping tokens
    function swapAtoB(uint amountAIn) external {
        require(amountAIn > 0, "AmountAIn must be greater than 0");

        uint amountBOut = getAmountOut(amountAIn, reserveA, reserveB);

        tokenA.transferFrom(msg.sender, address(this), amountAIn);
        tokenB.transfer(msg.sender, amountBOut);

        // Update reserves
        reserveA += amountAIn;
        reserveB -= amountBOut;
    }

    function swapBtoA(uint amountBIn) external {
        require(amountBIn > 0, "AmountBIn must be greater than 0");

        uint amountAOut = getAmountOut(amountBIn, reserveB, reserveA);

        tokenB.transferFrom(msg.sender, address(this), amountBIn);
        tokenA.transfer(msg.sender, amountAOut);

        // Update reserves  
        reserveB += amountBIn;
        reserveA -= amountAOut;
    }

    // Uniswap formula with 0.3% fee: (x + dx)(y - dy) = x*y
    function getAmountOut(uint inputAmount, uint inputReserve, uint outputReserve) public pure returns (uint) {
        uint inputAmountWithFee = inputAmount * 997;
        uint numerator = inputAmountWithFee * outputReserve;
        uint denominator = (inputReserve * 1000) + inputAmountWithFee;
        return numerator / denominator;
    }
}
