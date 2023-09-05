// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import {Script, console2} from "forge-std/Script.sol";
import {VanFT} from "src/VanFT.sol";

contract TestDeploy is Script {
    function run() public {
        vm.createSelectFork(getChain("anvil").rpcUrl);
        vm.broadcast(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266);
        VanFT test = new VanFT();
    }
}
