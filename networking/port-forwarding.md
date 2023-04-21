# Port forwarding

Es muy importante que reenvíe los puertos (port forwarding) a sus clientes de ejecución y consenso de Ethereum, esto asegura que pueda conectarse con otros nodos de manera eficiente.&#x20;

Su cliente de ejecución y consenso seguirá funcionando sin el reenvío de puertos, pero puede notar que tardará mucho tiempo en encontrar pares, y también puede tener problemas para conectarse con un número significativo de ellos. Así que es en su mejor interés (y muy recomendable) configurarlo para reenvíos.&#x20;

A continuación se muestra una lista de los puertos por defecto que el software está configurado para escuchar.

| Cliente de Ejecución                                                                                          | Puerto(s)                    |
| ------------------------------------------------------------------------------------------------------------- | ---------------------------- |
| [Besu](https://besu.hyperledger.org/en/stable/public-networks/how-to/connect/configure-ports/#p2p-networking) | 30303 TCP/UDP                |
| [Erigon](https://github.com/ledgerwatch/erigon#default-ports-and-protocols--firewalls)                        | 30303 TCP/UDP, 30304 TCP/UDP |
| [Geth](https://geth.ethereum.org/docs/fundamentals/security#networking-security)                              | 30303 TCP/UDP                |
| [Nethermind](https://docs.nethermind.io/nethermind/ethereum-client/configuration/network)                     | 30303 TCP/UDP                |

| Cliente de Consenso                                                                                         | Puerto(s)            |
| ----------------------------------------------------------------------------------------------------------- | -------------------- |
| [Lighthouse](https://lighthouse-book.sigmaprime.io/advanced\_networking.html#nat-traversal-port-forwarding) | 9000 TCP/UDP         |
| [Lodestar](https://chainsafe.github.io/lodestar/reference/cli/#beacon)                                      | 9000 TCP/UDP         |
| [Nimbus](https://nimbus.guide/networking.html)                                                              | 9000 TCP/UDP         |
| [Prysm](https://docs.prylabs.network/docs/prysm-usage/p2p-host-ip#incoming-p2p-connection-prerequisites)    | 12000 UDP, 13000 TCP |
| [Teku](https://docs.teku.consensys.net/Reference/CLI/CLI-Syntax/#p2p-port)                                  | 9000 TCP/UDP         |

Si tu nodo está corriendo y los puertos han sido redireccionados, puedes usar una herramienta online [como esta](https://www.yougetsignal.com/tools/open-ports/) para comprobar si los puertos han sido redireccionados correctamente.&#x20;

Para más información sobre cómo redirigir los puertos, lo mejor es buscar instrucciones en google, asegúrate de incluir la marca y el modelo de tu router, ya que los pasos específicos para redirigir los puertos variarán en función de tu router.

### IP estáticas

It is also recommended to configure your node with a static IP. This can be hardcoded on the machine itself or set as a reservation on your DHCP server (which is usually your router).

También se recomienda configurar el nodo con una IP estática. Esta puede estar codificada en la propia máquina o configurada como una reserva en tu servidor DHCP (que normalmente es tu router).&#x20;

Si a tu nodo se le asigna una dirección IP dinámica, siempre existe la posibilidad de que a tu máquina se le asigne una dirección IP diferente y el reenvío de puertos deje de funcionar, ya que apuntarán a la IP antigua.&#x20;

Lectura adicional: [Exploring Eth2 – Why Open Ports Matter](https://www.symphonious.net/2021/08/14/exploring-eth2-why-open-ports-matter/) (Inglés)
