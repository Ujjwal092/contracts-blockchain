// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract VendingMachine {

    uint soda;
    address owner;

    constructor() {
        soda = 100;
        owner = msg.sender;
    }

    // buy soda
    function buy() public payable {

        require(msg.value == 1 ether, "You should pay 1 ETH");
        require(soda > 0, "Out of stock");

        soda = soda - 1;
    }

    // refill inventory
    function fillSoda(uint _soda) public {

        require(msg.sender == owner, "You are not owner");

        soda = soda + _soda;
    }

    // withdraw contract balance
    function withdrawBalance() public {

        require(msg.sender == owner, "You are not owner");

        payable(owner).transfer(address(this).balance);
    }
}
//transfer() forwards only 2300 gas which may not be enough for contracts after EIP-1884 gas cost changes. So Solidity recommends
// using call() which forwards gas and allows proper error handling.