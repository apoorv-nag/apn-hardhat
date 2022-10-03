// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

// We can declare custom errors inside contract also.
// But declaring it outside helps us to import the errors in other contracts
error Unauthorized(string m);

contract CustomErrorDemo {
    address payable owner = payable(msg.sender);

    function withdraw() public {
        if (msg.sender != owner) {
            // revert("This !!!!!!!!!!"); // Total Gas Fees 179169
            revert Unauthorized("Some error"); // Total Gas Fees 150459
        }

        owner.transfer(address(this).balance);
    }
}