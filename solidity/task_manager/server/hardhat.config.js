require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();
/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.24",

  //defining networks

  networks:{
    sepolia: {
      url: process.env.ALCHEMY_SEPOLIA_KEY,
      accounts: [process.env.ACCOUNT_PRIVATE_KEY]
    }
  }

};
