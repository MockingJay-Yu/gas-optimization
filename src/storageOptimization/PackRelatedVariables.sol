// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

//dev Packing related variables into same slot reduces gas costs by minimizing costly
// storage related operations
contract GasSavingExample1 {
    uint160 public packedVariables;

    // Manual packing is the most efficient
    // gas : 43905
    function packVariables(uint80 x, uint80 y) public {
        packedVariables = uint160(x) << 80 | uint160(y);
    }

    // gas : 344
    function unpackVariables() public view returns (uint80, uint80) {
        uint80 x = uint80(packedVariables >> 80);
        uint80 y = uint80(packedVariables);
        return (x, y);
    }
}

contract GasSavingExample2 {
    uint80 public x;
    uint80 public y;

    // EVM Packing is slightly less efficient
    // gas : 43946
    function setVars(uint80 _x, uint80 _y) public {
        x = _x;
        y = _y;
    }

    // gas : 367
    function loadVars() public view returns (uint80, uint80) {
        return (x, y);
    }
}

contract GasSavingExample3 {
    uint256 public x;
    uint256 public y;

    // No pakcing is least efficient
    // gas : 65813
    function setVars(uint256 _x, uint256 _y) public {
        x = _x;
        y = _y;
    }

    // gas : 407
    function loadVars() public view returns (uint256, uint256) {
        return (x, y);
    }
}
