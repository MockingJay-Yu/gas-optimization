// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

import "@openzeppelin/contracts/utils/structs/BitMaps.sol";

//dev Use bitmaps instead of bools when a significant amount of booleans are used. It only takes one
//bit to store this information, and each slot is 256 bits, that means one can store a 256 booleans with
//one storage slot.
contract BitMapExample {
    using BitMaps for BitMaps.BitMap;

    BitMaps.BitMap private bitmap;

    function setBit(uint256 _index, bool _value) public {
        bitmap.setTo(_index, _value);
    }

    function getBit(uint256 _index) public view returns (bool) {
        return bitmap.get(_index);
    }
}
