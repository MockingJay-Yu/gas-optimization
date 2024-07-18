// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

//dev Solidity does not cache the storage read. Reads and Writes are considerably more expensive
// Therefore, you should manually cache the variable to do exactly one storage read and exactly one
// storage write.
contract Counter1 {
    uint256 public number;

    //read number twice
    //gas : 43531
    function increment() public {
        require(number < 10);
        number += 1;
    }
}

contract Counter2 {
    uint256 public number;

    // read number once
    // gas : 43414
    function increment() public {
        uint256 _number = number;
        require(_number < 10);
        number = _number + 1;
    }
}
