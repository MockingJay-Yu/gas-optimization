// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

//dev Packing struct items can help save gas.
//note Struct members are stored sequentially in the contract's storage,starting from the slot position
//where they are initialized
contract PackedStruct {
    struct Detail {
        uint64 time; // Takes one slot, it only use 64 bits (8 bytes) of the slot
        address person; // Use the same slot as `time`, it use 160 bits (20 bytes) of the slot
        uint256 money; // Takes a new slot
    }

    Detail public detail;

    // Used 2 storage slots
    // gas : 66294
    function packedStruct(uint64 _time, address _person, uint256 _money) public {
        detail = Detail(_time, _person, _money);
    }

    // gas : 466
    function unpack() public view returns (uint64, address, uint256) {
        return (detail.time, detail.person, detail.money);
    }
}

contract UnPackedStruct {
    struct Detail {
        uint64 time; // Takes one slot, it only use 64 bits (8 bytes) of the slot
        uint256 money; // This will take a new slot because it is a complete 256 bits (32 bytes) value
        address person; // Takes a new slot
    }

    Detail public detail;

    // Used 3 storage slots
    // gas : 88362
    function packedStruct(uint64 _time, uint256 _money, address _person) public {
        detail = Detail(_time, _money, _person);
    }

    // gas : 521
    function unpack() public view returns (uint64, uint256, address) {
        return (detail.time, detail.money, detail.person);
    }
}
