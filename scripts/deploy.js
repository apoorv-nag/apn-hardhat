const { ethers } = require("hardhat")

aysnc function main () {
    const [deployer] = await ethers.getSigners();

    console.log("Deploying contracts with the account: ", deployer.address);

    console.log("Account Balance:", (await deployer.getBalance().toString());
    
    const Token = await ethers.getContractFactory("Token");

    const token = Token.deplo();
}

main()
.then(()=> process.exit(0))
.catch(e => {
    console.log(e);
    console.log(1);
})