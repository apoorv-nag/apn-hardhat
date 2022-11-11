// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

contract MappingDemo {
    mapping(address => uint) public balances;

    mapping(address => mapping(address => bool)) public isFriend;

    function test() external {
        balances[msg.sender] = 123;
        // uint bal = balances[msg.sender];
        // uint bal2 = balances[address(1)];

        balances[msg.sender] += 456;

        delete balances[msg.sender]; // reset to default value
    }
}
