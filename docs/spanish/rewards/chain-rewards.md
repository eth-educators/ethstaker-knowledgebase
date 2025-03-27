# ¿Cómo gana ETH mi validador?

Los validadores que participan en la seguridad del [Beacon Chain](/spanish/staking-glossary#beacon-chain) y ejecutan "tareas" son recompensados por esto mediante la nueva emisión de ETH. Además, los validadores reciben tarifas prioritarias pagadas por los usuarios y opcionalmente [MEV](/spanish/staking-glossary#MEV). Los validadores son recompensados por ejecutar esos deberes mediante la nueva emisión de ETH en el "saldo del validador". El APY actual se puede ver en la [plataforma de lanzamiento oficial](https://launchpad.ethereum.org/en/)[↗](https://launchpad.ethereum.org/en/).

<table><thead><tr><th width="178">Tipo</th><th>Capa</th><th>Frecuencia</th><th>Monto</th></tr></thead><tbody><tr><td><a href="/spanish/staking-glossary#attestation">Atestación</a></td><td><a href="/spanish/staking-glossary#consensus-layer">Consenso</a></td><td>Una vez por <a href="/spanish/staking-glossary#epoch">Epoch</a> (cada 6.4 minutos en promedio)</td><td>0.000014 ETH*</td></tr><tr><td><a href="https://app.gitbook.com/o/5TLAFycQGS1YA3kIVVOf/s/qceavar0TsKoVat3fJGq/~/changes/18/staking-glossary#block-proposer">Propuesta de bloque</a> </td><td><a href="/spanish/staking-glossary#consensus-layer">Consenso</a></td><td><a href="/spanish/rewards/proposal-frequency">Cada 2 meses en promedio</a></td><td>0.02403 ETH*</td></tr><tr><td><a href="/spanish/staking-glossary#sync-committee">comité de sincronización</a></td><td><a href="/spanish/staking-glossary#consensus-layer">Consenso</a></td><td>Cada 2 años en promedio**</td><td>0.11008 ETH*</td></tr><tr><td><a href="/spanish/staking-glossary#slasher-node">Slashing Reward</a></td><td><a href="/spanish/staking-glossary#consensus-layer">Consenso</a></td><td>Muy raramente incluido en Propuestas de Bloques</td><td>Hasta 0.0625 ETH</td></tr><tr><td><a href="/spanish/staking-glossary#priority-fees">Priority Fees</a></td><td><a href="/spanish/staking-glossary#execution-layer">Ejecución</a></td><td>Incluido en cada Propuesta de Bloque que contenga transacciones</td><td>Típicamente 0.01 a 0.1 ETH; muy raramente 1+ ETH</td></tr><tr><td><a href="/spanish/staking-glossary#mev">MEV Rewards</a></td><td><a href="/spanish/staking-glossary#execution-layer">Ejecución</a></td><td>También incluido en Propuestas de Bloques al usar <a href="/validator-clients/mev-boost">MEV-boost</a></td><td>Típicamente 0.01 a 0.1 ETH; muy raramente 1+ ETH</td></tr></tbody></table>

_\*Varía según el número total de validadores en la red. La estimación mostrada es aproximada para 435,000 validadores activos._&#x20;

_\*\*Estos están sujetos a la aleatoriedad; puede haber "rachas secas" varias veces más largas que el promedio sin recibir una._

Las recompensas proporcionadas en el [Consenso](/spanish/staking-glossary#consensus-layer) actualmente no son líquidas. Están bloqueadas en la cadena hasta que se implementen los [retiros](/spanish/faq#can-i-withdraw-my-eth-at-any-time). Las recompensas proporcionadas en la [Ejecución](/spanish/staking-glossary#execution-layer), sin embargo, son líquidas y se pueden acceder instantáneamente.

[Fuente↗](https://docs.rocketpool.net/guides/node/responsibilities.html#how-ethereum-staking-works)

## Penalizaciones de validador

Si el validador está fuera de línea y no está ejecutando sus deberes, será penalizado a una tasa ligeramente menor que las recompensas por el mismo período de tiempo.

Los validadores son penalizados por pequeñas cantidades de ETH si están desconectados y no realizan sus deberes asignados. Esto se llama [**leaking**](/spanish/staking-glossary#inactivity-leak). Si un validador viola una de las reglas principales de la cadena Beacon y parece estar atacando la red, puede ser [**slashed**](/spanish/staking-glossary#slashable-offenses). Slash es una salida forzosa de su validador sin su permiso, acompañada de una multa relativamente grande que elimina parte del saldo de ETH de su validador.

Realísticamente, la única condición que puede causar un slashing es si ejecuta las claves de su validador en dos nodos al mismo tiempo (como una configuración de conmutación por error / redundancia, donde su nodo de respaldo se enciende accidentalmente mientras su nodo principal todavía se está ejecutando). No deje que esto suceda y **no tendrá slashing**. El slashing no puede ocurrir por estar fuera de línea para mantenimiento.

A continuación, se muestra una tabla que muestra las penalizaciones que pueden ocurrirle a un validador:

| Tipo                                                                                                                                               | Capa                                               | Monto                                                                                                       |
| -------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- |
| [Atestación](/spanish/staking-glossary#attestation) perdida                                                                                           | [Consenso](/spanish/staking-glossary#consensus-layer) | 0.000011 ETH\* por atestación (-9/10 del valor de una recompensa de atestación normal)                      |
| [Propuesta de bloque](https://app.gitbook.com/o/5TLAFycQGS1YA3kIVVOf/s/qceavar0TsKoVat3fJGq/\~/changes/18/staking-glossary#block-proposer) perdida | [Consenso](/spanish/staking-glossary#consensus-layer) | 0                                                                                                           |
| Perdida de [comité de sincronización](/spanish/staking-glossary#sync-committee)                                                                       | [Consenso](/spanish/staking-glossary#consensus-layer) | 0.00047 ETH\* por epoch (-0.1 ETH en total si está fuera de línea durante todo el comité de sincronización) |
| [Slashing](/spanish/staking-glossary#slashable-offenses)                                                                                              | [Consenso](/spanish/staking-glossary#consensus-layer) | Al menos 1/32 de su saldo, hasta todo su saldo en circunstancias extremas                                   |

_\*Varía según el número total de validadores en la red. La estimación mostrada es aproximada para 435,000 validadores activos._

!!! info "Info"
    Como regla general, si está desconectado durante X horas (y no está en un [comité de sincronización](/spanish/staking-glossary#sync-committee)), recuperará todo su ETH perdido después de X horas una vez que vuelva a estar en línea y atestando.

[Fuente ↗](https://docs.rocketpool.net/guides/node/responsibilities.html#penalties)
