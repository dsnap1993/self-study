pragma solidity ^0.4.23;

contract MarketPlaceOverflow {
    address public owner;
    uint public price;         // the price of a product
    uint public stockQuantity; // the number of stock

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    // the event which shows the number of added stocks
    event AddStock(uint addedQuantity);

    // constructor
    constructor() public {
        owner = msg.sender;
        stockQuantity = 100;
    }

    // the processing which adds stocks
    function addStock(uint8 _addedQuantity) public onlyOwner {
        emit AddStock(_addedQuantity);
        stockQuantity += _addedQuantity;
    }
}