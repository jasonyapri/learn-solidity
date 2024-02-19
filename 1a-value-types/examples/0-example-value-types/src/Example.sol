// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/console.sol";

contract Example {
    uint8 a = 254; // 0 -> 255
    uint256 b = 22; // alias: uint

    bool myCondition;
    
    enum Choice {
        Up,
        Down,
        Left,
        Right
    }

    constructor(Choice choice) {
        if (choice == Choice.Up) {
            console.log("Up");
        } else{
            console.log("Not Up!");
        
        }
    }

    int8 c = 127; // -128 -> 127
    int256 d = -55; // alias: int256
}
