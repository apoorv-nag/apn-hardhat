// import { ethers } from 'hardhat';

async function main() {
  const [deployer, deployer_2] = await ethers.getSigners();

  const ERC20FixedSupplyContractFactory = await ethers.getContractFactory(
    'APNToken'
  );
  const ERC20FixedSupplyContract = await ERC20FixedSupplyContractFactory.deploy(
    10000
  );
  console.log(await deployer.getBalance());
  console.log(await ERC20FixedSupplyContract.balanceOf(deployer.address));
  console.log(await ERC20FixedSupplyContract.balanceOf(deployer_2.address));
}

main().catch((e) => {
  console.error(e);
  process.exitCode = 1;
});
