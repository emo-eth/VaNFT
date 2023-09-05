// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import {Test} from "forge-std/Test.sol";
import {VanFT} from "../src/VanFT.sol";

contract VanFTTest is Test {
    VanFT test;

    event GasLeft(uint256);

    function setUp() public {
        test = new VanFT();
    }

    function testMint() public {
        // cannot test due to to gas-forwarding being limited to 63/64 of remaining gas
        VanFT _test = test;
        vm.resumeGasMetering();
        emit GasLeft(gasleft());
        _test.mint{gas: 30_000_000}(block.number);
        assertEq(test.balanceOf(address(this)), 1);
    }
}
