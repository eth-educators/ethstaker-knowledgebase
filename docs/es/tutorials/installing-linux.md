# Instalando Linux

Para instalar Linux en una máquina física, aquí están los pasos a seguir:&#x20;

1. Descarga una imagen de distribución de Linux en tu computadora de uso diario.&#x20;
2. Crea un USB con la imagen de distribución.&#x20;
3. Arranca tu máquina de staking desde el USB.&#x20;
4. Selecciona las opciones correctas para tu instalación.

### Descargar una imagen de distribución de Linux

Hay muchas distribuciones de Linux disponibles. Si eres un usuario experimentado de Linux, probablemente ya sepas qué distribución quieres usar según tus habilidades y conocimientos. Sin embargo, si eres un usuario nuevo de Linux o simplemente quieres algo sencillo de instalar y usar, la distribución de Linux recomendada es Ubuntu Linux.

Hay dos tipos de distribuciones entre las que puedes elegir:

* Desktop: [https://ubuntu.com/download/desktop↗](https://ubuntu.com/download/desktop)
* Server: [https://ubuntu.com/download/server↗](https://ubuntu.com/download/server)

La versión de escritorio (Desktop) viene con una interfaz gráfica similar a Windows o macOS. Para las máquinas de staking, la versión de escritorio no es ideal ya que tiene un sobrecargo adicional que no es necesario, pero puede ser más fácil para los nuevos usuarios que se sienten más cómodos con una interfaz gráfica.

La versión de servidor (Server) es meramente una interfaz de línea de comandos. Esto puede parecer intimidante al principio, pero al seguir las [guías de solo staking](../../tutorials/solo-staking-guides), simplemente copiarás y pegarás comandos, por lo que no es demasiado difícil. Puedes conectarte de forma remota a tu máquina de staking de manera segura utilizando protocolos como SSH, pero la forma más fácil de comenzar es conectar directamente un teclado y un monitor. [Siempre se puede utilizar SSH más adelante](../../tutorials/connect-via-ssh).

### Crea un USB con la imagen de distribución

Hay muchas herramientas disponibles para grabar imágenes de disco en unidades USB. Una que es de código abierto y que funciona en múltiples plataformas es [https://www.balena.io/etcher↗](https://etcher.balena.io/). Simplemente selecciona la imagen de distribución de Linux que descargaste anteriormente, selecciona el USB y ¡a flashear!

<figure><img src="/assets/img/gitbook/image (1) (2).png" alt="Balena Etcher Configuration Screen"><figcaption></figcaption></figure>

### Arranca tu máquina de staking desde el USB

Este paso debería ser tan fácil como insertar el USB que has grabado con la imagen de disco en el paso anterior y luego encender tu máquina de staking. En algunos casos, es posible que debas forzar la máquina a arrancar desde el USB en lugar de cualquier sistema operativo actualmente instalado. Esto se puede hacer editando el orden de arranque en el BIOS y permitiendo el arranque desde USB. Google es el mejor lugar para encontrar información sobre cómo arrancar desde un USB si encuentras algún problema en esta etapa.

### Selecciona las opciones correctas para tu instalación

Una vez que hayas arrancado desde el USB, se te presentará un menú de instalación. Utiliza las teclas de flecha (arriba y abajo) para mover la selección y utiliza la tecla de retorno (enter) para seleccionar la opción.

<figure><img src="/assets/img/gitbook/image (6) (2).png" alt="Linux installation page"><figcaption></figcaption></figure>

Después de seleccionar `Try or Install Ubuntu Server`, verás una pantalla como esta. No necesitas hacer nada en este punto, el sistema simplemente se está iniciando.

<figure><img src="/assets/img/gitbook/image (11).png" alt="Linux installation loading screen"><figcaption></figcaption></figure>

Una vez que el sistema se haya iniciado, se te presentará el asistente de instalación. El primer paso es seleccionar el idioma.

<figure><img src="/assets/img/gitbook/image (2) (1).png" alt="Linux installation language selection"><figcaption></figcaption></figure>

Selecciona el idioma (diseño) del teclado.

<figure><img src="/assets/img/gitbook/image (85).png" alt="Linux installation keyboard selection"><figcaption></figcaption></figure>

Selecciona el tipo de instalación que deseas utilizar. Para este caso, selecciona `Ubuntu Server`.

<figure><img src="/assets/img/gitbook/image (93).png" alt="Linux installation type selection"><figcaption></figcaption></figure>

Selecciona una red. Si tu máquina de apuestas utiliza un cable Ethernet para una conexión directa a la red (recomendado), esta opción debería estar preseleccionada. Si utilizas WiFi, selecciona los detalles correspondientes.

<figure><img src="/assets/img/gitbook/image (25) (1).png" alt="Linux installation network selection"><figcaption></figcaption></figure>

Selecciona un proxy si es necesario. Si estás utilizando una red doméstica estándar y no sabes qué significa esta opción, no te preocupes, déjala en blanco.

<figure><img src="/assets/img/gitbook/image (16) (1).png" alt="Linux installation proxy selection"><figcaption></figcaption></figure>

Selecciona desde dónde deseas descargar las actualizaciones del sistema operativo. Esta ubicación puede seleccionarse en función de tu ubicación geográfica para que las descargas sean más rápidas. Sin embargo, es más fácil seleccionar la opción predeterminada que ya está preseleccionada.

<figure><img src="/assets/img/gitbook/image (17) (1).png" alt="Linux installation archive mirror selection"><figcaption></figcaption></figure>

Selecciona la configuración de almacenamiento. Dado que tu máquina de staking es probablemente una máquina dedicada, la mejor opción es `Use an entire disk` (usar un disco completo). No te preocupes por el cifrado, ya que deseas que tu máquina pueda reiniciarse automáticamente y los discos cifrados hacen que ese proceso sea mucho más complejo.

<figure><img src="/assets/img/gitbook/image (72).png" alt="Linux installation storage selection"><figcaption></figcaption></figure>

Se te mostrará una pantalla de resumen de la configuración de almacenamiento. Por defecto, Linux puede que no utilice todo el espacio en disco disponible. En la captura de pantalla anterior, se muestra el tamaño del almacenamiento local como 1,171 terabytes, pero la pantalla de confirmación a continuación muestra solo 100 GB en uso.

<figure><img src="/assets/img/gitbook/image (29).png" alt="Linux installation storage confirmation"><figcaption></figcaption></figure>

Para utilizar todo el espacio en disco disponible, utiliza las teclas de flecha para moverte a la fila `ubuntu-lv` y presiona la tecla de retorno/enter para seleccionar `Edit`. Ingresa el valor `Max` mostrado junto a `Size` en el campo de entrada y luego `Save`.

<figure><img src="/assets/img/gitbook/image (66).png" alt="Edit available disk space"><figcaption></figcaption></figure>

<figure><img src="/assets/img/gitbook/image (43).png" alt="Save available disk space"><figcaption></figcaption></figure>

Después de confirmar la configuración de almacenamiento, se te presentará una pantalla adicional de confirmación para asegurarte de que estás listo para formatear y eliminar por completo cualquier dato existente en el disco de almacenamiento. Eso es lo que queremos, así que selecciona `Continue`.

<figure><img src="/assets/img/gitbook/image (7) (2) (1).png" alt="Linux installation storage confirmation screen"><figcaption></figcaption></figure>

Configurar el perfil de usuario es importante, ya que es la forma en que accederás a la máquina, tanto de forma directa como remota. Selecciona un nombre para tu usuario y el nombre para tu servidor que aparecerá en tu red local. Tu nombre de usuario se utiliza para iniciar sesión en la máquina y la contraseña protege tu cuenta de usuario.

<figure><img src="/assets/img/gitbook/image (31).png" alt="Linux installation user creation screen"><figcaption></figcaption></figure>

En este punto, es una buena idea configurar el servidor SSH para no tener que instalarlo manualmente más adelante. Si no tienes la intención de conectarte por SSH a tu máquina de staking y solo te conectarás directamente con un teclado y un monitor, no necesitas esta opción. Para obtener información sobre conexiones SSH, consulta el tutorial [Conectar con SSH](../../tutorials/connect-via-ssh).

<figure><img src="/assets/img/gitbook/image (21) (1).png" alt="Linux installation ssh setup"><figcaption></figcaption></figure>

Esta pantalla podría mostrarse pidiéndote seleccionar o deseleccionar snaps populares. No te preocupes por esta página, incluso podría estar vacía para ti. Simplemente continúa con la siguiente pantalla.

<figure><img src="/assets/img/gitbook/image (12) (2).png" alt="Linux installation server snaps"><figcaption></figcaption></figure>

En este punto, la instalación comenzará utilizando todas las configuraciones que has proporcionado. Esto puede llevar algunos minutos (10 o más) según tu hardware y configuración. No necesitas hacer nada, simplemente espera hasta que se complete. Al finalizar el proceso de instalación, deberás reiniciar tu máquina. Selecciona `Reboot Now` y se te pedirá que retires el dispositivo de instalación (el USB que utilizaste durante la instalación).

<figure><img src="/assets/img/gitbook/image (26) (1).png" alt="Linux installation complete screen"><figcaption></figcaption></figure>

Una vez que el sistema se reinicie, verás información de inicio similar al resultado que se muestra a continuación. Espera hasta que se complete y se te mostrará una pantalla de inicio de sesión.

<figure><img src="/assets/img/gitbook/image (19).png" alt="Linux startup screen"><figcaption></figcaption></figure>

Esta es la pantalla de inicio de sesión de tu máquina validadora. El nombre de esta máquina es `eridian-validator`.

<figure><img src="/assets/img/gitbook/image (24) (1).png" alt="Linux login screen"><figcaption></figcaption></figure>

Ingresa el nombre de usuario que creaste durante la instalación. Luego se te solicitará la contraseña. A medida que escribas tu contraseña, no se mostrará nada en la línea de comandos (¡parecerá que no está funcionando!), pero no te preocupes, esto es por seguridad y la escritura está funcionando correctamente.

<figure><img src="/assets/img/gitbook/image (22) (1).png" alt="Linux password input screen"><figcaption></figcaption></figure>

¡Y... has ingresado correctamente!

<figure><img src="/assets/img/gitbook/image (13) (1).png" alt="Linux successful login screen"><figcaption></figcaption></figure>

¡Felicitaciones! Has instalado correctamente Ubuntu Linux Server en tu máquina de staking.  🥳

En este punto, te encuentras en la línea de comandos y puedes comenzar a trabajar con muchas de las [guías de solo staking.](../../tutorials/solo-staking-guides)
