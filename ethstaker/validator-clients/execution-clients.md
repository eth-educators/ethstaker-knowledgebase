# Execution clients

{% hint style="info" %}
For more info about Execution clients and Validator clients start here: \
[Validator clients explained](validator-clients-explained.md) 👀
{% endhint %}

The Ethereum community maintains multiple open-source execution clients (previously known as 'Eth1 clients', or just 'Ethereum clients'), developed by different teams using different programming languages. This makes the network stronger and more diverse. The ideal goal is to achieve diversity without any client dominating to reduce any single points of failure.

| Client         | Documentation                                          | GitHub                                                | Discord                                                                                                      |
| -------------- | ------------------------------------------------------ | ----------------------------------------------------- | ------------------------------------------------------------------------------------------------------------ |
| **Geth**       | [Link ↗](https://geth.ethereum.org/docs/)              | [Link ↗](https://github.com/ethereum/go-ethereum)     | [Link ↗](https://discord.com/invite/nthXNEv)                                                                 |
| **Besu**       | [Link ↗](https://besu.hyperledger.org/)                | [Link ↗](https://github.com/hyperledger/besu)         | [Link ↗](https://discord.com/invite/hyperledger)                                                             |
| **Nethermind** | [Link ↗](https://docs.nethermind.io/nethermind/)       | [Link ↗](https://github.com/NethermindEth/nethermind) | [Link ↗](https://discord.com/invite/PaCMRFdvWT)                                                              |
| **Erigon**     | [Link ↗](https://github.com/ledgerwatch/erigon#erigon) | [Link ↗](https://github.com/ledgerwatch/erigon)       | <p><a href="https://github.com/ledgerwatch/erigon#erigon-discord-server">Link ↗ </a><br>(Request access)</p> |

### Geth

Go Ethereum (Geth for short) is one of the original implementations of the Ethereum protocol. Currently, it is the most widespread client with the biggest user base and variety of tooling for users and developers. It is written in Go, fully open source and licensed under the GNU LGPL v3.

### Besu

Hyperledger Besu is an enterprise-grade Ethereum client for public and permissioned networks. It runs all of the Ethereum Mainnet features, from tracing to GraphQL, has extensive monitoring and is supported by ConsenSys, both in open community channels and through commercial SLAs for enterprises. It is written in Java and is Apache 2.0 licensed.

Besu's extensive documentation will guide you through all details on its features and setups.

### Nethermind

Nethermind is an Ethereum implementation created with the C# .NET tech stack, licensed with LGPL-3.0, running on all major platforms including ARM. It offers great performance with:

* An optimized virtual machine.
* State access.
* Networking and rich features like Prometheus/Grafana dashboards, seq enterprise logging support, JSON RPC tracing, and analytics plugins.

### Erigon

Erigon, formerly known as Turbo‐Geth, started as a fork of Go Ethereum oriented toward speed and disk‐space efficiency. Erigon is a completely re-architected implementation of Ethereum, currently written in Go but with implementations in other languages under development. Erigon's goal is to provide a faster, more modular, and more optimized implementation of Ethereum. It can perform a full archive node sync using around 2TB of disk space, in under 3 days.

