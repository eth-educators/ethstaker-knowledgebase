# Staking FAQ

* [Can I be slashed for being offline?](faq.md#can-i-be-slashed-for-being-offline)
* [Can I stop running my validator for a few days and then start it back up again?](faq.md#can-i-stop-running-my-validator-for-a-few-days-and-then-start-it-back-up-again)
* [Can I withdraw my ETH at any time?](faq.md#can-i-withdraw-my-eth-at-any-time)
* [How long will a withdrawal take?](faq.md#how-long-will-a-withdrawal-take)
* [How are validators incentivized to stay active and honest?](faq.md#how-are-validators-incentivized-to-stay-active-and-honest)
* [How does MEV Boost min-bid work?](faq.md#how-does-mev-boost-min-bid-work)
* [How long do pre-signed exit messages remain valid?](faq.md#how-long-do-pre-signed-exit-messages-remain-valid)
* [How important are disk IOPS?](faq.md#how-important-are-disk-iops)
* [How many validators can I run on my machine?](faq.md#how-many-validators-can-i-run-on-my-machine-do-i-need-multiple-consensus-or-execution-clients)
* [How much ETH do I need to stake to become a validator?](faq.md#how-much-eth-do-i-need-to-stake-to-become-a-validator)
* [How should I deal with a compromised or stolen machine?](faq.md#how-should-i-deal-with-a-compromised-or-stolen-machine)
* [I am overwhelmed and don't know where to start - what can I do?](faq.md#i-am-overwhelmed-and-dont-know-where-to-start---what-can-i-do)
* [I proposed a block! What did I earn?](faq.md#i-proposed-a-block-what-did-i-earn)
* [Is the deposit/source address shown anywhere?](faq.md#is-the-depositsource-address-shown-anywhere)
* [Is there a penalty for missing a block proposal?](faq.md#is-there-a-penalty-for-missing-a-block-proposal)
* [Is there a penalty for missing an attestation?](faq.md#is-there-a-penalty-for-missing-an-attestation)
* [Is there any advantage to having more than 32 ETH at stake?](faq.md#is-there-any-advantage-to-having-more-than-32-eth-at-stake)
* [Should I set a withdrawal address when setting up my solo staking validator?](faq.md#should-i-set-a-withdrawal-address-when-setting-up-my-solo-staking-validator)
* [Taxes!! How can I stay on top of them?](faq.md#taxes-how-can-i-stay-on-top-of-them)
* [What exactly is a validator?](faq.md#what-exactly-is-a-validator)
* [What happens if I lose my validator keys?](faq.md#what-happens-if-i-lose-my-validator-keys)
* [What happens if I lose my validator seed phrase / mnemonic?](faq.md#what-happens-if-i-lose-my-validator-seed-phrase--mnemonic)
* [What if I want to stop staking?](faq.md#what-if-i-want-to-stop-staking)
* [What is a node operator?](faq.md#what-is-a-node-operator)
* [What is a validator client?](faq.md#what-is-a-validator-client)
* [What is the deposit contract?](faq.md#what-is-the-deposit-contract)
* [What is the easiest way to Solo Home Staking?](faq.md#what-is-the-easiest-way-to-solo-home-staking)
* [What is the time commitment for running a validator?](faq.md#what-is-the-time-commitment-for-running-a-validator)
* [What should I do if I am getting lots of client errors post Shanghai?](faq.md#what-should-i-do-if-i-am-getting-lots-of-client-errors-post-shanghai)
* [When should I top up my validator’s balance?](faq.md#when-should-i-top-up-my-validators-balance)
* [Where are some good places to view various staking metrics?](faq.md#where-are-some-good-places-to-view-various-staking-metrics)
* [Where should I set my withdraw address to?](faq.md#where-should-i-set-my-withdraw-address-to)
* [Why can't I see my withdrawn ETH?](faq.md#why-cant-i-see-my-withdrawn-eth)
* [Why did my smart plug turn off my machine?](faq.md#why-did-my-smart-plug-turn-off-my-machine)
* [Why do I need to have funds at stake?](faq.md#why-do-i-need-to-have-funds-at-stake)
* [Why is all my RAM being used?](faq.md#why-is-all-my-ram-being-used)
* [Why the 32 ETH maximum?](faq.md#why-the-32-eth-maximum)

***

## Can I be slashed for being offline?

No. Realistically, the only condition that can cause a [slashing event](staking-glossary.md#slashable-offenses) is if you run your validator's keys on two nodes at the same time (such as a failover / redundancy setup, where your backup node accidentally turns on while your main node is still running). Don't let this happen, and you won't get slashed. **Slashing cannot occur from being offline for maintenance**.

## Can I stop running my validator for a few days and then start it back up again?

Yes, but with small penalties. See [I'm worried about downtime](help/downtime-explained.md).

## Can I withdraw my ETH at any time?

Yes! Withdrawals are now enabled on Ethereum :owl:

If your validator proposes a block, then some of those rewards are immediately available to you in the form of [priority fees](rewards/chain-rewards.md#priority-fees) and [MEV](rewards/chain-rewards.md#mev) (if you are using an [MEV-Boost](validator-clients/mev-boost.md) relay).

To withdraw your full validator amount (not just the skimmed amount) you will be able to withdraw your ETH by exiting your validator and waiting in the [withdrawal queue](staking-glossary.md#validator-queue). This process is different for each client, details for each can be found here: [How to exit a validator](tutorials/how-to-exit-a-validator.md).

Ethereum Foundation Withdrawals FAQ: [https://notes.ethereum.org/@launchpad/withdrawals-faq](https://notes.ethereum.org/@launchpad/withdrawals-faq)

## How long will a withdrawal take?

Validator withdrawals are processed in a round-robin fashion. Starting from validator 0 at the Capella upgrade, with each block, [the consensus layer sweeps](https://ethereum.org/en/staking/withdrawals/#validator-sweeping) through the validator set in validator index order until it has found 16 withdrawals to include. The next block proposer will pick up where the previous proposer left off in the validator set and scan for 16 further withdrawals, and so on. If every validator were eligible for a withdrawal, and if the beacon chain is performing perfectly, then a full sweep of 980,000 validators would take 8.5 days ("sweep delay").
For more info, [see Ben Edgington's eth2book](https://eth2book.info/capella/part2/deposits-withdrawals/withdrawal-processing/#withdrawal-processing). 
The queue and estimated withdrawal time can be seen on [validatorqueue.com](https://www.validatorqueue.com/) 

## Does my validator need to be online to withdraw my ETH?

No. You can generate your [exit message](tutorials/how-to-exit-a-validator.md) and submit it using someone elses Beacon Chain client.

Beaconcha.in has built a resource exactly for this: [https://beaconcha.in/tools/broadcast](https://beaconcha.in/tools/broadcast)

## How are validators incentivized to stay active and honest?

As a validator you are [rewarded](rewards/chain-rewards.md) for proposing / attesting to blocks that are included in the chain. On the other hand, you can be [penalized for being offline](rewards/chain-rewards.md#validator-penalties) and behaving maliciously—for example attesting to invalid or contradicting blocks.

The key concept is the following:

* Rewards are given for actions that help the network reach consensus.
* Minor penalties are given for inadvertent actions (or inactions) that hinder consensus.
* And major penalties (or [slashings](staking-glossary.md#slashable-offenses)) are given for malicious actions.

In other words, you maximize your rewards by providing the greatest benefit to the network as a whole.

## How important are disk IOPS?

Disk IOPS are very important if you want your node to operate to its true potential.

Low disk IOPS can cause many different issues such as missed attestations, missed block proposals, failure to get in sync with the network as well as failure to keep up with the network if already in sync.

If you are using Ubuntu, [IOPS can be measured using this software.](https://linuxreviews.org/HOWTO\_Test\_Disk\_I/O\_Performance) Before running tests, make sure your node services are stopped otherwise it will interfere with the results.

## How many validators can I run on my machine? Do I need multiple consensus or execution clients?

1\) Quite a lot! A former Teku developer wrote an article [in which they ran 5,000 validators on the one machine](https://www.symphonious.net/2022/04/06/exploring-eth2-cost-of-adding-validators/). There are a few other factors you will need to take into account, such as CPU, RAM and bandwidth considerations.

If you already have a validator client, a consensus client and an execution client, then it is as easy as importing the new keys into the validator client. It will pick up and start performing the validator duties for the new validator(s) right away.

2\) No, you do not need multiple consensus clients running to run multiple validators. A single consensus client can run multiple validators.

## How does MEV Boost min-bid work?

Beacon Nodes pick the highest reward (local or remote) if it is above the `min-bid` value.

If the highest reward (local or remote) is below the `min-bid` value then the local block will be selected.

There are circuit breakers in beacon nodes that select a local payload when certain network conditions are met such as there being many missed slots recently.

## How long do pre-signed exit messages remain valid?

Pre-signed exit messages only remain valid for two hard forks. After that, you will need to generate new ones.

This comes from [https://github.com/ethereum/consensus-specs/blob/dev/specs/phase0/beacon-chain.md#get\_domain](https://github.com/ethereum/consensus-specs/blob/dev/specs/phase0/beacon-chain.md#get\_domain) and specifically the line:

```
fork_version = state.fork.previous_version if epoch < state.fork.epoch else state.fork.current_version
```

An exit message signed at any epoch less than the last hard fork is lumped into a "previous version" bucket and given its fork version. That means that if your operation was signed two fork versions ago the verification function has the wrong fork version, hence the wrong domain, hence the wrong signing root, hence the wrong signature, hence it fails to verify.

## How much ETH do I need to stake to become a validator?

Each key-pair associated with a validator requires locking 32 ETH to be activated, which represents your initial balance as well as your initial and maximum voting power for any validator.

## How should I deal with a compromised or stolen machine?

The best thing to do is to exit your validator as soon as it is practical to do so. Even in the case of an encrypted machine that is physically stolen where you can safely assume the thief won't ever be able to gain access, it is simply not worth the thought or the risk of being slashed at some point in the future.

If your validator keys are ever compromised or you even suspect them of being compromised, exiting the validator and spinning up new ones are the best course of action you can take to protect yourself.

Once your ETH is secured, further investigations and actions can be taken to prevent or mitigate this from occurring again.

## I am overwhelmed and don't know where to start - what can I do?

Staking on Ethereum gives you many options to participate. This can be overwhelming - no doubt. We all have been there!

Take it step by step. First learn about the [options you have](getting-started/what-is-ethereum-staking.md#how-to-stake-your-eth) and choose what you are most comfortable with. There is no need to rush things and risk your precious sleep while doing so.

If you choose "Solo Home Staking" and want to run your own validator, decide between the different [hardware options](hardware/hardware-requirements.md) (f.e. Intel NUC) and follow [a staking guide](tutorials/solo-staking-guides.md) on testnet first. Search for Goerli Testnet Staking Guides. Take notes, find out what happens when you disconnect the power cable of your validator, how to update, etc. All in all - get confident with your node before staking on Ethereum Mainnet.

And - You don't have to face problems on your own.

Feel free to ask us any question and join our community on [Discord](https://discord.io/ethstaker).

## I proposed a block! What did I earn?

Validators that participate in securing the [beacon chain](staking-glossary.md#beacon-chain) and execute "duties" get rewarded for this by new issuance of ETH. In addition, validators receive priority fees paid by users, and optionally MEV, Maximal Extractable Value.

You can view a validator's reward for proposed blocks by looking at the fee recipient address on [etherscan.io↗](https://etherscan.io) under `Produced Blocks`.

<figure><img src=".gitbook/assets/image (52).png" alt="Etherscan proposed block rewards"><figcaption></figcaption></figure>

See a detailed explanation here: [How does my validator earn ETH?](rewards/chain-rewards.md)

## Is the deposit/source address shown anywhere?

Yes, the deposit/source address is shown on the validator. It’s not used for anything in the protocol though. The [consensus layer](staking-glossary.md#consensus-layer) actually has no record of which address a validator's deposit was made from but it is in the history of the [execution layer](staking-glossary.md#execution-layer) as all transactions are.

The deposit/source address can be seen on [beaconcha.in](https://beaconcha.in) under `Deposits` -> `Ethereum Deposits` -> `From Address`.

<figure><img src=".gitbook/assets/image (37).png" alt="Deposit address shown on beaconcha.in"><figcaption></figcaption></figure>

## Is there a penalty for missing a block proposal?

No. If you miss your block proposal, the [slot](staking-glossary.md#slot) that should have contained your block will be empty. Other than the lost [rewards](rewards/chain-rewards.md) from missing the block proposal, there are **no penalties or slashing** that occurs from a missed block proposal.

## Is there a penalty for missing an attestation?

Missing some [attestations](staking-glossary.md#attestation) is completely normal and extremely low-cost. The penalty for missing an attestation is exactly the same as the reward for a successful one. So, with around 240 attestations per day per validator, missing one or two is still a successful attestation rate of over 99%!

## Is there any advantage to having more than 32 ETH at stake?

No. There is no advantage to having more than 32 ETH staked.

Depositing more than 32 ETH to a single set of keys does not increase rewards potential, nor does accumulating rewards above 32 ETH, as each [validator](staking-glossary.md#validator) is limited to an effective balance of 32. This means that staking is done in 32 ETH increments, each with its own set of keys and balance.

## Should I set a withdrawal address when setting up my solo staking validator?

Setting a [withdrawal address](staking-glossary.md#withdrawal-address) when creating your validator keys is an important step when setting up your validator. Until a withdrawal address is set, you will not be able to claim your beacon chain rewards or withdraw your ETH.

The [Staking Deposit CLI](staking-glossary.md#staking-deposit-cli) can set a withdrawal address during deposit `JSON` creation (an 0x01 address). If a user opts not to do this - usually simply by omission - then it sets the hash of the withdrawal pub key instead (an 0x00 address)

And that’s it. Once your validator uses v1 credentials the withdrawal address is fixed and can’t be changed. In the current design, skimming is automatic, and so are full withdrawals: Full withdrawal just happens after exit is completed.

A tool to export the withdrawal key will likely not be created, and it’d also not be very useful. You need the withdrawal key at most twice:

* Once to generate the signing key (only if no withdrawal address was set at that time).
* Once more to sign a message to set one.

In both cases the key can be generated inside the CLI tool, be used for its purpose, and then be discarded again without ever being written to disk.

## Taxes!! How can I stay on top of them?

Calculating staking taxes can be both difficult and tiresome but it is an important thing to do. Luckily an amazing tool exists to simplify this process.

{% embed url="https://ethstaker.tax/" %}

This will give you a rundown of the rewards your validators have accrued. Always double check with a local tax agent before filing to ensure they have been calculated in an appropriate manner for the jurisdiction that you are a tax resident of.

## What exactly is a validator?

A validator is a virtual entity that lives on the [Beacon Chain](staking-glossary.md#beacon-chain), represented by a balance, [public key](staking-glossary.md#public-key), and other properties, and participates in [consensus](staking-glossary.md#consensus-layer) of the Ethereum network.

## What happens if I lose my validator keys?

If there's a catastrophic failure of your validator and you lose your validator keys, don't panic! These can be easily recovered as long as you still have your [validator seed phrase / mnemonic](staking-glossary.md#validator-seed-phrase). Simply follow the same steps you used when you first generated your validator keys, and install them on a new validator machine.

> Be 100% certain that any previous machines will not come back online as this will lead to a [slashing event](staking-glossary.md#slashable-offenses).

## What happens if I lose my validator seed phrase / mnemonic?

If you lose your seed phrase, the one used to generate the validator keys, then unfortunately your staked ETH is most likely unrecoverable.

However, if you had set a withdrawal address, then the validator keys are enough to sign a voluntary-exit, which causes a withdrawal to that address. There is also a special case if you have a pre-signed voluntary-exit message, but that's likely only used by staking services and only noted here for completeness.

## What if I want to stop staking?

In the event that you can't recover your validator or you decide you want to stop staking, you have the option to exit your validator. Exiting a validator is a one way process. For details on how to exit your validator, [check out our guide](tutorials/how-to-exit-a-validator.md).

## What is a node operator?

A node operator is the human being who makes sure the client software is running appropriately, maintaining hardware as needed.

## What is a validator client?

A [validator](staking-glossary.md#validator) client is the software that acts on behalf of the validator by holding and using its [private key](staking-glossary.md#private-key) to make [attestations](staking-glossary.md#attestation) about the state of the chain. A single validator client can hold many key pairs, controlling many validators.

## What is the deposit contract?

You can think of the deposit contract as a transfer of funds from an Ethereum account to a proof-of-stake validator account. It specifies who is staking, who is validating, how much is being staked, and who can withdraw the funds.

## What is the easiest way to Solo Home Staking?

Setting up your own validator for "Solo Home Staking" is not difficult.

You can follow step-by-step [staking guides](tutorials/solo-staking-guides.md), which don't take much time at all. See also [time commitment](faq.md#what-is-the-time-commitment-for-running-a-validator).

There are pre-configured hardware options like [Dappnode↗](https://dappnode.com/) or [Avado↗](https://ava.do/) which can make things easier and eliminate the need to interact with the command line interface or Linux in general. You can also install the open-source [Dappnode software ↗](https://docs.dappnode.io/user/quick-start/core/installation/) on your own hardware to have a more intuitive staking experience.

## What is the time commitment for running a validator?

The majority of the time commitment for staking is the initial learning and setup. It will probably take a day or two of tinkering to get it all figured out (maybe more, and that's okay!). Once you get going you're looking at updating once a month or so (ten minutes) and responding to outages, which are rare.

## What should I do if I am getting lots of client errors after a network upgrade?

The most common cause of this issue is when node operators have failed to upgrade their node software prior to the network upgrade taking place. This can cause the client software to follow a forked chain and require a resync to get the node operating again on the correct chain.

Ensure that you are running a client version that is supported post network upgrade. Please check the GitHub notes for respective the clients you are using to verify which version you should be running.

| Execution                                                          |
| ------------------------------------------------------------------ |
| [Geth](https://github.com/ethereum/go-ethereum/releases)           |
| [Nethermind](https://github.com/NethermindEth/nethermind/releases) |
| [Besu](https://github.com/hyperledger/besu/releases)               |
| [Erigon](https://github.com/ledgerwatch/erigon/releases)           |
| [Reth](https://github.com/paradigmxyz/reth/releases)               |

|                                                             |
| ----------------------------------------------------------- |
| [Prysm](https://github.com/prysmaticlabs/prysm/releases)    |
| [Lighthouse](https://github.com/sigp/lighthouse/releases)   |
| [Nimbus](https://github.com/status-im/nimbus-eth2/releases) |
| [Teku](https://github.com/ConsenSys/teku/releases)          |
| [Lodestar](https://github.com/ChainSafe/lodestar/releases)  |

If you were running an older version post network upgrade, then most likely your local database will need to be deleted and resynced. This is more commonly true for execution clients than it is for consensus clients.

If you download the beaconchai.in app or sign up to an account you can configure email alerts when new client releases are published so you won't run into this issue.&#x20;

Two other methods are to follow the projects on Github so you can be emailed when a new release is published, or to join the client team Discord servers where new software releases are announced.

## When should I top up my validator’s balance?

The answer to this question very much depends on how much ETH you have at your disposal. You should certainly top up if your balance is close to 16 ETH. This is to ensure you don’t get exited out of the validator set (which automatically happens if your balance falls below 16 ETH). At the other end of the spectrum, if your balance is closer to 31 ETH, it’s probably not worth adding the extra ETH required to get back to 32.

## Where are some good places to view various staking metrics?

There are many great resources out there to help you monitor your setup, a few are linked below.

{% embed url="https://beaconcha.in/" %}

{% embed url="https://beaconscan.com/" %}

{% embed url="https://www.rated.network/" %}

All of these services will help you see things such as attestation performance, block proposals and total ETH accrued from staking.

## Where should I set my withdraw address to?

It is critical that you set your validator withdraw address to an address that you have created yourself and have full control over.

This is typically defined as: A wallet address where you have the private keys and the ability to both send and receive transactions.

If you do not have the private key for the wallet (For example, an address on an exchange) then _**do not**_ set that as your validator withdraw address as there is no guarantee that the 3rd party will give you your rewards or even exist in the near future to continue giving you your rewards.

Always remember: **Not your keys, not your coins.**

Advanced setups such as setting the withdraw address to a multisig is also supported but it is only recommended for advanced users.

## Why can't I see my withdrawn ETH?

You may notice that your block proposals and ETH withdrawals are not appearing in your wallet transactions. Do not panic, this is both expected and normal. They will not appear there as both of these are not transactions.

If you enter in your wallet address into a website such as [https://etherscan.io/](https://etherscan.io/) you will see a "Produced Blocks" tab and a "Withdraws" tab, further detailed information can be found here. Please note that these buttons will only appear if that wallet has had a block proposal occur or a validator withdrawal occur.

Whichever wallet you use will show your up to date ETH balance even if the transaction list is empty.&#x20;

## Why did my smart plug turn off my machine?

A not so frequently asked question but it has come up a few times! Some smart plugs only switch themselves back on after power failure when internet access has been restored.&#x20;

However, in the case where your router or other critical network equipment are plugged into a smart plug with this "feature", they will not power back on unless the internet connection is restored, but the internet won't restore unless it has turned back on.&#x20;

If you use a smart plug, it may be worthwhile to run a few tests to see if yours does this, otherwise you may find this out the hard way while attending Devcon on the other side of the world where it can only be fixed with manual action on-site...

## Why do I need to have funds at stake?

As a validator, you'll need to have funds at stake so you can be penalized for behaving dishonestly. In other words, to keep you honest, your actions need to have financial consequences.

## Why is all my RAM being used?

This question is commonly asked by Linux users - [a detailed answer can be found here.](https://www.linuxatemyram.com/)

## Why the 32 ETH maximum?

Each 32 ETH deposit activates one set of validator keys. These keys are used to sign off on the state of the network. The lower the ETH requirement, the more resulting signatures must be saved by the network. 32 ETH was chosen as a balance between enabling as many people as possible to stake without inhibiting decentralization by bloating the size of each block with signatures.

Limiting the maximum stake to 32 ETH per validator encourages decentralization of power as it prevents any single validator from having an excessively large vote on the state of the chain. It also limits the amount of ETH that can be exited from staking at any given time, as the number of validator that can exit in a given time period is limited. This helps protect the network against certain attacks.

Although a validator's vote is weighted by the amount it has at stake, each validators voting weight starts at, and is capped at 32. It is possible to drop below this with poor node performance, but it is not possible to raise above it. If you add more than 32 ETH for a single validator it will just get withdrawn back down to 32 ETH to your rewards address.
