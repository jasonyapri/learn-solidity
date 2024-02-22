// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {
    function sum(uint[] calldata numbers) external pure returns(uint) {
        uint accummulatedSum = 0;
        for (uint i = 0; i < numbers.length; i++) {
            accummulatedSum += numbers[i];
        }

        return accummulatedSum;
    }
}