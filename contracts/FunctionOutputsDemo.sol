// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

contract FunctionOutputsDemo {
    function returnMany() public pure returns (uint, bool) {
        return (1, false);
    }

    function named() public pure returns (uint a, bool b) {
        return (1, false);
    }

    function assigned () public pure returns (uint a, bool b) {
        a = 1;
        b = false;
    }

    function destructingAssignments() public pure returns (uint, bool, bool) {
        (uint x, bool y) = named();
        (, bool y1) = named();
        return (x, y, y1);
    }
}