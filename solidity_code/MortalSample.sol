pragma solidity ^0.4.23;

contract Owned {
    address public owner;

    // modifier for checking the address
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    // set up the owner
    function owned() internal {
        owner = msg.sender;
    }

    // change the owner
    function changeOwner(address _newOwner) public onlyOwner {
        owner = _newOwner;
    }
}

contract Mortal is Owned {
    // discard the contract and send ether to the owner
    function kill() public onlyOwner {
        selfdestruct(owner);
    }
}

contract MortalSample is Mortal {
    string public someState;

    // the Fallback function
    function() payable public {
    }

    // constructor
    constructor() public {
        // call the function defined by Owned
        owned();

        // set up the initial value of someState
        someState = "initial";
    }
}