## 1. Use transfer hooks for tokens instead of initiating a transfer from the destination smart contract
- All ERC1155 tokens include a transfer hook
- safeTransfer and safeMint in ERC721 have transfer hook
- ERC1363 has transferAndCall and approveAndCall

## 2. Use ERC2930 access list transactions when making cross-contract calls to pre-warm storage slots and contract addresses

1. **cold read**
A cold read refers to accessing storage slots that have either never been initialized or are accessed for the first time
in a transaction. 
2. **warm read**
A warm read refers to accessing storage slots that have been accessed previously in the current transcation. 

EIP-2930 allows you to prepay the gas costs for some storage and call operations, with 200 gas discount. It does not require any modifications to the Solidity code and is purely specified client-side. 

Per EIP-2929, ethereum raised cold cost of opcode `SLOAD` from 800 to 2100 while lowering the warm cost to 100.

However,EIP-2930 has the added benefit to lowering transcation costs due to the transcation's 200 gas discount.

As a result, instead of paying 2100 gas for `SLOAD` respectively, the transaction only requires 1900 gas for cold access, and subsequent warm access will only cost 100 gas.

## 3. Cache calls to external contracts where it makes sense (like caching return data from chainlink oracle)

Caching data is generally recommended to avoid duplication in memory when you want to use the same data > 1 times during a
single transaction.

## 4. Implement multicall in router-like contracts

If you expect your users to make a sequence of calls, have a contract batch them together using muticall and it will be greatly save gas costs. 