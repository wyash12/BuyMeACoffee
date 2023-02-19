// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
// import "hardhat/console.sol";
// deployed to Goerli test net : 0xc0C0Ca510D88ad7D1C1b8B085BC3A244641Ab4A8

contract BuyMeACoffee{
    event NewMemo(
         address indexed from,
        uint256 timestamp,
        string name,
        string message
    );

    struct Memo {
        address from;
        uint256 timestamp;
        string name;
        string message;

    }
    Memo[] memos;

    address payable owner;

    constructor(){
        owner = payable(msg.sender);

    }

    function buyCoffee(string memory _name,string memory _message) public payable
    {
        require(msg.value > 0,"Can't buy coffee with 0 eth");

       memos.push( Memo(
            msg.sender,
            block.timestamp,
            _name,
            _message
       ));

        emit NewMemo(
            msg.sender,
            block.timestamp,
            _name,
            _message
               );
    }

    function withdrawTips()public{
        address(this).balance;
        require(owner.send(address(this).balance));
    }
    function getMemos() public view returns(Memo[] memory){
    return memos;
    }
}
