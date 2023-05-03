# ¿Cómo gana ETH mi validador?

Los validadores que participan en la seguridad del [Beacon Chain](../staking-glossary.md#beacon-chain) y ejecutan "tareas" son recompensados por esto mediante la nueva emisión de ETH. Además, los validadores reciben tarifas prioritarias pagadas por los usuarios y opcionalmente [MEV](../staking-glossary.md#MEV). Los validadores son recompensados por ejecutar esos deberes mediante la nueva emisión de ETH en el "saldo del validador". El APY actual se puede ver en la [plataforma de lanzamiento oficial](https://launchpad.ethereum.org/en/)[↗](https://launchpad.ethereum.org/en/).

| Tipo                                                                                                                                        | Capa                                                | Frecuencia                                                                                       | Monto                                            |
| ------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------- | ------------------------------------------------------------------------------------------------ | ------------------------------------------------ |
| [Atestación](../staking-glossary.md#attestation)                                                                                            | [Consenso](../staking-glossary.md#consensus-layer)  | Una vez por [Epoch](../staking-glossary.md#epoch) (cada 6.4 minutos en promedio)                 | 0.000014 ETH\*                                   |
| [Propuesta de bloque](https://app.gitbook.com/o/5TLAFycQGS1YA3kIVVOf/s/qceavar0TsKoVat3fJGq/\~/changes/18/staking-glossary#block-proposer)  | [Consenso](../staking-glossary.md#consensus-layer)  | [Cada 2 meses en promedio](proposal-frequency.md)                                                | 0.02403 ETH\*                                    |
| [comité de sincronización](../staking-glossary.md#sync-committee)                                                                           | [Consenso](../staking-glossary.md#consensus-layer)  | Cada 2 años en promedio\*\*                                                                      | 0.11008 ETH\*                                    |
| [Slashing Reward](../staking-glossary.md#slasher-node)                                                                                      | [Consenso](../staking-glossary.md#consensus-layer)  | Muy raramente incluido en Propuestas de Bloques                                                  | Hasta 0.0625 ETH                                 |
| [Priority Fees](../staking-glossary.md#priority-fees)                                                                                       | [Ejecución](../staking-glossary.md#execution-layer) | Incluido en cada Propuesta de Bloque que contenga transacciones                                  | Típicamente 0.01 a 0.1 ETH; muy raramente 1+ ETH |
| [MEV Rewards](../staking-glossary.md#mev)                                                                                                   | [Ejecución](../staking-glossary.md#execution-layer) | También incluido en Propuestas de Bloques al usar [MEV-boost](../validator-clients/mev-boost.md) | Típicamente 0.01 a 0.1 ETH; muy raramente 1+ ETH |

_\*Varía según el número total de validadores en la red. La estimación mostrada es aproximada para 435,000 validadores activos._&#x20;

_\*\*Estos están sujetos a la aleatoriedad; puede haber "rachas secas" varias veces más largas que el promedio sin recibir una._

Las recompensas proporcionadas en el [Consenso](../staking-glossary.md#consensus-layer) actualmente no son líquidas. Están bloqueadas en la cadena hasta que se implementen los [retiros](../faq.md#can-i-withdraw-my-eth-at-any-time). Las recompensas proporcionadas en la [Ejecución](../staking-glossary.md#execution-layer), sin embargo, son líquidas y se pueden acceder instantáneamente.

[Fuente↗](https://docs.rocketpool.net/guides/node/responsibilities.html#how-ethereum-staking-works)

## Penalizaciones de validador

Si el validador está fuera de línea y no está ejecutando sus deberes, será penalizado a una tasa ligeramente menor que las recompensas por el mismo período de tiempo.

Los validadores son penalizados por pequeñas cantidades de ETH si están desconectados y no realizan sus deberes asignados. Esto se llama [**leaking**](../staking-glossary.md#inactivity-leak). Si un validador viola una de las reglas principales de la cadena Beacon y parece estar atacando la red, puede ser [**slashed**](../staking-glossary.md#slashable-offenses). Slash es una salida forzosa de su validador sin su permiso, acompañada de una multa relativamente grande que elimina parte del saldo de ETH de su validador.

Realísticamente, la única condición que puede causar un slashing es si ejecuta las claves de su validador en dos nodos al mismo tiempo (como una configuración de conmutación por error / redundancia, donde su nodo de respaldo se enciende accidentalmente mientras su nodo principal todavía se está ejecutando). No deje que esto suceda y **no tendrá slashing**. El slashing no puede ocurrir por estar fuera de línea para mantenimiento.

A continuación, se muestra una tabla que muestra las penalizaciones que pueden ocurrirle a un validador:

| Tipo                                                                                                                                               | Capa                                               | Monto                                                                                                       |
| -------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- |
| [Atestación](../staking-glossary.md#attestation) perdida                                                                                           | [Consenso](../staking-glossary.md#consensus-layer) | 0.000011 ETH\* por atestación (-9/10 del valor de una recompensa de atestación normal)                      |
| [Propuesta de bloque](https://app.gitbook.com/o/5TLAFycQGS1YA3kIVVOf/s/qceavar0TsKoVat3fJGq/\~/changes/18/staking-glossary#block-proposer) perdida | [Consenso](../staking-glossary.md#consensus-layer) | 0                                                                                                           |
| Perdida de [comité de sincronización](../staking-glossary.md#sync-committee)                                                                       | [Consenso](../staking-glossary.md#consensus-layer) | 0.00047 ETH\* por epoch (-0.1 ETH en total si está fuera de línea durante todo el comité de sincronización) |
| [Slashing](../staking-glossary.md#slashable-offenses)                                                                                              | [Consenso](../staking-glossary.md#consensus-layer) | Al menos 1/32 de su saldo, hasta todo su saldo en circunstancias extremas                                   |

_\*Varía según el número total de validadores en la red. La estimación mostrada es aproximada para 435,000 validadores activos._

{% hint style="info" %}
Como regla general, si está desconectado durante X horas (y no está en un [comité de sincronización](../staking-glossary.md#sync-committee)), recuperará todo su ETH perdido después de X horas una vez que vuelva a estar en línea y atestando.
{% endhint %}

[Fuente ↗](https://docs.rocketpool.net/guides/node/responsibilities.html#penalties)
