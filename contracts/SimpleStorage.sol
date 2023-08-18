// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract SimpleStorage {
    // declaring a variable 
    uint256 favoriteNumber;

    // declare a struct array (this is used for creating custom types)
    struct Person {
        uint256 myFavNum;
        string name;
    }

    Person[] public listOfPerson;

    //  Creating mappings 
    mapping(uint256 => string) public finder;



    // declare setter and getter functions
    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns (uint256) {
        return favoriteNumber;
    }

    // Adding elements in the list (create a function that adds Persons to the listOfPersons list)
    function addPerson(uint256 _myFavNum, string memory _name) public {
        listOfPerson.push(Person(_myFavNum, _name));
        finder[_myFavNum] = _name;
    }
   
 } 