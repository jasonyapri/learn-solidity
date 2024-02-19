// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    address deployer;
    error InsufficientEther(uint256);
    error NotAuthorized();

    constructor() payable {
        deployer = msg.sender;
        if (msg.value < 1 ether) revert InsufficientEther(msg.value);
    }

    function withdraw() public {
        if (deployer == msg.sender) {
            (bool success, ) = deployer.call{value: address(this).balance}("");
            require(success);
        } else {
            revert NotAuthorized();
        }
    }
}
