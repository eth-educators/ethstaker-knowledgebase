# Estoy preocupado por el tiempo de inactividad 😔

No deberías preocuparte por el tiempo de inactividad, pero comprender lo que sucede cuando tu validador está fuera de línea puede ayudarte a ganar confianza como validador en solitario.

{% hint style="info" %}
La red Ethereum está diseñada pensando en los validadores en solitario. Esto significa que el protocolo es muy indulgente si un validador tiene tiempo de inactividad o está fuera de línea.

Si un validador está fuera de línea y no está ejecutando sus deberes, se le penalizará a una tasa ligeramente menor que las recompensas por el mismo período de tiempo.
{% endhint %}

## Escenario de ejemplo

* Comienzas como validador en solitario en casa con 32 ETH.
* Todo va bien y después de unos meses, el saldo de tu validador es de 32,5 ETH.
* Entonces... ¡tu validador se desconecta! 🚨\
  Si esto sucede de verdad, consulta la guía "Mi  "[¡Mi validador está desconectado! ¿Qué hago?"](validator-offline.md).

### Fuga por inactividad

* Tan pronto como tu validador ya no participe en la red, comenzará a [fugarse](../staking-glossary.md#inactivity-leak) ETH.&#x20;
  * Cuando estás desconectado, por cada atestación perdida, la fuga por inactividad podría ser de alrededor de -0,000011 ETH (la fuga por inactividad es ligeramente menor que una atestación exitosa).
  * Por una atestación exitosa normal, podrías ser recompensado con 0,000014 ET.
* Si tienes una falla catastrófica y no puedes volver a conectar tu validador en línea durante 5 días, entonces tomará aproximadamente 5 días de estar en línea para volver al mismo saldo que cuando ocurrió la falla.

### Propuestas de bloque perdidas

Si estás desconectado, no podrás producir un bloque. Pero ¿con qué frecuencia ocurren las propuestas de bloque para un solo validador? Actualmente, en promedio, un validador propondrá un bloque cada 2-3 meses.

Entonces, en este escenario de ejemplo, incluso si estás desconectado por 5 días, hay solo una pequeña posibilidad de que te pierdas una propuesta de bloque. ¿Pero qué pasa si pierdes una propuesta de bloque?

Si pierdes tu propuesta de bloque, el [slot](https://github.com/Buttaa/ethstaker/blob/main/help/staking-glossary.md#slot) que debería haber contenida tu bloque estará vacío. Aparte de las [recompensas](https://github.com/Buttaa/ethstaker/blob/main/help/rewards/chain-rewards.md) perdidas por faltar a la propuesta de bloque, no hay **penalizaciones ni deducciones** que ocurran por una propuesta de bloque perdida.

### ¿Puedo recibir deducciones por estar desconectado?

No. En realidad, la única condición que puede causar un [evento de deduccion](https://github.com/Buttaa/ethstaker/blob/main/help/staking-glossary.md#slashable-offenses) es si ejecutas las claves de tu validador en dos nodos al mismo tiempo (como una configuración de conmutación por error / redundancia, donde tu nodo de respaldo se enciende accidentalmente mientras tu nodo principal todavía está funcionando). No permitas que esto suceda y no recibirás deducciones. **Las deducciones no pueden ocurrir por mantenimiento fuera de línea**.

## ¿Qué pasa si no puedo recuperar mi validador y / o quiero dejar de hacer staking?

Si no puedes recuperar tu validador o decides dejar de hacer staking, tienes la opción de sacar tu validador. Aunque actualmente no se permiten retiros, aún puedes sacar a tu validador de la red. Esto significa que, aunque no podrás recuperar tu saldo de validador de inmediato (hasta que se permitan los retiros), no recibirás ninguna penalización por estar desconectado una vez que el validador salga de la [cola de retiro](../staking-glossary.md#validator-queue). Sacar un validador es actualmente un proceso unidireccional. Para obtener más detalles sobre cómo sacar tu validador, [consulta nuestra guía](../tutorials/how-to-exit-a-validator.md).

## Conclusión

Ser un validador en solitario es una responsabilidad importante para garantizar la salud a largo plazo de la red Ethereum. En EthStaker, nuestro objetivo es ayudar a la mayor cantidad de personas posible a [#stakefromhome ↗](https://twitter.com/search?q=%23stakefromhome), y esta información se proporciona para mostrar que el tiempo de inactividad y estar fuera de línea no es algo de lo que preocuparse excesivamente.
