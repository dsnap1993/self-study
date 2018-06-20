pragma solidity ^0.4.18;

contract Auction {
    address public highestBidder; // the address of highest bidder
    uint public highestBid;       // the price of highest bid

    // constructor
    constructor() public payable {
        highestBidder = msg.sender;
        highestBid = 0;
    }

    // the function for bidding
    function bid() public payable {
        // check that the bid is higher than the current price of highest bid
        require(msg.value > highestBid);

        // evacuate the repayment
        uint reFundAmount = highestBid;

        // evacuate the address of highest bidder
        address currentHighestBidder = highestBidder;
        
        // update the state
        highestBid = msg.value;
        highestBidder = msg.sender;

        // repay to the highest bidder
        currentHighestBidder.transfer(reFundAmount);
    }
}