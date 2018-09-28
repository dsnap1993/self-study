pragma solidity ^0.4.18;

contract Lottery {
    // register the applicants
    mapping (uint => address) public applicants;

    // register the number of applicants
    uint public numApplicants;

    // the infomation of winner
    address public winnerAddress;
    uint public winnerInd;

    // owner
    address public owner;

    // timestamp
    uint public timestamp;

    // modifier for checking owner
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    // constructor
    function Lottery() public {
        numApplicants = 0;
        owner = msg.sender;
    }

    // the function for entering the lottery
    function enter() public {
        // end the processing if the number of applicants is more than 3
        require(numApplicants < 3);

        // end the processing if you have applied
        for (uint i = 0; i < numApplicants; i++) {
            require(applicants[i] != msg.sender);
        }

        //accept the application
        applicants [numApplicants++] = msg.sender;
    }

    // draw lots
    function hold() public onlyOwner {
        // end the processing if the number of applicants is equal to 3
        require(numApplicants == 3);

        // set up timestamp
        timestamp = block.timestamp;

        // lottery
        winnerInd = timestamp % 3;
        winnerAddress = applicants[winnerInd];
    }
}