// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

contract TodoList {
    enum TodoStatuses{PENDING, COMPLETE}
    TodoStatuses constant defaultChoice = TodoStatuses.PENDING;

    uint counter = 1;

    struct Todo {
        string text;
        TodoStatuses status;
    }
    /**
    * TODO List Demo
    **/

    mapping(uint => Todo) public taskMapping;

    uint[] public positionsOfTasks;

    function createNewTask (string memory _task) external {
        
        Todo memory todo = Todo(_task, TodoStatuses.PENDING);
        taskMapping[counter] = todo;
        positionsOfTasks.push(counter++);
    }

    function markComplete(uint _id) external  {
        taskMapping[_id].status = TodoStatuses.COMPLETE;
    }

    function getTaskAtPos(string memory position) external {

    }
}