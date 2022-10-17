// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

contract TestContract1 {
    address public owner = msg.sender;

    function setOwner(address _owner) public {
        owner = _owner;
    }
}

contract TestContract2 {
    address public owner = msg.sender;
    uint public value = msg.value;
    uint public x;
    uint public y;

    constructor(uint _x, uint _y) payable {
        x = _x;
        y = _y;
    }
}

contract Proxy {
    event Deploy(address);

    fallback () external payable {}

    function deploy(bytes memory _code) external payable returns (address addr) {
        // address addr;
        assembly {
            // create (v, p, n)
            // v = amount of ETH to send
            // p = pointer in memory to start of code
            // n = size of code
            addr := create(callvalue(), add(_code, 0x20), mload(_code))
        }
        require(addr != address(0), "Deploy failed");
        // emit Deploy(addr);
        // return addr;
    }

    function execute(address _target, bytes memory _data)
    external 
    payable 
    {
        (bool success,) = _target.call{value: msg.value}(_data);
        require(success, "failed");
    }
}

contract Helper {
    function getBytecode1() external pure returns (bytes memory) {
        bytes memory byteCode = type(TestContract1).creationCode;
        return byteCode;
    }

    function getBytecode2(uint _x, uint _y) external pure returns (bytes memory) {
        bytes memory byteCode = type(TestContract2).creationCode;
        return abi.encodePacked(byteCode, abi.encode(_x, _y));
    }

    function getCalldata(address _owner) external pure returns (bytes memory) {
        return abi.encodeWithSignature("setowner(address)", _owner);
    }
}