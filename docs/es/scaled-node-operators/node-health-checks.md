# Comprobando el estado de los nodos

Para servir como validador, tanto el Cliente de Consenso (CL) como el Cliente de Ejecución (EL) deben estar actualizados con la red. Hay un par de técnicas para comprobarlo.&#x20;

Todos estos datos de verificación de salud deberían conducir a una [herramienta de monitoreo](https://github.com/gateway-fm/validator-kb/blob/main/reference/nodes/monitoring.md) de su elección.

### Comprobación de salud interna

La mayoría de los nodos tienen API de verificación de estado expuestas, que devuelven `HTTP 5xx` si el nodo no se sincroniza correctamente y `HTTP 200 OK` si todo está bien. Esa es la versión más simple y básica del chequeo de salud.

### Comprobación de marcas de tiempo

Una estrategia más se basa en la marca de tiempo (timestamp) del último bloque.

Para el EL es una respuesta a  [`eth_getBlockByNumber("latest", false)`](https://docs.gateway.fm/v/api-docs/ethereum/eth\_getblockbynumber).

Tiene un campo llamado `timestamp`. Al conocer el timestamp de un bloque y la tasa de producción de bloques (1 bloque por 12 segundos), es posible ver qué tan "antiguo" es el bloque actual del nodo.

Dado que a veces se pueden pasar por alto las propuestas de bloque, no tiene sentido mantener este umbral demasiado ajustado, pero si tiene más de 5 minutos, tiene sentido marcar el nodo como "no saludable" y notificar a su [herramienta de monitoreo](https://github.com/gateway-fm/validator-kb/blob/main/reference/nodes/monitoring.md).

### Comprobación de la fuente de la verdad (Forks)

Finalmente, el caso cuando los bloques se sincronizan, pero estás en la bifurcación incorrecta. La detección de eso podría ocurrir en el EL muy fácilmente, usando el hash de bloque devuelto por[`eth_getBlockByNumber("latest", false)`](https://docs.gateway.fm/v/api-docs/ethereum/eth\_getblockbynumber).

Puede comparar estos hashes entre los nodos y también entre las fuentes externas de verdad.
