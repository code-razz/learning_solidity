// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TokenManagement {
    address public admin;
    mapping(address => uint256) private balances;
    uint256 public totalSupply;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Deposit(address indexed from, uint256 value);
    event EtherReceived(address indexed sender, uint256 value);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized! Only admin can call this.");
        _;
    }

    modifier hasSufficientBalance(uint256 amount) {
        require(balances[msg.sender] >= amount, "Insufficient balance!");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    // Task 1.1: View Function for Token Balance
    function getBalance(address account) public view returns (uint256) {
        return balances[account];
    }

    // Task 1.2: Pure Function for Transfer Fee Calculation (1% fee)
    function calculateTransferFee(uint256 amount) public pure returns (uint256) {
        return amount / 100;
    }

    // Task 2.1: Function to add tokens (Only Admin)
    function addTokens(address account, uint256 amount) public onlyAdmin {
        balances[account] += amount;
        totalSupply += amount;
    }

    // Task 2.2 & 3.1: Function to Transfer Tokens
    function transferTokens(address recipient, uint256 amount) public hasSufficientBalance(amount) {
        uint256 fee = calculateTransferFee(amount);
        uint256 amountAfterFee = amount - fee;

        balances[msg.sender] -= amount;
        balances[recipient] += amountAfterFee;
        totalSupply -= fee; // Assume fee is burned or collected elsewhere

        emit Transfer(msg.sender, recipient, amountAfterFee);
    }

    // Task 4.2: Payable Function for Deposits
    function deposit() public payable {
        require(msg.value > 0, "Must send some Ether");
        emit Deposit(msg.sender, msg.value);
    }

    // Task 4.1: Fallback Function to Accept Ether
    receive() external payable {
        emit EtherReceived(msg.sender, msg.value);
        payable(admin).transfer(msg.value); // Transfer received Ether to admin
    }
}
