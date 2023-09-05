# VaNFT

Proof-of-concept for minting an entire block as an NFT by consuming enough gas to prevent other transactions from being processed.

- Must specify the block number to mint
  - Fails fast if the block number is invalid
- Checks remaining gas against the gas limit
  - Fails fast if the gas limit is too low
- Fine-tuned for EOAs – will not be possible to mint from a contract

After mint, gas is burned until there is < 21,000 gas remaining, which is the minimum gas required to send Ether from one EOA to another (the cheapest possible transaction).

# Testing

Testing is difficult, since the EVM only forwards 63/64 remaining gas, and Forge tests execute in an EVM with their own gas limit.

To test, start a local Anvil network.

- Run `TestDeploy.t.sol` to deploy the contract
- Use `cast send` or run the `TestScript.t.sol` to mint a block
  - The Forge script may fail on simulation, and skipping the simulation step may not work – hopefully this is fixed soon
