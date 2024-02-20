// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Escrow {
    address public depositor = msg.sender;
    address public beneficiary;
    address public arbiter;

    event Approved(uint);

    error NotAuthorized();

    constructor(address _arbiter, address _beneficiary) payable {
        arbiter = _arbiter;
        beneficiary = _beneficiary;
    }

    function approve() external {
        if (msg.sender != arbiter) revert NotAuthorized();

        uint balance = address(this).balance;
        (bool success, ) = beneficiary.call{value: balance}("");
        require(success);

        emit Approved(balance);
    }
}
