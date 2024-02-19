// SPDX-License-Identifier: MIT
import "forge-std/console.sol";

pragma solidity ^0.8.20;

contract Contract {
    address public owner;
    address public charity;

    constructor(address _charity) {
        owner = msg.sender;
        charity = _charity;
    }

    receive() external payable {
        console.log(msg.value);
    }

    function tip() public payable {
        (bool success, ) = owner.call{value: msg.value}("");
        require(success);
    }

    function donate() public {
        (bool success, ) = charity.call{value: address(this).balance}("");
        require(success);
    }
}
