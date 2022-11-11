// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;
// pragma solidity 0.8.17;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TodoList is ReentrancyGuard, Ownable {
    enum TodoStatuses {
        PENDING,
        COMPLETE
    }

    // A todo record
    struct Todo {
        // todo message
        string text;
        // todo status
        TodoStatuses status;
    }
    TodoStatuses private constant _DEFAULT_CHOICE = TodoStatuses.PENDING;

    uint private _counter = 1;

    Todo[] public listOfTodos;

    function createTask(string memory _task) external onlyOwner nonReentrant {
        Todo memory todo = Todo(_task, TodoStatuses.PENDING);
        listOfTodos.push(todo);
    }

    function markComplete(uint _id) external onlyOwner nonReentrant {
        /**
         * Mark a task as complete
         */
        listOfTodos[_id].status = TodoStatuses.COMPLETE;
    }

    function getTaskAtIndex(uint _idx)
        external
        view
        onlyOwner
        returns (string memory)
    {
        return listOfTodos[_idx].text;
    }

    function getTaskStatusAtIndex(uint _idx)
        external
        view
        onlyOwner
        returns (TodoStatuses)
    {
        return listOfTodos[_idx].status;
    }

    function totalCount() external view onlyOwner returns (uint) {
        return listOfTodos.length;
    }

    function removeTask(uint index) public onlyOwner nonReentrant {
        require(index <= listOfTodos.length, "Tasks are less");
        listOfTodos[index] = listOfTodos[listOfTodos.length - 1];
        listOfTodos.pop();
    }
}
