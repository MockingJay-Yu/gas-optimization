// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "forge-std/Test.sol";
import "../src/PackRelatedVariables.sol";

contract PackRelatedVariablesTest is Test {
    GasSavingExample1 gasSavingExample1;
    GasSavingExample2 gasSavingExample2;
    GasSavingExample3 gasSavingExample3;
    uint80 x;
    uint80 y;
    uint160 packedXY = 80 * (2 ** 80) + 90;

    function setUp() public {
        gasSavingExample1 = new GasSavingExample1();
        gasSavingExample2 = new GasSavingExample2();
        gasSavingExample3 = new GasSavingExample3();
        x = 80;
        y = 90;
    }

    function testExample1() public {
        gasSavingExample1.packVariables(x, y);
        assertEq(gasSavingExample1.packedVariables(), packedXY);
        (uint80 var1, uint80 var2) = gasSavingExample1.unpackVariables();
        assertEq(var1, 80);
        assertEq(var2, 90);
    }

    function testExample2() public {
        gasSavingExample2.setVars(x, y);
        assertEq(gasSavingExample2.x(), 80);
        assertEq(gasSavingExample2.y(), 90);
        (uint80 var1, uint80 var2) = gasSavingExample2.loadVars();
        assertEq(var1, 80);
        assertEq(var2, 90);
    }

    function testExample3() public {
        uint256 var1 = 80;
        uint256 var2 = 90;
        gasSavingExample3.setVars(var1, var2);
        assertEq(gasSavingExample3.x(), 80);
        assertEq(gasSavingExample3.y(), 90);
        (uint256 result1, uint256 result2) = gasSavingExample3.loadVars();
        assertEq(result1, 80);
        assertEq(result2, 90);
    }
}
