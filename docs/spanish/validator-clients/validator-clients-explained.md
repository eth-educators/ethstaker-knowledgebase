# Qué son los clientes de validación?

Ethereum es una red peer-to-peer (P2P) con miles de nodos que deben ser capaces de comunicarse entre sí utilizando protocolos estandarizados. La "capa de red" es el conjunto de protocolos que permiten que esos nodos se encuentren y intercambien información. Esto incluye la difusión de información ("gossiping") de uno a muchos a través de la red, así como el intercambio de solicitudes y respuestas entre nodos específicos de uno a uno. Cada nodo debe cumplir con reglas de red específicas para asegurarse de que está enviando y recibiendo la información correcta.

El software del cliente se divide en dos partes (clientes de ejecución y clientes de consenso), cada una con su propio conjunto de protocolos de red distintos. Además de comunicarse con otros nodos de Ethereum, los clientes de ejecución y de consenso deben comunicarse entre sí. Esta página brinda una explicación introductoria de los protocolos que permiten esta comunicación.

Los [clientes de ejecución](/spanish/validator-clients/execution-clients) difunden transacciones a través de la red peer-to-peer de la capa de ejecución. Esto requiere comunicación encriptada entre pares autenticados. Cuando se selecciona a un validador para proponer un bloque, las transacciones registradas localmente en el nodo se envian a los clientes de consenso a través de una conexión RPC local, que se empaquetarán en bloques Beacon.

Posteriormente, los [clientes de consenso](/spanish/validator-clients/consensus-clients) difunden los bloques Beacon a través de su red p2p. Esto requiere dos redes p2p separadas: una que conecta clientes de ejecución para la difusión de transacciones y otra que conecta clientes de consenso para la difusión de bloques.

[_**Fuente ↗**_](https://ethereum.org/en/developers/docs/networking-layer)
