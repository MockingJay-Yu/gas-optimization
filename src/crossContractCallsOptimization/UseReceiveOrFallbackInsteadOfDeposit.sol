// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

//dev Using `receive` or `fallback` instead of a custom `deposit` function for receiving Ether is beneficial.
// 1. Sending Ether directly to contract address is simpler and can save gas compared to calling a function.
// 2. Users don't need to know specific function names.
contract UseReceiveOrFallbackInsteadOfDeposit {
    mapping(address => uint256) public balances;

    event Deposit(address indexed sender, uint256 indexed amount);

    // gas : 44974
    function deposit() public payable {
        balances[msg.sender] += msg.value;

        emit Deposit(msg.sender, msg.value);
    }

    // gas : 44880
    receive() external payable {
        deposit();
    }
}
