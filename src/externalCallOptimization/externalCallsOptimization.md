## 1. Use transfer hooks for tokens instead of initiating a transfer from the destination smart contract

## 2. Use fallback or receive instead of deposit() when transferring Ether

## 3. Cache calls to external contracts where it makes sense (like caching return data from chainlink oracle)

## 4. Implement multicall in router-like contracts

## 5. Avoid contract calls by making the architecture monolithic