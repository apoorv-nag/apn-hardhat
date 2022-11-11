const { expect } = require('chai');
const { ethers } = require('hardhat');

describe('TodoListDemo', function () {
  it('Should create task', async function () {
    const TodoList = await ethers.getContractFactory('TodoList');
    const todoList = await TodoList.deploy();
    await todoList.deployed();

    expect(await todoList.totalCount()).to.equal(0);

    todoList.createTask('Buy tea');
    todoList.createTask('Buy coffee');
    todoList.createTask('Solve a quiz');

    expect(await todoList.totalCount()).to.equal(3);
  });

  it('Should mark a task complete', async function () {
    const TodoList = await ethers.getContractFactory('TodoList');
    const todoList = await TodoList.deploy();
    await todoList.deployed();

    expect(await todoList.totalCount()).to.equal(0);

    todoList.createTask('Buy tea');
    todoList.createTask('Buy coffee');
    todoList.createTask('Buy drinks');

    expect(await todoList.getTaskStatusAtIndex(0)).to.equal(0);
    expect(await todoList.getTaskStatusAtIndex(1)).to.equal(0);
    expect(await todoList.getTaskStatusAtIndex(2)).to.equal(0);

    await todoList.markComplete(1);

    expect(await todoList.getTaskStatusAtIndex(0)).to.equal(0);
    expect(await todoList.getTaskStatusAtIndex(1)).to.equal(1);
    expect(await todoList.getTaskStatusAtIndex(2)).to.equal(0);
  });

  it('Should get a task at Index', async function () {
    const TodoList = await ethers.getContractFactory('TodoList');
    const todoList = await TodoList.deploy();
    await todoList.deployed();

    expect(await todoList.totalCount()).to.equal(0);

    todoList.createTask('Buy tea');
    todoList.createTask('Buy coffee');
    todoList.createTask('Solve a quiz');

    expect(await todoList.getTaskAtIndex(0)).to.equal('Buy tea');
    expect(await todoList.getTaskAtIndex(1)).to.equal('Buy coffee');
    expect(await todoList.getTaskAtIndex(2)).to.equal('Solve a quiz');
  });

  it('Should get a task status at Index', async function () {
    const TodoList = await ethers.getContractFactory('TodoList');
    const todoList = await TodoList.deploy();
    await todoList.deployed();

    expect(await todoList.totalCount()).to.equal(0);

    todoList.createTask('Buy tea');
    todoList.createTask('Buy coffee');
    todoList.createTask('Solve a quiz');

    expect(await todoList.getTaskAtIndex(0)).to.equal('Buy tea');

    // expect(await todoList.getTaskStatusAtIndex(0)).to.equal(
    //   TodoList.TodoStatuses
    // );
  });

  it('Should get a task status at Index', async function () {
    const TodoList = await ethers.getContractFactory('TodoList');
    const todoList = await TodoList.deploy();
    await todoList.deployed();

    expect(await todoList.totalCount()).to.equal(0);

    todoList.createTask('Buy tea');

    // expect(await todoList.getTaskStatusAtIndex(0)).to.equal(
    //   TodoList.TodoStatuses
    // );
  });

  it('Should remove a task at index', async function () {
    const TodoList = await ethers.getContractFactory('TodoList');
    const todoList = await TodoList.deploy();
    await todoList.deployed();

    expect(await todoList.totalCount()).to.equal(0);

    todoList.createTask('Buy tea');

    expect(await todoList.totalCount()).to.equal(1);

    todoList.createTask('Buy coffee');

    expect(await todoList.totalCount()).to.equal(2);

    todoList.removeTask(0);

    expect(await todoList.getTaskAtIndex(0)).to.equal('Buy coffee');
  });
});
