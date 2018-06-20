pragma solidity ^0.4.23;

contract CircuitBreaker {
    bool public stopped; // Circuit Breaker runs if true
    address public owner;
    bytes16 public message;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    // modifier for checking the value stopped
    modifier isStopped() {
        require(!stopped);
        _;
    }

    // constructor
    constructor() public {
        owner = msg.sender;
        stopped = false;
    }

    // change the status of stopped
    function toggleCircuit(bool _stopped) public onlyOwner {
        stopped = _stopped;
    }

    // the function updating the message
    // can not update the value stopped if true
    function setMessage(bytes16 _message) public isStopped {
        message = _message;
    }
}