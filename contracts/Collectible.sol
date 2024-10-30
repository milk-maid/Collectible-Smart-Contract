// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
contract Collectible {

    address private owner;
    uint private askingPrice;
    bool private notForSale = true;
    uint private saleTimestamp;

    event Deployed(address indexed _inside);
    event Transfer(address indexed _originalOwner, address indexed _newOwner);
    event ForSale(uint _price, uint _blockTimestamp);
    event Purchase(uint purchaseAmt, address indexed _buyer);

    constructor() {
        owner = msg.sender;
        emit Deployed(msg.sender);
    }

    function transfer(address _recipient) external {
        require(owner == msg.sender, "You are not the owner");
        owner = _recipient; // ownership transferred
        emit Transfer(msg.sender, owner);
    }

    function markPrice(uint _askingPrice) external {
        require(owner == msg.sender, "You are not the owner");
		require(_askingPrice > 0, "input a positive asking price");
        askingPrice = _askingPrice;
        notForSale = false;

        // Set the sale timestamp to the current block timestamp when marking for sale
        saleTimestamp = block.timestamp;

        emit ForSale(_askingPrice, block.timestamp);
    }

    function purchase() external payable {
        require(msg.value == askingPrice, "Incorrect amount sent");
        require(!notForSale, "Item is not for sale");

        // Require that the current timestamp is after the saleTimestamp
        require(block.timestamp > saleTimestamp, "Sale timestamp not reached");

        // Assign ownership before Ether transfer
        address previousOwner = owner;
        owner = msg.sender;
        notForSale = true; // Mark item as not for sale

        // Transfer Ether to the previous owner
        (bool success, ) = previousOwner.call{value: msg.value}("");
        require(success, "Transfer failed");

        emit Purchase(msg.value, msg.sender);
    }
}
