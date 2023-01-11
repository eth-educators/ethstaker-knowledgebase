# Staking FAQ

* [Can I be slashed for being offline?](faq.md#can-i-be-slashed-for-being-offline)
* [Can I stop running my validator for a few days and then start it back up again?](faq.md#can-i-stop-running-my-validator-for-a-few-days-and-then-start-it-back-up-again)
* [Can I withdraw my ETH at any time?](faq.md#can-i-withdraw-my-eth-at-any-time)
* [How are validators incentivized to stay active and honest?](faq.md#how-are-validators-incentivized-to-stay-active-and-honest)
* [How long do pre-signed exit messages remain valid?](faq.md#how-long-do-pre-signed-exit-messages-remain-valid)
* [How much ETH do I need to stake to become a validator?](faq.md#how-much-eth-do-i-need-to-stake-to-become-a-validator)
* [I proposed a block! What did I earn?](faq.md#i-proposed-a-block-what-did-i-earn)
* [Is the deposit/source address shown anywhere?](faq.md#is-the-depositsource-address-shown-anywhere)
* [Is there a penalty for missing a block proposal?](faq.md#is-there-a-penalty-for-missing-a-block-proposal)
* [Is there a penalty for missing an attestation?](faq.md#is-there-a-penalty-for-missing-an-attestation)
* [Is there any advantage to having more than 32 ETH at stake?](faq.md#is-there-any-advantage-to-having-more-than-32-eth-at-stake)
* [Should I set a withdrawal address when setting up my solo staking validator?](faq.md#should-i-set-a-withdrawal-address-when-setting-up-my-solo-staking-validator)
* [What exactly is a validator?](faq.md#what-exactly-is-a-validator)
* [What happens if I lose my validator keys?](faq.md#what-happens-if-i-lose-my-validator-keys)
* [What happens if I lose my validator seed phrase / mnemonic?](faq.md#what-happens-if-i-lose-my-validator-seed-phrase--mnemonic)
* [What if I want to stop staking?](faq.md#what-if-i-want-to-stop-staking)
* [What is a node operator?](faq.md#what-is-a-node-operator)
* [What is a validator client?](faq.md#what-is-a-validator-client)
* [What is the deposit contract?](faq.md#what-is-the-deposit-contract)
* [What is the time commitment for running a validator?](faq.md#what-is-the-time-commitment-for-running-a-validator)
* [When should I top up my validator’s balance?](faq.md#when-should-i-top-up-my-validators-balance)
* [Why do I need to have funds at stake?](faq.md#why-do-i-need-to-have-funds-at-stake)
* [Why the 32 ETH maximum?](faq.md#why-the-32-eth-maximum)

***

## Can I be slashed for being offline?

No. Realistically, the only condition that can cause a [slashing event](staking-glossary.md#slashable-offenses) is if you run your validator's keys on two nodes at the same time (such as a failover / redundancy setup, where your backup node accidentally turns on while your main node is still running). Don't let this happen, and you won't get slashed. **Slashing cannot occur from being offline for maintenance**.

## Can I stop running my validator for a few days and then start it back up again?

Yes, but with small penalties. See [I'm worried about downtime](help/downtime-explained.md).

## Can I withdraw my ETH at any time?

Withdrawals are not currently enabled on the [beacon chain](staking-glossary.md#beacon-chain). This means that any ETH deposited will be locked in the staking contract until a future time (expected to be in 2023 but this time frame is an estimate) when an upgrade to the network allows withdrawals.

If your validator proposes a block, then some of those rewards are immediately available to you in the form of [priority fees](rewards/chain-rewards.md#priority-fees) and [MEV](rewards/chain-rewards.md#mev) (if you are using an [MEV-Boost](validator-clients/mev-boost.md) relay).

In future, when withdrawals have been enabled, you will be able to withdraw your ETH by exiting your validator and waiting in the [withdrawal queue](staking-glossary.md#validator-queue).

## How are validators incentivized to stay active and honest?

As a validator you are [rewarded](rewards/chain-rewards.md) for proposing / attesting to blocks that are included in the chain. On the other hand, you can be [penalized for being offline](rewards/chain-rewards.md#validator-penalties) and behaving maliciously—for example attesting to invalid or contradicting blocks.

The key concept is the following:

* Rewards are given for actions that help the network reach consensus.
* Minor penalties are given for inadvertant actions (or inactions) that hinder consensus.
* And major penalities (or [slashings](staking-glossary.md#slashable-offenses)) are given for malicious actions.

In other words, you maximize your rewards by providing the greatest benefit to the network as a whole.

## How long do pre-signed exit messages remain valid?

Pre-signed exit messages only remain valid for two hard forks. After that, you will need to generate new ones.

This comes from [https://github.com/ethereum/consensus-specs/blob/dev/specs/phase0/beacon-chain.md#get\_domain](https://github.com/ethereum/consensus-specs/blob/dev/specs/phase0/beacon-chain.md#get\_domain) and specifically the line:

```
fork_version = state.fork.previous_version if epoch < state.fork.epoch else state.fork.current_version
```

An exit message signed at any epoch less than the last hard fork is lumped into a "previous version" bucket and given its fork version. That means that if your operation was signed two fork versions ago the verification function has the wrong fork version, hence the wrong domain, hence the wrong signing root, hence the wrong signature, hence it fails to verify.

## How much ETH do I need to stake to become a validator?

Each key-pair associated with a validator requires locking 32 ETH to be activated, which represents your initial balance as well as your initial and maximum voting power for any validator.

## I proposed a block! What did I earn?

Validators that participate in securing the [beacon chain](staking-glossary.md#beacon-chain) and execute "duties" get rewarded for this by new issuance of ETH. In addition, validators receive priority fees paid by users, and optionally MEV, Maximal Extractable Value.

You can view a validator's reward for proposed blocks by looking at the fee recipient address on [etherscan.io↗](https://etherscan.io) under `Produced Blocks`.

<figure><img src=".gitbook/assets/image (6) (1).png" alt="Etherscan proposed block rewards"><figcaption></figcaption></figure>

See a detailed explanation here: [How does my validator earn ETH?](rewards/chain-rewards.md)

## Is the deposit/source address shown anywhere?

Yes, the deposit/source address is shown on the validator. It’s not used for anything in the protocol though. The [consensus layer](staking-glossary.md#consensus-layer) actually has no record of which address a validator's deposit was made from but it is in the history of the [execution layer](staking-glossary.md#execution-layer) as all transactions are.

The deposit/source address can be seen on [beaconcha.in](https://beaconcha.in) under `Deposits` -> `Ethereum Deposits` -> `From Address`.

<figure><img src=".gitbook/assets/image (16) (3).png" alt="Deposit address shown on beaconcha.in"><figcaption></figcaption></figure>

## Is there a penalty for missing a block proposal?

No. If you miss your block proposal, the [slot](staking-glossary.md#slot) that should have contained your block will be empty. Other than the lost [rewards](rewards/chain-rewards.md) from missing the block proposal, there are **no penalties or slashing** that occurs from a missed block proposal.

## Is there a penalty for missing an attestation?

Missing some [attestations](staking-glossary.md#attestation) is completely normal and extremely low-cost. The penalty for missing an attestation is exactly the same as the reward for a successful one. So, with around 240 attestations per day per validator, missing one or two is still a successful attestation rate of over 99%!

## Is there any advantage to having more than 32 ETH at stake?

No. There is no advantage to having more than 32 ETH staked.

Depositing more than 32 ETH to a single set of keys does not increase rewards potential, nor does accumulating rewards above 32 ETH, as each [validator](staking-glossary.md#validator) is limited to an effective balance of 32. This means that staking is done in 32 ETH increments, each with its own set of keys and balance.

## Should I set a withdrawal address when setting up my solo staking validator?

Setting a [withdrawal address](staking-glossary.md#withdrawal-address) when creating your validator keys can be useful as you won't need to set it again when withdrawals are enabled.

The [Staking Deposit CLI](staking-glossary.md#staking-deposit-cli) can set a withdrawal address during deposit json creation. If a user opts not to do this - usually simply by omission - then it sets the hash of the withdrawal pub key instead. Sometime in the future - possibly with Shanghai/Capella hard fork - there will be a tool that takes the mnemonic and signs a message to effect a one-time change from v0 credentials - withdrawal key - to v1 credentials: Withdrawal address.

And that’s it. Once your validator uses v1 credentials the withdrawal address is fixed and can’t be changed. In the current design, skimming is automatic, and so are full withdrawals: Full withdrawal just happens after exit is completed.

A tool to export the withdrawal key will likely not be created, and it’d also not be very useful. You need the withdrawal key at most twice:

* Once to generate the signing key (only if no withdrawal address was set at that time).
* Once more to sign a message to set one.

In both cases the key can be generated inside the CLI tool, be used for its purpose, and then be discarded again without ever being written to disk.

However, there are some cases to be aware of that make it beneficial to **not** set a withdrawal address at the start:

* If you plan to migrate your validator to a pool e.g. (Rocketpool) in the future, then you won't be able to perform this migration if you set a [withdrawal address](staking-glossary.md#withdrawal-address) when you created your validator keys. You would have to wait for withdrawals to be enabled, potentially wait in the withdrawal queue, then re-stake your ETH, potentially waiting in the activation queue as well!

## What exactly is a validator?

A validator is a virtual entity that lives on the [Beacon Chain](staking-glossary.md#beacon-chain), represented by a balance, [public key](staking-glossary.md#public-key), and other properties, and participates in [consensus](staking-glossary.md#consensus-layer) of the Ethereum network.

## What happens if I lose my validator keys?

If there's a catastrophic failure of your validator and you lose your validator keys, don't panic! These can be easily recovered as long as you still have your [validator seed phrase / mnemonic](staking-glossary.md#validator-seed-phrase). Simply follow the same steps you used when you first generated your validator keys, and install them on a new validator machine.

> Be 100% certain that any previous machines will not come back online as this will lead to a [slashing event](staking-glossary.md#slashable-offenses).

## What happens if I lose my validator seed phrase / mnemonic?

If you lose your seed phrase, the one used to generate the validator keys, then unfortunately your staked ETH is most likely unrecoverable.

However, if you had set a withdrawal address, then the validator keys are enough to sign a voluntary-exit, which causes a withdrawal to that address. There is also a special case if you have a pre-signed voluntary-exit message, but that's likely only used by staking services and only noted here for completeness.

## What if I want to stop staking?

In the event that you can't recover your validator or you decide you want to stop staking, you have the option to exit your validator. Even though withdrawals are not currently enabled, you can still exit your validator from the network. This means that, while you won't be able to get your validator balance back right away (until withdrawals are enabled), you won't receive any penalties for being offline once the validator exits the [withdrawal queue](staking-glossary.md#validator-queue). Exiting a validator is currently a one way process. For details on how to exit your validator, [check out our guide](tutorials/how-to-exit-a-validator.md).

## What is a node operator?

A node operator is the human being who makes sure the client software is running appropriately, maintaining hardware as needed.

## What is a validator client?

A [validator](staking-glossary.md#validator) client is the software that acts on behalf of the validator by holding and using its [private key](staking-glossary.md#private-key) to make [attestations](staking-glossary.md#attestation) about the state of the chain. A single validator client can hold many key pairs, controlling many validators.

## What is the deposit contract?

You can think of the deposit contract as a transfer of funds from an Ethereum account to a proof-of-stake validator account. It specifies who is staking, who is validating, how much is being staked, and who can withdraw the funds.

## What is the time commitment for running a validator?

The majority of the time commitment for staking is the initial learning and setup. It will probably take a day or two of tinkering to get it all figured out (maybe more, and that's okay!). Once you get going you're looking at updating once a month or so (ten minutes) and responding to outages, which are rare.

## When should I top up my validator’s balance?

The answer to this question very much depends on how much ETH you have at your disposal. You should certainly top up if your balance is close to 16 ETH. This is to ensure you don’t get exited out of the validator set (which automatically happens if your balance falls below 16 ETH). At the other end of the spectrum, if your balance is closer to 31 ETH, it’s probably not worth adding the extra ETH required to get back to 32.

## Why do I need to have funds at stake?

As a validator, you'll need to have funds at stake so you can be penalized for behaving dishonestly. In other words, to keep you honest, your actions need to have financial consequences.

## Why the 32 ETH maximum?

Each 32 ETH deposit activates one set of validator keys. These keys are used to sign off on the state of the network. The lower the ETH requirement, the more resulting signatures must be saved by the network. 32 ETH was chosen as a balance between enabling as many people as possible to stake without inhibiting decentralization by bloating the size of each block with signatures.

Limiting the maximum stake to 32 ETH per validator encourages decentralization of power as it prevents any single validator from having an excessively large vote on the state of the chain. It also limits the amount of ETH that can be exited from staking at any given time, as the number of validator that can exit in a given time period is limited. This helps protect the network against certain attacks.

Although a validator's vote is weighted by the amount it has at stake, each validators voting weight starts at, and is capped at 32. It is possible to drop below this with poor node performance, but it is not possible to raise above it. Do not deposit more than 32 ETH for a single validator. It will not add to your rewards and will be locked until [withdrawals are enabled](faq.md#can-i-withdraw-my-eth-at-any-time).
