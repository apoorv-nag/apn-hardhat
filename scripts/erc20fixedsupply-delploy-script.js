// import { ethers } from 'hardhat';

async function main() {
  const [deployer] = await ethers.getSigners();

  const ERC20FixedSupplyContractFactory = await ethers.getContractFactory(
    'ERC20FixedSupply'
  );
  const ERC20FixedSupplyContract = await ERC20FixedSupplyContractFactory.deploy(
    10
  );

  console.log(await ERC20FixedSupplyContract.balanceOf(deployer));
}

main().catch((e) => {
  console.error(e);
  process.exitCode = 1;
});
