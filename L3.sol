// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract myFav {
     //these data will be stored in memory
    uint public  myNum = 20;
    string public myString = "Hello world   ";
    uint public check = 10; 
   
  
   function setMyNumber(uint _myNumber) public{
    myNum  = _myNumber;
   }
  
    function setMyString(string calldata _myStr) public{
    myString  = _myStr; //we can use call data as well but for read only
   }
   
   function cheking() public view returns(uint){
    return check;
   }
 //by declaring view we can state that the state variable 
 //is being used for view only we are not changing it

 function hitList() public pure returns(uint){
    return 1000; //returns _num*2; if uint _num is used as argument
 }
 //and here state variable cant be even seen unlike view  

}  