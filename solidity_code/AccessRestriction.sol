pragma solidity ^0.4.23;

contract Owned {
    address public owner;

    // modifier for checking accessing
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

contract AccessRestriction is Owned {
    string public someState;

    // contructor
    constructor() public {
        // call the own function which is defined by Owned
        owned();

        // set up the initial value of someState
        someState = "initial";
    }

    // the function updating someState
    function updateSomeState(string _newState) public onlyOwner {
        someState = _newState;
    }
}