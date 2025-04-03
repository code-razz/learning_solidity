// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract ErrorHandler{
    uint256 public balance=100;

    function withdraw(uint amount) public{
        require(balance >=amount,"Not enough money");
        balance -= amount;
    }

    function withdraw1(uint amount) public{
        if(balance < amount){
            revert("Insufficient balance revert");
        }
        balance -= amount;
    }

    function checkBalance() public view{
        assert(balance > 0);
    }

    // function 
}