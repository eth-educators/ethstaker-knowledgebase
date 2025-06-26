---
description: >-
  Instrucciones para actualizar las credenciales para el depósito de recompensas
  de la cadena Beacon así como para la salida del depósito inicial
---

# Actualizar credenciales de depósito

Como se describe en [el barrido de validadores](https://docs.ethstaker.cc/ethstaker-knowledge-base/getting-started/withdrawal-process-explained#validator-sweeping), la única forma de recibir recompensas de la [ cadena Beacon](https://docs.ethstaker.cc/ethstaker-knowledge-base/staking-glossary#beacon-chain) o el depósito inicial de 32 ETH a la[ salida de un validador](https://docs.ethstaker.cc/ethstaker-knowledge-base/staking-glossary#5.-exiting-validator) es que el validador haya establecido una [dirección de retiro](https://docs.ethstaker.cc/ethstaker-knowledge-base/staking-glossary#withdrawal-address) cambiando sus credenciales de retiro que inicia con 0x00 a la que inicia con 0x01.

Es posible durante la creación de un validador especificar una dirección de retiro de capa de ejecución, si lo ha hecho ya, no hay necesidad de actualizar sus credenciales. De hecho, una vez que las credenciales se establezcan en la dirección que inicia con 0x01, ya no es posible cambiarlas en el futuro. Por eso es imperativo que cuando se elija una dirección de retiro, se elija una sobre la que tenga control total, como una hardware wallet. Se recomienda fuertemente NO elegir una wallet donde no controle las claves privadas, como por medio de un exchange o a través de un tercero.

Tenga en cuenta: Si en algún momento está confundido con qué debería hacer, pida orientación a la comunidad de EthStaker. No hay preguntas tontas y siempre nos esforzamos por dar la bienvenida a quien llegue antes de ayudarles.

Usuarios de eth-docker: Hay una guía independiente si usas eth-docker[ aquí](https://github.com/ethstaker/eth-docker/tree/main/.eth/ethdo). La siguiente guía puede considerarse un complemento ya que los pasos son muy similares.

## Advertencias

* Elija una dirección sobre la que tenga absoluto control: Se recomienda fuertemente carteras de hardware y carteras de Exchanges NO DEBE USARSE. Puede pensar que es conveniente enviar a una cartera "caliente" o a un exchange para evitar comisiones de transacción adicionales, pero usted está arriesgando no sólo sus recompensas, sino también el depósito inicial de 32 ETH.
* Una vez que sus credenciales de retiro han cambiado de 0x00 a 0x01 no se pueden cambiar en el futuro.
* Su clave mnemónica es necesaria para cambiar sus credenciales: Sus fondos serán bloqueados indefinidamente mientras sus credenciales de retiro sean 0x00. Sin su clave mnemónica, no será posible actualizar sus credenciales. Excepto para casos extremadamente raros donde se tenga control de la llave privada de la cuenta de retiro y el keystore. En todo caso le recomendamos buscar a fondo su clave mnemónica y no proseguir con este proceso si tiene problemas para localizarla.
* ¡Hágalo off-line! La seguridad es importante: Al hacer este cambio, estarás exponiendo su clave mnemónica por lo que es muy recomendable realizar esta acción sin conexión a internet u otras redes. Si hace este proceso mientras haya una conexión a internet u otra red se arriesga a que le sean robados su clave mnemónica y por ende sus validadores y recompensas.
* Todas las recompensas de la cadena Beacon y el depósito inicial serán enviados a la dirección especificada automáticamente sin intervención del usuario: La dirección especificada será la única ubicación donde las recompensas y el depósito inicial serán enviadas, una vez se haya establecido. Si la dirección especificada se compromete, se aconseja trabajar con un grupo de White Hats para recuperar sus fondos.
* No se deshaga de su clave mnemónica después de actualizar sus credenciales: Incluso después de que se cambien las credenciales, todavía se le aconseja mantener su clave mnemónica ya que se puede utilizar para regenerar los archivos de su keystore si esos archivos se pierden. Su clave mnemónica puede ser parte de su herencia en un futuro, así que cuídela bien.

## Elegir la herramienta

Hay dos herramientas principales que se utilizan para hacer el cambio de credenciales y ambas tienen requisitos diferentes. Eche un vistazo a ambas opciones y elija según su situación. Normalmente, si tiene múltiples validadores asociados con una sola clave mnemónica, 'ethdo' es el método preferido.

### Waygu KeyGen

Una aplicación de GUI que proporciona la funcionalidad disponible en la herramienta CLI de Ethereum Staking. En caso de ser un usuario no técnico (no programador), esta es una buena opción. Es fácil de usar y menos propensa a errores comparado con intentar usar directamente la herramienta CLI de Ethereum Staking. Aquí hay un[ video](https://www.youtube.com/watch?v=EMQoVtxNaxo) guía para esta herramienta.

### ethdo

Una herramienta CLI extremadamente potente que es ideal para usuarios técnicos (programadores) o aquellos usuarios con múltiples validadores asociados con la misma clave mnemónica. Esta herramienta también ha demostrado ser muy eficaz con los usuarios que han encontrado problemas con Waygu KeyGen, normalmente debido a malentendidos. Debido a la dificultad técnica de esta herramienta, el resto de la guía se centrará en cómo utilizarla.

## Preparación

Para que ethdo realice los cambios necesarios, hay una serie de cosas que requerirá hacer:

* Instalar la herramienta "ethdo":[ https://github.com/wealdtech/ethdo/releases](https://github.com/wealdtech/ethdo/releases)
* Configurar el archivo de 'preparación sin conexión': Este es un archivo que contiene información sobre todos los validadores de la cadena Beacon como la clave pública, índice de validador, y credenciales actuales (llamado el estado de la cadena Beacon). Estos datos son necesarios para que la herramienta realice la firma necesaria. Para generar este archivo, puede ejecutar el siguiente comando en su cliente de la cadena Beacon:

```
./ethdo validator credenciales set --prepare-offline
```

Nota: Es posible que no cuente con ethdo en su máquina y necesitará descargarlo. Si no tiene acceso a su validador o está usando el servicio de un tercero puedes solicitar en la comunidad de ese tercero una versión o[ descargar una versión anterior aquí](https://github.com/benjaminchodroff/ConsensusLayerWithdrawalProtection/blob/main/offline-preparation.json.mainnet.2023-03-04.tar.gz).

* Tener a la manos la clave mnemónica del validador: Cuando generó el validador, usted creó o proporcionó una [clave mnemónica](https://docs.ethstaker.cc/ethstaker-knowledge-base/staking-glossary#validator-seed-phrase-mnemonic). Si no posee esta clave o la ha perdido, no podrá hacer la firma necesaria y por lo tanto no podrá continuar.
* Una máquina sin conexión (con "air-gap"): Debido a que va a exponer la clave mnemónica para firmar esta operación, es recomendable usar una máquina sin conexión a otras redes para realizar la operación. Hay numerosas guías sobre cómo configurar una máquina con air-gap y puede [ver un ejemplo aquí](https://ubuntu.com/tutorials/create-a-usb-stick-on-ubuntu#1-overview).
* Escoger la dirección en capa de ejecución: Para recibir fondos, necesita especificar una dirección de capa de ejecución que usted controle completamente. Esto preferiblemente sería una cartera de hardware como un Ledger, pero sin duda querrá elegir una dirección que cuente con la mayor seguridad posible. Después de establecer una dirección, si la dirección escogida se viera comprometida, tendría una gran probabilidad de perder sus recompensas y depósitos iniciales.
* Una unidad de memoria tipo USB:  Ya que la máquina en la que va a realizar este cambio no tendrá acceso a Internet necesitará la memoria para tener acceso a los archivos, así como para guardar la información del resultado de la operación. En esta unidad de memoria deberá poner la herramienta de CLI ethdo, el archivo de "preparación sin conexión.json" y la dirección que desea establecer como cuenta para depósitos.

## Cambiar las credenciales

Antes de comenzar este proceso, es importante que comprenda que hasta que no mueva sus resultados a una máquina en línea y los envíe, no debe preocuparse por arruinar este paso. Tome un respiro y relájese, le acompañaremos en este proceso.

Advertencia: Vale la pena enfatizar que, por favor, haga el esfuerzo de realizar esta operación en una computadora completamente fuera de línea (con "air-gap"). Un usuario nos informó que hizo un cambio en línea en su máquina de trabajo y recibió un mensaje de su personal de TI con su clave mnemónica incluida. Afortunadamente para ese individuo quien descubrió su clave mnemónica era una buena persona y le advirtió. Tómese en serio la seguridad.

### Iniciar la máquina sin conexión

Conecte a la máquina sin conexión el Live USB que creó durante el paso de preparación y encienda la computadora. Elija la opción "Try Ubuntu without installing" (esp: "Pruebe Ubuntu sin instalar"). Si queda atascado en este paso, puedes seguir[ esta guía](https://ubuntu.com/tutorials/try-ubuntu-before-you-install#3-boot-from-usb-flash-drive). Asegúrese de desconectar todas las redes, y apagar las capacidades de red, buscando en la parte superior derecha de la pantalla el icono de la red. Haciendo clic en el icono podrá desactivar la conexión a Internet y asegurarse que ya no haya conexión.

### Obtener los archivos y la herramienta en la máquina sin conexión

Ahora que tiene el sistema de operaciones sin conexión corriendo, conecte su memoria USB que tiene ethdo,  la nueva dirección  de depósitos y el archivo de "preperación sin conexión".json. Probablemente verá una notificación que el dispositivo fue detectado y al hacer clic en ese dispositivo se abrirá el explorador de archivos. En este punto, requerimos operar en una Terminal que nos permitirá ejecutar la función CLI de ethdo para crear la operación. Puede abrir la terminal haciendo clic en Actividades en la parte superior izquierda y luego escribir terminal. Si queda atascado en este paso, puedes seguir esta[ guía](https://ubuntu.com/tutorials/command-line-for-beginners#3-opening-a-terminal).

En la terminal vamos a copiar el contenido de la unidad de memoria USB a su dispositivo local para evitar cualquier problema de permisos. Para ello, primero necesita localizar los archivos de la memoria. Generalmente los encontrará ejecutando estos comandos:

```
cd /media/usb/
ls-la
```

Una vez encontrado, puede ejecutar:

```
pwd
```

y copiar la ubicación resultante junto con el nombre de la memoria USB.

Ahora para copiar el contenido, podemos volver a nuestro home y ejecutar un comando para copiar el contenido y corregir los permisos:



```
cd ~
cp <PWD_RESULT>/* ~
chmod 777 *
```

Donde  \<PWD\_RESULT> es el resultado de tu comando anterior. Algo similar a:

```
cp /media/usb/my-usb/* ~
```

En este punto, al ejecutar:

```
./ethdo
```

debería resultar en la ejecución de CLI y proporcionar una lista de todos los comandos que tiene para ofrecer.

### Crear la operación

Ahora con su dirección y clave mnemónica a la mano, puede ejecutar el siguiente comando y rellenando la información necesaria:

```
./ethdo validator credentials set --offline --withdrawal-address="0x12341234...12341234" --mnemonic="test ocean pyramid my 24 words pyrmaid ocean test"
```

Donde "withdrawal-address" es la dirección en la capa de ejecución que USTED CONTROLA COMPLETAMENTE y la clave mnemónica es la frase de 24 palabras que se usó o creó cuando configuró sus validadores.

Esto debería crear como resultado un archivo llamado "change-operations.json" con los cambios. Si se encuentra con algún problema o duda, por favor consulte las preguntas más frecuentes (FAQ) o pregúntenos en Discord. Estamos siempre encantados de ayudar en todo lo que podamos.

### Enviar la operación

Para enviar la operación, necesitamos transferir el archivo "change-operations.json" a una máquina con conexión a Internet. Copie el archivo "change-operations.json" a la memoria USB mediante el explorador de archivos o usando el siguiente comando en la terminal:

```
cp change-operations.json <PWD_RESULT>/
```

Nuevamente, debería ser algo similar a:

```
cp change-operations.json /media/usb/my-usb/
```

Ahora puede apagar con seguridad la máquina sin conexión.

Conecte la memoria USB a una máquina de confianza que tenga una conexión a Internet.

Abra el archivo "change-operations.json" y busque un atributo llamado "to\_execution\_address". Esa es la dirección a la que se depositarán sus recompensas de la cadena Beacon. Asegúrese de que ésta es la dirección que usted desea y de la cual tiene control total. Se aconseja enviar una transacción de prueba desde y hacia la dirección.

Una vez que haya verificado la dirección, puede enviar la operación usando la herramienta de transmisión de[ Beaconchain](https://beaconcha.in/tools/broadcast) o puede transferir el archivo a su nodo de cadena Beacon y ejecutar el siguiente comando:

```
curl -X POST -H 'Content-Type: application/json' -d @change-preparation.json http://<IP>:5052/eth/v1/beacon/pool/bls_to_execution_changes
```

Donde \<IP> es la dirección de su nodo, lo más probable es que localhost

### Verificar cambios

Llegados a este punto, el proceso de envío y la propagación debería ser casi instantáneo. Busque su validador en [ beaconcha.in](https://beaconcha.in/) y compruebe si las credenciales de retiro han sido actualizadas. Al visualizar un validador, hay una sección de Deposits que debe reflejar el cambio de sus credenciales.

En este punto, sus credenciales han sido actualizadas y recibirá automáticamente las recompensas de la cadena Beacon como se describe [aquí](https://docs.ethstaker.cc/ethstaker-knowledge-base/getting-started/withdrawal-process-explained#validator-sweeping).

## Preguntas más frecuentes (FAQ)

### Mis credenciales ya son 0x01. ¿Debo hacer algo?

Noup. ¡Ya está todo listo! Recibirá sus recompensas periódicamente como se define [aquí](https://docs.ethstaker.cc/ethstaker-knowledge-base/getting-started/withdrawal-process-explained#validator-sweeping).

### ¿Cómo puedo volver a cambiar mi dirección de retiro?

Después de establecer una dirección de retiro, cambiando sus credenciales de 0x00 a 0x01, ya NO es posible cambiarlas de nuevo. Si quiere que sus recompensas y depósitos vayan a otra dirección, tendrá que sacar el validador y volver a configurarlo desde cero, ahora con la dirección deseada.

### Tengo mi clave mnemónica de depósito. ¿Puedo modificar mis credenciales?

La única forma de enviar un cambio de credencial válido es si la operación está firmada por la clave mnemónica con la que creó los validadores. Normalmente es una frase de 24 palabras. Su cuenta de depósito es irrelevante a menos que haya especificado su clave mnemónica de depósito cuando creó sus validadores.

### Perdí mi clave mnemónica. ¿Los fondos no se enviarán a la dirección de depósito?

Sentimos mucho decir que no. Las recompensas de la cadena Beacon y el depósito inicial sólo puede ir a la dirección establecida o permanecerá bloqueado indefinidamente si las credenciales aún corresponden a una cuenta iniciando en 0x00. Durante el desarrollo de la cadena Beacon y en el momento de su lanzamiento, se esperaba que las credenciales 0x00 pudieran ser usadas para manejar retiros directamente. Pero debido a cambios en futuros planes de desarrollo, se decidió que una dirección de la capa de ejecución necesitaría ser especificada y por ende se ha forzado el cambio de las direcciones 0x00 a las que inician con 0x01.

### Estoy 100% seguro de que tengo la clave mnemónica correcta. ¿Por qué fallan los comandos de configuración de credenciales?

ethdo hace una búsqueda en el estado de la cadena Beacon comparando las claves públicas correspondientes a la clave mnemónica proporcionada. E intenta 1024 índices diferentes (también conocidos como rutas o posiciones) antes de fallar. Si utiliza el servicio de un tercero como StakeFish o Stakedlays, es posible que la clave pública no coincida. Puede sacarle la vuelta a esto usando su clave privada en lugar de la clave mnemónica. Siga estas instrucciones y póngase en contacto con la comunidad de EthStaker si tiene problemas:

```
./ethdo account derive --mnemonic="pyramid 24 words test" --show-private-key --path="m/12381/3600/0/0"h
```

Esto le mostrará la clave privada de la ruta 0. Copie ese valor y prueba este comando:

```
./ethdo validator credentials set --offline --withdrawal-address="0xADDRESS_YOU_CONTROL" --private-key="PRIVATE_KEY_FROM_ABOVE"
```

Luego siga las mismas [instrucciones de envío](https://docs.ethstaker.cc/ethstaker-knowledge-base/tutorials/updating-withdrawal-credentials#submit-the-operation).

### El archivo "change-operations.json" está mostrando un extraño valor de 0x010000000! ¿Qué es esto?

Cuando haya establecido una dirección de retiro, las credenciales tienen un patrón de 0x01 seguido de 22 0 y luego su dirección sin el prefijo 0x. Así que si su dirección fuera: "0x123456789abcdeedcba987654321012345789abc", entonces sus credenciales serían:"0x010000000000000000000000000000123456789abcdeedcba987654321012345789abc" después de que haya realizado el cambio correctamente.\
\
