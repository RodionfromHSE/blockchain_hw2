# Poetry NFT Contract

*Note:* I tried to implement `Exchange Office` first, but something went wrong...

## What you need:

* Node (18 or higher)
* Git
* MetaMask wallet
* Sepolia ETH from [Alchemy faucet](https://www.alchemy.com/faucets/sepolia)
* Free Alchemy account (HTTP endpoint for Sepolia)

---

## 1. Setup the project

```bash
git clone https://github.com/your-name/poetry-nft.git
cd poetry-nft
npm install
```

## 2. Create `.env` file

Create a file called `.env` in your project folder:

```
API_URL="your-alchemy-http-endpoint"
PRIVATE_KEY="your-wallet-private-key"
```

## 3. Run tests

```bash
npx hardhat test
```

Check if tests pass.

## 4. Deploy contract to Sepolia

```bash
npx hardhat run scripts/deploy.js --network sepolia
```

Save the printed contract address.

## 5. Publish your NFT

```bash
npx hardhat console --network sepolia
```

Inside the console, run:

```js
const nft = await ethers.getContractAt("PoetryNFT", "your-contract-address");
await nft.publish("Your poem here...");
```

## 6. Verify your NFT

* Copy the transaction hash into [Sepolia Etherscan](https://sepolia.etherscan.io/) to check.
* Or, use the console to confirm:

```js
await nft.tokenURI(1);
```

It returns base64-encoded data. Decode this with any base64 decoder online.
