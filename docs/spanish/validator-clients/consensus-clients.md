# Clientes de consenso

!!! info "Info"
    Puedes consultar más información sobre los clientes de ejecución y los clientes de validación aqui: \
    [¿Qué son los clientes de validación?](/spanish/validator-clients/validator-clients-explained)👀

Existen varios clientes de consenso (anteriormente conocidos como clientes 'Eth2') que respaldan las actualizaciones de consenso. Estos clientes ejecutan la Beacon Chain y proporcionan un mecanismo de consenso de prueba de [prueba de participación (PoS)](/spanish/staking-glossary#proof-of-stake-pos) a los [clientes de ejecución](/spanish/validator-clientsexecution-clients).&#x20;

Todos los clientes de consenso siguen la misma [especificación ↗](https://github.com/ethereum/consensus-specs). Si un cliente no cumple con esta especificación, no podrá llegar a un consenso con el resto de la red.

| Cliente        | Documentación                                                | GitHub                                             | Discord                                                                    |
| -------------- | ------------------------------------------------------------ | -------------------------------------------------- | -------------------------------------------------------------------------- |
| **Lighthouse** | [Link ↗](https://lighthouse-book.sigmaprime.io/)             | [Link ↗](https://github.com/sigp/lighthouse)       | [Link ↗](https://discord.gg/gdq27tnKSM)                                    |
| **Loadstar**   | [Link ↗](https://chainsafe.github.io/lodestar/)              | [Link ↗](https://github.com/ChainSafe/lodestar)    | [Link ↗](https://discord.com/invite/yjyvFRP)                               |
| **Nimbus**     | [Link ↗](https://status-im.github.io/nimbus-eth2/intro.html) | [Link ↗](https://github.com/status-im/nimbus-eth2) | [Link ↗](https://discord.gg/aTDcbTG2gQ)                                    |
| **Prysm**      | [Link ↗](https://docs.prylabs.network/docs/getting-started)  | [Link ↗](https://github.com/prysmaticlabs/prysm)   | [Link ↗](https://discord.gg/GVM5TJwzkU)                                    |
| **Teku**       | [Link ↗](https://docs.teku.consensys.net/en/stable/)         | [Link ↗](https://github.com/ConsenSys/teku)        | <p><a href="https://discord.gg/trQ378WCp4">Link ↗</a><br>(canal #teku)</p> |

### Lighthouse

Lighthouse es una implementación de cliente de consenso escrita en Rust bajo la licencia Apache-2.0. Es mantenida por Sigma Prime y ha sido estable y lista para producción desde el inicio de Beacon Chain. Es utilizado por varias empresas, grupos de participación y particulares. Su objetivo es ser seguro, eficiente y compatible en una amplia gama de entornos, desde PC de escritorio hasta implementaciones automatizadas sofisticadas.

### Loadstar

Lodestar es una implementación de cliente de consenso lista para producción escrita en Typescript bajo la licencia LGPL-3.0. Es mantenida por ChainSafe Systems y es el más nuevo de los clientes de consenso para solistas, desarrolladores e investigadores. Lodestar consta de un nodo beacon y un cliente validador impulsado por implementaciones en JavaScript de los protocolos de Ethereum. Lodestar tiene como objetivo mejorar la usabilidad de Ethereum con clientes ligeros, ampliar la accesibilidad a un grupo más amplio de desarrolladores y contribuir aún más a la diversidad del ecosistema.

### Nimbus

Nimbus es una implementación de cliente de consenso escrita en Nim bajo la licencia Apache-2.0. Es un cliente listo para producción utilizado por solistas y grupos de participación (staking pools). Nimbus está diseñado para ser eficiente en recursos, lo que facilita su ejecución en dispositivos con restricciones de recursos e infraestructuras empresariales sin comprometer la estabilidad o el rendimiento de las recompensas. Un menor consumo de recursos significa que el cliente tiene un margen de seguridad mayor cuando la red está bajo estrés.

Implementado por Trinity, funciona como una sincronización rápida, pero también descarga los datos necesarios para ejecutar los bloques más recientes, lo que te permite consultar la cadena dentro de los primeros minutos desde el inicio.&#x20;

* Sincroniza el estado primero y te permite realizar consultas RPC en poco tiempo.
* Aún se encuentra en desarrollo y no es completamente confiable. La sincronización en segundo plano se ralentiza y las respuestas de RPC pueden fallar en ocasiones.

### Prysm

Prysm es un cliente de consenso de código abierto y completo, escrito en Go bajo la licencia GPL-3.0. Cuenta con una interfaz de usuario web opcional y prioriza la experiencia del usuario, la documentación y la configurabilidad tanto para usuarios individuales como institucionales que participan en la validación de la red Ethereum 2.0 desde sus hogares (stake-at-home).

### Teku

Teku es uno de los clientes originales del Beacon Chain desde el inicio. Junto con los objetivos habituales de seguridad, robustez, estabilidad, facilidad de uso y rendimiento, Teku se enfoca específicamente en cumplir totalmente con los diversos estándares de los clientes de consenso.&#x20;

Teku ofrece opciones de implementación muy flexibles. El nodo del Beacon Chain y el cliente validador se pueden ejecutar juntos como un único proceso, lo cual es extremadamente conveniente para los validadores individuales, o los nodos se pueden ejecutar por separado para operaciones de validación más sofisticadas. Además, Teku es completamente interoperable con [Web3Signer↗](https://github.com/ConsenSys/web3signer/) para la seguridad de las claves de firma y la protección contra penalizaciones por incumplimiento.&#x20;

Teku está escrito en Java y tiene una licencia Apache 2.0. Es desarrollado por el equipo de Protocolos en ConsenSys, que también es responsable de Besu y Web3Signer.
