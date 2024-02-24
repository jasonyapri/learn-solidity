// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Ownable {
    address owner = msg.sender;
    error NotAuthorized();

    modifier onlyOwner {
        if(owner != msg.sender) revert NotAuthorized();
        _;
    }
}