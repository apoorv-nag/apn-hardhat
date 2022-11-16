const { ethers } = require('hardhat');

describe('APNTokenTest', function () {
  it('Should deploy contract', async function () {
    const APNTokenContract = await ethers.getContractFactory('APNToken');

    const APNToken = await APNTokenContract.deploy(1000);
    await APNToken.deployed();

    console.log(APNToken.getBalance());
  });
});
