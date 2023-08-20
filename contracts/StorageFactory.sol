// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// This lesson focused on interacting with other .sol files 
// Similar to JS we can call contracts from other files unto our 
// own files using "named import" as shown here

import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory {

// The contract in a sense is of a type of object but in Solidity 
// is an address (every contract is defined by its own unique address)

// Hence to create a variable of a type of contract we can
// SimpleStorage public simpleStorage 

// which would follow the type visiblity name order/rule


// But here I created a list to track each contract 
    SimpleStorage[] public myListOfSimpleStorage;

    function createSimpleStorageContract () public {
        SimpleStorage newContract = new SimpleStorage();
        myListOfSimpleStorage.push(newContract);
    }

// Once a contract it still has its functions still embedded in it and we can call
// them from within our function isn't that cool?
    function sfStore(uint256 _index, uint256 _favNum) public {
      myListOfSimpleStorage[_index].store(_favNum);
    }

    function sfRetrieve (uint256 _index) public view returns (uint256) {
        return myListOfSimpleStorage[_index].retrieve();
    }
}