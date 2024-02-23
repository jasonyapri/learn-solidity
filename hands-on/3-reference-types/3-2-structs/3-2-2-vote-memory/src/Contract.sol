// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {
	enum Choices { Yes, No }

	struct Vote {
		Choices choice;
		address voter;
	}
	
	// TODO: make a new createVote function
	function createVote(Choices _choice) external view returns(Vote memory) {
		Vote memory _vote = Vote({
			choice: _choice,
			voter: msg.sender
		});
		
		return _vote;
	}
}