// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

//dev `SSTORE2` is a unique concept in a way that it uses a contract's bytecode to write and store data.
//Some properties of SSTORE2:
//  We can write only once.Effectively using CREATE instead of SSTORE
//  To read,instead of using SLOAD,we now call EXTCODECOPY on th deployed address where the data is stored
//  Writing data becomes significantly cheaper when more and more data needs to be stores
//  we can also use CREATE2 to calculate the pointer address off chain without relying on storing the pointer
//Here is an example of SSTORE2,actually github has mature libraries available for use:
//https://github.com/Vectorized/solady
//https://github.com/Philogy/sstore3
library SSTORE2 {
    function write(bytes memory data) internal returns (address) {
        address addr;
        assembly {
            addr := create(0, add(data, 0x20), mload(data))
        }
        require(addr != address(0), "SSTORE2:CREATE_FAILED");
        return addr;
    }

    function read(address addr) internal view returns (bytes memory) {
        uint256 size;
        assembly {
            size := extcodesize(addr)
        }
        bytes memory data = new bytes(size);
        assembly {
            extcodecopy(addr, add(data, 0x20), 0, size)
        }
        return data;
    }
}

contract Example {
    using SSTORE2 for address;

    address public dataAddress;

    function storeData(bytes memory data) public {
        dataAddress = SSTORE2.write(data);
    }

    function retrieveData() public view returns (bytes memory) {
        return SSTORE2.read(dataAddress);
    }
}
