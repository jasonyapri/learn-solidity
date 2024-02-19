// SPDX-License-Identifier: MIT
import "forge-std/console.sol";

pragma solidity ^0.8.20;

contract Contract {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    receive() external payable {
        console.log(msg.value);
        return true;
    }

    function tip() public payable {
        (bool success, ) = owner.call{value: msg.value}("");
        require(success);
    }
}
