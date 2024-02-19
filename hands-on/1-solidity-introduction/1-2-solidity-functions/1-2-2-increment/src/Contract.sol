// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    uint public x;
    constructor(uint arg) {
        x = arg;
    }

    function increment() external {
        x++;
    }

    function add(uint param) external view returns (uint) {
        return param + x;
    }
}
