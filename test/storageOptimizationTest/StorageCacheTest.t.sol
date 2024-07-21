// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "forge-std/Test.sol";
import "../../src/storageOptimization/StorageCache.sol";

contract StorageCacheTest is Test {
    Counter1 counter1;
    Counter2 counter2;

    function setUp() public {
        counter1 = new Counter1();
        counter2 = new Counter2();
    }

    function testCounter1() public {
        counter1.increment();
        assertEq(counter1.number(), 1);
    }

    function testCounter2() public {
        counter2.increment();
        assertEq(counter2.number(), 1);
    }
}
