pragma solidity ^0.4.23;

contract SmartSwitch {
    // the structure for switch
    struct Switch {
        address addr; // the address of user
        uint endTime; // the time to end using(UnixTime)
        bool status;  // usable if true
    }

    address public owner; // the address of service owner
    address public iot;   // the address of IoT

    mapping (uint => Switch) public switches; // the map which stores Switch
    uint public numPaid;                      // the number of payments

    // check the authority of service owner
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    // check the authority of IoT
    modifier onlyIoT() {
        require(msg.sender == iot);
        _;
    }

    // constructor
    // take the address of IoT as the argument
    constructor(address _iot) public {
        owner = msg.sender;
        iot = _iot;
        numPaid = 0;
    }

    // the called function when the payment
    function payToSwitch() public payable {
        // end the process if the ether which it has got is equal to 1 ether
        require(msg.value == 1000000000000000000);

        // set up Switch
        Switch s = switches[numPaid++];
        s.addr = msg.sender;
        s.endTime = now + 300;
        s.status = true;
    }

    // the function which changes the status
    // it is called when it is the time to end using ( need to correct this comment)
    // the argument is the key value of switches
    function updateStatus(uint _index) public onlyIoT {
        // end the process if not set up the Switch to the target index 
        require(switches[_index].addr != 0);

        // end the process if it is not time
        require(now > switches[_index].endTime);

        // update the status
        switches[_index].status = false;
    }

    // the function for withdrawing ether which has been paid
    function withdrawFunds() public onlyOwner {
        if (!owner.send(this.balance)) {
            revert();
        }
    }

    // the function for discarding the contract
    function kill() public onlyOwner {
        selfdestruct(owner);
    } 
}