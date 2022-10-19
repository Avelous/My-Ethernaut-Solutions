// SPDX-License-Identifier: MIT
pragma solidity ^0.6.5;

interface IDetectionBot {
    function handleTransaction(address user, bytes calldata msgData) external;
}

interface IForta {
    function setDetectionBot(address detectionBotAddress) external;

    function notify(address user, bytes calldata msgData) external;

    function raiseAlert(address user) external;
}

contract MyDetectionBot is IDetectionBot {
    address constant VAULT;

    constructor(address _vault) {
        VAULT = _vault;
    }

    function handleTransaction(address user, bytes calldata msgData)
        external
        override
    {
        (, , address origSender) = abi.decode(
            msgData[4:],
            (address, uint256, address)
        );
        if (origSender == VAULT) {
            IForta(msg.sender).raiseAlert(user);
        }
    }
}
