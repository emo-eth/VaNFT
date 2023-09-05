// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import {Script, console2} from "forge-std/Script.sol";
import {VanFT} from "src/VanFT.sol";

contract TestScript is Script {
    function run() public {
        VanFT test = new VanFT();

        vm.makePersistent(address(test));
        vm.createSelectFork("mainnet");

        vm.broadcast();
        test.mint(block.number);
    }
}
