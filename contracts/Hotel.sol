// SPDX-License-Identifier: GPL
pragma solidity ^0.8.0;

contract Hotel {
    enum Status {
        Vacant,
        Occupied
    }

    Status public currentStatus;

    event Occupy(address _occupant, uint _value);

    address payable public owner;

    constructor () {
        owner = payable(msg.sender);
        currentStatus = Status.Vacant;
    }

    modifier onlyWhileVacant {
        // if the value paased in require will be true then next lines get executed otherwise function gets terminated with the message provided
        require(currentStatus == Status.Vacant, "Currently occupied"); 
        _;
    }

    modifier cost(uint _amount){
        require(msg.value >= _amount, "Not enough Ether provided");
        _;
    }

    function book() public payable  onlyWhileVacant cost(2 ether) {
        // Check Price...
        // require(msg.value >= 2 ether, "Not enough Ether provided") // Or we can create seperate function for this
        
        // Check status...
        // require(currentStatus == Status.Vacant, "Currently occupied"); // Or we can create seperate function for this

        currentStatus = Status.Occupied;

        // owner.transfer(msg.value);

        // Alternative of above line...
        (bool sent, bytes memory data) = owner.call{value: msg.value}("");
        require(true);

        emit Occupy(msg.sender, msg.value);
    }
}