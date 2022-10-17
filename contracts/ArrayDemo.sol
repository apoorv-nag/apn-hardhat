// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

/**
* Array - dynamic and fixed size
* Initialization
* Insert (push), get, update, delete
*/
contract ArrayDemo {
    uint[] public n1;

    // Fixed size array
    uint[3] public n1Fixed;

    // Initialization of array
    uint[] public n2 = [1,2,3,4];

    // Adding more elements will throw an error
    uint[3] public n2Fixed = [1,2,3];

    // public access specifier makes the function callable inside the contract and also from outside
    // external only allows to access the function from outside not from the contract
    function pushN1(uint _num) public {
        // if we fix the size of the array then this line will throw error
        n1.push(_num);
    }

    // Deleting the data at index just initializes the index with default value
    function deleteAt(uint _i) external {
        delete n1[_i];
    }

    function popN1() external returns (uint[] memory) {
        // if we fix the size of the array then this line will throw error
        n1.pop();
        return n1;
    }

    function getLengthN1() view external returns (uint) {
        return n1.length;
    }

    // Logic to remove element from index
    function remove(uint _index) external {
        require(_index < n1.length, "Index out of bound");
        for (uint _i= _index; _i < n1.length - 1;_i++) {
            n1[_i] = n1[_i+1];
        }
        n1.pop();
    }

    function remove_gas_efficient(uint _index) external {
        require(_index < n1.length, "Index out of bound");
        n1[_index] = n1[n1.length - 1];
        n1.pop();
    }

    function test() external {
        assert(n1.length == 0);
        pushN1(1);
        assert(n1.length == 1);
    }
}
