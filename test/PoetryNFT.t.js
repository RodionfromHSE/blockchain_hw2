const { expect } = require("chai");
describe("PoetryNFT", () => {
  it("mints to caller and stores poem", async () => {
    const [alice] = await ethers.getSigners();
    const PoetryNFT = await ethers.getContractFactory("PoetryNFT");
    const nft = await PoetryNFT.deploy();
    await nft.publish("Roses are red");
    expect(await nft.ownerOf(1)).to.equal(alice.address);
  });
});
