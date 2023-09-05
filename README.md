# VaNFT

Proof-of-concept for minting an entire block as an NFT, by consuming enough gas to prevent other transactions from being processed.

- Must specify the block number to mint
  - Fails fast if the block number is invalid
- Checks remaining gas against the gas limit
  - Fails fast if the gas limit is too low
- Fine-tuned for EOAs – will not be possible to mint from a contract
