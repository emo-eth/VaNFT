// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import {Script, console2} from "forge-std/Script.sol";
import {VanFT} from "src/VanFT.sol";

contract TestScript is Script {
    function run() public {
        // --skip-simulation flag seems to be broken – test with `cast send` in meantime
        vm.createSelectFork(getChain("anvil").rpcUrl);
        vm.broadcast(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266);
        VanFT(0x5FbDB2315678afecb367f032d93F642f64180aa3).mint{gas: 30000000}(block.number + 1);
    }
}
