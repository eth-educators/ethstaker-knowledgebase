# Glosario de Staking

* [#agregador-de-atestaciones](#agregador-de-atestaciones "mention")&#x20;
* [#atestacion](#atestacion "mention")
* [#beacon-chain](#beacon-chain "mention")
* [#bloque](#bloque "mention")
* [#proponente-de-bloque](#proponente-de-bloque "mention")
* [#nodo-de-almacenamiento](#nodo-de-almacenamiento "mention")
* [#estado-del-bloque](#estado-del-bloque "mention")
  * [#propuesto-proposed](#propuesto-proposed "mention")
  * [#programado-scheduled](#programado-scheduled "mention")&#x20;
  * [#perdido-omitido-missed-skipped](#perdido-omitido-missed-skipped "mention")
  * [#huerfano-orphaned](#huerfano-orphaned "mention")
* [#cadena-canonica](#cadena-canonica "mention")
* [#cabeza-de-cadena](#cabeza-de-cadena "mention")
* [#checkpoints](#checkpoints "mention")
* [#software-cliente](#software-cliente "mention")
* [#comites](#comites "mention")
* [#capa-de-consenso](#capa-de-consenso "mention")
* [#contrato-de-deposito](#contrato-de-deposito "mention")
* [#efectividad](#efectividad "mention")
* [#epoca](#epoca "mention")
* [#capa-de-ejecucion](#capa-de-ejecucion "mention")
* [#finalizacion](#finalizacion "mention")
  * [#problemas-de-finalidad](#problemas-de-finalidad "mention")
* [#fork](#fork "mention")
* [#nodo-completo](#nodo-completo "mention")
* [#bloque-genesis](#bloque-genesis "mention")
* [#hard-fork](#hard-fork "mention")
* [#voto-principal](#voto-principal "mention")
* [#fuga-de-inactividad](#fuga-de-inactividad "mention")
* [#distancia-de-inclusion](#distancia-de-inclusion "mention")
* [#datos-de-entrada](#datos-de-entrada "mention")
* [#justificacion](#justificacion "mention")
* [#clientes-ligeros](#clientes-ligeros "mention")
* [#mev](#mev "mention")
* [#mempool](#mempool "mention")
* [#nodo](#nodo "mention")
* [#operador](#operador "mention")
* [#tasa-de-participacion](#tasa-de-participacion "mention")
* [#peers](#peers "mention")
* [#tarifas-de-prioridad](#tarifas-de-prioridad "mention")
* [#llave-privada](#llave-privada "mention")
* [#proof-of-stake-pos](#proof-of-stake-pos "mention")
* [#llave-publica](#llave-publica "mention")
* [#firmar](#firmar "mention")
* [#ofensa-deducibles](#ofensa-deducibles "mention")
  * [#violacion-de-atestacion](#violacion-de-atestacion "mention")
  * [#violacion-de-atestacion](#violacion-de-atestacion "mention")
* [#nodo-slasher](#nodo-slasher "mention")
* [#slot](#slot "mention")
* [#staker-individual](#staker-individual "mention")
* [#voto-de-origen](#voto-de-origen "mention")
* [#staker](#staker "mention")
* [#staking-cli](#staking-cli "mention")
* [#destinatario-de-tarifas-sugerido](#destinatario-de-tarifas-sugerido "mention")
* [#comite-de-sincronizacion](#comite-de-sincronizacion "mention")
* [#voto-destino](#voto-destino "mention")
* [#validadores](#validadores "mention")
  * [#elegible-para-activacion-y-activacion-estimada](#elegible-para-activacion-y-activacion-estimada "mention")
  * [#indice-unico](#indice-unico "mention")
  * [#saldo-actual-y-saldo-efectivo](#saldo-actual-y-saldo-efectivo "mention")
* [#ciclo-de-vida-del-validador](#ciclo-de-vida-del-validador "mention")
  * [#1.-depositar](#1.-depositar "mention")
  * [#2.-pendiente](#2.-pendiente "mention")
  * [#3.-validador-activo](#3.-validador-activo "mention")
  * [#4.-slashing-validator](#4.-slashing-validator "mention")
  * [#5.-salida-del-validad](#5.-salida-del-validad "mention")
* [#grupo-de-validadores](#grupo-de-validadores "mention")
* [#cola-de-validacion](#cola-de-validacion "mention")
* [#frase-semilla-mnemotecnico](#frase-semilla-mnemotecnico "mention")
* [#direccion-de-retiro](#direccion-de-retiro "mention")

***

## nodo de almacenamiento

* Almacena todo lo que se mantiene en un [#nodo-completo](#nodo-completo "mention") y crea un archivo de estados históricos.&#x20;
* Los nodos de archivo son necesarios si desea consultar algo como el saldo de una cuenta en un bloque en particular.&#x20;
* Estos datos representan unidades de terabytes (más de 20 TB para Geth), lo que hace que los nodos de archivo sean menos atractivos para la mayoría de los usuarios, pero pueden ser útiles para servicios como exploradores de bloques, proveedores de billeteras y análisis de cadenas.

La sincronización de software clientes en cualquier modo que no sea de archivo dará como resultado la eliminación de los datos extra de la cadena de bloques. Esto significa que no un nodo completo no cuenta con todos los estados históricos, pero el nodo completo puede recrearlos a pedido.

No se requiere que los nodos de archivo participen en la validación de bloques y, en teoría, pueden construirse desde cero simplemente reproduciendo los bloques desde génesis.

\*\*\*\*[**Fuente ↗**](https://ethereum.org/en/developers/docs/nodes-and-clients/#archive-node)

## atestación

Votos de [#validadores](#validadores "mention")[ ](#validadores)que confirman la validez de un [#bloque](#bloque "mention"). En momentos designados, cada validador es responsable de publicar diferentes certificaciones que declaran formalmente la visión actual de la cadena del validador, incluido el último [#checkpoints](#checkpoints "mention") finalizado y la [#cabeza-de-cadena](#cabeza-de-cadena "mention") actual.

Cada validador activo crea una atestación por [#epoca](#epoca "mention") (\~6,5 minutos), que consta de los siguientes componentes:

| Componente                                         | Descripcion                                                                                                                                                                                                                      |
| -------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Comité**                                         | Una lista de bits de validadores donde la posición se asigna al índice del validador en su comité. El valor (0/1) indica si el validador firmó los datos (es decir, si están activos y de acuerdo con el proponente del bloque). |
| **Slot**                                           | El número de slot al que hace referencia la atestación.                                                                                                                                                                          |
| **Índice**                                         | A number that identifies which committee the validator belongs to in a given slot.                                                                                                                                               |
| **Voto de cabeza de cadena (beacon\_block\_root)** | The root hash of the block the validator sees at the head of the chain (the result of applying the fork-choice algorithm).                                                                                                       |
| **Origen**                                         | Parte del voto de finalidad que indica lo que los validadores ven como el bloque justificado más reciente.                                                                                                                       |
| **Destino**                                        | Parte del voto de finalidad que indica lo que los validadores ven como el primer bloque en la época actual.                                                                                                                      |
| **Firma**                                          | Una firma BLS que agrega las firmas de validadores individuales.                                                                                                                                                                 |

Un componente importante relacionado con la eficacia es el voto de cabeza de cadena. Este es un voto que hace el validador sobre lo que cree que es el último bloque válido en la cadena al momento de certificar. La estructura de una votación principal en cadena consta de los siguientes componentes:

* Slot - Define _dónde_ cree el validador que se encuentra el cabezal de cadena actual.
* Hash - Define _lo que_ el validador cree que es el cabezal de cadena actual.

La combinación define de forma única un punto en la cadena de bloques. Al combinar suficientes votos de cabeza de cadena, la red Ethereum llega a un consenso sobre el estado de la cadena.

[**Fuente (ethereum.org) ↗**](https://ethereum.org/en/developers/docs/consensus-mechanisms/pos/attestations/)\
[**Fuente (Attestant) ↗**](https://www.attestant.io/posts/defining-attestation-effectiveness/)

## agregador de atestaciones

Aunque los datos en cada atestación son relativamente pequeños, se acumulan rápidamente con decenas de miles de validadores. Como estos datos se almacenarán para siempre en la cadena de bloques, es importante minimizarlos, y esto se hace a través de un proceso conocido como agregación de atestación.

La agregación toma múltiples atestaciones que han elegido votar con el mismo comité, voto principal en cadena y voto definitivo, y las fusiona en una única atestación agregada.

Una atestación agregada difiere en dos aspectos de una atestación simple. En primer lugar, se enumeran varios validadores. En segundo lugar, la firma es una firma agregada hecha a partir de las firmas de las atestaciones simples coincidentes. Las atestaciones agregadas son muy eficientes para almacenar, pero introducen comunicaciones adicionales y cargas computacionales.

Si se requiriera que cada validador agregara todas las atestaciones, sobrecargaría rápidamente la red con la cantidad de comunicaciones requeridas para pasar cada atestación a cada validador. Del mismo modo, si la agregación fuera puramente opcional, los validadores no se molestarían en desperdiciar sus propios recursos al hacerlo. En su lugar, la red elige un subconjunto de validadores para llevar a cabo tareas de agregación. Les interesa hacer un buen trabajo, ya que es más probable que se incluyan atestaciones agregadas con un mayor número de validadores en la cadena de bloques, por lo que es más probable que el validador sea recompensado.

Los validadores que realizan este proceso de agregación se conocen como **agregadores**.

[_**Fuente ↗**_](https://www.attestant.io/posts/defining-attestation-effectiveness/)

## beacon chain

Una parte importante del trabajo de la beacon chain es almacenar y administrar el registro de [#validadores](#validadores "mention") - el conjunto de participantes responsables de ejecutar el sistema Ethereum [#proof-of-stake-pos](#proof-of-stake-pos "mention").

Este registro se utiliza para:

* Assigns validators their duties.
* Asigna a los validadores sus funciones.
* Finaliza los [#checkpoints](#checkpoints "mention").&#x20;
* Realice una generación de números aleatorios (RNG) a nivel de protocolo.&#x20;
* Avanza la [#beacon-chain](#beacon-chain "mention"). Vote en la [#chain-head](#chain-head "mention") elegir el fork.

[_**Fuente ↗**_](https://notes.ethereum.org/@djrtwo/Bkn3zpwxB#High-level-overview)

## bloque

Un bloque es una unidad de información agrupada que incluye una lista ordenada de transacciones e información relacionada con el consenso. Los bloques son propuestos por validadores de [Proof of Stake (PoS)](#proof-of-stake-pos)), momento en el que se comparten en toda la red peer-to-peer, donde todos los demás nodos pueden verificarlos fácilmente de forma independiente. Las reglas de consenso rigen qué contenidos de un bloque se consideran válidos, y la red ignora cualquier bloque no válido. El orden de estos bloques y las transacciones en ellos crean una cadena determinista de eventos cuyo final representa el estado actual de la red.

## proponente de bloque

Un [#validadores](#validadores "mention") elegido por [#beacon-chain](#beacon-chain "mention") para proponer el siguiente [#bloque](#bloque "mention"). Solo puede haber un bloque válido por [#slot](#slot "mention").

## estado del Bloque

### Propuesto (Proposed)

El bloque fue propuesto por un validador.

### Programado (Scheduled)

Los validadores están enviando datos actualmente.

### Perdido/omitido (Missed/skipped)

El proponente no propuso el bloque dentro del plazo dado, por lo que el bloque se perdió/se saltó.

### Huérfano (Orphaned)

Para entender esto, miremos el diagrama debajo de "1, 2, 3, ..., 9" representan los slots (ranuras).

1. El validador en el slot 1 propone el bloque "a".
2. El validador en el slot 2 propone "b".
3. El slot 4 se está omitiendo porque el validador no propuso un bloque (por ejemplo, fuera de línea).
4. En el slot 5/6 se produce una bifurcación: el validador (5) propone un bloque, pero el validador (6) no recibe estos datos (por ejemplo, el bloque no los alcanzó lo suficientemente rápido). Por lo tanto, Validator(6) propone su bloque con la información más reciente que ve de validator(3).
5. La [regla de elección de fork (bifurcación) ↗](https://notes.ethereum.org/@vbuterin/rkhCgQteN?type=view#LMD-GHOST-fork-choice-rule)  es la clave aquí: decide cuál de las cadenas disponibles es la canónica.

## cadena canónica

La cadena canónica es la cadena que se acuerda que es la cadena "principal" y no un [fork](#fork).

## cabeza de cadena

El último bloque recibido por un validador. Esto no significa necesariamente que sea la cabeza de la [#cadena-canonica](#cadena-canonica "mention").

## checkpoints

La [#beacon-chain](#beacon-chain "mention") tiene un tempo dividido en [#slot](#slot "mention")s (12 segundos) y [#epoca](#epoca "mention")s (32 slots). El primer slot en cada época es un checkpoint. Cuando una gran mayoría de validadores [da fe ](#atestacion)del vínculo entre dos checkpoints, se pueden [justificar ](#justificacion)y luego, cuando se justifica otro checkpoint encima, se pueden [finalizar](#finalizacion).

## software cliente

Una implementación del software Ethereum que verifica las transacciones en un bloque. Estos pueden ser [clientes de capa de consenso](https://ethereum.org/en/developers/docs/nodes-and-clients/#consensus-clients)  o [clientes de capa de ejecución](https://ethereum.org/en/developers/docs/nodes-and-clients/#execution-clients). Cada validador necesita tanto un cliente de capa de ejecución como un cliente de capa de consenso.

## comités

Un grupo de al menos 128 [#validadores](#validadores "mention") asignados para validar bloques en cada [#slot](#slot "mention"). Uno de los validadores del comité es el agregador, responsable de agregar las firmas de todos los demás validadores del comité que acuerdan una [#atestacion](#atestacion "mention"). No debe confundirse con los [#comite-de-sincronizacion](#comite-de-sincronizacion "mention").

## capa de consenso

La capa de consenso de Ethereum es la red de [consensus-clients.md](validator-clients/consensus-clients.md "mention").

## contrato de depósito

El contrato de depósito es la puerta de entrada a Ethereum [#proof-of-stake-pos](#proof-of-stake-pos "mention") y se administra a través de un **contrato inteligente** en Ethereum. El contrato inteligente acepta cualquier transacción con una cantidad mínima de 1 ETH y [#datos-de-entrada](#datos-de-entrada "mention") válidos. Los nodos de [#beacon-chain](#beacon-chain "mention") escuchan el contrato de depósito y usan los datos de entrada para acreditar cada validador.&#x20;

[_Más información sobre el contrato de depósito_](para-empezar/deposit-process.md)

## efectividad

El tiempo medio que tardan las certificaciones de un validador en incluirse en la cadena.

[_Revisa nuestra página sobre validator effectiveness_ ](validator-clients/validator-effectiveness.md)

## época

**1 época = 32** [**slots**](#slot)\
Representa el número de 32 slots (12 segundos) y tarda aproximadamente **6,4 minutos**. Las épocas juegan un papel importante cuando se trata de la cola y la finalidad del validador.

epresents the number of 32 slots (12 seconds) and takes approximately **6.4 minutes.** Epochs play an important role when it comes to the [validator queue](#validator-queue) and [finality](#finalization).

## capa de ejecución

La capa de ejecución de Ethereum es la red de [clientes de ejecución](validator-clients/execution-clients.md).&#x20;

## finalización

En Ethereum [#proof-of-stake-pos](#proof-of-stake-pos "mention") al menos dos tercios de los validadores deben ser honestos, por lo tanto, si hay dos [#epoca](#epoca "mention") en competencia y un tercio de los [#validadores](#validadores "mention") deciden ser maliciosos, recibirán una penalización. Los validadores honestos serán recompensados.

Para determinar si se ha finalizado una época, los validadores deben ponerse de acuerdo sobre las últimas dos épocas seguidas, luego todas las épocas anteriores se pueden considerar finalizadas.

### problemas de finalidad

Si hay menos del 66,6% del total de votos posibles (la [#tasa-de-participacion](#tasa-de-participacion "mention")) en una época específica, la época no se puede justificar. Como se mencionó en "Finalización", se requieren tres épocas consecutivas justificadas para alcanzar la finalización. Mientras la cadena no pueda alcanzar este estado, tiene problemas de finalidad.

&#x20;there are less than 66.6% of the total possible votes (the [participation rate](#participation-rate)) in a specific epoch, the epoch cannot be [justified](#justification). As mentioned in "[Finalization](#finalization)", three justified epochs in a row are required to reach finality. As long as the chain cannot reach this state it has finality issues.

During finality issues, the validator [entry queue](#validator-queue) will be halted and new validators will not be able to join the network, however, inactive validators with less than 16 ETH balance will be exited from the network. This leads to more stability in the network and a higher participation rate, allowing the chain to eventually finalize.

## fork

Un cambio en el protocolo que provoca la creación de una cadena alternativa o una divergencia temporal en dos posibles rutas de bloques. Ver también [#hard-fork](#hard-fork "mention")

## nodo completo

Almacena y mantiene los datos completos de la cadena de bloques en el disco. Provee datos de blockchain a solicitud y ayuda a respaldar la red participando en la validación de bloques y verificando todos los bloques y estados. Todos los estados se pueden derivar de un nodo completo.

[**Fuente ↗**](https://www.quicknode.com/guides/infrastructure/ethereum-full-node-vs-archive-node)

## bloque Génesis

El primer bloque en una cadena de bloques, utilizado para inicializar una red en particular y su criptomoneda.

## hard fork

Se produce un hard fork  cuando se envía una actualización a la red Ethereum y la nueva versión del software se bifurca de la versión anterior. Por lo general, requiere que los operadores actualicen su software de validación para permanecer en el lado correcto del fork. Ver también  [#fork](#fork "mention")

## voto principal

El validador ha votado oportunamente por la [#cabeza-de-cadena](#cabeza-de-cadena "mention") correcto.

## fuga de inactividad

Si Beacon Chain ha pasado más de cuatro [#epoca](#epoca "mention")s sin [#finalizacion](#finalizacion "mention"), se activa un protocolo de emergencia llamado "fuga de inactividad". El fin último de la fuga de inactividad es crear las condiciones necesarias para que la cadena recupere la finalidad. La finalidad requiere una mayoría de 2/3 del ether total apostado para acordar los puntos de [#checkpoints](#checkpoints "mention"). Si los validadores que representan más de 1/3 del total de validadores se desconectan o no envían las [#atestacion](#atestacion "mention") correctas, entonces no es posible que una gran mayoría de 2/3 finalice los [#checkpoints](#checkpoints "mention"). La fuga de inactividad permite que la participación perteneciente a los validadores inactivos se desangre gradualmente hasta que controlen menos de 1/3 de la participación total, lo que permite que los validadores activos restantes finalicen la cadena. Por grande que sea el grupo de validadores inactivos, los validadores activos restantes eventualmente controlarán >2/3 de la apuesta. ¡La pérdida de participación es un fuerte incentivo para que los validadores inactivos se reactiven lo antes posible!

## distancia de inclusión

La distancia de inclusión de un [#slot](#slot "mention") es la diferencia entre el slot en el que se realiza una [#atestacion](#atestacion "mention") y el número de slot  más bajo del bloque en el que se incluye la [#atestacion](#atestacion "mention"). Por ejemplo, una atestación realizada en el slot _s_ e incluida en el bloque en la ranura _s + 1_ tiene una distancia de inclusión de 1. Si, en cambio, la atestación se incluyera en el bloque en el slot _s + 5_, la distancia de inclusión sería 5.

El valor de una certificación de la red Ethereum depende de su distancia de inclusión, siendo preferible una distancia de inclusión baja. Esto se debe a que cuanto antes se presente la información a la red, más útil será.

Para reflejar el valor relativo de una certificación, la recompensa otorgada a un validador por certificar se escala de acuerdo con la distancia de inclusión. Específicamente, la recompensa se multiplica por 1/d, donde d es la distancia de inclusión.

<figure><img src="/assets/img/gitbook/InclusionDistance.png" alt="Attestation Reward Inclusion Distance Distribution"><figcaption></figcaption></figure>

## datos de entrada

Los datos de entrada, también llamados **datos de depósito**, son una secuencia de 842 caracteres generada por el usuario. Representa la [#llave-publica](#llave-publica "mention") y la llave pública de retiro, que fueron firmadas con la [#llave-privada](#llave-privada "mention") del validador. Los datos de entrada deben agregarse a la transacción del [#contrato-de-deposito](#contrato-de-deposito "mention") para que la [#beacon-chain](#beacon-chain "mention") los identifique.

[_Más información sobre el contrato de depósito_](para-empezar/deposit-process.md)

## justificación

El 66,6% del total de validadores necesitan dar fe a favor de la inclusión de un bloque en la [#cadena-canonica](#cadena-canonica "mention"). Esta condición actualiza el bloque a "justificado". Es poco probable que los bloques justificados se reviertan, pero pueden hacerlo bajo ciertas condiciones.&#x20;

Cuando se justifica otro bloque encima de un bloque justificado, se actualiza a "finalizado". Finalizar un bloque es un compromiso de incluir el bloque en la cadena canónica.&#x20;

[_Más información sobre la justificación ↗_](https://ethereum.org/en/developers/docs/consensus-mechanisms/pos/gasper/)

## clientes ligeros

Un cliente de Ethereum que no almacena una copia local de la cadena de bloques ni valida bloques y transacciones. Ofrece las funciones de una billetera y puede crear y transmitir transacciones.

## MEV

MEV o "valor extraíble máximo", es un tema controversial. Los operadores de nodos pueden extraer MEV aceptando bloques creados por "buscadores", a través de un pequeño programa secundario llamado  "[mev-boost ↗](https://ethresear.ch/t/mev-boost-merge-ready-flashbots-architecture/11177)". En este caso, el cliente de la capa de consenso, como Nimbus, Teku, etc., cuando se le solicite obtener un bloque para proponer, obtendrá bloques de los relés MEV a través de mev-boost y del cliente de la capa de ejecución, como Besu, Geth, etc. y luego elija el bloque del relé que mejor pague. Actualmente, la capa de ejecución no comunica su pago esperado y solo se elegiría cuando el relevo no ofrezca ningún bloque. Para esto, se debe confiar en que el relé entregará bloques válidos. Las recompensas de MEV se pagan a la misma dirección del destinatario de la tarifa sugerida que las tarifas prioritarias.

Las recompensas de MEV se pagan a la misma dirección del destinatario de la tarifa sugerida que las tarifas prioritarias.

ewards from MEV are paid to the same [suggested fee recipient](#suggested-fee-recipient) address as [priority fees](#priority-fees).

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

## tarifas de prioridad

Casi todas las transacciones en Ethereum establecen una [tarifa de prioridad ↗](https://ethereum.org/en/developers/docs/gas/#priority-fee) para incentivar a los [#proponente-de-bloque](#proponente-de-bloque "mention") a incluir la transacción como una prioridad más alta que otras. Cuanto mayor sea la tarifa en relación con otras transacciones que actualmente esperan en el [#mempool](#mempool "mention") Esta tarifa se paga al proponente del bloque. Todas las tarifas de prioridad en un bloque se agregan y pagan en un solo cambio de estado directamente al [#destinatario-de-tarifas-sugerido](#destinatario-de-tarifas-sugerido "mention") establecido por el proponente del bloque. Esta dirección podría ser una billetera de hardware, una billetera de software o incluso un contrato de múltiples firmas.

## llave privada

(Private Key) Un número secreto que permite a los usuarios de Ethereum demostrar la propiedad de una cuenta o contratos mediante la producción de una firma digital.

## proof of stake (PoS)

Un método por el cual un protocolo de cadena de bloques de criptomonedas tiene como objetivo lograr un consenso distribuido. PoS pide a los usuarios que demuestren la propiedad de una cierta cantidad de criptomonedas (su "participación" en la red) para poder participar en la validación de transacciones.

## llave publica

Un número, derivado a través de una función unidireccional de una [#llave-privada](#llave-privada "mention"), que puede ser compartido públicamente y utilizado por cualquier persona para verificar una firma digital realizada con la clave privada correspondiente.

## firmar

Demostrar criptográficamente que un mensaje o transacción fue aprobado por el titular de una  [#llave-privada](#llave-privada "mention").

## ofensa deducibles

Si su validador comete un delito que puede implicar deducciones (slashing), será forzado a salir del grupo de validadores y se le deducirá ETH según las circunstancias del evento. Por lo general, esto será 1-2 ETH, pero podría ser [significativamente más ↗](https://ethereum.org/en/developers/docs/consensus-mechanisms/pos/rewards-and-penalties/#slashing).

Esto no es algo de lo que deba preocuparse demasiado, hay [pasos simples](help/slashing-explained.md) que puede seguir para asegurarse de no invocar un evento de slashing.

Hay tres formas que probocan esto, todas las cuales equivalen a la propuesta deshonesta o la certificación de bloques.

### violación de atestación

* **Votación doble:** Firma de dos [#atestacion](#atestacion "mention")es  diferentes en una [#epoca](#epoca "mention").
* **Votos envolventes**: Atestar a un bloque que "rodea" a otro (efectivamente cambiando la historia).

### Infracción del proponente

* **Propuesta de doble bloque:** [Proponer ](#proponente-de-bloque)y [#firmar](#firmar "mention") firmar dos bloques diferentes para un mismo [#slot](#slot "mention").

## nodo slasher

El [slasher ](https://github.com/Buttaa/ethstaker/blob/main/slasher.md)**es una entidad propia**, pero requiere un [#beacon-chain](#beacon-chain "mention") para recibir [atestaciones](#atestacion). Para encontrar actividad maliciosa por parte de los validadores, los slashers iteran a través de todas las atestaciones recibidas hasta que se encuentra una ofensa dedicul que se puede cortar. Los recortes encontrados se transmiten a la red y el siguiente [#proponente-de-bloque](#proponente-de-bloque "mention") agrega la prueba al [#bloque](#bloque "mention"). El proponente del bloque recibe una recompensa por cortar al validador malicioso. Sin embargo, el denunciante (Slasher) no recibe una recompensa.

## slot

**32 slots = 1** [#epoca](#epoca "mention")\
Un período de tiempo de 12 segundos en el que un validador elegido al azar tiene tiempo para proponer un bloque. El número total de validadores se divide en [#committees](#committees "mention") y uno o más comités individuales son responsables de dar fe de cada puesto. Se elegirá un validador del comité para que sea el agregador, mientras que los otros 127 validadores dan fe. Después de cada época, los validadores se mezclan y fusionan en nuevos comités. Cada espacio puede tener o no un bloque, ya que un validador podría perder su propuesta (por ejemplo, puede estar desconectado o enviar su bloque demasiado tarde). Hay un mínimo de 128 validadores por comité.

## staker individual

Un operador que ejecuta un validador en la red Ethereum sin un protocolo entre su validador y [#beacon-chain](#beacon-chain "mention")

## voto de origen

El validador ha votado oportunamente por el origen correcto del [checkpoint](#checkpoint).

## staker

Alguien que ha depositado ETH en un validador para asegurar la red. Puede ser alguien que ejecuta un validador (un operador) o alguien que depositó su ETH en un grupo, donde otra persona es el operador del validador.

## staking CLI

Una herramienta de línea de comandos utilizada para generar claves de validación y depositar archivos de datos.

* [https://github.com/ethereum/staking-deposit-cli](https://github.com/ethereum/staking-deposit-cli)

## destinatario de tarifas sugerido

El destinatario de la tarifa es una dirección de Ethereum nominada por un validador de [#beacon-chain](#beacon-chain "mention") para recibir las tarifas de transacciones de usuarios y [#mev](#mev "mention").

## comité de sincronización

Un comité de sincronización es un grupo de [#validadores](#validadores "mention")seleccionados al azar que se actualizan cada \~27 horas. Su propósito es agregar sus [#firmar](#firmar "mention") a encabezados de bloque válidos. Los comités de sincronización permiten a los [#clientes-ligeros](#clientes-ligeros "mention")  realizar un seguimiento de la [#chain-head](#chain-head "mention") jefe de la cadena de bloques sin necesidad de acceder a todo el conjunto de validadores. Ocurre cada 2 años en promedio, sin embargo, puede haber "períodos secos" varias veces más largos que el promedio sin que se dé uno. Entonces, si su validador es seleccionado... ¡felicidades! 🥳

## voto destino

El validador ha votado a tiempo por el destino correcto del [checkpoint](#checkpoints).

## validadores

Un nodo en un sistema de [#proof-of-stake-pos](#proof-of-stake-pos "mention") responsable de almacenar datos, procesar transacciones y agregar nuevos bloques a la cadena de bloques. Para activar el software de validación, debe poder aportar 32 ETH. El trabajo de los validadores es proponer bloques y firmar atestaciones. Tiene que estar en línea durante al menos el 50% del tiempo para tener retornos positivos. Un validador lo ejecuta un operador (un ser humano), en el hardware (una computadora) y se empareja con un nodo (muchos miles de validadores pueden ejecutarse en un nodo)

### elegible para activación y activación estimada

Se refiere a validadores pendientes. El depósito ha sido reconocido por [#beacon-chain](#beacon-chain "mention") en la marca de tiempo de "Elegible para activación". Si hay una cola de [validadores pendientes ↗](https://www.beaconcha.in/validators), se calcula una marca de tiempo estimada para la activación.

### índice único

Cada validador recibe un índice único en función de cuándo se agregan desde el [validator queue](#validator-queue).

### saldo actual y saldo efectivo

El saldo actual es la cantidad de ETH que tiene el validador a partir de ahora. El saldo efectivo representa un valor calculado por el saldo actual. Se utiliza para determinar el tamaño de una recompensa o penalización que recibe un validador. El saldo efectivo nunca puede ser superior a 32 ETH.&#x20;

Para aumentar el saldo efectivo, el validador requiere "saldo efectivo + 1.25 ETH". En otras palabras, si el saldo efectivo es de 20 ETH, se requiere un saldo actual de 21,25 ETH para tener un saldo efectivo de 21 ETH. El saldo efectivo se ajustará una vez que caiga 0,25 por debajo del umbral, como se ve en los ejemplos anteriores.

Aquí hay ejemplos de cómo cambia el saldo efectivo:

* Si el saldo actual es 32,00 ETH, el saldo efectivo es 32,00 ETH.
* Si el saldo actual se redujo de 22 ETH a 21,76 ETH, el saldo efectivo será de **22,00 ETH**.
* Si el saldo actual aumenta a 22,25 **y** el saldo efectivo es de 21 ETH, el saldo efectivo aumentará a 22 ETH.

## ciclo de vida del validador

#### 1. Depositar

Se han depositado 32 ETH en el [#contrato-de-deposito](#contrato-de-deposito "mention") y este estado se mantendrá durante unas 7 horas. Esto ofrece seguridad en caso de que la cadena Ethereum sea atacada.

#### 2. Pendiente

Esperando la activación en el [Beacon Chain](#beacon-chain).

Antes de que los validadores ingresen al la [#cola-de-validacion](#cola-de-validacion "mention"), necesitan ser votados por otros validadores activos. Esto ocurre cada 4 horas.

#### 3. Validador activo

Actualmente atestando y proponiendo bloques.

El validador permanecerá activo hasta que:

* Su saldo cae por debajo de 16 ETH (expulsado).
* Salida voluntaria.
* Sea slashed.

#### 4. Slashing validator

El validador ha sido malicioso y será cortado y expulsado del sistema.

> Una _**Penalty**_ es una recompensa negativa (por ejemplo, por desconectarse).\
> Un _**Slashing**_ es un penalidad grande (≥ 1/32 de saldo en juego) y una salida contundente... **. - Justin Drake**

#### 5. Salida del validador

* **Expulsado:** El saldo del validador cayó por debajo de un umbral y fue expulsado por la red.
* **Salida:** Salida voluntaria, el titular de la clave de retiro tiene la capacidad de retirar el saldo actual del saldo del validador correspondiente.

## grupo de validadores

El número de validadores actualmente activos que aseguran la red Ethereum. El grupo de validadores actual se puede [ver aquí ↗](https://beaconcha.in/validators).

## cola de validación

La cola de validación es una cola de primero en entrar, primero en salir para activar y salir de los validadores en el [#beacon-chain](#beacon-chain "mention").

* Hasta 327680 validadores activos en la red, se pueden activar 4 validadores por [#epoca](#epoca "mention"). Por cada (4 \* 16384) = **65536** validadores activos, la tasa de activación del validador aumenta en uno.
* 5 validadores por época requiere 327680 validadores activos, lo que permite 1125 validadores por día.
* 6 validadores por época requiere 393216 validadores activos, lo que permite 1350 validadores por día.
* 7 validadores por época requiere 458752 validadores activos, lo que permite 1575 validadores por día.
* 8 validadores por época requiere 524288 validadores activos, lo que permite 1800 validadores por día.
* 9 validadores por época requiere 589824 validadores activos, lo que permite 2025 validadores por día.
* 10 validadores por época requiere 655360 validadores activos, lo que permite 2200 validadores por día.
* La cantidad de activaciones escala con la cantidad de validadores activos y el límite es el conjunto de validadores activos dividido por 64.

La salida de validadores funciona de la misma manera, con la cantidad de validadores que pueden salir de Beacon Chain por tasa diaria limitada para preservar la estabilidad de la red.

## frase semilla / mnemotécnico

La frase semilla o mnemotécnica es un conjunto de palabras (generalmente de 12, 18 o 24 palabras) que se utiliza para generar sus claves de validación. Su mnemónico es la copia de seguridad de sus claves de validación y será la ÚNICA forma de retirar su ETH cuando llegue el momento y nadie puede ayudarlo a recuperar su mnemónico si lo pierde.

## dirección de retiro

Una dirección que se puede configurar opcionalmente al crear una clave de validación que se usará para retirar ETH apostado. Si esta dirección no se configura en el momento de la creación de la clave, se puede configurar en el momento del retiro. Para obtener más información sobre cómo configurar la dirección de retiro en la creación de la clave, consulte nuestra respuesta a las [preguntas frecuentes](/es/faq.md).
