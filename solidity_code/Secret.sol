pragma solidity ^0.4.23;

contract Secret {
    string private secret; // the secret string

    // constructor
    constructor(string _secret) public {
        secret = _secret;
    }

    // set up the secret string
    function setSecret(string _secret) public {
        secret = _secret;
    }
}