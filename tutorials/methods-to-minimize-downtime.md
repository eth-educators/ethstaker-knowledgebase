# Métodos para minimizar el tiempo de inactividad

{% hint style="info" %}
Recuerda que nunca se deben configurar las claves del validador en múltiples máquinas al mismo tiempo, ya que si la misma clave del validador está activa dos veces en la red, se producirá una [_deducción (slashing)_](../staking-glossary.md#slashable-offenses). Las claves solo deben configurarse para un validador al mismo tiempo.
{% endhint %}

Habiendo dicho eso, vamos a entrar en detalle. A continuación mostraremos algunas cosas que puedes hacer para minimizar el tiempo de inactividad.

Siempre habrán situaciones en las que tendrás tiempo de inactividad, esto es inevitable al ejecutar un validador, por lo tanto no esperes un registro de atestaciones perfecto. Sin embargo, hay algunas cosas que puedes hacer para _minimizar_ el tiempo de inactividad.

Las siguientes ideas pueden o no ser factibles dependiendo de la cantidad de validadores que estés ejecutando. Te pedimos evaluar por ti mismo los pros y cons, y decide si es apropiado implementarlas según tus circunstancias.

### Conectar tu nodo y router a un UPS

Esto asegurará que tu equipo no se apague abruptamente, lo que potencialmente salvará tu hardware de daños, así como evitará la corrupción de tu base de datos/sistema operativo, ahorrándote la necesidad de resincronizar o reinstalar. Puedes encontrar más información al respecto en la página de [prácticas de hardware recomendadas](../hardware/hardware-best-practices.md).

### Ejecutar múltiples pares de clientes de Consenso-Ejecución

Siempre es buena práctica correr múltiples pares de clientes ya sea en diferentes SSDs o en máquinas separadas. Una máquina separada es importante _siempre y cuando_ estés corriendo un número considerable de validadores, de lo contrario mantener diferentes SSDs será suficiente.

Es seguro ejecutar múltiples nodos para redundancia, pero no múltiples validadores. Por ejemplo, [Lighthouse admite esto de forma nativa](https://lighthouse-book.sigmaprime.io/redundancy.html).

El beneficio de hacer esto es que no tendrás ningún tiempo de inactividad en caso de que uno de los pares de clientes se desconecte, se corrompa o si el SSD deje de funcionar y requiera mantenimiento manual para volver a estar en línea. Podrás solucionar el nodo dañado cuando se te sea posible y mientras tanto el validador seguirá activo sin inconvenientes utilizando el otro nodo beacon previamente configurado.

Incluso puedes llevarlo un paso más allá y tener tu cliente validador en un SSD separado (por ejemplo, junto con tu sistema operativo) y hacer que apunte a tus nodos beacon, ambos también en SSDs separados, reduciendo así los puntos de fallo en general.

### Contar con hardware de repuesto listo para usar

Puede ser útil tener un SSD de repuesto listo para ser reemplazado en caso de fallo de hardware. Podrás iniciar inmediatamente el proceso de recuperación de tus nodos/validadores y, una vez completado, podrás comprar un disco de reemplazo en tu propio tiempo.

Si viajas con frecuencia, incluso podrías tenerlo conectado a tu máquina, manteniéndolo listo para su uso. Esto significa que tu nodo podría ser recuperado de forma remota, a menos que, por supuesto, el disco que falle sea tu disco del sistema operativo.

Habrá momentos en los que estés desconectado y falten atestaciones, no te estreses ni entres en pánico cuando esto suceda y concéntrate en volver a estar en línea. Por ejemplo, si estás desconectado durante 4 horas, te tomará 4 horas en línea para actualizar el balance de tu validador de vuelta.

Para obtener más información sobre el tiempo de inactividad, consulta nuestras publicaciones de ayuda:

* [Estoy preocupado por el tiempo de inactividad 😔](../help/downtime-explained.md)
* [Estoy preocupado por las deducciones (slashing) 🔪](../help/slashing-explained.md)
