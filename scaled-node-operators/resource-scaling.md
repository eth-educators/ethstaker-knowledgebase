---
description: Under construction 🏗️
---

# Resource scaling

```
Skeleton Bullet Points
- Extra space to allocate in terms of non-finality / Or being able to extend the filesystem quickly
- 1:1 CL:EL and other combinations - pro/cons
- Info on archive node and what it means in CL context
- When/How to scale up the setup? What to look out for while scaling?
```

Resource scaling is a pivotal aspect of managing large-scale Ethereum staking operations. Knowing when and how to scale your resources can mean the difference between seamless operation and a bottlenecked, inefficient network. This guide aims to help you make informed decisions on scaling your Ethereum staking setup.

### Extra Space to Allocate in Terms of Non-finality / Or Being Able to Extend the Filesystem Quickly

#### What You Need to Know

Non-finality periods may require extra storage, and being able to extend the filesystem quickly can be critical.

#### Best Practices

* Maintain a reserve storage capacity to handle non-finality periods.
* Use file systems that support rapid resizing or opt for scalable cloud storage solutions.

### 1:1 CL:EL and Other Combinations - Pros/Cons

Vouch/Dirk?

### Info on Archive Node and What It Means in CL Context

#### What You Need to Know

An archive node retains the entire Ethereum state and history, which may be required for specific queries or auditing purposes.

#### Best Practices

* Run an archive node only if your specific use-case requires historical state data.
* Understand that archive nodes are resource-intensive in both storage and computational power.

### When/How to Scale Up the Setup? What to Look Out For While Scaling?

#### What You Need to Know

Scaling is inevitable but should be approached systematically.

#### Best Practices

* **Metrics**: Monitor CPU, memory, and storage utilization as well as network latency.
* **Thresholds**: Define clear metrics thresholds for scaling actions.
* **Cost-Benefit Analysis**: Always weigh the benefits of scaling against the costs involved.
* **Scalability Testing**: Prioritize conducting load tests to simulate the impact of scaling.
* **Monitoring**: Intensify monitoring efforts post-scaling to catch any issues early.



Resource scaling requires foresight, preparation, and a good understanding of the operational intricacies of Ethereum staking. By keeping these best practices in mind, you can ensure that your large-scale Ethereum staking operation is both robust and agile, capable of adapting to the ever-evolving landscape of Ethereum staking.

> <img src="../.gitbook/assets/image (108).png" alt="" data-size="line">The information in the Scaled Node Operators section has been written and reviewed by [GatewayFM](https://gateway.fm), a leading large scale Ethereum staking infrastructure provider.
