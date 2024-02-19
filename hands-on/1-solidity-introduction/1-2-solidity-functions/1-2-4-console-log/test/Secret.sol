pragma solidity ^0.8.20;

contract Secret {
    string public message;
    uint public win;

    constructor(string memory _message, uint _win) {
        message = _message;
        win = _win;
    }
}
