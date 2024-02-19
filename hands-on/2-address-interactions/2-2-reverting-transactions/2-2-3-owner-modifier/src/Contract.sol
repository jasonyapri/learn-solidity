// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    uint configA;
    uint configB;
    uint configC;
    address owner;
    error NotAuthorized();

    constructor() {
        owner = msg.sender;
    }

    function setA(uint _configA) public onlyOwner {
        configA = _configA;
    }

    function setB(uint _configB) public onlyOwner {
        configB = _configB;
    }

    function setC(uint _configC) public onlyOwner {
        configC = _configC;
    }

    modifier onlyOwner() {
        // TODO: require only the owner access
        if (owner != msg.sender) revert NotAuthorized();
        _;
        // TODO: run the rest of the function body
    }
}
