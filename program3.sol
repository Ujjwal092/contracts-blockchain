// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract myFavString {
     //these data will be stored in memory
    uint public  myNum = 20;
    string public myString = "Hello world   "; 
   
   //this is fn and these will get stored temp in RAM and will stored in stack
   function setMyNumber(uint _myNumber) public{
    myNum  = _myNumber;
   }
   //so we used memory like adding temporoily so stored in heap 
    function setMyString(string calldata _myStr) public{
    myString  = _myStr; //we can use call data as well but for read only
   }
//Data location must be "memory" or "calldata" for parameter in function
//memory usage ->  storage>memory>calldata

}  