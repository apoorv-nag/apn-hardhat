// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

contract Ownable {
    address public owner;

    constructor () {
        owner = msg.sender;
    }

    modifier isOwner () {
        require(msg.sender == owner, "Unauthorized");
        _;
    }

    function transferOwnership(address _newOwner) external isOwner {
        require(_newOwner != address(0), "invalid address");
        owner = _newOwner;
    }

    function doFunctionCall() external view isOwner returns (string memory) {
        return "It works";
    }
}