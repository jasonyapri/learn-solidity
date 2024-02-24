// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {

    event ProposalCreated(uint proposalId);
    event VoteCast(uint proposalId, address voter);

    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
        mapping(address => uint8) voters;
        bool executed;
    }
    
    Proposal[] public proposals;

    address[] whitelistedAddresses;

    error NotAuthorized();

    constructor(address[] memory addr) {
        whitelistedAddresses = addr;
        whitelistedAddresses.push(msg.sender);
    }

    function isWhitelisted(address addr) internal view returns(bool) {
        bool found = false;

        for(uint i = 0; i < whitelistedAddresses.length; i++) {
            if (whitelistedAddresses[i] == addr) {
                found = true;
                return found;
            }
        }
        
        return found;
    }

    function newProposal(address _target, bytes calldata _data) external {
        if (!isWhitelisted(msg.sender)) revert NotAuthorized();

        Proposal storage newProp = proposals.push();

        newProp.target = _target;
        newProp.data = _data;
        newProp.yesCount = 0;
        newProp.noCount = 0;
        newProp.executed = false;

        emit ProposalCreated(proposals.length-1);
    }

    function castVote(uint proposalId, bool support) external {
        if (!isWhitelisted(msg.sender)) revert NotAuthorized();

        if (proposals[proposalId].voters[msg.sender] == 1) {
            if (!support) {
                proposals[proposalId].yesCount--;
                proposals[proposalId].noCount++;
                proposals[proposalId].voters[msg.sender] = 2;
            }
        } else if (proposals[proposalId].voters[msg.sender] == 2) {
            if (support) {
                proposals[proposalId].yesCount++;
                proposals[proposalId].noCount--;
                proposals[proposalId].voters[msg.sender] = 1;
            }
        } else{
            if (support) {
                proposals[proposalId].yesCount++;
                proposals[proposalId].voters[msg.sender] = 1;
            } else{
                proposals[proposalId].noCount++;
                proposals[proposalId].voters[msg.sender] = 2;
            }
            emit VoteCast(proposalId, msg.sender);
        }

        if (proposals[proposalId].yesCount >= 10 && proposals[proposalId].executed == false) {
            (bool success, ) = proposals[proposalId].target.call(proposals[proposalId].data);
            require(success);
            proposals[proposalId].executed = true;
        }
    }
}
