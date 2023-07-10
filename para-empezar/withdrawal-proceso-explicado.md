# Withdrawal: proceso explicado

### Recompensas por staking

Los pagos de recompensas se procesan automáticamente para las cuentas de validadores activos con un balance efectivo máximo de 32 ETH.

Cualquier balance por encima de los 32 ETH obtenido a través de las recompensas no contribuye realmente al principal ni aumenta el peso de este validador en la red, y se retira automáticamente como un pago de recompensa cada pocos días. Aparte de proporcionar una dirección de retiro una vez, estas recompensas no requieren ninguna acción por parte del operador del validador. Todo esto se inicia en la capa de consenso, por lo que no se requiere gas (fee de transacción) en ningún paso.

### Salir completamente del staking

Es necesario proporcionar _una_ dirección de retiro antes de que se puedan transferir fondos desde el balance de una cuenta de validador.

Los usuarios que deseen salir por completo del staking y retirar todo su balance también deben firmar y transmitir un mensaje de "voluntary exit" (salida voluntaria) con las claves del validador, lo cual iniciará el proceso de salida del staking. Esto se hace con tu cliente de validador y se envía a tu nodo de beacon, y no requiere gas.

El proceso de salida de un validador del staking lleva un tiempo variable, según la cantidad de personas que están saliendo al mismo tiempo. Una vez completado, esta cuenta ya no será responsable de realizar tareas de validación en la red, no será elegible para recompensas y ya no tendrá sus ETH "en staking". En este momento, la cuenta se marcará como completamente "withdrawable".

Una vez que se haya marcado una cuenta como "withdrawable" y se hayan proporcionado las credenciales de retiro, no hay nada más que el usuario deba hacer aparte de esperar. Las cuentas son barridas automáticamente y de forma continua por los proponentes de bloques en busca de fondos salientes elegibles, y el saldo de tu cuenta se transferirá en su totalidad (también conocido como "full withdrawal") durante la próxima [barrida](https://ethereum.org/en/staking/withdrawals/#validator-sweeping).

### ¿Cómo funcionan los pagos de retiro?

Se determina si un validador es elegible para un retiro o no por el estado de la propia cuenta del validador. En ningún momento se necesita la intervención del usuario para determinar si una cuenta debe iniciar un retiro o no; todo el proceso se realiza automáticamente por la capa de consenso en un ciclo continuo.

#### Barriendo los validadores

Cuando un validador está programado para proponer el siguiente bloque, se le exige construir una cola de retiro con un máximo de 16 retiros elegibles. Esto se hace comenzando originalmente con el índice del validador 0, determinando si hay un retiro elegible para esta cuenta según las reglas del protocolo y agregándolo a la cola en caso de que exista. El validador designado para proponer el siguiente bloque continuará donde lo dejó el último, avanzando en orden indefinidamente.

{% hint style="info" %}
Piensa en un reloj analógico. La aguja del reloj señala la hora, avanza en una dirección, no salta ninguna hora y eventualmente vuelve al principio después de llegar al último número.

Ahora, en lugar de tener los números del 1 al 12, imagina que el reloj tiene los números del 0 a N _(el número total de cuentas de validadores que se hayan registrado en la Beacon Chain, más de 500,000 hasta enero de 2023)_.

La aguja del reloj señala el siguiente validador que debe verificarse para los retiros elegibles. Comienza en 0 y avanza sin omitir ninguna cuenta. Cuando se llega al último validador, el ciclo continúa desde el principio.
{% endhint %}

#### Verificación de una cuenta para retiros

Mientras un proponente está revisando los validadores en busca de retiros posibles, cada validador que se verifica se evalúa en función de una breve serie de preguntas para determinar si se debe iniciar un retiro y, de ser así, cuántos ETH se deben retirar.

1. **¿Se ha proporcionado una dirección de retiro?** Si no se ha proporcionado una dirección de retiro, la cuenta se omite y no se inicia ningún retiro.
2. **¿El validador ha salido y es retirable ("withdrawable")?** Si el validador ha salido por completo y hemos alcanzado la época en la que se considera que su cuenta es "withdrawable", se procesará un retiro completo. Esto transferirá todo el saldo restante a la dirección de retiro.
3. **¿El saldo efectivo ha alcanzado el máximo de 32 ETH?** Si la cuenta tiene credenciales de retiro, no ha salido por completo y tiene recompensas superiores a 32 esperando, se procesará un retiro parcial que transferirá solo las recompensas superiores a 32 a la dirección de retiro del usuario.

Durante el ciclo de vida de un validador, solo se realizan dos acciones que influyen directamente en este flujo:

* Proporcionar credenciales de retiro para habilitar cualquier forma de retiro.
* Salir de la red, lo que iniciará un retiro completo.

#### Gas free

Este enfoque de retiros de staking evita que los stakers tengan que enviar manualmente una transacción solicitando una cantidad específica de ETH para retirar. Esto también significa que **no se requiere gas (fee de transacción)** y los retiros tampoco compiten por el espacio existente de bloques de la capa de ejecución.

#### ¿Con qué frecuencia recibiré mis recompensas de staking?

Un máximo de 16 retiros pueden procesarse en un solo bloque. A ese ritmo, se pueden procesar hasta 115,200 retiros de validadores por día (suponiendo que no haya slots perdidos). Como se mencionó anteriormente, los validadores sin retiros elegibles se omitirán, lo que disminuirá el tiempo necesario para completar la barrida.

Ampliando este cálculo, podemos estimar el tiempo que llevará procesar una cantidad determinada de retiros:&#x20;

| Number of withdrawals | Time to complete |
| :-------------------: | :--------------: |
|        400,000        |     3.5 days     |
|        500,000        |     4.3 days     |
|        600,000        |     5.2 days     |
|        700,000        |     6.1 days     |
|        800,000        |     7.0 days     |

Como puedes ver, esto se ralentiza a medida que hay más validadores en la red. Un aumento en los bloques perdidos podría disminuirlo proporcionalmente, pero esto generalmente representa el lado más lento de los resultados posibles.

Fuente: [https://ethereum.org/en/staking/withdrawals/](https://ethereum.org/en/staking/withdrawals/)
