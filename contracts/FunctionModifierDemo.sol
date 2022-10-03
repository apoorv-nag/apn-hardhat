// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

contract FunctionModifierDemo {
    bool public isPaused = false;
    address owner = msg.sender;

    uint counter;

    error UnauthorizedAccess(address sender, address owner);

    modifier isOwner() {
        if (owner != msg.sender) {
            revert UnauthorizedAccess(msg.sender, owner);
        }
        _;
    }

    function inc() isOwner external  {
        counter++;
    }

    function dec () external isOwner {
        counter--;
    }

    function setIsPaused(bool _isPaused) isOwner external {
        isPaused = _isPaused;
    }
}