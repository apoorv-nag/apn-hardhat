// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ERC20FixedSupply is ERC20 {
    constructor(uint256 initialSupply) ERC20("APN Token", "APN") {
        _mint(msg.sender, initialSupply);
    }

    function _transfer(
        address from,
        address to,
        uint256 val
    ) internal override {
        super._transfer(from, to, val);
    }

    function test() public pure returns (uint) {
        return 0;
    }
}
