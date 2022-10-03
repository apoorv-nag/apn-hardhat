// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.9;

contract SimpleStorage {
    // state variable - unsigned integer of 2**256-1 bits
    uint storedData;

    // Can be used to modify the value of the variable
    function set(uint x) public {
        storedData = x;
    }

    // get the value of variable
    function get() public view returns (uint) {
        return storedData;
    }
}
