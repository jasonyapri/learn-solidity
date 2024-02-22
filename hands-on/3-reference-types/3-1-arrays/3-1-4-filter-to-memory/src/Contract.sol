// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {
    function filterEven(uint[] calldata numbers)
        external
        pure
        returns(uint[] memory)
    {
        uint evenNumberCount = 0;
        for (uint i = 0; i < numbers.length; i++) {
            if (numbers[i] % 2 == 0)
                evenNumberCount++;
        }

        uint[] memory evenNumbers = new uint[](evenNumberCount);
        uint evenNumberIndex = 0;
        for (uint i = 0; i < numbers.length; i++) {
            if (numbers[i] % 2 == 0)
                evenNumbers[evenNumberIndex++] = numbers[i];
        }
        
        return evenNumbers;
    }
}