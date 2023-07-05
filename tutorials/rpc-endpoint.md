# Configurando un endpoint RPC

Esta página le mostrará cómo configurar su cliente de ejecución para atender solicitudes HTTP RPC.&#x20;

Esto le permitirá interactuar directamente con la red Ethereum utilizando su propio nodo. ¡Ya no es necesario utilizar un servicio de terceros como Infura!

### 1) Configure su cliente de ejecución

Deberá agregar los siguientes indicadores a su cliente de ejecución.

{% tabs %}
{% tab title="Geth" %}
#### Banderas Requeridas

```
--http
--http.api eth,net,web3
--http.corsdomain '*'
```

Tenga en cuenta que configurar su --http-corsdomain según el ejemplo anterior permitirá que cualquier persona use su nodo como punto final de RPC. Asegúrese de que esto también esté emparejado con las reglas de firewall adecuadas para evitar que esto suceda.

#### Banderas Optionales

```
--http.addr 0.0.0.0
--http.port 8545
```

[Link a documentacion](https://geth.ethereum.org/docs/interacting-with-geth/rpc)

Esto indicará que su nodo Geth está listo para conexiones RPC.

<figure><img src="../.gitbook/assets/image (6).png" alt=""><figcaption></figcaption></figure>
{% endtab %}

{% tab title="Nethermind" %}
#### Banderas Requeridas

```
--JsonRpc.Enabled true
```

#### Banderas Opcionales&#x20;

```
--JsonRpc.Port=8545 
--JsonRpc.Host="127.0.0.1" 
--JsonRpc.EnabledModules=[Eth,Web3,Net,Rpc]
```

[Link a documentacion](https://docs.nethermind.io/nethermind/ethereum-client/configuration/jsonrpc)

Esto indicará que su nodo Nethermind está listo para conexiones RPC

<figure><img src="../.gitbook/assets/image (7).png" alt=""><figcaption></figcaption></figure>
{% endtab %}

{% tab title="Besu" %}
#### Banderas Requeridas

```
--rpc-http-api=ETH,NET,WEB3
--rpc-http-cors-origins="*"
--rpc-http-enabled=true
```

Tenga en cuenta que configurar su --rpc-http-cors-origins según el ejemplo anterior permitirá que cualquier persona use su nodo como punto final de RPC. Asegúrese de que esto también esté emparejado con las reglas de firewall adecuadas para evitar que esto suceda.

#### Banderas Opcionales&#x20;

```
--rpc-http-host=0.0.0.0
```

[Link a documentacion](https://besu.hyperledger.org/en/stable/public-networks/how-to/use-besu-api/)

Esto indicará que su nodo Besu está listo para conexiones RPC

<figure><img src="../.gitbook/assets/image (5).png" alt=""><figcaption></figcaption></figure>
{% endtab %}

{% tab title="Erigon" %}
**Banderas Requeridas**

```
--http.api=eth,erigon,web3,net,debug,trace,txpool
--http.vhosts '*'
```

Tenga en cuenta que configurar su --http.vhosts según el ejemplo anterior permitirá que cualquier persona use su nodo como punto final de RPC. Asegúrese de que esto también esté emparejado con las reglas de firewall adecuadas para evitar que esto suceda.

#### Banderas Opcionales&#x20;

```
--http            #HTTP-RPC server (enabled by default). Use --http=false to disable it (default: true)
--http.addr value #HTTP-RPC server listening interface (default: "localhost")
--http.port value #HTTP-RPC server listening port (default: 8545)
```

[Link a documentacion](https://github.com/ledgerwatch/erigon#json-rpc-daemon)

Esto indicará que su nodo Erigon está listo para conexiones RPC

<figure><img src="../.gitbook/assets/image (3).png" alt=""><figcaption></figcaption></figure>
{% endtab %}
{% endtabs %}

### 2) Configura tu billetera

Ahora necesitará una billetera que le permita agregar puntos finales de RPC personalizados. Puede encontrar una lista de billeteras con esta característica [via este link.](https://ethereum.org/en/wallets/find-wallet/)

El siguiente ejemplo le mostrará cómo usar su punto final RPC con Metamask, ya que es una de las billeteras más utilizadas.

#### 2.1) Abra Metamask, haga clic en el ícono de menú en la parte superior derecha y seleccione "Add network"

<figure><img src="../.gitbook/assets/image (12).png" alt=""><figcaption></figcaption></figure>

#### 2.2) Desplácese hacia abajo y seleccione "Add a network manually"

<figure><img src="../.gitbook/assets/image (8).png" alt=""><figcaption></figcaption></figure>

#### 2.3) Complete los detalles de su nodo

Los detalles específicos variarán dependiendo de su configuración local. Como estoy ejecutando Geth en la misma máquina que mi instalación de Metamask, estoy usando 127.0.0.1 como dirección IP.

<figure><img src="../.gitbook/assets/image (13).png" alt=""><figcaption></figcaption></figure>

Si su RPC no está disponible o es inaccesible, puede mostrar un error cuando ingrese la ID de la cadena y no le permitirá guardar la red.

#### 2.4) Esté atento al mensaje de confirmación.

<figure><img src="../.gitbook/assets/image (4).png" alt=""><figcaption></figcaption></figure>

#### 2.5) Cambie a su nueva red si Metamask aún no lo ha hecho

<figure><img src="../.gitbook/assets/image.png" alt=""><figcaption></figcaption></figure>

¡Éxito! Ahora puede usar Metamask como lo haría normalmente con el beneficio adicional de acceder a la red Ethereum a través de su propio nodo 🥳
