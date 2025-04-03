# Sincronización de puntos de control



!!! info "Info"
    Se puede encontrar una lista mantenida por la comunidad de puntos finales de sincronización de checkpoints aquí: [Ethereum Beacon Chain checkpoint sync endpoints ↗](https://eth-clients.github.io/checkpoint-sync-endpoints/)&#x20;

La sincronización de checkpoints, también conocida como sincronización de subjetividad débil, ofrece una experiencia de usuario superior para sincronizar el Beacon Node. Se basa en suposiciones de  [subjetividad débil↗](https://ethereum.org/en/developers/docs/consensus-mechanisms/pos/weak-subjectivity), lo cual permite sincronizar la Beacon Chain desde un punto de control  reciente en lugar de hacerlo desde el génesis. La sincronización de puntos de control acelera significativamente el tiempo de sincronización inicial con suposiciones de confianza similares a las de la sincronización desde el [génesis](../../staking-glossary#genesis-block).

En la práctica, esto significa que tu nodo se conecta a un servicio remoto para descargar estados finalizados recientes y continúa verificando los datos a partir de ese punto. Para esto es importante confiar en que los terceros proporcionen los datos correctos sobre la información correcta sobre los estados que fueron finalizados, por lo que es necesario tener cuidado con la elección del proveedor.

### Validar con una fuente confiable conocida&#x20;

Debes validar el slot y el state\_root contra una fuente conocida y confiable. Esto puede ser un amigo, alguien de la comunidad que conozcas o cualquier otra fuente en la que confíes. Existe una lista mantenida de puntos finales de sincronización de checkpoints alojados públicamente [aquí↗](https://eth-clients.github.io/checkpoint-sync-endpoints/),  pero se recomienda usar tu propia fuente confiable en primer lugar, si es posible.&#x20;

Es importante que conozcas la dirección IP y el puerto de tu nodo beacon.



#### Obtener el número de slot y el valor de state&#x20;

Opción A:

1. Verifica los registros de tu cliente de consenso.
2. Encuentra el número de slot.
3. &#x20;Encuentra el valor de state root.

Opción B:

1. Ingresa `http://YOUR_NODE_IP:YOUR_NODE_PORT/eth/v1/beacon/headers/finalized` en tu buscador
2. Encuentra el número de slot.
3. &#x20;Encuentra el valor de state root.

Opción C:

1. Instala curl y jq.
2.  En una ventana de terminal nueva, ejecuta:

    ```bash
    curl -s http://YOUR_NODE_IP:YOUR_NODE_PORT/eth/v1/beacon/headers/finalized | jq .'data.header.message'
    ```

Si el número de `slot`y el valor de `state_root` de tu validador coinciden con el número de slot y el valor de state\_root de múltiples fuentes confiables, entonces es una coincidencia exitosa. ¡Felicitaciones! 🎉

Sin embargo, si los valores de slot y state\_root no coinciden, se recomienda comenzar desde cero borrando tu nodo de la Beacon Chain y reiniciando el proceso de sincronización desde el principio.&#x20;

[Detalles técnicos sobre la sincronización de los puntos de control↗](https://notes.ethereum.org/@djrtwo/ws-sync-in-practice)

[Debilidades subjetivas↗](https://ethereum.org/en/developers/docs/consensus-mechanisms/pos/weak-subjectivity)
