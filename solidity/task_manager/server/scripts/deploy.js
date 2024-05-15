const hre = require("hardhat");

async function main() {
    try {
    
    const task = await hre.ethers.getContractFactory("task");

    //deploy

    const contract = await task.deploy();



    console.log(`Contract deployed to ${contract}`);

    }
    catch(error) {
        console.error(error);
        process.exit(0);
    } 
}

main();