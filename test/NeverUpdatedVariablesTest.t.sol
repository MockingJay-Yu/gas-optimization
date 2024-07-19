// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

import "forge-std/Test.sol";
import "../src/NeverUpdatedVariables.sol";

contract NeverUpdatedVariablesTest is Test {
    Constants constants;
    NoConstants noConstants;
    uint256 constant MAX_UINT256 = 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;

    function setUp() public {
        constants = new Constants();
        noConstants = new NoConstants();
    }

    function testConstants() public view {
        uint256 value = constants.getMaxValue();
        assertEq(MAX_UINT256, value);
    }

    function testNoConstants() public view {
        uint256 value = noConstants.getMaxValue();
        assertEq(MAX_UINT256, value);
    }
}
