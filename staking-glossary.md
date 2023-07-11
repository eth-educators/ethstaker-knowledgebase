# Glosario de Staking

* [Archival node](staking-glossary.md#archival-node)
* [Attestation](staking-glossary.md#attestation)
* [Attestation aggregator](staking-glossary.md#attestation-aggregator)
* [Beacon chain](staking-glossary.md#beacon-chain)
* [Block](staking-glossary.md#block)
* [Block proposer](staking-glossary.md#block-proposer)
* [Block status](staking-glossary.md#block-status)
  * [Proposed](staking-glossary.md#proposed)
  * [Scheduled](staking-glossary.md#scheduled)
  * [Missed/skipped](staking-glossary.md#missedskipped)
  * [Orphaned](staking-glossary.md#orphaned)
* [Canonical chain](staking-glossary.md#canonical-chain)
* [Chain head](staking-glossary.md#chain-head)
* [Checkpoints](staking-glossary.md#checkpoints)
* [Client](staking-glossary.md#client)
* [Committees](staking-glossary.md#committees)
* [Consensus layer](staking-glossary.md#consensus-layer)
* [Deposit contract](staking-glossary.md#deposit-contract)
* [Effectiveness](staking-glossary.md#effectiveness)
* [Epoch](staking-glossary.md#epoch)
* [Execution layer](staking-glossary.md#execution-layer)
* [Finalization](staking-glossary.md#finalization)
  * [Finality issues](staking-glossary.md#finality-issues)
* [Fork](staking-glossary.md#fork)
* [Full node](staking-glossary.md#full-node)
* [Genesis block](staking-glossary.md#genesis-block)
* [Hard fork](staking-glossary.md#hard-fork)
* [Head vote](staking-glossary.md#head-vote)
* [Inactivity leak](staking-glossary.md#inactivity-leak)
* [Inclusion distance](staking-glossary.md#inclusion-distance)
* [Input data](staking-glossary.md#input-data)
* [Justification](staking-glossary.md#justification)
* [Light clients](staking-glossary.md#light-clients)
* [MEV](staking-glossary.md#mev)
* [Mempool](staking-glossary.md#mempool)
* [Node](staking-glossary.md#node)
* [Operator](staking-glossary.md#operator)
* [Participation rate](staking-glossary.md#participation-rate)
* [Peers](staking-glossary.md#peers)
* [Priority fees](staking-glossary.md#priority-fees)
* [Private key](staking-glossary.md#private-key)
* [Proof of stake (PoS)](staking-glossary.md#proof-of-stake-pos)
* [Public key](staking-glossary.md#public-key)
* [Signing](staking-glossary.md#signing)
* [Slashable offenses](staking-glossary.md#slashable-offenses)
  * [Attestation violation](staking-glossary.md#attestation-violation)
  * [Proposer violation](staking-glossary.md#proposer-violation)
* [Slasher node](staking-glossary.md#slasher-node)
* [Slot](staking-glossary.md#slot)
* [Solo staker](staking-glossary.md#solo-staker)
* [Source vote](staking-glossary.md#source-vote)
* [Staker](staking-glossary.md#staker)
* [Staking deposit CLI](staking-glossary.md#staking-deposit-cli)
* [Suggested fee recipient](staking-glossary.md#suggested-fee-recipient)
* [Sync committee](staking-glossary.md#sync-committee)
* [Target vote](staking-glossary.md#target-vote)
* [Validator](staking-glossary.md#validator)
  * [Eligible for activation & Estimated activation](staking-glossary.md#eligible-for-activation--estimated-activation)
  * [Unique index](staking-glossary.md#unique-index)
  * [Current balance & Effective balance](staking-glossary.md#current-balance--effective-balance)
* [Validator lifecycle](staking-glossary.md#validator-lifecycle)
  * [1. Deposited](staking-glossary.md#1-deposited)
  * [2. Pending](staking-glossary.md#2-pending)
  * [3. Active validator](staking-glossary.md#3-active-validator)
  * [4. Slashing validator](staking-glossary.md#4-slashing-validator)
  * [5. Exiting validator](staking-glossary.md#5-exiting-validator)
* [Validator pool](staking-glossary.md#validator-pool)
* [Validator queue](staking-glossary.md#validator-queue)
* [Validator seed phrase / mnemonic](staking-glossary.md#validator-seed-phrase--mnemonic)
* [Withdrawal address](staking-glossary.md#withdrawal-address)

***

## nodo de almacenamiento

* Almacena todo lo que se mantiene en un [#nodo-completo](staking-glossary.md#nodo-completo "mention") y crea un archivo de estados históricos.&#x20;
* Los nodos de archivo son necesarios si desea consultar algo como el saldo de una cuenta en un bloque en particular.&#x20;
* Estos datos representan unidades de terabytes (más de 20 TB para Geth), lo que hace que los nodos de archivo sean menos atractivos para la mayoría de los usuarios, pero pueden ser útiles para servicios como exploradores de bloques, proveedores de billeteras y análisis de cadenas.

La sincronización de software clientes en cualquier modo que no sea de archivo dará como resultado la eliminación de los datos extra de la cadena de bloques. Esto significa que no un nodo completo no cuenta con todos los estados históricos, pero el nodo completo puede recrearlos a pedido.

No se requiere que los nodos de archivo participen en la validación de bloques y, en teoría, pueden construirse desde cero simplemente reproduciendo los bloques desde génesis.

\*\*\*\*[**Fuente ↗**](https://ethereum.org/en/developers/docs/nodes-and-clients/#archive-node)

## atestación

Votos de [#validadores](staking-glossary.md#validadores "mention")[ ](staking-glossary.md#validadores)que confirman la validez de un [#bloque](staking-glossary.md#bloque "mention"). En momentos designados, cada validador es responsable de publicar diferentes certificaciones que declaran formalmente la visión actual de la cadena del validador, incluido el último [#checkpoints](staking-glossary.md#checkpoints "mention") finalizado y la [#cabeza-de-cadena-chain-head](staking-glossary.md#cabeza-de-cadena-chain-head "mention") actual.

Votes by [validators](staking-glossary.md#validator) which confirm the validity of a [block](staking-glossary.md#block). At designated times, each validator is responsible for publishing different attestations that formally declare a validator's current view of the chain, including the last finalized [checkpoint](staking-glossary.md#checkpoints) and the current [head of the chain](staking-glossary.md#chain-head).

Every active validator creates one attestation per [epoch](staking-glossary.md#epoch) (\~6.5 minutes), consisting of the following components:

| Component                                                                          | Description                                                                                                                                                                                                                  |
| ---------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Committee**                                                                      | A bitlist of validators where the position maps to the validator index in their committee. The value (0/1) indicates whether the validator signed the data (i.e. whether they are active and agree with the block proposer). |
| **Slot**                                                                           | The slot number that the attestation references.                                                                                                                                                                             |
| **Index**                                                                          | A number that identifies which committee the validator belongs to in a given slot.                                                                                                                                           |
| <p><strong>Chain head vote</strong></p><p><strong>(beacon_block_root)</strong></p> | The root hash of the block the validator sees at the head of the chain (the result of applying the fork-choice algorithm).                                                                                                   |
| **Source**                                                                         | Part of the finality vote indicating what the validators see as the most recently justified block.                                                                                                                           |
| **Target**                                                                         | Part of the finality vote indicating what the validators see as the first block in the current epoch.                                                                                                                        |
| **Signature**                                                                      | A BLS signature that aggregates the signatures of individual validators.                                                                                                                                                     |

An important component related to effectiveness is the chain head vote. This is a vote the validator makes about what it believes is the latest valid block in the chain at the time of attesting. The structure of a chain head vote consists of the following components:

* Slot - Defines _where_ the validator believes the current chain head to be.
* Hash - Defines _what_ the validator believes the current chain head to be to be.

The combination uniquely defines a point on the blockchain. By combining enough of these chain head votes the Ethereum network reaches consensus about the state of the chain.

[**Source (ethereum.org) ↗**](https://ethereum.org/en/developers/docs/consensus-mechanisms/pos/attestations/)\
[**Source (Attestant) ↗**](https://www.attestant.io/posts/defining-attestation-effectiveness/)

## Attestation aggregator

Although the data in each [attestation](staking-glossary.md#attestation) is relatively small, it mounts up quickly with tens of thousands of [validators](staking-glossary.md#validator). As this data will be stored forever on the blockchain, minimizing it is important, and this is done through a process known as attestation aggregation.

Aggregation takes multiple attestations that have all chosen to vote with the same committee, chain head vote, and finality vote, and merges them together in to a single aggregate attestation.

An aggregate attestation differs in two ways from a simple attestation. First, there are multiple validators listed. Second, the signature is an aggregate signature made from the signatures of the matching simple attestations. Aggregate attestations are very efficient to store, but introduce additional communications and computational burdens.

If every validator was required to aggregate all attestations it would quickly overload the network with the number of communications required to pass every attestation to every validator. Equally, if aggregating were purely optional then validators will not bother to waste their own resources doing so. Instead, a subset of validators is chosen by the network to carry out aggregation duties1. It is in their interest to do a good job, as aggregate attestations with higher numbers of validators are more likely to be included in the blockchain so the validator is more likely to be rewarded.

Validators that carry out this aggregation process are known as aggregators.

[_**Source ↗**_](https://www.attestant.io/posts/defining-attestation-effectiveness/)

## Beacon chain

A major part of the work of the beacon chain is storing and managing the registry of [validators](staking-glossary.md#validator) – the set of participants are responsible for running the Ethereum [Proof of Stake (PoS)](staking-glossary.md#proof-of-stake-pos) system.

This registry is used to:

* Assigns validators their duties.
* Finalizes [checkpoints](staking-glossary.md#checkpoints).
* Perform a protocol level random number generation (RNG).
* Progress the beacon chain.
* Vote on the [head of the chain](staking-glossary.md#chain-head) for the fork choice.

[_**Source ↗**_](https://notes.ethereum.org/@djrtwo/Bkn3zpwxB#High-level-overview)

## bloque

Un bloque es una unidad de información agrupada que incluye una lista ordenada de transacciones e información relacionada con el consenso. Los bloques son propuestos por validadores de [Proof of Stake (PoS)](staking-glossary.md#proof-of-stake-pos)), momento en el que se comparten en toda la red peer-to-peer, donde todos los demás nodos pueden verificarlos fácilmente de forma independiente. Las reglas de consenso rigen qué contenidos de un bloque se consideran válidos, y la red ignora cualquier bloque no válido. El orden de estos bloques y las transacciones en ellos crean una cadena determinista de eventos cuyo final representa el estado actual de la red.

## Block proposer

A chosen [validator](staking-glossary.md#validator) by the [Beacon Chain](staking-glossary.md#beacon-chain) to propose the next [block](staking-glossary.md#block). There can only be one valid block per [slot](staking-glossary.md#slots).

## Estado del Bloque

### Propuesto (Proposed)

El bloque fue propuesto por un validador.

### Programado (Scheduled)

Los validadores están enviando datos actualmente.

### Perdido/omitido (Missed/skipped)

El proponente no propuso el bloque dentro del plazo dado, por lo que el bloque se perdió/se saltó.

### Huérfano (Orphaned)

Para entender esto, miremos el diagrama debajo de "1, 2, 3, ..., 9" representan las ranuras (slots).

1. El validador en la ranura 1 propone el bloque "a".
2. El validador en la ranura 2 propone "b".
3. La ranura 4 se está omitiendo porque el validador no propuso un bloque (por ejemplo, fuera de línea).
4. En la ranura 5/6 se produce una bifurcación: el validador (5) propone un bloque, pero el validador (6) no recibe estos datos (por ejemplo, el bloque no los alcanzó lo suficientemente rápido). Por lo tanto, Validator(6) propone su bloque con la información más reciente que ve de validator(3).
5. La [regla de elección de fork (bifurcación) ↗](https://notes.ethereum.org/@vbuterin/rkhCgQteN?type=view#LMD-GHOST-fork-choice-rule)  es la clave aquí: decide cuál de las cadenas disponibles es la canónica.

## cadena canónica

La cadena canónica es la cadena que se acuerda que es la cadena "principal" y no un [fork](staking-glossary.md#fork).

## chain head

El último bloque recibido por un validador. Esto no significa necesariamente que sea la cabeza de la [cadena canónica](staking-glossary.md#cadena-canonica).

## checkpoints

The [Beacon Chain](staking-glossary.md#beacon-chain) has a tempo divided into [slots](staking-glossary.md#slot) (12 seconds) and [epochs](staking-glossary.md#epoch) (32 slots). The first slot in each epoch is a checkpoint. When a supermajority of validators [attests](staking-glossary.md#attestation) to the link between two checkpoints, they can be [justified](staking-glossary.md#justification) and then when another checkpoint is justified on top, they can be [finalized](staking-glossary.md#finalization).

## Software Cliente

Una implementación del software Ethereum que verifica las transacciones en un bloque. Estos pueden ser clientes de capa de consenso o clientes de capa de ejecución. Cada validador necesita tanto un cliente de capa de ejecución como un cliente de capa de consenso.

An implementation of Ethereum software that verifies transactions in a block. These can be [consensus layer clients](https://ethereum.org/en/developers/docs/nodes-and-clients/#consensus-clients) or [execution layer clients](https://ethereum.org/en/developers/docs/nodes-and-clients/#execution-clients). Each validator needs both an execution layer client and a consensus layer client.

## Committees

A group of at least 128 [validators](staking-glossary.md#validator) assigned to validate blocks in each [slot](staking-glossary.md#slot). One of the validators in the committee is the aggregator, responsible for aggregating the signatures of all other validators in the committee that agree on an attestation. Not to be confused with [sync committees](staking-glossary.md#sync-committee).

## Consensus layer

La capa de consenso de Ethereum es la red de [consensus-clients.md](validator-clients/consensus-clients.md "mention").

## Deposit contract

The Deposit contract is the **gateway** to Ethereum [Proof of Stake (PoS)](staking-glossary.md#proof-of-stake-pos) and is managed **through a smart contract** on Ethereum. The smart contract accepts any transaction with a minimum amount of 1 ETH and a valid [input data](staking-glossary.md#input-data). Ethereum beacon-nodes listen to the deposit contract and use the input data to credit each validator.

[_More info on the deposit contract_](para-empezar/deposit-process.md)

## Effectiveness

The average time it takes for a validator's attestations to be included in the chain.

[_Check out our page explaining validator effectiveness in more detail_](validator-clients/validator-effectiveness.md)

## Epoch

**1 Epoch = 32** [**Slots**](staking-glossary.md#slot)\
Represents the number of 32 slots (12 seconds) and takes approximately **6.4 minutes.** Epochs play an important role when it comes to the [validator queue](staking-glossary.md#validator-queue) and [finality](staking-glossary.md#finalization).

## Execution layer

Ethereum's execution layer is the network of [execution clients](validator-clients/execution-clients.md).

## Finalization

In Ethereum [Proof of Stake (PoS)](staking-glossary.md#proof-of-stake-pos) at least two third of the validators have to be honest, therefore if there are two competing [epochs](staking-glossary.md#epoch) and one third of the [validators](staking-glossary.md#validator) decide to be malicious, they will receive a penalty. Honest validators will be rewarded.

In order to determine if an epoch has been finalized, validators have to agree on the latest two epochs in a row, then all previous Epochs can be considered as finalized.

### Finality issues

If there are less than 66.6% of the total possible votes (the [participation rate](staking-glossary.md#participation-rate)) in a specific epoch, the epoch cannot be [justified](staking-glossary.md#justification). As mentioned in "[Finalization](staking-glossary.md#finalization)", three justified epochs in a row are required to reach finality. As long as the chain cannot reach this state it has finality issues.

During finality issues, the validator [entry queue](staking-glossary.md#validator-queue) will be halted and new validators will not be able to join the network, however, inactive validators with less than 16 ETH balance will be exited from the network. This leads to more stability in the network and a higher participation rate, allowing the chain to eventually finalize.

## fork

Un cambio en el protocolo que provoca la creación de una cadena alternativa o una divergencia temporal en dos posibles rutas de bloques. Ver también [#hard-fork](staking-glossary.md#hard-fork "mention")

## nodo completo

Almacena y mantiene los datos completos de la cadena de bloques en el disco. Provee datos de blockchain a solicitud y ayuda a respaldar la red participando en la validación de bloques y verificando todos los bloques y estados. Todos los estados se pueden derivar de un nodo completo.

[**Fuente ↗**](https://www.quicknode.com/guides/infrastructure/ethereum-full-node-vs-archive-node)

## bloque Génesis

El primer bloque en una cadena de bloques, utilizado para inicializar una red en particular y su criptomoneda.

## hard fork

Se produce un hard fork  cuando se envía una actualización a la red Ethereum y la nueva versión del software se bifurca de la versión anterior. Por lo general, requiere que los operadores actualicen su software de validación para permanecer en el lado correcto del fork. Ver también  [#fork](staking-glossary.md#fork "mention")

## Head voteVoto principal

The validator has made a timely vote for the correct [head block](staking-glossary.md#chain-head).

## Inactivity leak

If the Beacon Chain has gone more than four [epochs](staking-glossary.md#epoch) without [finalizing](staking-glossary.md#finalization), an emergency protocol called the "inactivity leak" is activated. The ultimate aim of the inactivity leak is to create the conditions required for the chain to recover finality. Finality requires a 2/3 majority of the total staked ether to agree on source and target checkpoints. If validators representing more than 1/3 of the total validators go offline or fail to submit correct [attestations](staking-glossary.md#attestation) then it is not possible for a 2/3 supermajority to finalize checkpoints. The inactivity leak lets the stake belonging to the inactive validators gradually bleed away until they control less than 1/3 of the total stake, allowing the remaining active validators finalize the chain. However large the pool of inactive validators, the remaining active validators will eventually control >2/3 of the stake. The loss of stake is a strong incentive for inactive validators to reactivate as soon as possible!

## Inclusion distance

The inclusion distance of a [slot](staking-glossary.md#slot) is the difference between the slot in which an [attestation](staking-glossary.md#attestation) is made and the lowest slot number of the block in which the attestation is included. For example, an attestation made in slot _s_ and included in the block at slot _s + 1_ has an inclusion distance of _1_. If instead the attestation was included in the block at slot _s + 5_ the inclusion distance would be _5_.

The value of an attestation to the Ethereum network is dependent on its inclusion distance, with a low inclusion distance being preferable. This is because the sooner the information is presented to the network, the more useful it is.

To reflect the relative value of an attestation, the reward given to a validator for attesting is scaled according to the inclusion distance. Specifically, the reward is multiplied by _1/d_, where _d_ is the inclusion distance.

<figure><img src=".gitbook/assets/InclusionDistance.png" alt="Attestation Reward Inclusion Distance Distribution"><figcaption></figcaption></figure>

## Datos de entrada

Los datos de entrada, también llamados **datos de depósito**, son una secuencia de 842 caracteres generada por el usuario. Representa la [#llave-publica](staking-glossary.md#llave-publica "mention") y la llave pública de retiro, que fueron firmadas con la [#llave-privada](staking-glossary.md#llave-privada "mention") del validador. Los datos de entrada deben agregarse a la transacción del contrato de depósito para que la cadena de balizas los identifique.

The Input data, also called the **deposit data**, is a user generated, 842 long sequence of characters. It represents the validator public key and the withdrawal public key, which were signed with by the validator [private key](staking-glossary.md#private-key). The input data needs to be added to the transaction to the [deposit contract](para-empezar/deposit-process.md) in order to get identified by the [beacon-chain](staking-glossary.md#beacon-chain).

[_More info about the deposit process_](para-empezar/deposit-process.md)

## Justification

66.6% of the total validators need to attest in favour of a block's inclusion in the [canonical chain](staking-glossary.md#canonical-chain). This condition upgrades the block to "justified". Justified blocks are unlikely to be reverted, but they can be under certain conditions.

When another block is justified on top of a justified block, it is upgraded to "finalized". Finalizing a block is a commitment to include the block in the canonical chain.

[_More info on justification ↗_](https://ethereum.org/en/developers/docs/consensus-mechanisms/pos/gasper/)

## clientes ligeros

Un cliente de Ethereum que no almacena una copia local de la cadena de bloques ni valida bloques y transacciones. Ofrece las funciones de una billetera y puede crear y transmitir transacciones.

## MEV

MEV o "valor extraíble máximo", es un tema controversial. Los operadores de nodos pueden extraer MEV aceptando bloques creados por "buscadores", a través de un pequeño programa secundario llamado  "[mev-boost ↗](https://ethresear.ch/t/mev-boost-merge-ready-flashbots-architecture/11177)". En este caso, el cliente de la capa de consenso, como Nimbus, Teku, etc., cuando se le solicite obtener un bloque para proponer, obtendrá bloques de los relés MEV a través de mev-boost y del cliente de la capa de ejecución, como Besu, Geth, etc. y luego elija el bloque del relé que mejor pague. Actualmente, la capa de ejecución no comunica su pago esperado y solo se elegiría cuando el relevo no ofrezca ningún bloque. Para esto, se debe confiar en que el relé entregará bloques válidos. Las recompensas de MEV se pagan a la misma dirección del destinatario de la tarifa sugerida que las tarifas prioritarias.

Las recompensas de MEV se pagan a la misma dirección del destinatario de la tarifa sugerida que las tarifas prioritarias.

ewards from MEV are paid to the same [suggested fee recipient](staking-glossary.md#suggested-fee-recipient) address as [priority fees](staking-glossary.md#priority-fees).

[_**Source ↗**_](https://ethereum.org/en/developers/docs/mev/)

## mempool

Cuando un nodo Ethereum recibe una transacción, no se agrega instantáneamente a un bloque. La transacción se lleva a cabo en un área de espera o una zona de amortiguamiento.

La transacción pasa por una serie de niveles de verificación, como comprobar si la salida es mayor que la entrada, si la firma es válida o no, etc., y luego solo se agrega a un bloque. La transacción no se agrega a un bloque si falla alguna de estas validaciones. El papel de un mempool surge mientras una transacción pasa por estos controles. Simplemente se mantiene en esta sala de espera o en un mempool. Tan pronto como se confirma la transacción, se elimina del mempool y se agrega a un bloque. Mempool no es una referencia maestra compartida universalmente por todos los nodos. No hay un mempool "único". Esto significa que cada nodo configura sus propias reglas para el mempool del nodo. De hecho, un nodo puede ser el primero en recibir una transacción, pero es posible que no haya propagado la transacción al resto de la red.

[**Fuente ↗**](https://www.geeksforgeeks.org/what-is-ethereum-mempool/)

## nodo

Una instancia de software de cliente de Ethereum que esté conectada a otras computadoras que también ejecuten software de Ethereum, formando una red. Un nodo no necesita necesariamente un validador, pero un validador requiere un nodo. Ejecutar un nodo por sí solo no genera ningún ingreso, pero contribuye a la solidez de la red.

## operador

Una persona que mantiene un validador.

## tasa de participación

La tasa de participación es el porcentaje de validadores que están en línea y realizando sus funciones.

Si el conjunto de validadores es de 1000 validadores y 250 validadores están fuera de línea o rara vez hacen propuestas o certificaciones, entonces se podría estimar que la tasa de participación es del 75 %.

[**Fuente ↗**](https://ethereum.stackexchange.com/questions/87503)

## peers

Otros nodos que ejecutan clientes de Ethereum que se conectan entre sí a través de una red de igual a igual (peer to peer). La comunicación entre peers es la forma en que la red Ethereum permanece descentralizada ya que no hay un punto único de falla.

## Priority fees

Almost all transaction on Ethereum set a [priority fee ↗](https://ethereum.org/en/developers/docs/gas/#priority-fee) to incentivize [block proposers](staking-glossary.md#block-proposer) to include the transaction as a higher priority than others. The higher the fee relative to other transactions currently waiting in the [mempool](staking-glossary.md#mempool) This fee is paid to the block proposer. All of the priority fees in a block are aggregated and paid in a single state change directly to the [suggested fee recipient](staking-glossary.md#suggested-fee-recipient) set by the block proposer. This address could be a hardware wallet, a software wallet, or even a multi-sig contract.

## llave privada

(Private Key) Un número secreto que permite a los usuarios de Ethereum demostrar la propiedad de una cuenta o contratos mediante la producción de una firma digital.

## proof of stake (PoS)

Un método por el cual un protocolo de cadena de bloques de criptomonedas tiene como objetivo lograr un consenso distribuido. PoS pide a los usuarios que demuestren la propiedad de una cierta cantidad de criptomonedas (su "participación" en la red) para poder participar en la validación de transacciones.

## llave publica

Un número, derivado a través de una función unidireccional de una [#llave-privada](staking-glossary.md#llave-privada "mention"), que puede ser compartido públicamente y utilizado por cualquier persona para verificar una firma digital realizada con la clave privada correspondiente.

## firmar

Demostrar criptográficamente que un mensaje o transacción fue aprobado por el titular de una  [#llave-privada](staking-glossary.md#llave-privada "mention").

## Slashable offenses

If your validator commits a slashable offense it will be force exited from the validator pool and will have ETH deducted depending on the circumstances of the event. Typically, this will be 1-2 ETH but could be [significantly more ↗](https://ethereum.org/en/developers/docs/consensus-mechanisms/pos/rewards-and-penalties/#slashing).

This is not something to be overly worried about, there are [simple steps](help/slashing-explained.md) you can take to make sure that you don't invoke a slashing event.

There are three ways a validator can be slashed, all of which amount to the dishonest proposal or attestation of blocks.

### Attestation violation

* **Double voting**: Signing two different [attestations](staking-glossary.md#attestation) in one [epoch](staking-glossary.md#epoch).
* **Surround votes**: Attesting to a block that "surrounds" another one (effectively changing history).

### Proposer violation

* **Double block proposal**: [Proposing](staking-glossary.md#block-proposer) and [signing](staking-glossary.md#signing) two different [blocks](staking-glossary.md#block) for the same [slot](staking-glossary.md#slot).

## Slasher node

The [**slasher**](https://github.com/Buttaa/ethstaker/blob/main/slasher.md) **is its own entity** but requires a beacon-node to receive [attestations](https://kb.beaconcha.in/glossary#attestation). To find malicious activity by validators, the slashers iterates through all received attestations until a **slashable offense** has been found. Found slashings are broadcasted to the network and the next [block proposer](staking-glossary.md#block-proposer) adds the proof to the block. The block proposer receives a reward for slashing the malicious validator. However, the whistleblower (Slasher) does not receive a reward.

## Slot

**32 Slots = 1** [**Epoch**](staking-glossary.md#epoch)\
A time period of **12 seconds** in which a randomly chosen validator has time to propose a block. The total number of validators is split up in [committees](staking-glossary.md#committees) and one or more individual committees are responsible to attest to each slot. One validator from the committee will be chosen to be the aggregator, while the other 127 validators are attesting. After each Epoch, the validators are mixed and merged to new committees. Each slot may or may not have a block in it as a validatory could miss their proposal (e.g. they may be offline or submit their block too late). There is a minimum of 128 validators per committee.

## Solo staker

An operator who runs a validator on the Ethereum network without a protocol between their validator and the Beaconchain

## Source vote

The validator has made a timely vote for the correct source [checkpoint](staking-glossary.md#checkpoint).

## Staker

Someone who has deposited ETH into a validator to secure the network. This can be someone who runs a validator (an operator) or someone who deposited their ETH into a pool, where someone else is the operator of the validator.

## Staking deposit CLI

A command-line tool used to generate validator keys and deposit data files.

* [https://github.com/ethereum/staking-deposit-cli](https://github.com/ethereum/staking-deposit-cli)

## Suggested fee recipient

The fee recipient is an Ethereum address nominated by a [Beacon Chain](staking-glossary.md#beacon-chain) validator to receive tips from user transactions and [MEV](staking-glossary.md#mev).

## comité de sincronización

Un comité de sincronización es un grupo de [#validadores](staking-glossary.md#validadores "mention")seleccionados al azar que se actualizan cada \~27 horas. Su propósito es agregar sus [#firmar](staking-glossary.md#firmar "mention") a encabezados de bloque válidos. Los comités de sincronización permiten a los clientes ligeros realizar un seguimiento del jefe de la cadena de bloques sin necesidad de acceder a todo el conjunto de validadores. Ocurre cada 2 años en promedio, sin embargo, puede haber "períodos secos" varias veces más largos que el promedio sin que se dé uno. Entonces, si su validador es seleccionado... ¡felicidades! 🥳

A sync committee is a randomly selected group of [validators](staking-glossary.md#validator) that refresh every \~27 hours. Their purpose is to add their [signatures](staking-glossary.md#signing) to valid block headers. Sync committees allow [light clients](staking-glossary.md#light-clients) to keep track of the head of the blockchain without needing to access the entire validator set. Occurs every 2 years on average, however, there can be "dry spells" multiple times longer than the average without being given one. So if your validator is selected... congratulations! 🥳

## Target vote

The validator has made a timely vote for the correct target [checkpoint](staking-glossary.md#checkpoints).

## validadores

Un nodo en un sistema de [#proof-of-stake-pos](staking-glossary.md#proof-of-stake-pos "mention") responsable de almacenar datos, procesar transacciones y agregar nuevos bloques a la cadena de bloques. Para activar el software de validación, debe poder aportar 32 ETH. El trabajo de los validadores es proponer bloques y firmar atestaciones. Tiene que estar en línea durante al menos el 50% del tiempo para tener retornos positivos. Un validador lo ejecuta un operador (un ser humano), en el hardware (una computadora) y se empareja con un nodo (muchos miles de validadores pueden ejecutarse en un nodo)

### Eligible for activation & Estimated activation

Refers to pending validators. The deposit has been recognized by the [Beacon Chain](staking-glossary.md#beacon-chain) at the timestamp of “Eligible for activation”. If there is a queue of [pending validators ↗](https://www.beaconcha.in/validators), an estimated timestamp for activation is calculated.

### Unique index

Every validator receives a unique index based on when they are added from the [validator queue](staking-glossary.md#validator-queue).

### Current balance & Effective balance

The current balance is the amount of ETH held by the validator as of now. The **effective Balance** represents a value calculated by the current balance. It is used to determine the size of a reward or penalty a validator receives. The effective balance can never be higher than 32 ETH.

In order to increase the effective balance, the validator requires “effective balance + 1.25 ETH”. In other words, if the effective balance is 20 ETH, a current balance of 21.25 ETH is required in order to have an effective balance of 21 ETH. The effective balance will adjust once it drops by 0.25 below the threshold as seen in the examples above.

Here are examples on how the effective balance changes:

* If the Current balance is 32.00 ETH – the Effective balance is 32.00 ETH.
* If the Current balance dropped from 22 ETH to 21.76 ETH – Effective balance will be **22.00 ETH**.
* If the Current balance increases to 22.25 **and** the effective balance is 21 ETH, the effective balance will increase to 22 ETH.

## Validator lifecycle

#### 1. Deposited

32 ETH has been deposited to the ETH1 deposit-contract and this state will be kept for around 7 hours. This offers security in case the Ethereum chain gets attacked.

#### 2. Pending

Waiting for activation on the [Beacon Chain](staking-glossary.md#beacon-chain).

Before validators enter the [validator queue](staking-glossary.md#validator-queue), they need to be voted in by other active validators. This occurs every 4 hours.

#### 3. Active validator

Currently attesting and proposing blocks.

The validator will stay active until:

* Its balance drops below 16 ETH (ejected).
* Voluntary exit.
* It gets slashed.

#### 4. Slashing validator

The Validator has been malicious and will be slashed and kicked out of the system.

> A _**Penalty**_ is a negative reward (e.g. for going offline).\
> A _**Slashing**_ is a large penalty (≥ 1/32 of balance at stake) and a forceful exit ... **. - Justin Drake**

#### 5. Exiting validator

* **Ejected**: The validator balance fell below a threshold and was kicked out by the network.
* **Exited**: Voluntary exit, the withdrawal key holder has the ability to **withdraw** the current balance of the corresponding validator balance.

## Validator pool

The number of currently active validators securing the Ethereum network. The current validator pool can be seen [here ↗](https://beaconcha.in/validators).

## Validator queue

The validator queue is a first-in-first-out queue for activating and exiting validators on the [Beacon Chain](staking-glossary.md#beacon-chain).

* Until 327680 active validators in the network, 4 validators can be activated per [epoch](staking-glossary.md#epoch). For every (4 \* 16384) = **65536** active validators, the validator **activation rate** goes up by one.
* 5 validators per epoch requires 327680 active validators, allowing 1125 validators per day.
* 6 validators per epoch requires 393216 active validators, allowing 1350 validators per day.
* 7 validators per epoch requires 458752 active validators, allowing 1575 validators per day.
* 8 validators per epoch requires 524288 active validators, allowing 1800 validators per day.
* 9 validators per epoch requires 589824 active validators, allowing 2025 validators per day.
* 10 validators per epoch requires 655360 active validators, allowing 2200 validators per day.
* Amount of activations scales with the amount of active validators and the limit is the active validator set divided by 64.

Exiting validators works in the same way, with the amount of validators that can exit the Beacon Chain per day rate limited to preserve the stability of the network.

## Validator seed phrase / mnemonic

The Seed Phrase or Mnemonic is a set of words (usually 12, 18 or 24 words long) used to generate your validator keys. Your mnemonic is the backup for your validator keys and will be the ONLY way to withdraw your ETH when the time comes and no one can help you recover your mnemonic if you lose it.

## Withdrawal address

An address that can be optionally set when creating a validator key that will be used to withdraw staked ETH. If this address is not set at the time of key creation it can be set at the time of withdrawal instead. For more information about setting the withdrawal address on key creation, [see our FAQ answer](faq.md#should-i-set-a-withdrawal-address-when-setting-up-my-solo-staking-validator).
