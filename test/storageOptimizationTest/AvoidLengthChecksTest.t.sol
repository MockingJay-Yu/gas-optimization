// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "forge-std/Test.sol";
import "../src/storageOptimization/AvoidLengthChecks.sol";

contract AvoidLengthChecksTest is Test {
    Array array;

    uint256 _index = 1;

    function setUp() public {
        array = new Array();
    }

    function testGet() public view {
        uint256 value = array.get(_index);
        assertEq(value, 2);
    }

    function testUnsafeAccess() public view {
        uint256 value = array.unsafeAccess(_index);
        assertEq(value, 2);
    }
}
