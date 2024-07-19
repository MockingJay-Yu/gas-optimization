// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "forge-std/Test.sol";
import "../src/KeepStringsSmallerThan32Bytes.sol";

contract KeepStringsSmallerThan32BytesTest is Test {
    StringStorage1 stringStorage1;
    StringStorage2 stringStorage2;

    function setUp() public {
        stringStorage1 = new StringStorage1();
        stringStorage2 = new StringStorage2();
    }

    function testStringStorage1() public {
        stringStorage1.getString();
        bytes32 data = vm.load(address(stringStorage1), 0); //slot 0
        emit log_named_bytes32("Full string plus length", data); // the full string and its length*2 is stored at slot 0, because it is less than 32 bytes
    }

    function testStringStorage2() public {
        stringStorage2.getStringLongerThan32Bytes();
        bytes32 length = vm.load(address(stringStorage2), 0); // slot 0 stores the length*2+1
        emit log_named_bytes32("Length of string", length);

        bytes32 data1 = vm.load(address(stringStorage2), keccak256(abi.encode(0))); // slot keccak256(0)
        emit log_named_bytes32("First string chunk", data1);

        bytes32 data2 = vm.load(address(stringStorage2), bytes32(uint256(keccak256(abi.encode(0))) + 1));
        emit log_named_bytes32("Second string chunk", data2);
    }
}
