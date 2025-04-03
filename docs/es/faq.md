# Preguntas Frequentes de Staking

* [¿Puedo ser sancionado por estar desconectado?](#puedo-ser-sancionado-por-estar-desconectado)
* [¿Puedo dejar de correr mi validador durante unos días y luego volver a iniciarlo?](#puedo-dejar-de-correr-mi-validador-durante-unos-dias-y-luego-volver-a-iniciarlo)
* [¿Puedo retirar mi ETH en cualquier momento?](#puedo-retirar-mi-eth-en-cualquier-momento)
* [¿Cómo se incentiva a los validadores a permanecer activos y honestos?](#como-se-incentiva-a-los-validadores-a-permanecer-activos-y-honestos)
* [¿Por cuanto tiempo son válidos los mensajes de salida pre firmados?](#por-cuanto-tiempo-son-validos-los-mensajes-de-salida-pre-firmados)
* [¿Cuánto ETH necesito para hacer staking y convertirme en validador?](#cuanto-eth-necesito-para-hacer-stake-y-convertirme-en-validador)
* [Estoy abrumado y no sé por donde empezar, ¿qué puedo hacer?](#estoy-abrumado-y-no-se-por-donde-empezar-que-puedo-hacer)
* [¡Propuse un bloque! ¿Qué gané?](#propuse-un-bloque-que-gane)
* [¿Se muestra la dirección de depósito u origen en algún lugar?](#se-muestra-la-direccion-de-deposito-u-origen-en-algun-lugar)
* [¿Hay una penalización por perder una propuesta de bloque?](#hay-una-penalizacion-por-perder-una-propuesta-de-bloque)
* [¿Hay una penalización por perder una certificación?](#hay-una-penalizacion-por-perder-una-certificacion)
* [¿Hay alguna ventaja en tener más de 32 ETH en participación?](#hay-alguna-ventaja-en-tener-mas-de-32-eth-en-participacion)
* [¿Debería establecer una dirección de retiro al configurar mi validador?](#deberia-establecer-una-direccion-de-retiro-al-configurar-mi-validador)
* [¿Qué es un validador exactamente?](#que-es-un-validador-exactamente)
* [¿Qué pasa si pierdo las llaves de mi validador?](#que-pasa-si-pierdo-las-llaves-de-mi-validador)
* [¿Qué pasa si pierdo la frase semilla o mnemónica de mi validador?](#que-pasa-si-pierdo-la-frase-semilla-o-mnemonica-de-mi-validador)
* [¿Y si quiero dejar de participar?](#y-si-quiero-dejar-de-participar)
* [¿Qué es un operador de nodos?](#que-es-un-operador-de-nodos)
* [¿Qué es un cliente del validador?](#que-es-un-cliente-del-validador)
* [¿Qué es el contrato de depósito?](#que-es-el-contrato-de-deposito)
* [¿Cuál es la forma más fácil de participar individualmente desde casa?](#cual-es-la-forma-mas-facil-de-participar-individualmente-desde-casa)
* [¿Cuál es el compromiso de tiempo de correr un validador?](#cual-es-el-compromiso-de-tiempo-de-correr-un-validador)
* [¿Cuándo debería recargar el balance de mi validador?](#cuando-deberia-recargar-el-balance-de-mi-validador)
* [¿Por qué tengo que tener fondos en participación?](#por-que-tengo-que-tener-fondos-en-participacion)
* [¿Por qué el máximo de 32 ETH?](#por-que-el-maximo-de-32-eth)

## ¿Puedo ser sancionado por estar desconectado?

No. Realmente la única condición que puede causar una [sanción](../staking-glossary#slashable-offenses) es si usas las llaves de tu validador en dos nodos al mismo tiempo (como una conmutación por error / configuración de redundancia, donde tu nodo de respaldo se enciende accidentalmente mientras el principal sigue en funcionamiento). No permitas que esto suceda y no serás sancionado. **No se puede ser sancionado por estar desconectado por mantenimiento**.

## ¿Puedo dejar de correr mi validador durante unos días y luego volver a iniciarlo?

Sí, pero con penalizaciones pequeñas. Consulta [Estoy preocupado por el tiempo de inactividad](../help/downtime-explained).

## ¿Puedo retirar mi ETH en cualquier momento?

Los retiros no están actualmente habilitados en la [Beacon chain](../staking-glossary#beacon-chain). Esto significa que todo el ETH depositado quedará bloqueado en el contrato de staking hasta un momento futuro (abril 2023) en el que se permitirán los retiros tras una actualización de la red.

Puedes ver más información en la página de preguntas frecuentes de la Ethereum Foundation (en inglés) [https://notes.ethereum.org/@launchpad/withdrawals-faq](https://notes.ethereum.org/@launchpad/withdrawals-faq)

Si tu validador propone un bloque, parte de las recompensas estarán disponibles de forma inmediata en forma de [fees de prioridad](../rewards/chain-rewards) y [MEV](../rewards/chain-rewards) (si estás usando un relay con [MEV-Boost](../validator-clients/mev-boost)).

En el futuro, cuando los retiros estén habilitados, podrás retirar tu ETH al salir del validador y esperar en la [cola de retiro](../staking-glossary#validator-queue).

## ¿Cómo se incentiva a los validadores a permanecer activos y honestos?

Como validador, eres [recompensado](../rewards/chain-rewards) por proponer / atestiguar bloques que se incluyan en la cadena. Por otro lado, puedes ser [penalizado por estar desconectado](../rewards/chain-rewards#penalizaciones-de-validador) y comportarte de manera maliciosa, por ejemplo, atestiguando bloques inválidos o contradictorios.

El concepto clave es el siguiente:

* Las recompensas se otorgan por acciones que ayuden a la red a llegar a un consenso.
* Hay pequeñas penalizaciones por acciones involuntarias que obstaculizan el consenso.
* Grandes [penalizaciones](#hay-una-penalizacion-por-perder-una-certificacion) (o 'slashings') por acciones maliciosas.

En otras palabras, maximizas tus recompensas al proporcionar el mayor beneficio a la red.

## ¿Por cuanto tiempo son válidos los mensajes de salida pre firmados?

Los mensajes de salida pre firmados sólo se mantienen válidos para dos hard forks. Tras estos deberás generar nuevos.

Esto se debe a [https://github.com/ethereum/consensus-specs/blob/dev/specs/phase0/beacon-chain.md#get\_domain](https://github.com/ethereum/consensus-specs/blob/dev/specs/phase0/beacon-chain.md#get\_domain), específicamente la línea:

```
fork_version = state.fork.previous_version if epoch < state.fork.epoch else state.fork.current_version
```

Un mensaje de salida firmado en cualquier época anterior al último hard fork se agrupa en una "versión anterior" y se le asigna su versión del fork. Esto significa que si tu operación fue firmada hace dos forks, la función de verificación tiene la versión del fork incorrecta, y por lo tanto el dominio equivocado, la raíz equivocada y fallará al verificar.

## ¿Cuánto ETH necesito para hacer staking y convertirme en validador?

Cada par de llaves asociado con un validador requiere bloquear 32 ETH para activarse, lo cual representa tu balance inicial, además de tu poder de voto inicial y máximo para cualquier validador.

## Estoy abrumado y no sé por donde empezar, ¿qué puedo hacer?

Hay muchas opciones para participar haciendo staking en Ethereum, esto sin duda puede ser abrumador.

Tómalo con calma. Primero aprende sobre las [opciones que tienes](../getting-started/what-is-ethereum-staking#como-participar-con-sus-eth) y escoge la que más te convenga. No hay necesidad de apurarse y perder el sueño.

Si escoges "staking individual en casa" y quieres correr tu propio validador, decide entre las diferentes [opciones de hardware](../hardware/hardware-requirements) (e.j. Intel NUC) y sigue una [guía de staking](../tutorials/solo-staking-guides) en una red de prueba primero. Busca guías de staking para la red de pruebas Goerli. Toma notas, averigua que sucede cuando desconectas el cable de alimentación del validador, como actualizar, etc. En resumen, obtén experiencia con tu nodo antes de hacer staking en la red principal de Ethereum.

Igualmente, no tienes que enfrentar los problemas tu solo.

No dudes en hacernos cualquier pregunta y únete a nuestra comunidad de [Discord](https://discord.io/ethstaker).

## ¡Propuse un bloque! ¿Qué gané?

Los validadores que participan en asegurar la [Beacon chain](../staking-glossary#beacon-chain) y realizan sus "deberes" son recompensados por ello mediante la emisión de ETH nuevo. Además, los validadores reciben fees de prioridad pagados por los usuarios, y MEV (Maximal Extractable Value) opcionalmente.

Puedes ver las recompensas por bloques propuestos de un validador mirando la dirección del receptor de los fees en [etherscan.io↗](https://etherscan.io) bajo `Produced Blocks`.

<figure><img src="/assets/img/gitbook/image (6) (1).png" alt="Etherscan proposed block rewards"><figcaption></figcaption></figure>

Puedes ver una explicación detallada aquí: [¿Cómo gana ETH mi validador?](../rewards/chain-rewards)

## ¿Se muestra la dirección de depósito u origen en algún lugar?

Si, la dirección de depósito u origen se muestra en el validador. Sin embargo, no se usa para nada en el protocolo. La [capa de consenso](../staking-glossary#consensus-layer) no tiene registro de desde qué dirección se realizó el depósito de un validador, pero queda registrado en el historial de la [capa de ejecución](../staking-glossary#execution-layer) al igual que todas las demás transacciones.

La dirección de depósito u origen se puede ver en [beaconcha.in](https://beaconcha.in) bajo `Deposits` -> `Ethereum Deposits` -> `From Address`.

<figure><img src="/assets/img/gitbook/image (16) (3).png" alt="Deposit address shown on beaconcha.in"><figcaption></figcaption></figure>

## ¿Hay una penalización por perder una propuesta de bloque?

No. Si pierdes una propuesta de bloque, la [ranura](../staking-glossary#slot) que debería contener tu bloque estará vacía. A parte de las [recompensas](../rewards/chain-rewards) perdidas por perder la propuesta del bloque, **no hay ninguna penalidad o sanción** que ocurra por una propuesta de bloque perdida.

## ¿Hay una penalización por perder una certificación?

Perder algunas certificaciones es completamente normal y extremadamente económico. La penalidad por perder una [certificación](../staking-glossary#attestation) es exactamente la misma que la recompensa por una exitosa. Por lo tanto, con alrededor de 240 certificaciones al día por validador, perder uno o dos sigue siendo una tasa exitosa de más del 99%.

## ¿Hay alguna ventaja en tener más de 32 ETH en participación?

No. No hay ninguna ventaja en tener más de 32 ETH en participación.

Depositar más de 32 ETH en el mismo set de llaves no incrementa el potencial de recompensas, o acumula recompensas por encima de 32 ETH ya que cada [validador](../staking-glossary#validator) está limitado a un balance de 32. Esto significa que se participa en incrementos de 32 ETH, cada uno con su único set de llaves y balance.

## ¿Debería establecer una dirección de retiro al configurar mi validador?

Establecer una [dirección de retiro](../staking-glossary#withdrawal-address) cuando creas las llaves de tu validador puede ser útil ya que no tendrás que configurarla de nuevo cuando se habiliten los retiros.

La [interfaz de línea de comando de depósito de participación](../staking-glossary#staking-deposit-cli) puede establecer una dirección de retiro cuando se crea el json de depósito. Si un usuario decide no hacerlo, normalmente por omisión, entonces establece el hash de la llave pública de retiro en su lugar. En algún momento futuro, posiblemente con la actualización Shangai/Capella, habrá una herramienta que tome la mnemónica y firme un mensaje para efectuar un cambio único de credenciales v0, llave de retiro, a credenciales v1, dirección de retiro.

Y eso es todo. Una vez tu validador usa credenciales v1, la dirección de retiro no puede ser cambiada. Bajo el diseño actual, las barridas son automáticas, igual que los retiros completos: Los retiros completos ocurren solo cuando se completa la salida del validador.

Es poco probable que se cree una herramienta para exportar la llave de retiro, tampoco sería muy útil. Necesitas la llave de retiro como mucho dos veces:

* Una vez para generar la llave de firma (solo si no estableciste una dirección de retiro en ese momento).
* Una vez más para firmar un mensaje para establecer una.

En ambos casos la llave puede ser generada dentro del CLI, ser usada para su propósito, y después descartarse sin haber sido escrita en el disco.

Sin embargo, hay algunos casos a tomar en cuanta donde es preferible **no** establecer una dirección de depósito al principio:

* Si planeas migrar tu validador a una piscina en el futuro (e.j. RocketPool), no podrás hacer esta migración si configuras una [dirección de retiro](../staking-glossary#withdrawal-address) cuando creas las llaves de tu validador. Necesitarías esperar a que se habiliten los retiros, esperar en la fila de retiros y después volver a entrar a un validador, potencialmente teniendo que esperar una fila de activación también.

## ¿Qué es un validador exactamente?

Un validador es una entidad virutal que vive en la [Beacon chain](../staking-glossary#beacon-chain), representado por un balance, [llave pública](../staking-glossary#public-key) y otras propiedades. También participa en el [consenso](../staking-glossary#consensus-layer) de la red de Ethereum.

## ¿Qué pasa si pierdo las llaves de mi validador?

Si hay una falla catastrófica de tu validador y pierdes sus llaves no te preocupes. Estas pueden ser fácilmente recuperadas siempre y cuando tengas la [frase semilla o mnemónica de tu validador](../staking-glossary#validator-seed-phrase-mnemonic). Simplemente sigue las mismas instrucciones que cuando generaste por primera vez las llaves de tu validador, e instálalas en una nueva máquina validadora.

> Tienes que estar 100% seguro de que las máquinas anteriores no volverán a estar en línea, ya que esto resultará en un [evento de penalización](../staking-glossary#slashable-offenses).

## ¿Qué pasa si pierdo la frase semilla o mnemónica de mi validador?

Si pierdes la frase semilla usada para generar las llaves de tu validador, entonces es probable que el ETH en participación no se pueda recuperar.

De todas formas, si tienes una dirección de retiro, las llaves del validador son suficientes para firmar una salida voluntaria, lo que resultaría en un retiro a esa dirección. También está el caso especial si tienes un mensaje de salida voluntario previamente firmado, pero estos normalmente solo son usados por servicios de staking y los ponemos en esta guía para mantenerla completa.

## ¿Y si quiero dejar de participar?

Si no puedes recuperar tu validador o decides que quieres dejar de participar, tienes la opción de salir de tu validador. Aunque los retiros no están habilitados, puedes hacer que tu validador salga de la red. Esto significa que, aunque no vas a poder tener el balance de tu validador de inmediato (hasta que se activen los retiros), no vas a ser penalizado por estar fuera de línea una vez el validador sale de la [fila de retiro](../staking-glossary#validator-queue). Salir de un validador es un proceso de una vía ahora mismo. Para más detalles sobre como salir de tu validador, [revisa nuestra guía](../tutorials/how-to-exit-a-validator).

## ¿Qué es un operador de nodos?

Un operador de nodos es un humano que se asegura de que el software del cliente esta corriendo de forma apropiada, manteniendo el hardware según sea necesario.

## ¿Qué es un cliente del validador?

Un cliente del [validador](../staking-glossary#validator) es el software que actúa a nombre del validador al sostener y usar sus llaves privadas para hacer certificaciones acerca del estado de la cadena. Un único cliente validador puede tener multiples pares de llaves, controlando varios validadores.

## ¿Qué es el contrato de depósito?

Puedes pensar en el contrato de depósito como una transferencia de fondos desde una cuenta de Ethereum hasta una cuenta de un validador de prueba de participación. Especifica quién está participando, quién está validando, cuánto ETH hay participando, y quién puede retirar los fondos.

## ¿Cuál es la forma más fácil de participar individualmente desde casa?

Configurar tu propio validador para participar individualmente desde casa no es complicado.

Puedes seguir estas [guías de participación](../tutorials/solo-staking-guides) paso a paso, lo que no te tomará mucho tiempo. Puedes revisar también el [compromiso de tiempo](#what-is-the-time-commitment-for-running-a-validator).

De todas formas, hay opciones de hardware pre-configuradas como [Dappnode↗](https://dappnode.com/) o [Avado↗](https://ava.do/), que pueden hacer todo más fácil y eliminar la necesidad de interactuar con la interfaz de línea de comando o Linux en general. También puedes instalar el software de código abierto de [Dappnode ↗](https://docs.dappnode.io/user/quick-start/core/installation/) en tu propio hardware para tener una experiencia de participación más intuitiva.

## ¿Cuál es el compromiso de tiempo de correr un validador?

La mayoría del compromiso de tiempo por participar es el aprendizaje y configuración inicial. Te tomará probablemente un día o dos de prueba y error para tener todo listo (quizás más, y eso también está bien). Una vez tengas todo listo solo vas a tener que actualizar una vez al mes más o menos (toma diez minutos) y arreglar apagones u otros problemas, los cuales no son frecuentes.

## ¿Cuándo debería recargar el balance de mi validador?

La respuesta a esta pregunta depende bastante de cuanto ETH tengas a tu disposición. Ciertamente deberías recargar si tu balance está cerca de 16 ETH. Esto es para asegurarte de que no salgas del conjunto de validadores (lo cual pasa automáticamente si tu balance cae por debajo de 16 ETH). En el otro lado del espectro, si tu balance está por los 31 ETH, probablemente no merezca la pena añadir el ETH restante para llegar a 32.

## ¿Por qué tengo que tener fondos en participación?

Como un validador, tienes que tener fondos en participación para que puedas ser penalizado por comportarte de forma deshonesta. En otras palabras, para mantenerte honesto, tus acciones tienen que tener consecuencias financieras.

## ¿Por qué el máximo de 32 ETH?

Cada 32 ETH se activa un conjunto de llaves de validador. Estas llaves se usan para firmar el estado de la red. Mientras más bajo sea la cantidad de ETH requerido, más firmas deberán ser guardadas por la red. 32 ETH fue escogido como un balance entre permitir que participen la mayor cantidad de personas posibles sin inhibir la descentralización de la red al llenar el espacio de cada bloque con firmas.

Limitar la cantidad máxima a 32 ETH por validador fomenta la descentralización del poder, ya que evita que un solo validador tenga un voto excesivamente grande sobre el estado de la cadena. También limita la cantidad de ETH que puede salir de participación en un momento dado, ya que la cantidad de validadores que pueden salir en cada periodo es limitado. Esto ayuda a proteger la red contra ciertos ataques.

Aunque el voto de un validador se pondera por la cantidad que tiene en participación, el peso de voto comienza y tiene un límite en 32. Es posible caer por debajo de esto con un rendimiento deficiente del nodo, pero no es posible elevarlo. No deposites más de 32 ETH para un solo validador. No crecerán las recompensas y estarán bloqueados hasta que se [habiliten los retiros](#puedo-retirar-mi-eth-en-cualquier-momento).
