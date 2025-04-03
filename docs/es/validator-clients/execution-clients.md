# Execution clients

!!! info "Info"
    Puedes consultar más información sobre los clientes de ejecución y los clientes de validación aqui: \
    [Qué son los clientes de validacióón?](../../validator-clients/validator-clients-explained)👀

La comunidad de Ethereum mantiene varios clientes de ejecución de código abierto (anteriormente conocidos como 'clientes Eth1' o simplemente 'clientes de Ethereum'), desardollados por diferentes equipos, utilizando diferentes lenguajes de programación. Esto hace que la red sea más fuerte y diversa. El objetivo ideal es lograr diversidad sin que ningún cliente domine, para reducir cualquier punto único de falla.

| Cliente        | Documentación                                          | GitHub                                                | Discord                                                                                                     |
| -------------- | ------------------------------------------------------ | ----------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- |
| **Geth**       | [Link ↗](https://geth.ethereum.org/docs/)              | [Link ↗](https://github.com/ethereum/go-ethereum)     | [Link ↗](https://discord.com/invite/nthXNEv)                                                                |
| **Besu**       | [Link ↗](https://besu.hyperledger.org/)                | [Link ↗](https://github.com/hyperledger/besu)         | [Link ↗](https://discord.com/invite/hyperledger)                                                            |
| **Nethermind** | [Link ↗](https://docs.nethermind.io/nethermind/)       | [Link ↗](https://github.com/NethermindEth/nethermind) | [Link ↗](https://discord.com/invite/PaCMRFdvWT)                                                             |
| **Erigon**     | [Link ↗](https://github.com/ledgerwatch/erigon#erigon) | [Link ↗](https://github.com/ledgerwatch/erigon)       | <p><a href="https://github.com/ledgerwatch/erigon#erigon-discord-server">Link ↗</a><br>(Request access)</p> |

### Geth

Go Ethereum (Geth, abreviado) es una de las implementaciones originales del protocolo de Ethereum. Actualmente, es el cliente más extendido, con la mayor base de usuarios y variedad de herramientas tanto para usuarios como para desarrolladores. Está escrito en Go, es completamente código abierto y tiene licencia bajo GNU LGPL v3.

### Besu

Besu Hyperledger Besu es un cliente de Ethereum de nivel empresarial para redes públicas y con permisos. Ejecuta todas las características de Ethereum Mainnet, desde el seguimiento hasta GraphQL, tiene un amplio monitoreo y cuenta con el respaldo de ConsenSys, tanto en canales comunitarios abiertos como a través de SLAs comerciales para empresas. Está escrito en Java y tiene licencia Apache 2.0.&#x20;

Besu tiene una extensa documentación que te puede servir de guía a través de todos los detalles sobre sus características y configuraciones.

### Nethermind

Nethermind Nethermind es una implementación de Ethereum creada con el stack tecnológico de C# .NET, con licencia LGPL-3.0, que se ejecuta en todas las principales plataformas, incluyendo ARM. Ofrece un excelente rendimiento con:

* Una máquina virtual optimizada.
* Acceso al estado.
* Redes y características avanzadas como paneles de control Prometheus/Grafana, soporte de registro empresarial seq, trazado de JSON RPC y complementos de análisis.

### Erigon

Erigon, anteriormente conocido como Turbo-Geth, comenzó como una bifurcación de Go Ethereum orientada a la velocidad y eficiencia del espacio en disco. Erigon es una implementación completamente reestructurada de Ethereum, escrita actualmente en Go pero con implementaciones en otros lenguajes en desarrollo. El objetivo de Erigon es proporcionar una implementación de Ethereum más rápida, modular y optimizada. Puede realizar una sincronización completa de nodo de archivo utilizando alrededor de 2TB de espacio en disco en menos de 3 días.
