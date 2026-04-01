// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract VendingMachine {

    uint public soda;
    address public owner;

    mapping(address => uint) public sodaPurchased;

    constructor() {
        soda = 100;
        owner = msg.sender;
    }

    // buy soda
    function buy() public payable {

        require(msg.value == 1 ether, "You should pay 1 ETH");
        require(soda > 0, "Out of stock");

        sodaPurchased[msg.sender] += 1;

        soda -= 1;
    }

    // refill inventory
    function fillSoda(uint _soda) public {

        require(msg.sender == owner, "You are not owner");

        soda += _soda;
    }

    // withdraw contract balance
    function withdrawBalance() public {

        require(msg.sender == owner, "You are not owner");

        payable(owner).transfer(address(this).balance);
    }
}