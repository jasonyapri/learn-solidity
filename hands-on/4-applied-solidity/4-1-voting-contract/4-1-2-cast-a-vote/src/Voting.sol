// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {
    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
    }
    
    Proposal[] public proposals;

    function newProposal(address _target, bytes calldata _data) external {
        Proposal memory newProp = Proposal({
            target: _target,
            data: _data,
            yesCount: 0,
            noCount: 0
        });
        
        proposals.push(newProp);
    }

    function castVote(uint proposalId, bool support) external {
        if (support) {
            proposals[proposalId].yesCount++;
        } else{
            proposals[proposalId].noCount++;
        }
    }
}
