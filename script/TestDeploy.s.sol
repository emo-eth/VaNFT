// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import {Script, console2} from "forge-std/Script.sol";
import {VanFT} from "src/VanFT.sol";

contract TestDeploy is Script {
    function run() public {
        vm.createSelectFork("anvil");
        vm.broadcast();
        VanFT test = new VanFT();
    }
}
