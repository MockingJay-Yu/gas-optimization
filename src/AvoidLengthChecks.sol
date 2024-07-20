// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

//dev Under the hood when you read the value of an index of an array,solidity adds bytecode that checks that
//you are reading from a vaild index else it reverts with a error.we can use EVM Opcodes to skip the length
//overflow check.The permise is that the accessed index does not exceed the length of the array.
//Actually,openzeppelin's `Array.sol` already has a concrete implementation.
contract Array {
    uint256[] public arrays;

    constructor() {
        arrays.push(1);
        arrays.push(2);
        arrays.push(3);
    }

    // gas : 4587
    function get(uint256 _index) public view returns (uint256) {
        return arrays[_index];
    }

    // gas : 2350
    function unsafeAccess(uint256 _index) public view returns (uint256) {
        bytes32 slot;
        uint256 value;
        assembly {
            mstore(0, arrays.slot)
            slot := add(keccak256(0, 0x20), _index)
            value := sload(slot)
        }
        return value;
    }
}
