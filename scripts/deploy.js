async function main() {
  const [deployer] = await ethers.getSigners();
  const PoetryNFT = await ethers.getContractFactory("PoetryNFT");
  const nft = await PoetryNFT.deploy();
  await nft.deployed();
  console.log("PoetryNFT deployed at:", nft.address);
}
main().catch(console.error);
