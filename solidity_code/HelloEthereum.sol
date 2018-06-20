pragma solidity ^0.4.23;

contract HelloEthereum {
    // the first example of comment
    string public msg1; // the second example of comment
    string public msg2;

    /* the third example of comment */
    address public owner;

    uint8 public counter;

    // contructor
    constructor(string _msg1) public{
        // setting _msg1 on msg1
        msg1 = _msg1;

        // setting the address which have generated this contractor
        owner = msg.sender;

        // setting 0 as initial value on counter
        counter = 0;
    }

    // the setter of msg2
    function setMsg2(string _msg2) public{
        // the example of if method
        if(owner != msg.sender) {
            revert();
        }else {
            msg2 = _msg2;
        }
    }

    // the getter of msg2
    function getMsg2() view public returns(string) {
        return msg2;
    }

    function setCounter() public {
        //the example of for method
        for(uint8 i = 0; i < 3; i++) {
            counter++;
        }
    }
}