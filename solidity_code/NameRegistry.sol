pragma solidity ^0.4.18;

contract NameRegistry {
    // the structure for contract
    struct Contract {
        address owner;
        address addr;
        bytes32 description;
    }

    // the number of registered records
    uint public numContracts;

    // the map which has the contracts
    mapping(bytes32 => Contract) public contracts;

    // the constructor
    function NameRegistry () public{
        numContracts = 0;
    }

    // register the contract
    function register(bytes32 _name) public returns(bool) {
        //if the name doesn't use, it is registered
        if (contracts[_name].owner == 0) {
            Contract storage con = contracts[_name];
            con.owner = msg.sender;
            numContracts++;
            return true;
        }else {
            return false;
        }
    }

    // remove the contract
    function unregister(bytes32 _name) public returns(bool) {
        if (contracts[_name].owner == msg.sender) {
            contracts[_name].owner = 0;
            numContracts--;
            return true;
        }else {
            return false;
        }
    }

    // change the owner of contract
    function changeOwner(bytes32 _name, address _newOwner) public onlyOwner(_name) {
        contracts[_name].owner = _newOwner;
    }

    // get the owner of contract
    function getOwner(bytes32 _name) view public returns(address) {
        return contracts[_name].owner;
    }

    // set the address of contract
    function setAddr(bytes32 _name, address _addr) public onlyOwner(_name) {
        contracts[_name].addr = _addr;
    }

    // get the address of contract
    function getAddr(bytes32 _name) view public returns(address) {
        return contracts[_name].addr;
    }

    // set up the description of contract
    function setDescription(bytes32 _name, bytes32 _description) public onlyOwner(_name) {
        contracts[_name].description = _description;
    }

    // get the description of contract
    function getDescription(bytes32 _name) view public returns(bytes32) {
        return contracts[_name].description;
    }

    // define modifier
    modifier onlyOwner(bytes32 _name) {
        require(contracts[_name].owner == msg.sender);
        _;
    }

    
}