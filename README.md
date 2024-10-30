# Ethereum Collectible Ownership Smart Contract

In this project I implements a **Collectible Ownership Smart Contract** on the Ethereum blockchain. Built as part of the [Alchemy University Web3 Development Bootcamp](https://university.alchemy.com/) (Ethereum Track), this smart contract allows for the secure transfer, sale, and purchase of a collectible. The project demonstrates essential Ethereum development skills and advanced Solidity concepts.

## Project Overview

The `Collectible` contract empowers owners to transfer collectibles, set sale prices, and facilitate secure purchases with Ether. With features like stateful sale control and event logging, this contract reflects real-world use cases in blockchain technology.

---

### Key Features

- **Ownership Transfer**: Allows only the current owner to transfer ownership to a new address.
- **Price Management**: Owners can set or update the asking price and control whether the item is available for sale.
- **Secure Purchase**: Buyers can purchase the collectible by sending the exact asking price in Ether.
- **Event Logging**: Emits events for deployment, transfer, sale listing, and purchase, making it easy to track transactions and ownership history on-chain.

---

### Contract Details

**Events**:

- `Deployed(address _inside)`: Triggered upon contract deployment with the initial owner address.
- `Transfer(address _originalOwner, address _newOwner)`: Records each ownership transfer.
- `ForSale(uint _price, uint _blockTimestamp)`: Logs when the collectible is listed for sale.
- `Purchase(uint purchaseAmt, address _buyer)`: Emitted when the collectible is purchased, recording the sale amount and buyer's address.

**Functions**:

- `transfer(address _recipient)`: Allows the current owner to transfer ownership to `_recipient`.
- `markPrice(uint _askingPrice)`: Sets the asking price and makes the collectible available for sale.
- `purchase() payable`: Allows a buyer to purchase the collectible at the set price, securely transferring Ether to the previous owner.

---

### Learning Insights

In building this contract, I gained hands-on experience with:

- **Ethereum Fundamentals**: Wallet transactions, events, and state management.
- **Solidity Best Practices**: Secure Ether transfers, ownership checks, and sale logic.
- **Event Logging Constraints**: Recognizing the limit of four topics in event logs, and structuring events to optimize log queries.

This project also introduced me to essential Solidity concepts, including custom events for monitoring, Ether handling, and smart contract security best practices.

---
