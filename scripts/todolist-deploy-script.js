async function main() {
  const [deployer] = await ethers.getSigners();

  console.log('Deploying contracts with the account: ', deployer.address);

  console.log('Account Balance:', await deployer.getBalance().toString());

  const Token = await ethers.getContractFactory('TodoList');
  const token = await Token.deploy();
  console.log(await token.totalCount());

  console.log('Token address: ', token.address);
}

console.log('hello');
main()
  .then(() => process.exit(0))
  .catch((e) => {
    console.log(e);
    process.exit(1);
  });
