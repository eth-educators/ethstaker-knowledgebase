# My validator is offline! What do I do?

## Don't panic!

The penalty for missing attestations is exactly the same as the reward for a successful one. Any downtime penalty will be recovered in the same amount of uptime.

[Proposing a block is rare](../rewards/proposal-frequency.md). Depending on the size of the [validator pool](../staking-glossary.md#validator-pool), a single validator will on average only propose a block every few months. If you are unlucky enough to be offline at the time that your validator is asked to propose a block, that's also ok.

The Ethereum network is robust and designed to handle these situations. If you miss your block proposal, the [slot](staking-glossary.md#slot) that should have contained your block will be empty. Other than the lost [rewards](rewards/chain-rewards.md) from missing the block proposal, there are **no penalties or slashing** that occurs from a missed block proposal.

Automated failover and backup systems may seem like a good idea, but they are much **_much_** more likely to cause a slashing event (e.g. double proposal) than a manual recovery process. Missing out on a few days of rewards may seem bad at the time, but getting slashed and potentially missing _MONTHS_ of rewards is a lot worse!

## Getting back online

- TODO
  - Initial trouble shooting
  - Resyncing
