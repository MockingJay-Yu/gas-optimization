// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

import "forge-std/Test.sol";
import "../../src/crossContractCallsOptimization/UseReceiveOrFallbackInsteadOfDeposit.sol";

contract UseReceiveOrFallbackInsteadOfDepositTest is Test {
    event Deposit(address indexed sender, uint256 indexed amount);

    UseReceiveOrFallbackInsteadOfDeposit vault;
    address public PLAYER = makeAddr("player");
    uint256 public constant STARTING_USER_BALANCE = 10 ether;
    uint256 public constant DEPOSIT_AMOUNT = 5 ether;

    function setUp() public {
        vault = new UseReceiveOrFallbackInsteadOfDeposit();
        vm.deal(PLAYER, STARTING_USER_BALANCE);
    }

    function testDeposit() public {
        vm.prank(PLAYER);
        vm.expectEmit(true, true, false, false, address(vault));
        emit Deposit(PLAYER, DEPOSIT_AMOUNT);
        vault.deposit{value: DEPOSIT_AMOUNT}();
        assertEq(vault.balances(PLAYER), DEPOSIT_AMOUNT);
    }

    function testReceive() public {
        vm.prank(PLAYER);
        vm.expectEmit(true, true, false, false, address(vault));
        emit Deposit(PLAYER, DEPOSIT_AMOUNT);
        (bool success,) = address(vault).call{value: DEPOSIT_AMOUNT}("");
        if (success) {
            assertEq(vault.balances(PLAYER), DEPOSIT_AMOUNT);
        }
    }
}
