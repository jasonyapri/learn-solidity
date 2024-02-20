// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Sidekick {
    function makeContact(address hero) external {
        (bool s, ) = hero.call(abi.encodeWithSignature("alert()"));
        require(s);
    }
}
