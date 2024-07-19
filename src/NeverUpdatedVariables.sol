// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

//dev In Solidity, variables which are not intended to be updated should be `constant` or `immutable`.
//This is because `constant` and `immutable` values are embedded directly into the bytecode of the contract
//which they are defined and does not use storage.
//`constant` variables' value are determined at compile time and directly embedded into the bytecode.
//`immutable` variables' value are determined at deployment time and embedded into the bytecode.
contract Constants {
    uint256 public constant MAX_UINT256 = 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;

    // gas : 183
    function getMaxValue() public pure returns (uint256) {
        return MAX_UINT256;
    }
}

contract NoConstants {
    uint256 public MAX_UINT256 = 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;

    // gas : 2280
    function getMaxValue() public view returns (uint256) {
        return MAX_UINT256;
    }
}
