# Estoy preocupado por las deducciones (slashing)🔪

El slashing es una palabra que asusta. Pero, ¿qué es exactamente, cómo puede suceder y cuánto debe preocuparte?

!!! info "Info"
    TLDR: Realísticamente, la única condición que puede causar un evento de [slashing](../../staking-glossary#slashable-offenses) es si ejecutas las claves de tu validador en dos nodos al mismo tiempo (como un sistema de conmutación / redundancia, donde tu nodo de respaldo se enciende accidentalmente mientras tu nodo principal todavía está en funcionamiento). No permitas que esto suceda y no serás objeto de un slashing.

    **El slashing no puede ocurrir por estar desconectado por mantenimiento**.

### ¿Qué es el Slashing?

El slashing es un término utilizado para describir la respuesta de la red Ethereum a un validador que actúa en contra de las reglas de la red. Los validadores realizan una serie de tareas (por ejemplo, [atestaciones](../../staking-glossary#attestation) y [proponer bloques](../../staking-glossary#block-proposer)).\


Si alguien quisiera atacar la red Ethereum, podría proponer múltiples bloques o atestiguar múltiples bloques en conflicto. Para desincentivar los ataques a la red, en un sistema [Proof of Stake (PoS)](../../staking-glossary#proof-of-stake-pos), los validadores tienen algo en juego, que actualmente son 32 ETH por validador. Cuando un validador infringe las reglas de la red, sucederán dos cosas:

1. Se toma una cantidad de ETH del saldo inicial de 32 ETH depositados inicialmente al lanzar el validador.
2. El validador es expulsado forzosamente y eliminado del [pool de validadores](../../staking-glossary#validator-pool).

La cantidad de ETH tomada como penalización varía según el estado de la red. Si un pequeño número de validadores son objeto de un slashing al mismo tiempo, entonces una estimación aproximada de la penalización por slashing es de 1 o 2 ETH. En un evento Black Swan increíblemente raro, cuando una gran parte de la red está simultáneamente desconectada o infringiendo las reglas (por ejemplo, en un ataque coordinado), entonces la penalización por slashing puede ser de hasta el 100% de la apuesta.

Ser expulsado forzosamente de la cola de validadores actualmente bloquea tu staking, ya que los [retiros no están habilitados](../../faq#can-i-withdraw-my-eth-at-any-time). Cuando los retiros estén habilitados, podrás volver a apostar tus ETH restantes (si todavía tienes los 32 requeridos), después de pasar por la [cola de salida](../../staking-glossary#validator-queue) y la [cola de activación](../../staking-glossary#validator-queue).
