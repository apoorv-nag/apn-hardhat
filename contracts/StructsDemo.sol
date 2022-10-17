// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

contract StructDemo {
    struct Car {
        string model;
        uint year;
        address owner;
    }

    Car public car;

    Car[] public cars;

    mapping(address => Car[]) public carsByOwner;

    function examples() external {
        Car memory toyota = Car("Toyota", 1990, msg.sender);
        Car memory lambo = Car({model: "Lamborghini", year:1989, owner: msg.sender});
        Car memory tesla;

        tesla.model = "Tesla";
        tesla.year = 2010;
        tesla.owner = msg.sender;

        cars.push(toyota);
        cars.push(lambo);
        cars.push(tesla);

        cars.push(Car("Ferrari", 2020, msg.sender));

        // Car memory _car = cars[0];

        // we need storage because after modifying we want to persist the data
        // if we use memory then it will be lost after function has executed
        Car storage _car = cars[0];
        _car.model;
        _car.year;
        _car.year = 1999;

        delete _car.owner; // it will reset to address(0) - default address value

        // this will reset all the data at index 1
        delete cars[1];
    }

}