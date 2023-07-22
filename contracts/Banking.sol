// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract Banking
{
    address owner;
    mapping(address => uint) public balance;

    constructor() 
    {
        owner = msg.sender;
    }

    function withdraw(uint amount) external payable 
    {
        require(balance[msg.sender] >= amount, "Insufficient Balance");
        balance[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    } 

    function deposit() external payable 
    {
        balance[msg.sender] += msg.value;
    }

    function getBalance() external view returns (uint) 
    {
        return balance[msg.sender];
    }
}