// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";

contract Contract {

	struct User {
		uint balance;
		bool isActive;
	}

	mapping(address => User) public users;

    error NotEnoughBalance();
    error UserNotActive();
    error UserAlreadyCreated();

	function createUser() external {
		if (users[msg.sender].isActive == true) revert UserAlreadyCreated();

		User memory newUser = User({
			balance: 100,
			isActive: true
		});

		users[msg.sender] = newUser;
	}

	function transfer(address recipient, uint amount) external {
		if (users[msg.sender].isActive == false) revert UserNotActive();
		if (users[recipient].isActive == false) revert UserNotActive();
		if (users[msg.sender].balance < amount) revert NotEnoughBalance();

		users[msg.sender].balance -= amount;
        users[recipient].balance += amount;
	}

}