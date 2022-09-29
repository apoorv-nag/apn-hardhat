// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

import { Unauthorized } from "./CustomErrorDemo.sol";

contract ImportErrorDemo {

    address owner;

    constructor () payable  {
        owner = msg.sender;
    }

    function withdrawAll(address payable to) public {
        if (owner != msg.sender) {
            revert Unauthorized("some error");
        }
        to.transfer(address(this).balance);
    }

}
