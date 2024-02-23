// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {
	enum Choices { Yes, No }
	
	struct Vote {
		Choices choice;
		address voter;
	}

	Vote[] public votes;

	function createVote(Choices choice) external {
		(Vote memory filteredVote, ) = findVote(msg.sender);
		if (filteredVote.voter == address(0)) {
			votes.push(Vote({
				choice: choice,
				voter: msg.sender
			}));
		} else{
			revert("You have voted previously!");
		}
	}

	function changeVote(Choices choice) external {
		(Vote memory filteredVote, uint voterIndex) = findVote(msg.sender);

		if (filteredVote.voter == address(0)) {
			revert("You have not voted previously!");
		} else{
			votes[uint(voterIndex)].choice = choice;
		}
	}

	function findVote(address voter) internal view returns(Vote memory, uint256) {
		for (uint i = 0; i < votes.length; i++) {
			if (votes[i].voter == voter) return (votes[i], i);
		}

		return (Vote(Choices.No, address(0)), 0);
	}

	function hasVoted(address voter) external view returns(bool) {
		(Vote memory filteredVote, ) = findVote(voter);

		if (filteredVote.voter != address(0)) {
			return true;
		} else{
			return false;
		}
	}

	function findChoice(address voter) external view returns(Choices) {
		(Vote memory filteredVote, ) = findVote(voter);

		if (filteredVote.voter != address(0)) {
			return filteredVote.choice;
		}
	}
}