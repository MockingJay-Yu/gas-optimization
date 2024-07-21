// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;
//dev A timestamp of size uint48 will work for millions of years into the future. A block number of size
//uint32 enough to contains billions of blocks.This should give you a sense of the size of numbers that
//are sensible.

contract StoreBlockTimeAndBlockNumber {
    uint48 public blockTimeStamp;
    uint32 public blockNumer;
}
