// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.19;
//get funds from users
//withdraw funds
//set a min value in usd
//this is locally
// import {AggregatorV3Interface} from "./AggregatorV3Interface.sol";

//directly from github

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";


//aggregator interface
// interface AggregatorV3Interface {

//   function decimals() external view returns (uint8);
//   function description() external view returns (string memory);
//   function version() external view returns (uint256);

//   function getRoundData(uint80 _roundId)
//     external
//     view
//     returns (
//       uint80 roundId,
//       int256 answer,
//       uint256 startedAt,
//       uint256 updatedAt,
//       uint80 answeredInRound
//     );
//   function latestRoundData()
//     external
//     view
//     returns (
//       uint80 roundId,
//       int256 answer,
//       uint256 startedAt,
//       uint256 updatedAt,
//       uint80 answeredInRound
//     );

// }



contract Fundme {
    
    uint256 public minusd = 5e18;

    function fund() public payable  {
        //allow users to send money
        //have min amount set
        //contracts can hold funds 
        require(getconversionrate(msg.value) >= minusd, "min amount is req");    
        //msg.usd is in ether/wei the minusd is dollars
        //so we are going to use chainlinks
        //we cant make a https call to any apis
        //we need oracles to do that 

        //chainlink datafeeds


        }

        function getprice() public view returns(uint256) {
        //ETH/USD     
           //address 0x694AA1769357215DE4FAC081bf1f309aDC325306
           //abi

        //how can we get the abi 
        // interfaces
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 price,,,) = priceFeed.latestRoundData();   
      

        return uint256(price * 1e10);     
      
        }



        function getconversionrate(uint256 ethamount) public  view  returns(uint256) {
            // 1 eth = ?
            //2000_00000000000000000


            uint256 ethprice = getprice(); // this function is going to retrive the price
            //(2000_000000000000000000 *1_000000000000000000) / 1e18 = 2000
            
            uint256 ethamountinusd = (ethprice * ethamount)/ 100;



          return ethamountinusd;


        }

        function getversion() public view returns (uint256) {
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
            
        }

    // function withdraw() public {
        
    // }
}
