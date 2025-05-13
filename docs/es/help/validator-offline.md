# ¡Mi validador está desconectado! ¿Qué debo hacer?

## ¡No entre en pánico!

La penalización por faltar a las atestaciones es exactamente la misma que la recompensa por una exitosa. Cualquier penalización por tiempo de inactividad se recuperará en la misma cantidad de tiempo de actividad.

[Proponer un bloque es raro](../../rewards/proposal-frequency). Dependiendo del tamaño del [pool de validadores](../../staking-glossary#validator-pool), un único validador en promedio sólo propondrá un bloque cada pocos meses. Si tienes la mala suerte de estar desconectado en el momento en que se le pide a tu validador que proponga un bloque, también está bien.

La red Ethereum es robusta y está diseñada para manejar estas situaciones. Si pierdes tu propuesta de bloque, la [ranura](https://github.com/Buttaa/ethstaker/blob/main/help/staking-glossary.md#slot) que debería haber contenido tu bloque estará vacía. Además de las [recompensas](https://github.com/Buttaa/ethstaker/blob/main/help/rewards/chain-rewards.md) perdidas por no proponer el bloque, no hay penalizaciones ni deducciones que ocurran por una propuesta de bloque perdida.

Los sistemas automáticos de conmutación por error y de copia de seguridad pueden parecer una buena idea, pero son mucho mucho más propensos a causar un evento de deducción (por ejemplo, doble propuesta) que un proceso de recuperación manual. Perder algunos días de recompensas puede parecer malo en ese momento, ¡pero ser reducido y perder potencialmente MESES de recompensas es mucho peor!

## Volviendo a estar en línea

* TODO
  * Resolución de problemas iniciales
  * Resincronización
