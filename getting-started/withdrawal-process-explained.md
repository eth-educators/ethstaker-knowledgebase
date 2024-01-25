# Withdrawal process explained

### Staking rewards <a href="#staking-rewards" id="staking-rewards"></a>

Reward payments are automatically processed for active validator accounts with a maxed out effective balance of 32 ETH.

Any balance above 32 ETH earned through rewards does not actually contribute to principal, or increase the weight of this validator on the network, and is thus automatically withdrawn as a reward payment every few days. Aside from providing a withdrawal address one time, these rewards do not require any action from the validator operator. This is all initiated on the consensus layer, thus no gas (transaction fee) is required at any step.

### Exiting staking entirely <a href="#exiting-staking-entirely" id="exiting-staking-entirely"></a>

Providing a withdrawal address is required before _any_ funds can be transferred out of a validator account balance.

Users looking to exit staking entirely and withdraw their full balance back must also sign and broadcast a "voluntary exit" message with validator keys which will start the process of exiting from staking. This is done with your validator client and submitted to your beacon node, and does not require gas.

The process of a validator exiting from staking takes variable amounts of time, depending on how many others are exiting at the same time. Once complete, this account will no longer be responsible for performing validator network duties, is no longer eligible for rewards, and no longer has their ETH "at stake". At this time the account with be marked as fully “withdrawable”.

Once an account is flagged as "withdrawable", and withdrawal credentials have been provided, there is nothing more a user needs to do aside from wait. Accounts are automatically and continuously swept by block proposers for eligible exited funds, and your account balance will be transferred in full (also known as a "full withdrawal") during the next [sweep](https://ethereum.org/en/staking/withdrawals/#validator-sweeping).

### How do withdrawal payments work? <a href="#how-do-withdrawals-work" id="how-do-withdrawals-work"></a>

Whether a given validator is eligible for a withdrawal or not is determined by the state of the validator account itself. No user input is needed at any given time to determine whether an account should have a withdrawal initiated or not—the entire process is done automatically by the consensus layer on a continuous loop.

#### Validator "sweeping" <a href="#validator-sweeping" id="validator-sweeping"></a>

When a validator is scheduled to propose the next block, it is required to build a withdrawal queue, of up to 16 eligible withdrawals. This is done by originally starting with validator index 0, determining if there is an eligible withdrawal for this account per the rules of the protocol, and adding it to the queue if there is. The validator set to propose the following block will pick up where the last one left off, progressing in order indefinitely.

{% hint style="info" %}
Think about an analogue clock. The hand on the clock points to the hour, progresses in one direction, doesn’t skip any hours, and eventually wraps around to the beginning again after the last number is reached.\
\
Now instead of 1 through 12, imagine the clock has 0 through N _(the total number of validator accounts that have ever been registered on the Beacon Chain, over 900,000 as of Jan 2024)._\
\
The hand on the clock points to the next validator that needs to be checked for eligible withdrawals. It starts at 0, and progresses all the way around without skipping any accounts. When the last validator is reached, the cycle continues back at the beginning.
{% endhint %}

**Checking an account for withdrawals**

While a proposer is sweeping through validators for possible withdrawals, each validator being checked is evaluated against a short series of questions to determine if a withdrawal should be triggered, and if so, how much ETH should be withdrawn.

1. **Has a withdrawal address been provided?** If no withdrawal address has been provided, the account is skipped and no withdrawal initiated.
2. **Is the validator exited and withdrawable?** If the validator has fully exited, and we have reached the epoch where their account is considered to be "withdrawable", then a full withdrawal will be processed. This will transfer the entire remaining balance to the withdrawal address.
3. **Is the effective balance maxed out at 32?** If the account has withdrawal credentials, is not fully exited, and has rewards above 32 waiting, a partial withdrawal will be processed which transfers only the rewards above 32 to the user's withdrawal address.

There are only two actions that are taken by validator operators during the course of a validator's life cycle that influence this flow directly:

* Provide withdrawal credentials to enable any form of withdrawal
* Exit from the network, which will trigger a full withdrawal

#### Gas free <a href="#gas-free" id="gas-free"></a>

This approach to staking withdrawals avoids requiring stakers to manually submit a transaction requesting a particular amount of ETH to be withdrawn. This also means there is **no gas (transaction fee) required**, and withdrawals also do not compete for existing execution layer block space.

#### How frequently will I get my staking rewards? <a href="#how-soon" id="how-soon"></a>

A maximum of 16 withdrawals can be processed in a single block. At that rate, 115,200 validator withdrawals can be processed per day (assuming no missed slots). As noted above, validators without eligible withdrawals will be skipped, decreasing the time to finish the sweep.

Expanding this calculation, we can estimate the time it will take to process a given number of withdrawals:

| Number of withdrawals | Time to complete |
| :-------------------: | :--------------: |
|        800,000        |     7.0 days     |
|        900,000        |     7.8 days     |
|       1,000,000       |     8.7 days     |
|       1,100,000       |     9.6 days     |

As you see this slows down as more validators are on the network. An increase in missed blocks could slow this down proportionally, but this will generally represent the slower side of possible outcomes.

**Source:** [**https://ethereum.org/en/staking/withdrawals/**](https://ethereum.org/en/staking/withdrawals/)
