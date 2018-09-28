pragma solidity ^0.4.23;

contract MarketPlaceTOD {
    address public owner;
    uint public price;         // the price of a product
    uint public stockQuantity; //the number of stock

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    event UpdatePrice(uint _price);
    event Buy(uint _price, uint _quantity, uint _value, uint _change);

    // constructor
    constructor() public {
        owner = msg.sender;
        price = 1;
        stockQuantity = 100;
    }

    // the processing of updating the price
    function updatePrice(uint _price) public onlyOwner {
        price = _price;
        emit UpdatePrice(price);
    }

    // the processing of buying
    function buy(uint _quantity) public payable {
        if (msg.value < _quantity * price || _quantity > stockQuantity) {
            revert();
        }

        // the processing of returning the change
        msg.sender.transfer(msg.value - _quantity * price);

        stockQuantity -= _quantity;
        emit Buy(price, _quantity, msg.value, msg.value - _quantity * price);
    }
}