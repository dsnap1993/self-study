pragma solidity ^0.4.18;

contract VictimBalance {
    // register the balance by the address
    mapping (address => uint) public userBalances;

    // the event for showing the message
    event MessageLog(string);

    // the event for showing the balance
    event BalanceLog(uint);

    // constructor
    function VictimBalance() public {
    }

    // the function which called when sending the ether
    function addToBalance() public payable {
        userBalances[msg.sender] += msg.value;
    }

    // the function which called when withdrawing the ether
    function withdrawBalance() public payable returns(bool) {
        MessageLog("withdrawBalance has started");
        BalanceLog(this.balance);

        // I. check the balance
        if (userBalances[msg.sender] == 0) {
            MessageLog("No Balance.");
            return false;
        }

        // II. refund to the caller
        msg.sender.transfer(userBalances[msg.sender]);

        // III. update the balance
        userBalances[msg.sender] = 0;

        MessageLog("withdrawBalance has finished");

        return true;
    }
}