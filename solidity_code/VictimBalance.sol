pragma solidity ^0.4.23;

contract VictimBalance {
    // register the balance by the address
    mapping (address => uint) public userBalances;

    // the event for showing the message
    event MessageLog(string);

    // the event for showing the balance
    event BalanceLog(uint);

    uint public amount;

    // constructor
    constructor() public {
    }

    // the function which called when sending the ether
    function addToBalance() public payable {
        userBalances[msg.sender] += msg.value;
    }

    // the function which called when withdrawing the ether
    function withdrawBalance(address _sender) public payable returns(bool) {
        emit MessageLog("withdrawBalance has started");
        emit BalanceLog(this.balance);

        // I. check the balance
        if (userBalances[_sender] == 0) {
            emit MessageLog("No Balance.");
            return false;
        }

        // II. refund to the caller
        // _sender.transfer(userBalances[_sender]);
        amount = userBalances[_sender];

        // III. update the balance
        userBalances[_sender] = 0;

        // IV. refund to caller
        _sender.transfer(amount);

        emit MessageLog("withdrawBalance has finished");

        return true;
    }
}