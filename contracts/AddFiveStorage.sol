// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {SimpleStorage} from "./SimpleStorage.sol";

// This lesson is focused on Inheritance. Let's say we want to
// our contract to have the same functionality as SimpleStorage contract
// but add 5 to our favourite number, we can make a child contract(AddFiveStorage)
// by adding "is" to the parent contract 
// This makes it possible to inherit all its functions and its custom functions


contract AddFiveStorage is SimpleStorage {
// To be able to make changes on a parent function, it has to be a virtual 
// function, hence the keyword "virtual" is required on the base function and
// "override" on the instance function. Viola!

    function store(uint256 _favNum) public override {
        favoriteNumber = _favNum + 5;
    }
}
