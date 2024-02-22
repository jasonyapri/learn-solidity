// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {
    function sum(uint[5] memory numbers) external pure returns(uint) {
        uint accumulatedSum = 0;
        for (uint i = 0; i < 5; i++) {
            accumulatedSum += numbers[i];
        }

        return accumulatedSum;
    }
}