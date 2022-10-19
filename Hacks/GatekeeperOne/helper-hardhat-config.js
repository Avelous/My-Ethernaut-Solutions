const { ethers } = require("hardhat")

const networkConfig = {
    4: {
        name: "rinkeby"
        
    },
    1337 : {
        name: "hardhat"
       
    },
    31337 : {
        name: "hardhat"
    
    },
}

const developmentChains = ["hardhat", "localhost"]

module.exports = {
    networkConfig,
    developmentChains,
}
