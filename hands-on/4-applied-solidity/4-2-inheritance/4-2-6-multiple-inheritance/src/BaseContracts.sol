// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Ownable {
    address owner = msg.sender;
    error NotAuthorized();

    modifier onlyOwner {
        if(owner != msg.sender) revert NotAuthorized();
        _;
    }
}

contract Transferable is Ownable {
    event OwnershipTransfered(address oldOwner, address newOwner);
    
    function transfer(address newOwner) external onlyOwner {
        address oldOwner = owner;
        owner = newOwner;

        emit OwnershipTransfered(oldOwner, newOwner);
    }
}