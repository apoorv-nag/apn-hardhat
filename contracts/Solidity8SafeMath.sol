// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

contract Solidity8SafeMath {
    function testUnderflow() public pure returns (uint) {
        uint x = 0;
        --x;
        // If we want to see underflow issue then we can wrap in unchecked
        // unchecked { x--; }
        
        return x;
    }
}
