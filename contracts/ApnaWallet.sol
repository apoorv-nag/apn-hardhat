// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

error TooLowCreditValue(string message);
error UnauthorizedAccess();
error TooLessBalance();

contract ApnaWallet {
    address payable owner;

    constructor() payable {
        owner = payable(msg.sender);
    }

    function deposit () external payable {
        // Anyone can credit the balance of this wallet
        if (msg.value < 1) {
            revert TooLowCreditValue("Too Low Credit");
        }

    }

    function getBalance() public view returns (uint) {
        if (msg.sender != owner) {
            revert UnauthorizedAccess();
        }
        return address(this).balance;
    }

    function withdraw(uint amount) public {
        if (amount > address(this).balance) {
            revert TooLessBalance();
        }
        owner.transfer(amount);
    }


}