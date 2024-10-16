## Use zero byte

Ethereum charges 4 gas for a zero byte of calldata and 16 gas for a non-zero byte. This is true during
a normal function call and during deployment.

- **Use vanity addresses**
  It is cheaper to use vanity addresses with leading zeros, this saves calldata gas cost.This will not save
  gas when calling the address directly.However,if that contrat's address is used as an argument to a function,
  that can will cost less gas due to having more zeros in the calldata.

- **Avoid signed integers in calldata if possible**
  Because solidity uses two's complement to represent signed integers, calldata for small negative numbers will be
  largely non-zero.For example, `-1` is `0xff..ff` in two's complement form and therefore more expensive.

## Calldata is cheaper than memory

Loading function inputs or data is directly from calldata is cheaper compared to loading from memory.This is because
accessing data from calldata involves fewer operations and gas costs. So it is advised to use memory only when the
data needs to be modified in the function(calldata cannot be modified)
