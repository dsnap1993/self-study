pragma solidity ^0.4.23;

contract VictimBalance {
    // register the balance by the address
    mapping (address => uint) public userBalances;

    // the event for showing the message
    event MessageLog(string);

    // the event for showing the balance
    event BalanceLog(uint);

    // constructor
    constructor() public {
    }

    // the function which called when sending the ether
    function addToBalance() public payable {
        userBalances[msg.sender] += msg.value;
    }

    // the function which called when withdrawing the ether
    function withdrawBalance() public payable returns(bool) {
        emit MessageLog("withdrawBalance has started");
        emit BalanceLog(this.balance);

        // I. check the balance
        if (userBalances[msg.sender] == 0) {
            emit MessageLog("No Balance.");
            return false;
        }

        // II. refund to the caller
        msg.sender.transfer(userBalances[msg.sender]);

        // III. update the balance
        userBalances[msg.sender] = 0;

        emit MessageLog("withdrawBalance has finished");

        return true;
    }
}