# Conectar con el SSH

La conexión remota a una máquina de validación, ya sea alojada por un proveedor de nube (AWS, etc.) o que se ejecute en tu hogar, se logra principalmente utilizando SSH (Secure Shell).

El SSH es una herramienta de línea de comandos que permite el acceso directo a una máquina remota. Este tutorial cubrirá:

1. [Instación de SSH en tu máquina de staking](connect-via-ssh.md#installing-ssh-on-your-staking-machine)
2. [Conectándote a tu máquina de staking usando SSH](connect-via-ssh.md#connecting-to-your-staking-machine-using-ssh)
3. [Usando Mosh para mejorar tu experiencia de conexión remota](connect-via-ssh.md#using-mosh-to-improve-your-remote-connection-experience)
4. [Usando Blink en iOS para conexiones móviles](connect-via-ssh.md#using-blink-for-ios-for-mobile-connections)
5. [Generación de llaves SSH ](connect-via-ssh.md#generating-ssh-keys)
6. [Cambio de puerto SSH predefinido](connect-via-ssh.md#changing-the-default-ssh-port)

Este tutorial no cubrirá la configuración de red necesaria para obtener una IP estática, nombre de host y/o [VPN](http://127.0.0.1:5000/o/5TLAFycQGS1YA3kIVVOf/s/x0r5p8oRhI3NM8yvyTPC/), ya que estos temas se tratan en otros tutoriales.

Mientras que el SSH por sí mismo es una gran herramienta, hay algunas limitaciones que pueden ser frustrantes cuando se conecta a una mala conexión a Internet. Por ejemplo, si el internet se cae aunque sea por un segundo (si estás en un carro o tren en movimiento) o cambias de red WiFi, la conexión SSH se cerrará.

## Instalación de SSH en tu máquina de staking

Cuando instalaste Linux en tu máquina de staking las opciones de instalación deberían haberte preguntado si querías instalar SSH durante el proceso de instalación.

<figure><img src="../.gitbook/assets/image (25).png" alt="Linux Ubuntu Installation - Install SSH"><figcaption></figcaption></figure>

Para comprobar si SSH está instalado en tu máquina de staking, ejecuta el comando:

```bash
ssh -V
```

Si el SSH está instalado, deberías ver una respuesta mostrando la versión instalada:

```
OpenSSH_8.9p1 Ubuntu-3ubuntu0.1, OpenSSL 3.0.2 15 Mar 2022
```

Si ves un error o no ves el resultado de la versión, entonces es probable que el servidor SSH no esté instalado. Cuando desees instalar nuevos paquetes en Linux, es recomendable asegurarse de que los paquetes están actualizados por motivos de seguridad:

```bash
sudo apt-get update
```

Luego instala `openssh-server`:

```bash
sudo apt-get install -y openssh-server
```

Si estás utilizando UFW como firewall y has restringido las conexiones entrantes y salientes, tendrás que añadir el puerto SSH para permitir conexiones remotas (sustituyendo `<SSH_PORT>` por el puerto SSH configurado - el puerto por defecto es `22`):

```bash
sudo ufw allow in <SSH_PORT> comment 'Allow SSH in'
```

### Conectándote a tu máquina de staking usando SSH

Una vez que haya confirmado que SSH está instalado en su máquina de staking, puedes conectarte desde una máquina diferente utilizando el comando:

```bash
ssh <USERNAME>@<IP_ADDRESS>
```

Por ejemplo: `ssh eridian@186:204:70:208`

Este comando intenta conectarse con tu nombre de usuario a la dirección IP específica (o nombre de host) de tu máquina de staking.

Es posible que aparezca un mensaje que diga algo así como "No se ha conectado a esta máquina antes, ¿quiere confiar en ella?", a lo que deberás responder "`Yes`".

En este punto, si todo está configurado correctamente, se te pedirá que introduzcas tu contraseña. Esta es la contraseña que utilizas para iniciar sesión con el usuario de tu máquina de staking.

Si estás utilizando un[ puerto diferente para tu conexión SSH](connect-via-ssh.md#changing-the-default-ssh-port) entonces puedes especificar el puerto cuando te conectes utilizando:

```
ssh -p <PORT> <USERNAME>@<IP_ADDRESS>
```

### Usando Mosh para mejorar tu experiencia de conexión remota

**Beneficios de usar Mosh:**

* Si tienes una conexión a Internet intermitente (por ejemplo, una conexión móvil o estás en un vehículo en movimiento) una conexión SSH estándar fallará cada vez que se pierda la conexión. En ese caso, la conexión debe restablecerse manualmente, lo que puede resultar molesto si ocurre a menudo y está utilizando medidas de seguridad adicionales como [2FA](ssh-security-2fa.md). Mosh permite que las conexiones se caigan y se restablezcan automáticamente cuando la señal de Internet se reconecta.
* Mosh utiliza una interfaz predictiva para escribir comandos en la consola. El SSH estándar sólo muestra el comando tecleado una vez que ha vuelto del servidor remoto. Si tienes una conexión lenta, esto puede percibirse como una interfaz lenta. Mosh muestra el texto a medida que escribes los comandos, dando una experiencia de usuario mucho más agradable.

**Limitaciones de uso de Mosh:**

* Una limitación que notarás cuando utilices Mosh es que no puedes desplazarte hacia atrás en el historial del terminal. Esto se debe a la forma en que Mosh sólo muestra la pantalla actual, lo que tiene algunas ventajas de rendimiento, pero puede ser frustrante si se pierde algo y no puedes desplazarte hacia atrás para verlo.

El paquete Mosh debe instalarse en ambos lados de la conexión. Esto significa que tanto su máquina de staking como la máquina desde la que deseas conectarte (por ejemplo, tu laptop de uso diario) necesitarán Mosh instalado.

Instala [Mosh ](https://mosh.org/#getting)en tu máquina de staking:

```bash
sudo apt-get install -y mosh
```

Si está utilizando UFW, otorgale permisos a los puertos Mosh a través del firewall:

```
sudo ufw allow in 60000:60020/udp comment 'Allow Mosh in'
```

Mosh utiliza el mismo método de conexión que SSH, por lo que una vez que se ha instalado y se han permitido los puertos debería ser tan sencillo como conectarse con el comando:

```
sudo mosh <USERNAME>@<IP_ADDRESS>
```

Si ha cambiado el puerto SSH por defecto puede especificar el puerto utilizado por Mosh utilizando el comando:

```
sudo mosh --ssh="ssh -p <MODIFIED_SSH_PORT>" <USERNAME>@<IP_ADDRESS>
```

## Usando Blink Shell en iOS para conexiones móviles

La app móvil de [Blink Shell↗](https://apps.apple.com/us/app/blink-shell-code-editor/id1594898306) para iOS te permite conectarte a tu máquina de staking usando SSH y Mosh.

En tu dispositivo (iPhone o iPad) abre la aplicación Blink Shell y escribe:

```
config
```

![](<../.gitbook/assets/image (57).png>)

Puede añadir llaves y certificados si utilizas una clave SSH para tus conexiones:

![](<../.gitbook/assets/image (7) (2).png>)

Los hosts pueden configurarse para que disponga de un comando alias, por ejemplo, `ssh validator`, que puedes utilizar con ajustes preconfigurados.

![](<../.gitbook/assets/image (77).png>)

La sincronización con iCloud puede desactivarse si no quieres que tus llaves y contraseñas del SSH se almacenen en iCLoud.

El bloqueo automático es una función útil para añadir seguridad adicional a tu dispositivo portátil. Y ya está.

Ya puedes conectarte a tu validador de staking doméstico de forma remota desde tu dispositivo iOS🗺️

![](<../.gitbook/assets/image (4) (3).png>)

## Generación de llaves SSH

Para mayor seguridad, las llaves SSH se pueden utilizar junto o en vez de tu nombre de usuario / contraseña de autenticación cuando te conectas a tu máquina de staking.

Sigue estas instrucciones para generar claves SSH: [https://linuxconfig.org/how-to-generate-and-manage-ssh-keys-on-linux](https://linuxconfig.org/how-to-generate-and-manage-ssh-keys-on-linux)

## Cambio de puerto SSH predefinido

El puerto configurado por defecto es el `22` para conexiones SSH. Si deseas cambiar el puerto predeterminado por cualquier motivo (por ejemplo, debido al reenvío de puertos en el router o a que el puerto está siendo utilizado por otro servicio), sigue estos pasos:

1.  Abre el archivo `/etc/ssh/sshd_config` y localiza esta línea:

    ```
    #Port 22
    ```
2.  Descomenta esa línea (eliminando el carácter `#` inicial) y cambie el valor por un número de puerto adecuado (por ejemplo, 22000):

    ```
    Port 22000
    ```
3. Guarda los cambios.
4.  Reinicia el servidor SSH:

    ```
    systemctl restart sshd
    ```
5.  Para confirmar que el puerto ha sido correctamente actualizado, corre:

    ```
    sudo netstat -tulpn | grep ssh
    ```
6.  El resultado debería mostrar el nuevo número del puerto:

    ```
    tcp        0      0 0.0.0.0:22000           0.0.0.0:*               LISTEN      1282/sshd: /usr/
    sbi 
    tcp6       0      0 :::22000                :::*                    LISTEN      1282/sshd: /usr/
    sbi 
    ```
