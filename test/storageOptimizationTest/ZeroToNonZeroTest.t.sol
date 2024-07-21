// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "forge-std/Test.sol";
import "../../src/storageOptimization/ZeroToNonZero.sol";

contract ZeroToNonZeroTest is Test {
    ZeroToNonZero zeroToNonZero;

    function setUp() public {
        zeroToNonZero = new ZeroToNonZero();
    }

    function testZeroToNonZero() public {
        zeroToNonZero.zeroToNonZero();
        assertEq(zeroToNonZero.zero(), 1);
    }

    function testNonZeroToNonZero() public {
        zeroToNonZero.nonZeroToNonZero();
        assertEq(zeroToNonZero.one(), 2);
    }

    function testNonZeroToZero() public {
        zeroToNonZero.nonZeroToZero();
        assertEq(zeroToNonZero.one(), 0);
    }
}
