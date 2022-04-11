pragma solidity >=0.5.0;
// SPDX-License-Identifier: MIT

contract tes {
    struct Goods {
        bytes name;
        bytes img;
        bool isClaim;
    }

Goods public good = Goods("123","zx", false);
Goods[] public goodsList;

function getValue() public view returns(bytes memory) { //it can work
    return good.img;
}

function add() public{
    goodsList.push(Goods("123","zx", false)); //VM Exception while processing transaction: revert
}

function getArray() public view returns(Goods memory){ 
   return goodsList[0]; //VM Exception while processing transaction: revert
}

function getLength() public view returns(uint256) {
    return goodsList.length; //VM Exception while processing transaction: revert
}
}