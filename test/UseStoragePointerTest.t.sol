// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "forge-std/Test.sol";
import "../src/UseStoragePointer.sol";

contract UseStoragePointerTest is Test {
    StoragePointerOptimized storagePointerOptimized;
    StoragePointerUnOptimized storagePointerUpOptimized;
    uint256 _id;

    function setUp() public {
        storagePointerOptimized = new StoragePointerOptimized();
        storagePointerUpOptimized = new StoragePointerUnOptimized();
        _id = 0;
    }

    function testStoragePointerOptimized() public view {
        storagePointerOptimized.returnLastSeen(_id);
    }

    function testStoragePointerUpOptimized() public view {
        storagePointerUpOptimized.returnLastSeen(_id);
    }
}
