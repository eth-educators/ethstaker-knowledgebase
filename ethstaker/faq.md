# Staking FAQ

* [Can I be slashed for being offline?](faq.md#can-i-be-slashed-for-being-offline)
* [Can I withdraw my ETH at any time?](faq.md#can-i-withdraw-my-eth-at-any-time)
* [I proposed a block! What did I earn?](faq.md#i-proposed-a-block-what-did-i-earn)
* [Is there a penalty for missing a block proposal?](faq.md#is-there-a-penalty-for-missing-a-block-proposal)
* [Is there a penalty for missing an attestation?](faq.md#is-there-a-penalty-for-missing-an-attestation)
* [Should I set a withdrawal address when setting up my solo staking validator?](faq.md#should-i-set-a-withdrawal-address-when-setting-up-my-solo-staking-validator)
* [What is the time commitment for running a validator?](faq.md#what-is-the-time-commitment-for-running-a-validator)
* [What happens if I lose my validator keys?](faq.md#what-happens-if-i-lose-my-validator-keys)
* [What happens if I lose my validator seed phrase / mnemonic?](faq.md#what-happens-if-i-lose-my-validator-seed-phrase--mnemonic)
* [What if I want to stop staking?](faq.md#what-if-i-want-to-stop-staking)

***

## Can I be slashed for being offline?

No. Realistically, the only condition that can cause a [slashing event](staking-glossary.md#slashable-offenses) is if you run your validator's keys on two nodes at the same time (such as a failover / redundancy setup, where your backup node accidentally turns on while your main node is still running). Don't let this happen, and you won't get slashed. **Slashing cannot occur from being offline for maintenance**.

## Can I withdraw my ETH at any time?

Withdrawals are not currently enabled on the [beacon chain](staking-glossary.md#beacon-chain). This means that any ETH deposited will be locked in the staking contract until a future time (expected to be in 2023 but this time frame is an estimate) when an upgrade to the network allows withdrawals.

If your validator proposes a block, then some of those rewards are immediately available to you in the form of [priority fees](rewards/chain-rewards.md#priority-fees) and [MEV](rewards/chain-rewards.md#mev) (if you are using an [MEV-Boost](validator-clients/mev-boost.md) relay).

In future, when withdrawals have been enabled, you will be able to withdraw your ETH by exiting your validator and waiting in the [withdrawal queue](staking-glossary.md#validator-queue).

## I proposed a block! What did I earn?

Validators that participate in securing the [beacon chain](staking-glossary.md#beacon-chain) and execute "duties" get rewarded for this by new issuance of ETH. In addition, validators receive priority fees paid by users, and optionally MEV, Maximal Extractable Value.

You can view a validator's reward for proposed blocks by looking at the fee recipient address on [etherscan.io](https://etherscan.io) under `Produced Blocks`.

<figure><img src=".gitbook/assets/image (6).png" alt="Etherscan proposed block rewards"><figcaption></figcaption></figure>

See a detailed explanation here: [How does my validator earn ETH?](rewards/chain-rewards.md)

## Is the deposit/source address shown anywhere?

Yes, the deposit/source address is shown on the validator. It’s not used for anything in the protocol though. The [consensus layer](staking-glossary.md#consensus-layer) actually has no record of which address a validator's deposit was made from but it is in the history of the [execution layer](staking-glossary.md#execution-layer) as all transactions are.

The deposit/source address can be seen on [beaconcha.in](https://beaconcha.in) under `Deposits` -> `Ethereum Deposits` -> `From Address`.

<figure><img src=".gitbook/assets/image (16).png" alt="Deposit address shown on beaconcha.in"><figcaption></figcaption></figure>

## Is there a penalty for missing a block proposal?

No. If you miss your block proposal, the [slot](staking-glossary.md#slot) that should have contained your block will be empty. Other than the lost [rewards](rewards/chain-rewards.md) from missing the block proposal, there are **no penalties or slashing** that occurs from a missed block proposal.

## Is there a penalty for missing an attestation?

Missing some [attestations](staking-glossary.md#attestation) is completely normal and extremely low-cost. The penalty for missing an attestation is exactly the same as the reward for a successful one. So, with around 240 attestations per day per validator, missing one or two is still a successful attestation rate of over 99%!

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

## What is the time commitment for running a validator?

The majority of the time commitment for staking is the initial learning and setup. It will probably take a day or two of tinkering to get it all figured out (maybe more, and that's okay!). Once you get going you're looking at updating once a month or so (ten minutes) and responding to outages, which are rare.

## What happens if I lose my validator keys?

If there's a catastrophic failure of your validator and you lose your validator keys, don't panic! These can be easily recovered as long as you still have your [validator seed phrase / mnemonic](staking-glossary.md#validator-seed-phrase). Simply follow the same steps you used when you first generated your validator keys, and install them on a new validator machine.

> Be 100% certain that any previous machines will not come back online as this will lead to a [slashing event](staking-glossary.md#slashable-offenses).

## What happens if I lose my validator seed phrase / mnemonic?

If you lose your seed phrase, the one used to generate the validator keys, then unfortunately your staked ETH is most likely unrecoverable.

However, if you had set a withdrawal address, then the validator keys are enough to sign a voluntary-exit, which causes a withdrawal to that address. There is also a special case if you have a pre-signed voluntary-exit message, but that's likely only used by staking services and only noted here for completeness.

## What if I want to stop staking?

In the event that you can't recover your validator or you decide you want to stop staking, you have the option to exit your validator. Even though withdrawals are not currently enabled, you can still exit your validator from the network. This means that, while you won't be able to get your validator balance back right away (until withdrawals are enabled), you won't receive any penalties for being offline once the validator exits the [withdrawal queue](staking-glossary.md#validator-queue). Exiting a validator is currently a one way process. For details on how to exit your validator, [check out our guide](tutorials/how-to-exit-a-validator.md).
