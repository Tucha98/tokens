// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
 
interface IERC20{
    function totalSupply() external view returns(uint); //A method that defines the total supply of your tokens, When this limit is reached the smart contract will refuse to create new tokens.
    function balanceOf(address account) external view returns(uint); //A method that returns the number of tokens a wallet address has.
    function transfer(address recipient, uint amount) external returns(bool); //A method that takes a certain amount of tokens from the total supply and gives it to a user.
    function allowance(address owner, address spender) external view returns(uint); //Another type of transfer method which is used to transfer tokens between users.
    function approve(address spender, uint amount) external returns(bool); //This method verifies whether a smart contract is allowed to allocate a certain amount of tokens to a user, considering the total supply.
    function transferFrom(address sender, address recipient, uint amount) external returns(bool); //Another type of transfer method which is used to transfer tokens between users.
 
event Transfer(address indexed from, address indexed to, uint amount); //This event should be triggered when tokens are transferred from one account to another.
event Approval(address indexed owner, address indexed spender, uint amount);
 
}