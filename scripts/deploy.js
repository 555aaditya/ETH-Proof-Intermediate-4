const { ethers } = require("hardhat");

async function main() {
  const Banking = await ethers.getContractFactory("Banking");
  const banking = await Banking.deploy();
  await banking.deployed();

  console.log("Banking contract deployed to:", banking.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
