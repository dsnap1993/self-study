pragma solidity ^0.4.18;

contract AuctionWithdraw {
    address public highestBidder; // the address of highest bidder
    uint public highestBid;       // the price of highest bid
    mapping(address => uint) public usersBalance; // the map which registers the repayments

    // constructor
    constructor() public payable {
        highestBidder = msg.sender;
        highestBid = 0;
    }

    // the function for bidding
    function bid() public payable {
        // check that the bidding price is higher than the price of highest bid
        require(msg.value > highestBid);

        // update the address of highest bidder
        usersBalance[highestBidder] += highestBid;

        // update the state
        highestBid = msg.value;
        highestBidder = msg.sender;
    }

    function withdraw() public {
        // check that the price is more than 0
        require(usersBalance[msg.sender] > 0);

        // evacuate the refund amount
        uint reFundAmount = usersBalance[msg.sender];

        // update the refund amount
        usersBalance[msg.sender] = 0;

        // refund processing
        msg.sender.transfer(reFundAmount);
    }   
}