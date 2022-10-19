const { network, ethers } = require("hardhat")
const { developmentChains, networkConfig } = require("../helper-hardhat-config")
const { verify } = require("../utils/verify")


module.exports = async function ({ getNamedAccounts, deployments }) {
    const { deploy, log } = deployments
    const { deployer } = await getNamedAccounts()
    const chainId = network.config.chainId


    log("----------------------------------------------------")
    const args = []
    const hackGatekeeper = await deploy("HackGatekeeperOne", {
        from: deployer,
        args: args,
        log: true,
        waitConfirmation: network.config.blockConfirmation || 1,
    })
   

       // Verify the deployment
       if (
        !developmentChains.includes(network.name) &&
        process.env.ETHERSCAN_API_KEY
    ) {
        console.log("Verifying...")
        await verify(hackGatekeeper.address, args)
    }
}


module.exports.tags = ["all", "hack"]