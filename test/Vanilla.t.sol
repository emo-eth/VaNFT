// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import {Test} from "forge-std/Test.sol";

contract VanillaTest is Test {
    function test() public {
        require(gasleft() > (block.gaslimit - 22000), "VanFT: not enough gas");
    }
}
