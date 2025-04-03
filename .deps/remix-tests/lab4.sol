// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TokenTransfer {
    // Task 1: Contract Setup
    // Define state variables to manage token ownership and supply
    address public admin;
    uint256 public totalSupply;
    mapping(address => uint256) public balances;

    // Task 4: Implement Events
    // Events to log important contract activities
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Deposit(address indexed from, uint256 value);

    // Task 3: Implement Modifiers
    // Modifier to ensure only admin can execute certain functions
    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized! Only admin can call this.");
        _;
    }

    // Modifier to check if the sender has sufficient balance before transferring tokens
    modifier hasSufficientBalance(uint256 amount) {
        require(balances[msg.sender] >= amount, "Insufficient balance!");
        _;
    }

    // Task 1: Contract Setup
    // Constructor to initialize contract state variables
    constructor() {
        admin = msg.sender; // Set admin as the contract deployer
        totalSupply = 1000000; // Set the total supply of tokens
        balances[admin] = totalSupply; // Assign all tokens to admin
    }

    // Task 2: Implement Functions
    // View function to check the token balance of a given address
    function getBalance(address account) public view returns (uint256) {
        return balances[account];
    }

    // Pure function to calculate a 1% transfer fee on the given amount
    function calculateTransferFee(uint256 amount) public pure returns (uint256) {
        return amount / 100; // 1% fee
    }

    // Function to allow the admin to add tokens to a user's balance
    function addTokens(address to, uint256 amount) public onlyAdmin {
        balances[to] += amount;
        emit Transfer(admin, to, amount);
    }

    // Function to transfer tokens from the admin to another user
    function transferTokens(address to, uint256 amount) public onlyAdmin hasSufficientBalance(amount) {
        uint256 fee = calculateTransferFee(amount);
        uint256 amountAfterFee = amount - fee;
        
        balances[msg.sender] -= amount; // Deduct the full amount from sender
        balances[to] += amountAfterFee; // Transfer amount after fee deduction
        balances[admin] += fee; // Admin collects the fee

        emit Transfer(msg.sender, to, amountAfterFee);
    }

    // Task 5: Fallback and Payable Functions
    // Fallback function triggered when Ether is sent to the contract
    receive() external payable {
        emit Transfer(msg.sender, admin, msg.value);
        payable(admin).transfer(msg.value); // Transfer received Ether to the admin
    }

    // Function to allow users to deposit Ether into the contract
    function deposit() external payable {
        emit Deposit(msg.sender, msg.value);
    }
}
