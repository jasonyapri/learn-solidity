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
    }
    
    Proposal[] public proposals;

    function newProposal(address _target, bytes calldata _data) external {
        Proposal storage newProp = proposals.push();

        newProp.target = _target;
        newProp.data = _data;
        newProp.yesCount = 0;
        newProp.noCount = 0;

        emit ProposalCreated(proposals.length-1);
    }

    function castVote(uint proposalId, bool support) external {
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
        }

        emit VoteCast(proposalId, msg.sender);
    }
}
