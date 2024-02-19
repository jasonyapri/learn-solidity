// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    error InsufficientEther(uint256);

    constructor() payable {
        if (msg.value != 1 ether) {
            revert InsufficientEther(msg.value);
        }
    }
}
