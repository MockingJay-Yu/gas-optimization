// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

//dev When a storage variable changes from zero to non-zero,
//it is more expensive than changing from non-zero to non-zero
contract ZeroToNonZero {
    uint256 public zero;
    uint256 public one = 1;

    //gas : 43368
    function zeroToNonZero() public {
        zero = 1;
    }

    //gas : 26224
    function nonZeroToNonZero() public {
        one = 2;
    }

    //gas : 21380
    function nonZeroToZero() public {
        one = 0;
    }
}
