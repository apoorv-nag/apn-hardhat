// SPDX-License-Identifier: MIT
// pragma solidity 0.8.9;
pragma solidity 0.8.17;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract Ownable is ReentrancyGuard {
    // Variable that maintains 
    // owner address
    address private _owner;

    // Sets the original owner of 
    // contract when it is deployed
    constructor()
    {
        _owner = msg.sender;
    }

    // Publicly exposes who is the
    // owner of this contract
    function owner() public view returns(address) 
    {
        return _owner;
    }

    // onlyOwner modifier that validates only 
    // if caller of function is contract owner, 
    // otherwise not
    modifier onlyOwner() 
    {
        require(isOwner(),
        "Function accessible only by the owner !!");
        _;
    }

    // function for owners to verify their ownership. 
    // Returns true for owners otherwise false
    function isOwner() public view returns(bool) 
    {
        return msg.sender == _owner;
    }

    function transferOwnerShip(address _newOwner) onlyOwner nonReentrant public {
        _owner = _newOwner;
    }
}


contract TodoList is ReentrancyGuard, Ownable {

    enum TodoStatuses{PENDING, COMPLETE}
    TodoStatuses constant defaultChoice = TodoStatuses.PENDING;

    uint counter = 1;

    // A todo record
    struct Todo {
        // todo message
        string text;
        // todo status
        TodoStatuses status;
    }

    Todo[] public listOfTodos;

    function createTask (string memory _task) onlyOwner nonReentrant external {
        Todo memory todo = Todo(_task, TodoStatuses.PENDING);
        listOfTodos.push(todo);
    }

    function getTaskAtIndex(uint _idx) onlyOwner external view returns (string memory) {
        return listOfTodos[_idx].text;
    }

    function getTaskStatusAtIndex(uint _idx) onlyOwner external view returns (TodoStatuses) {
        return listOfTodos[_idx].status;
    }

    function totalCount() onlyOwner external view returns (uint) {
        return listOfTodos.length;
    }

    function markComplete(uint _id) onlyOwner nonReentrant external  {
        /**
        * Mark a task as complete
        */
        listOfTodos[_id].status = TodoStatuses.COMPLETE;
    }

    function removeTask(uint index) onlyOwner nonReentrant public {
        require(index <= listOfTodos.length, "Tasks are less");
        listOfTodos[index] = listOfTodos[listOfTodos.length - 1];
        listOfTodos.pop();
    }
}
