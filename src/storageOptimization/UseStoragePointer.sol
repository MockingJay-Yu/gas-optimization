// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

//dev In Solidity, storage pointer are variables that reference a location in storage of a contract.Since
//storage pointers are lazy(meaning they only read or write when called or referenced),Therefor using storage
//pointers efficiently to avoid unnecessary storage reads and perform gas-efficient storage updates.
contract StoragePointerUnOptimized {
    struct User {
        uint256 id;
        string name;
        uint256 lastSeen;
    }

    mapping(uint256 => User) public users;

    constructor() {
        users[0] = User(0, "Jonh", block.timestamp);
    }

    // Using memory pointer means we are copying all of the struct from storage into memory including variables
    // we don't need.
    // gas : 2553
    function returnLastSeen(uint256 _id) public view returns (uint256) {
        User memory _user = users[_id];
        uint256 lastSeen = block.timestamp - _user.lastSeen;
        return lastSeen;
    }
}

contract StoragePointerOptimized {
    struct User {
        uint256 id;
        string name;
        uint256 lastSeen;
    }

    mapping(uint256 => User) public users;

    constructor() {
        users[0] = User(0, "Jonh", block.timestamp);
    }

    // We only access the lastSeen of the struct and make single storage load then store it on the stack.
    // gas : 7497
    function returnLastSeen(uint256 _id) public view returns (uint256) {
        User storage _user = users[_id];
        uint256 lastSeen = block.timestamp - _user.lastSeen;
        return lastSeen;
    }
}
