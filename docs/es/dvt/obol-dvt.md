# Obol DVT

### Conectar clientes de EC y BN existentes <a href="#connect-existing-ec-and-bn-clients" id="connect-existing-ec-and-bn-clients"></a>

Si ya estás ejecutando un cliente de ejecución (EC), p.e Geth y un Beacon Node (BN), p.e Lighthouse puede conectar su nodo Obol DVT a ellos. Esto le permite reutilizar el hardware existente y continuar ejecutando su validador de participación en solitario junto con los validadores Obol DVT.

![](https://2168503826-files.gitbook.io/\~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FKnJhWg57YoZq2MPfatKE%2Fuploads%2FCOFaz8w1x4xZe4qdsoZo%2Fimage.png?alt=media\&token=b649027f-0bfc-4e2b-a5da-1e47824b5268)

#### Actualice las banderas HTTP en el nodo Beacon existente <a href="#update-http-flags-on-existing-beacon-node" id="update-http-flags-on-existing-beacon-node"></a>

En su Beacon Node existente, asegúrese de agregar estas banderas para que el cliente Charon pueda comunicarse directamente.


=== "Banderas Lighthouse"
    ```
    --http
    --http-address=0.0.0.0
    --http-port=5052
    ```

    [https://lighthouse-book.sigmaprime.io/api-bn.html#starting-the-server](https://lighthouse-book.sigmaprime.io/api-bn.html#starting-the-server)

=== "Banderas Teku"
    ```
    --rest-api-enabled=true
    --rest-api-interface=0.0.0.0
    --rest-api-host-allowlist=*
    ```

=== "Banderas Nimbus"
    ```
    --rest=true
    --rest-port=5052
    --rest-address=0.0.0.0
    --rest-allow-origin=*
    ```


#### Clone el repo ObolNetwork/charon-distributed-validator-node <a href="#clone-the-obolnetwork-charon-distributed-validator-node-repo" id="clone-the-obolnetwork-charon-distributed-validator-node-repo"></a>

```
# Clone this repo
git clone https://github.com/ObolNetwork/charon-distributed-validator-node.git

# Change directory
cd charon-distributed-validator-node
```

Hay dos pasos necesarios para cambiar la configuración:

1. Copy and edit the .env
2. Copy and edit the example override file

#### Copy and edit the .env

Copia el archivo de ejemplo `.env` .

```
cp .env.sample .env
```

Descomente (elimine el #) la línea `CHARON_BEACON_NODE_ENDPOINTS`. Agregue su dirección IP Beacon Node existente, por ejemplo, `"http://192.168.1.8:5052"`. Como Charon Client se ejecuta dentro de un contenedor Docker, no puede usar `localhost`, aunque podría estar ejecutándose en la misma máquina física, requiere la dirección IP de la máquina host

```
...

# Connect to one or more external beacon nodes. Use a comma separated list excluding spaces.
CHARON_BEACON_NODE_ENDPOINTS="http://<EXISTING_BEACON_NODE_IP_ADDRESS>:<PORT>"

...
```

**Copy and edit the example override file**

Cualquier sección sin comentarios anulará automáticamente la misma sección en `docker-compose.yml` cuando se ejecute con docker-compose up. Esto le permite editar las variables utilizadas por Docker sin cambiar el `docker-compose.yml` que podría modificarse en futuras actualizaciones.

```
cp docker-compose.override.yml.sample docker-compose.override.yml
```

Edite el archivo recién copiado `docker-compose.override.yml` y descomente (elimine el #) las siguientes líneas:

`services:`

* `geth:`
  * `profiles: [disable]`
* `lighthouse:`
  * `profiles: [disable]`

```
...

services:
  geth:
    #Disable geth
    profiles: [disable]
    # Bind geth internal ports to host ports
    #ports:
      #- 8545:8545 # JSON-RPC
      #- 8551:8551 # AUTH-RPC
      #- 6060:6060 # Metrics
      
  lighthouse:
    #Disable lighthouse
    profiles: [disable]
    # Bind lighthouse internal ports to host ports
    #ports:
      #- 5052:5052 # HTTP
      #- 5054:5054 # Metrics
      
...
```

¡Ahora está listo para comenzar el tutorial de Obol para crear un ENR y configurar su nuevo validador DVT!
