// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract UjjwalCoin{
    //class variables
    //har kisi adddress ke pass kitna balnce h 
    mapping(address => uint) private  balances;
    address private  owner;
    uint private _totalSupply;
    string private _name;
    string private _symbol;
    uint8 private _decimals; //uint8 standard
    mapping(address => mapping(address => uint256)) private allowed; 
/* Har owner address ke liye
 multiple spender addresses store karo
 aur unka allowed amount store karo 
 means Address A ne address B ko allow kiya hai
ki wo uske behalf pe 100 tokens spend kar sakta hai*/
  event Transfer(address indexed  _from, address indexed _to, uint _value);
   event Approval(address indexed _owner, address indexed _spender, uint _value);

    
    modifier onlyOwner() {
        require(owner == msg.sender , "You are not owner");
        _;
    }
    //intializing class variables via constructor
    constructor(){
        owner = msg.sender; //deployer of the contract
        emit Transfer(address(0), msg.sender, 1000);//means on calling cons adress 0 se msg.sender ko 1000 token transfer hota hai
        balances[msg.sender] = 1000; //balance of sender 1000
        _totalSupply = 1000; //total supply of the token is 1000
        _name = "UjjwalCoin"; //name of token
        _symbol = "UJC"; //symbol of token
        _decimals = 18; //total digit of the token

    }
    //options of ERC (NOTES)
    function name() public view returns (string memory){
        return _name;
    }
    function symbol() public view returns (string memory){
        return _symbol;
    }
    function decimals() public view returns (uint8){
        return _decimals;
    }
    //total coin
    function totalSupply() public view returns (uint256){
        return _totalSupply;
    }
    
    function burn(uint amount) public onlyOwner{
        balances[owner] -= amount;
        _totalSupply -= amount;
        emit Transfer( msg.sender,address(0), amount); 
    }
    //balance of owner
    function balanceOf(address _owner) public view returns(uint256 balance){
    return balances[_owner];
}
    //minting the token here we are adding balance to owners acc
    function mint(uint amount) public onlyOwner{
        balances[owner] += amount; //balance of owner will be increase by amount
        emit Transfer(address(0), msg.sender, amount); 
        _totalSupply -= amount; //amount will dec 

    }

//sender sending to some address 
    function transfer(address _to, uint256 _value) public returns (bool sucess) {
        //check balance of sender is there or not
        require(balances[msg.sender] >= _value, "Insufficient balance"); 
        //if balance is less than amount then only it will throw error
        require(address(0) != _to, "Invalid address"); //jisko bej rhe wo dead acc na ho
        balances[msg.sender] -= _value; //balance of sender will be decrease by amount
        balances[_to] += _value; //balance of receiver will be increase by amount
        emit  Transfer(msg.sender, _to, _value);
        return true;
    }

     function transferFrom(address _from, address _to , uint256 _value )public returns (bool success){
        require(balances[_from] >= _value, "Insufficient balance"); //check balance of sender is there or not
        require(allowed[_from][msg.sender] >= _value, "Insufficient allowance"); //check allowance of sender is there or not
           require(address(0) != _to, "Invalid address");
        balances[_from] -= _value; //balance of sender will be decrease by amount
        balances[_to] += _value; //balance of receiver will be increase by amount
       allowed[_from][msg.sender] -= _value; //balance of allowance will be decrease by amount]
        emit  Transfer(_from, _to, _value);
        return true;
     }

     function approve(address _spender, uint256 _value) public returns (bool success) {
       require(address(0) !=  _spender, "Invalid address"); //check address of spender is there or not means 000.. wla address na ho spender ka;
        require(balances[msg.sender] >= _value, "Insufficient balance");
        allowed[msg.sender][_spender] = _value; //allowance of sender will be increase by amount
        emit Approval(msg.sender, _spender, _value);
        return true; //spender is whom jo sender ke behalf pr send krega
    }
    // ye batayega ki kitna amount jo owner ne spender ko send karne ke liye allow kiya hai
    function allowance(address _owner, address _spender) public view returns (uint256) {
        return allowed[_owner][_spender];
    } 

    }