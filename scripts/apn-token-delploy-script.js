// import { ethers } from 'hardhat';

async function main() {
  const [deployer, deployer_2] = await ethers.getSigners();

  const APNTokenContract = await ethers.getContractFactory('APNToken');
  const APNToken = await APNTokenContract.deploy(10000);
  console.log(await deployer.getBalance());
  console.log(await APNToken.balanceOf(deployer.address));
  console.log(await APNToken.balanceOf(deployer_2.address));
}

main().catch((e) => {
  console.error(e);
  process.exitCode = 1;
});
