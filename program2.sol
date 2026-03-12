// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract MyFavNumber {
    uint public myNum = 10;

    //this is our new fucn
    function setMyNum(uint _myNum) public {
        myNum = _myNum; //_ is covention in solidity we can give a and b there 
    }   
} 
//byte code will be genrated after compilation and
// this byte code will be sent to etherium virtual machine coz it is fast and 
//byte code will be in hexadecimal form 
