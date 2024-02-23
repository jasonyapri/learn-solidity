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
		if (findVote(msg.sender).voter == address(0)) {
			votes.push(Vote({
				choice: choice,
				voter: msg.sender
			}));
		} else{
			revert("You have voted previously!");
		}
		
	}

	function findVote(address voter) internal view returns(Vote memory) {
		for (uint i = 0; i < votes.length; i++) {
			if (votes[i].voter == voter) return votes[i];
		}

		return Vote(Choices(0), address(0));
	}

	function hasVoted(address voter) external view returns(bool) {
		Vote memory filteredVote = findVote(voter);

		if (filteredVote.voter != address(0)) {
			return true;
		} else{
			return false;
		}
	}

	function findChoice(address voter) external view returns(Choices) {
		Vote memory filteredVote = findVote(voter);

		if (filteredVote.voter != address(0)) {
			return filteredVote.choice;
		}
	}
}