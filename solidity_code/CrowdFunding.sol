pragma solidity ^0.4.23;

contract CrowdFunding {
    // investor
    struct Investor{
        address addr; // the address of investor
        uint amount;  // investment amount
    }

    address public owner;     // the owner of contract
    uint public numInvestors; // the number of investors
    uint public deadline;     // the deadline(UnixTime)
    string public status;     // the status of campaign
    bool public ended;        // whether the campaign has ended
    uint public goalAmount;   // the goal amount
    uint public totalAmount;  // the total investment amount
    mapping (uint => Investor) public investors; // the map for managing the investors

    modifier onlyOwner () {
        require(msg.sender == owner);
        _;
    }

    // constructor
    constructor(uint _duration, uint _goalAmount) public{
        owner = msg.sender;

        // set the deadline on UnixTime
        deadline = now + _duration;

        goalAmount = _goalAmount;
        status = "Funding";
        ended = false;

        numInvestors = 0;
        totalAmount = 0;
    }

    // the called function when investing
    function fund() public payable {
        // cancel the processing if the campaign has ended
        require(!ended);

        Investor storage inv = investors[numInvestors++];
        inv.addr = msg.sender;
        inv.amount = msg.value;
        totalAmount += inv.amount;
    }

    // check whether the investment amount has reached
    // and send ethers in accodiate with the result of the campaign
    function checkGoalReached () public onlyOwner {
        // cancel the processing if the campaign has ended
        require(!ended);

        // cancel the processing before deadline
        require(now >= deadline);

        if (totalAmount >= goalAmount) {
            // in case that the campaign has successed
            status = "Campaign Has Successed";
            ended = true;
            // send all ethers in this contract to the owner
            if (!owner.send(this.balance)) {
                revert();
            }
        }else {
            // in case that the campaign has failed
            uint i = 0;
            status = "Campaign Has Failed";
            ended = true;

            // send back ethers to each investors
            while (i <= numInvestors) {
                if (!investors[i].addr.send(investors[i].amount)) {
                    revert();
                }
                i++;
            }
        }
    }

    // the function for discarding the contract
    function kill() public onlyOwner{
        selfdestruct(owner);
    }
}