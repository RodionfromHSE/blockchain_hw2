require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();
module.exports = {
  solidity: "0.8.24",
  networks: {
    sepolia: {
      url: process.env.API_URL,      // Alchemy/Infura RPC
      accounts: [process.env.PRIVATE_KEY] // your MetaMask pk without 0x
    }
  }
};
