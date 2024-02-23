// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {

	struct User {
		uint balance;
		bool isActive;
	}

	mapping(address => User) public users;

	function createUser() external {
		if (users[msg.sender].isActive == true) revert("Not Allowed");

		User memory newUser = User({
			balance: 100,
			isActive: true
		});

		users[msg.sender] = newUser;
	}

}