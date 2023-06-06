# Como resincronizar Geth

Una razón común para que Geth falle puede ser el paro inesperado de una máquina validadora. Geth utiliza RAM para memoria temporal y durante un cierre ordenado alguna información importante será escrita en el disco; sin embargo, durante un cierre ordenado, no hay tiempo suficiente para escribir en el disco (por ejemplo: durante la perdida de energía electrica, así que se pierden datos importantes.) Esta perdida de datos lleva a una corrupción de la carpeta `chaindata`, el cual requiere de una resincronización.&#x20;

* [Ubicación de Archivos](resync-geth.md#ubicacion-de-archivos)
* [Pasos (Si existe la carpeta antigua)](resync-geth.md#pasos-si-existe-la-carpeta-antigua)
* [Pasos (Si la carpeta antigua no existe)](resync-geth.md#pasos-si-la-carpeta-antigua-no-existe)

## Ubicación de Archivos

*   Ubicación estándar de la carpeta `chaindata`.

    ```bash
    /var/lib/goethereum/geth/chaindata/
    ```
*   Ubicación estándar de la carpeta `ancient`.

    ```bash
    /var/lib/goethereum/geth/chaindata/ancient
    ```

## Pasos (Si existe la carpeta antigua)

¡Buenas noticias! La resincronización requerida se puede hacer mucho más rápido que una resincronización completa simplemente manteniendo la carpeta `ancient`. La carpeta antigua contiene archivos que no se dañan durante un apagado inesperado.

1. Detiene Geth.
2.  Mueve la carpeta `ancient`.

    ```bash
    sudo mv /var/lib/goethereum/geth/chaindata/ancient /var/lib/goethereum/geth/
    ```
3.  Borra el directorio `chaindata` y vuelve a crearlo.

    ```bash
    sudo rm -rf /var/lib/goethereum/geth/chaindata
    sudo mkdir /var/lib/goethereum/geth/chaindata
    ```
4.  Mueve la carpeta antigua de regreso al directorio `chaindata` que ahora está vacío.

    ```bash
    sudo mv /var/lib/goethereum/geth/ancient /var/lib/goethereum/geth/chaindata
    ```
5.  Cambia el propietario del directorio `chaindata` al usuario Geth.

    ```bash
    sudo chown -R goeth:goeth /var/lib/goethereum/geth/chaindata
    sudo chmod 755 /var/lib/goethereum/geth/chaindata
    sudo chmod 755 /var/lib/goethereum/geth/chaindata/ancient
    ```
6. Inicia Geth.

¡Felicidades! Has iniciado éxitosamente una resincronización de Geth  🥳

## Pasos  (Si la carpeta antigua no existe)

Si la carpeta antigua no exista, no es un problema. Solo significa que necesitarás resincronizar Geth desde cero, el cual tomará más tiempo.

1. Detiene Geth.
2.  Elimina el directorio `chaindata` y lo vuelves a crear.

    ```bash
    sudo rm -rf /var/lib/goethereum/geth/chaindata
    sudo mkdir /var/lib/goethereum/geth/chaindata
    ```
3.  Confirma el propietario y los permisos para la carpeta  `chaindata` están configurados al usuario Geth.

    ```bash
    sudo chown -R goeth:goeth /var/lib/goethereum/geth/chaindata
    sudo chmod 755 /var/lib/goethereum/geth/chaindata
    ```
4. Inicia Geth.

¡Felicidades! Has iniciado una resincronización de Geth exitosa. 🥳
