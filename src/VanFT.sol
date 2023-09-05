// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import {ERC721} from "solady/tokens/ERC721.sol";
import {GasConsumer} from "forge-gas-metering/GasConsumer.sol";

contract VanFT is ERC721, GasConsumer {
    function name() public view override returns (string memory) {
        return "VanFT";
    }

    function symbol() public view override returns (string memory) {
        return "VFT";
    }

    function tokenURI(uint256) public view override returns (string memory) {
        return "https://vanft.ca";
    }

    event GasLeft(uint256);

    function mint(uint256 number) public {
        require(number == block.number, "Wrong block");
        emit GasLeft(gasleft());
        unchecked {
            require(gasleft() > (block.gaslimit - 22000), "VanFT: not enough gas");
        }
        _mint(msg.sender, block.number);
        unchecked {
            consumeGas(gasleft() - 100);
        }
    }
}
