// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
 
import "./ierc.sol"; // import file ierc
 
contract ERC20 is IERC20{ // to use the functions of the IERC20 interface
 
uint public override totalSupply; // declaracao da variavel totalsupply
mapping(address => uint) public override balanceOf; //bind unique Ethereum address to value of type uint
mapping(address => mapping(address => uint)) public override allowance; 
string public name ="Mike Token"; //Declaring variables and assigning the token name
string public symbol ="MKT";//Declaring variables and assigning the token symbol
uint public decimals = 18;//declaration of variables and assignment of the decimal precision of the token.

// Function transfer which will execute the transfer of tokens from the total supply to users.
function transfer(address recipient, uint amount) external override returns(bool){
balanceOf[msg.sender] -= amount; // deduct the amount from sender's balance
balanceOf[recipient] += amount; // add amount to recipient's balance
 
emit Transfer(msg.sender, recipient, amount); // issues the transaction, the address of the owner of the contract, the address where the amount goes and the amount.
return true; //returns true when the transaction is performed
}

//Function approve which will check if the total supply has the amount of token which needs to be allocated to a user. 
function approve(address spender, uint amount) external override returns(bool){
allowance[msg.sender][spender] = amount; // "msg.sender" calls the token approve function to allow spender to spend a value on its behalf.
emit Approval(msg.sender, spender, amount); // issue the function ok 
return true;
}
//Function transferFrom which will facilitate the transfer of token between users 
function transferFrom(address sender, address recipient, uint amount) external override returns(bool){
allowance[sender][msg.sender] -= amount; //"spender" calls the token approve function to allow msg.sender to deduct a value on its behalf.
balanceOf[sender] -= amount; // deduct the amount from sender's balance
balanceOf[recipient] += amount;// add amount to recipient's balance
emit Transfer(sender, recipient, amount);// issues the transaction, the address of the owner of the contract, the address where the amount goes and the amount.
return true;
}
 
}
