// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// contract tipJar{
//     //we can find out how much ether is in this contract
//     function getBalace() public view returns(uint){
//         // address(this).balance is a special property that gives the Ether 
//         // balace of current contracts
//         return address(this).balance; 
//     }
//     //This is a payable fn Anyone can call it and send Ether
//     function sendTip() public payable {
//         //this fn body is empty coz its only receive ether
//     }
// }

pragma solidity ^0.8.20;

contract tipJar{

    string status = "Hello solidity";

    //we can find out how much ether is in this contract
    function getBalace() public view returns(uint){
        // address(this).balance is a special property that gives the Ether 
        // balace of current contracts
        return address(this).balance; 
    }

    //new fn that will be payable means if anybody wants to modify must have to pay certain amount of fee let say 1  eth
    function setMyStatus(string calldata _status) payable public {
            require(msg.value == 1 ether, "Amount should be 1 ether");
            status = _status; //update the string after pay
    }
    //This is a payable fn Anyone can call it and send Ether
    function sendTip() public payable {
        //this fn body is empty coz its only receive ether
    }
} 
//if amount is != 1 payble will revert back whatever amount is sent