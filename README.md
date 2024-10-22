# Web3Sec-HW02-CTF

## Tools
- Foundry
- [PositiveCTF](https://github.com/PositiveSecurity/PositiveCTF.git)

## Install
```bash
forge install
```

## Testing
```bash
forge test
forge test --match-path test/{test-file} -vvv
```

## Testing results
```ini
Ran 1 test for test/08_LendingPool.t.sol:LendingPoolTest
[PASS] testExploitLevel() (gas: 169342)
Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 18.78ms (3.03ms CPU time)

Ran 1 test for test/01_Azino777.t.sol:Azino777Test
[PASS] testExploitLevel() (gas: 30425)
Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 18.79ms (2.89ms CPU time)

Ran 1 test for test/09_AntiRugPull.t.sol:AntiRugPullTest
[PASS] testExploitLevel() (gas: 144498)
Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 895.53µs (199.24µs CPU time)

Ran 1 test for test/10_FakeDAO.t.sol:FakeDAOTest
[PASS] testExploitLevel() (gas: 733978)
Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 18.78ms (3.02ms CPU time)

Ran 1 test for test/04_FindMe.t.sol:FindMeTest
[PASS] testExploitLevel() (gas: 34172)
Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 1.01ms (67.82µs CPU time)

Ran 1 test for test/11_DAO.t.sol:DAOTest
[FAIL: Solution is not solving the level] testExploitLevel() (gas: 8322)
Suite result: FAILED. 0 passed; 1 failed; 0 skipped; finished in 1.38ms (50.26µs CPU time)

Ran 1 test for test/05_CallMeMaybe.t.sol:CallMeMaybeTest
[PASS] testExploitLevel() (gas: 60794)
Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 488.01µs (51.97µs CPU time)

Ran 1 test for test/06_PredictTheFuture.t.sol:PredictTheFutureTest
[PASS] testExploitLevel() (gas: 73403)
Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 536.76µs (79.51µs CPU time)

Ran 1 test for test/03_WheelOfFortune.t.sol:WheelOfFortuneTest
[PASS] testExploitLevel() (gas: 318141)
Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 576.74µs (128.59µs CPU time)

Ran 1 test for test/07_Lift.t.sol:LiftTest
[PASS] testExploitLevel() (gas: 111009)
Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 504.71µs (68.97µs CPU time)

Ran 1 test for test/14_Metamorphic.t.sol:MetamorphicTest
[FAIL: Solution is not solving the level] testExploitLevel() (gas: 13243)
Suite result: FAILED. 0 passed; 1 failed; 0 skipped; finished in 756.07µs (43.63µs CPU time)

Ran 1 test for test/13_WrappedEther.t.sol:WrappedEtherTest
[PASS] testExploitLevel() (gas: 314733)
Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 747.11µs (273.37µs CPU time)

Ran 1 test for test/12_DAO2.t.sol:DAO2Test
[FAIL: Solution is not solving the level] testExploitLevel() (gas: 8322)
Suite result: FAILED. 0 passed; 1 failed; 0 skipped; finished in 18.78ms (1.24ms CPU time)

Ran 1 test for test/02_PrivateRyan.t.sol:PrivateRyanTest
[PASS] testExploitLevel() (gas: 33569)
Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 5.35ms (809.54µs CPU time)

Ran 1 test for test/15_PirateShip.t.sol:PirateShipTest
[FAIL: Solution is not solving the level] testExploitLevel() (gas: 10903)
Suite result: FAILED. 0 passed; 1 failed; 0 skipped; finished in 1.17ms (42.68µs CPU time)

Ran 15 test suites in 697.92ms (88.53ms CPU time): 11 tests passed, 4 failed, 0 skipped (15 total tests)
```