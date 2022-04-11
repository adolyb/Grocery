// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0;

contract Grocery{
    struct Goods{
        bytes name;
        bytes img;
        bool isClaimed;
    }

    Goods[] public goodlist; //商品列表实例化instance
    mapping(uint => address) goodsMap;  // 商品的归属
    mapping(address => uint[]) claimList;  // 领取数量
    mapping(address => uint) claimNum; // 领取统计
    uint maxClaim = 10;  // 最大领取数量, 可以用过添加商品来得到更多的机会


    function AddList(bytes memory _name, bytes memory _img) public returns(uint){
        goodlist.push(Goods(_name, _img ,false));
        uint id = goodlist.length-1;
        goodsMap[id] = msg.sender;
        claimNum[msg.sender] -= 1;
        return id;
    }

    function Claim(uint _id) public{
        require(claimNum[msg.sender]<= maxClaim,"You claimed too much");
        require(!goodlist[_id].isClaimed,"this item has been claimed");
        claimList[msg.sender].push(_id);
        claimNum[msg.sender] += 1 ;
        goodsMap[_id] = msg.sender;
        goodlist[_id].isClaimed = true ;
    }


}