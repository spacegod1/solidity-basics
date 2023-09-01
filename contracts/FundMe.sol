// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {PriceConverter} from "./PriceConverter.sol";

contract FundMe {
    
    using PriceConverter for uint256;

    uint256 public constant MINIMUM_USD  = 5e18;

    address[] public funders;
    mapping(address => uint256) public addressToAmt;

    address public immutable i_owner;

    constructor() {
        i_owner = msg.sender;
    }


    function fund() public payable {

        // contracts are able to hold native currency, E.g ETH
        require(msg.value.getConversionRate() >= MINIMUM_USD, "Didn't send enough ETH");
        funders.push(msg.sender);
        addressToAmt[msg.sender] += msg.value;
    }

 function withdraw() public onlyOwner {

     // using call
   (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
   require(callSuccess, "Call failed");

     for (uint256 i = 0; i < funders.length; i++) {
         address funder = funders[i];
         addressToAmt[funder] = 0;
     }

     funders = new address[](0);

    //sending eth can be done with transfer, send, or call methods
    //  payable(msg.sender).transfer(address(this).balance);

    // using send
    //  bool sendSuccess = payable(msg.sender).send(address(this).balance);
    //  require(sendSuccess, "Send failed")
 } 

    modifier onlyOwner() {
        require(msg.sender == i_owner, "Must be owner!");
        _;
    }
}