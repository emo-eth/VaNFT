// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import {ERC721} from "solady/tokens/ERC721.sol";
import {GasConsumer} from "forge-gas-metering/GasConsumer.sol";

contract VanFT is ERC721, GasConsumer {
    uint256 constant MINT_CALL_OVERHEAD = 21700;
    uint256 constant CALL_OVERHEAD = 21000;

    error WrongBlock();
    error InsufficientGasToBurn();

    function name() public pure override returns (string memory) {
        return "VanFT";
    }

    function symbol() public pure override returns (string memory) {
        return "VFT";
    }

    function tokenURI(uint256) public view override returns (string memory) {
        return "";
    }

    function mint(uint256 number) public {
        if (number != block.number) {
            revert WrongBlock();
        }
        if (gasleft() < (block.gaslimit - MINT_CALL_OVERHEAD)) {
            revert InsufficientGasToBurn();
        }
        _mint(msg.sender, block.number);
        unchecked {
            // account for the fact that only 63/64 of remaining can be forwarded at a time
            while (gasleft() > CALL_OVERHEAD) {
                consumeGas(gasleft() - 100);
            }
        }
    }
}
