// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

//dev In Solidity, strings are variable length dynamic data types.
//if the length <= 31 bytes, the length * 2 is stored at the least significant byte of it’s storage slot
//and the actual data of string is stored starting from the most significant byte in the slot in which it is defined.
//if the length > 31 bytes, the slot in which they are defined stores the length * 2 + 1,
//while their actual data is stored elsewhere(the keccak hash of that slot).
contract StringStorage1 {
    string public exampleString = "hello";

    // gas : 3177
    function getString() public view returns (string memory) {
        return exampleString;
    }
}

contract StringStorage2 {
    string public exampleString = "This is a string that is slightly over 32 bytes!";

    // gas : 7452
    function getStringLongerThan32Bytes() public view returns (string memory) {
        return exampleString;
    }
}
