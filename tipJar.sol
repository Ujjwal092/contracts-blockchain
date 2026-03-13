// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract tipJar{
    //we can find out how much ether is in this contract
    function getBalace() public view returns(uint){
        // address(this).balance is a special property that gives the Ether 
        // balace of current contracts
        return address(this).balance; 
    }
    //This is a payable fn Anyone can call it and send Ether
    function sendTip() public payable {
        //this fn body is empty coz its only receive ether
    }
}