// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "forge-std/Test.sol";
import "../src/PackStructs.sol";

contract PackStructsTest is Test {
    PackedStruct packedStruct;
    UnPackedStruct unPackedStruct;
    uint64 _time;
    address _person;
    uint256 _money;

    function setUp() public {
        packedStruct = new PackedStruct();
        unPackedStruct = new UnPackedStruct();
        _time = 53000;
        _person = address(0xdeadbeef);
        _money = 21000;
    }

    function testPackedStruct() public {
        packedStruct.packedStruct(_time, _person, _money);
        (uint64 var1, address var2, uint256 var3) = packedStruct.unpack();
        assertEq(var1, 53000);
        assertEq(var2, address(0xdeadbeef));
        assertEq(var3, 21000);
    }

    function testUnPackedStruct() public {
        unPackedStruct.packedStruct(_time, _money, _person);
        (uint64 var1, uint256 var2, address var3) = unPackedStruct.unpack();
        assertEq(var1, 53000);
        assertEq(var2, 21000);
        assertEq(var3, address(0xdeadbeef));
    }
}
