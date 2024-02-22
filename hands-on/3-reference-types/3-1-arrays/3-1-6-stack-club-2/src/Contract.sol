// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract StackClub {
    address[] public members;

    error NotAuthorized();

    constructor() {
        members.push(msg.sender);
    }

    function addMember(address newMember) external {
        bool isMember = false;

        for(uint i = 0; i < members.length; i++) {
            if (members[i] == msg.sender) {
                isMember = true;
                break;
            }
        }

        if (!isMember) revert NotAuthorized();

        members.push(newMember);
    }

    function isMember(address currentMember) public view returns(bool) {
        for (uint i = 0; i < members.length; i++) {
            if (members[i] == currentMember) return true;
        }

        return false;
    }

    function removeLastMember() public {
        bool isMember = false;

        for(uint i = 0; i < members.length; i++) {
            if (members[i] == msg.sender) {
                isMember = true;
                break;
            }
        }

        if (!isMember) revert NotAuthorized();
        members.pop();
    }
}