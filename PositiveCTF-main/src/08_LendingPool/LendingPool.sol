// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Test, console} from "../../lib/forge-std/src/Test.sol";

// This lending protocol allows deposits, withdrawal them at any time, and also flash loans.
// Your goal is to steal all the ether from contract.

import "../../lib/openzeppelin-contracts/contracts/utils/Address.sol";

interface IFlashLoanReceiver {
    function execute() external payable;
}

contract LendingPool {
    using Address for address payable;

    mapping(address => uint256) private balances;

    constructor() payable {
        require(msg.value == 0.1 ether);
    }

    function deposit() external payable {
        balances[msg.sender] += msg.value;
        console.log("balance of ", msg.sender, " = ", balances[msg.sender]);
    }

    function withdraw() external {
        uint256 amountToWithdraw = balances[msg.sender];
        console.log("atw = ", amountToWithdraw);
        balances[msg.sender] = 0;
        payable(msg.sender).sendValue(amountToWithdraw);
    }

    function flashLoan(uint256 _amount) external {
        uint256 balanceBefore = address(this).balance;
        require(balanceBefore >= _amount, "Not enough balance");

        console.log(
            "flash first check passed, balance-before = ",
            balanceBefore
        );

        IFlashLoanReceiver(msg.sender).execute{value: _amount}();

        console.log(
            "flash execute passed, cur balance = ",
            address(this).balance
        );

        require(
            address(this).balance >= balanceBefore,
            "Flashloan not paid back"
        );
    }
}
