// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {
	enum Choices { Yes, No }

	// TODO: create a vote struct and a public state variable
	struct Vote {
		Choices choice;
		address voter;
	}

	Vote public vote;

	function createVote(Choices _choice) external {
		Vote memory _vote = Vote(_choice, msg.sender);
		vote = _vote;
	}
}