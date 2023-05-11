# Alerting at scale

Alerting should be very specific. It’s easy to just set thresholds to every possible monitored metric and add an alarm to it. But that could lead to fatigue, distractions, and also ignoring alerts, see [this article](https://www.atlassian.com/incident-management/on-call/alert-fatigue) for more details.

Alerts should never be ignored, even if you think you have an idea what caused them.

For good tips on alerting in general, see [“My Philosophy on Alerting”](https://docs.google.com/document/d/199PqyG3UsyXlwieHaqbGiWVa8eMWi8zzAn0YfcApr8Q/edit).

## Saas Tools

* Pager Duty
* VictorOps

## On-Call

There is a practice in every cloud service, called “being on-call”. That means that at some moment in time, there is a person responsible for reacting to alerts, regardless of when they happen.

That means being ready to act in the middle of the night, on the weekends, etc. That is a tedious and tiring position to be in, so it is better to rotate people often on that.

An example of the on-call policy could be found in this [GitLab On-Call Handbook](https://about.gitlab.com/handbook/on-call/).

## Incident Response

What to look for first?

1. Is the node up and running? Is the validator client up and running? CPU/RAM/Disk space okay?
2. Read the logs. Are there enough peers? Is the number of validators found by the validator client as you expected?
3. Is your node in sync/is it syncing? If so, is it on the right fork? Take [`eth/v1/beacon/headers/head` API](https://ethereum.github.io/beacon-APIs/#/Beacon/getBlockHeader) and check it against any public block explorer or in a community.
4. Is the network finalizing? [`eth/v1/beacon/headers/finalized` API](https://ethereum.github.io/beacon-APIs/#/Beacon/getBlockHeader) -- should be moving every 6.2 minutes.

### Inactivity leaks

The inactivity leak means your node was chosen to do a certain duty (attesting for the chain head or producing a block) and didn’t do its job in time.

Inactivity leaks have relatively small penalties. They will degrade the performance of the Validator in terms of the yearly yield. That means that you have some choice in how to handle them:

1. React ASAP — use if you have a proper DevOps team and you want to optimize the node performance and the best APY possible. Ensure regular rotations in the on-call team.
2. React only during “business hours”, but on weekends — only notify, say, from 9:00 to 21:00 every day. That greatly reduces the strain on the on-call personnel.
3. React only during business hours — same as (2) but don’t notify on weekends.

### Delays in attestations (node suboptimal performance)

### Long Block Processing Times

### Security Incidents

**Possible Network Attacks**

What channels to reach out to if you think it's a network attack?

**Possible Vulnerability**

What channels to reach out to if it's a possible vulnerability?

## TBD

* Explanation of basic alerts they should incorporate (delayed slots, low participation rate, block processing times, etc)
* How long to store data for?
* Generic recommendation on alerting/metrics best practices

## Incident Response

What to look for first? When do you raise an alarm? First steps required during incidence response.
