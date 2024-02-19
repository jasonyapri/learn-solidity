// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    function double(uint param) external pure returns (uint result) {
        result = param * 2;
    }

    function double(
        uint param1,
        uint param2
    ) external pure returns (uint, uint) {
        return (param1 * 2, param2 * 2);
    }
}
