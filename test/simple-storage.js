const { ethers } = require("hardhat");
const { expect } = require("chai");

describe("Token Contract", function () {
    it("Deploy", async function() {
   
        const [owner] = await ethers.getSigners();
        
        console.log(`Owner balance ${await owner.getBalance()}`);
        
        const Token = await ethers.getContractFactory("SimpleStorage");
        
        const simpleStorageToken = await Token.deploy();
        
        console.log(simpleStorageToken.address);

        console.log('-----------------');
        console.log(await simpleStorageToken.get());
        await simpleStorageToken.set(ethers.constants.MaxUint256);
        // await simpleStorageToken.set(-100);
        console.log(await simpleStorageToken.get());
        console.log('-----------------');
        console.log(`Owner balance ${await owner.getBalance()}`);
    });
});

