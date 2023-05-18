---
description: >-
  Este tutorial te guiará en los pasos que debes seguir para configurar un
  servidor VPN en casa, permitiéndote conectarte de manera segura y gestionar tu
  máquina de staking desde cualquier lugar.
---

# Configurando el acceso VPN en casa



Si estás fuera de casa durante largos períodos de tiempo, este tutorial es para ti!

Pregunta: ¿Por qué debo configurar un servidor VPN? No es más fácil simplemente reenviar los puertos y conectarse?

_Respuesta_-Un servidor VPN introduce otra capa de seguridad. Para conectarte a tu nodo a través de SSH, primero tienes que conectarte a un VPN y luego hacer SSH a tu nodo. Esto introduce otra barrera y hace que las intrusiones sean mucho más difíciles.

### Requisitos

* Necesitarás una dirección IP pública estática o un DNS para tu red doméstica.
* Este tutorial asume que tienes instalado y funcionando Ubuntu Server 22.04 LTS. ¡Si no lo tienes, no te preocupes! Puedes consultar en el siguiente enlace un tutorial sobre cómo hacerlo.

{% content-ref url="../tutorials/installing-linux.md" %}
[installing-linux.md](../tutorials/installing-linux.md)
{% endcontent-ref %}

### Recomendaciones&#x20;

* Por motivos de seguridad, recomiendo configurar el servidor VPN en una máquina separada que no sea su máquina de validación. Esto incluso puede ser una máquina virtual.&#x20;

Ya teniendo presente lo anterior, empecemos!

### **Paso 1 )** Ejecute los comandos para asegurarse de que su máquina esté actualizada.

Inicie sesión en la máquina y autentíquese como superusuario usando el siguiente comando:

`sudo -i`

Ahora ejecute el siguiente comando para asegurarse de que el sistema operativo y los paquetes estén actualizados. Actualice cualquier paquete que no lo esté.

`apt-get update && apt-get upgrade`

<figure><img src="../.gitbook/assets/image (10).png" alt=""><figcaption><p> La salida debería verse de esta manera si no hay ninguna actualización necesaria.</p></figcaption></figure>

### **Paso 2) Instalar las necesidades de OpenVPN.**

Para ello, ejecute el siguiente comando:

`apt-get install ca-certificates wget net-tools gnupg`

<figure><img src="../.gitbook/assets/image (28).png" alt=""><figcaption><p>Con todo eso intalado estamos listos para preparar el dispositivo para el servidor del VPN. </p></figcaption></figure>

### **Step 3)** Importe la clave GPG de OpenVPN y agregue el repositorio oficial.**.**

Ejecute los siguientes tres comandos:

* Este comando cargará la clave pública CPG de OpenVPN.

```
curl -fsSL https://as-repository.openvpn.net/as-repo-public.gpg | gpg --dearmor > /etc/apt/trusted.gpg.d/as-repo-public.gpg
```

* Este comando añadirá el repositorio de OpenVPN en su dispositivo.

```
echo "deb http://as-repository.openvpn.net/as/debian jammy main">/etc/apt/sources.list.d/openvpn-as-repo.list
```

* Este último revisará las actualizaciones en todos los repositorios utilizados.

```
apt-get update
```

<figure><img src="../.gitbook/assets/image (38).png" alt=""><figcaption><p>Ahora notarás una nueva línea para el repositorio del servidor de acceso OpenVPN después de ejecutar "apt-get update".</p></figcaption></figure>

### Paso 4) Instalar el servidor de acceso OpenVPN

&#x20;¡Ahora comienza la diversión! Para instalarlo, ejecuta el siguiente comando:

```
apt-get install openvpn-as
```

<figure><img src="../.gitbook/assets/image (8).png" alt=""><figcaption><p>Es posible que necesites instalar varios paquetes para este paso...</p></figcaption></figure>

¡Hurra! Acabas de instalar el servidor de acceso OpenVPN. Presta atención a esta parte de la depuración, ya que contiene información valiosa.

<figure><img src="../.gitbook/assets/image (70).png" alt=""><figcaption><p>Toma nota de la URL, el nombre de usuario y la contraseña. ¡Muy importante!</p></figcaption></figure>

La interfaz de administración (Admin UI) se utiliza para realizar cambios en la configuración del servidor y agregar usuarios.

&#x20;La interfaz de cliente (Client UI) es para tus dispositivos, aquí podrás descargar perfiles/certificados de usuario. [Esa parte la haremos más adelante.](setting-up-home-vpn-access.md#step-6-adding-user-accounts.)

### Paso 5) Configurando el servidor para el acceso remoto.

Navega a la URL de la interfaz de administración. Es posible que recibas una advertencia de certificado, pero puedes ignorarla de forma segura y continuar. Una vez completado, verás la siguiente interfaz de usuario (UI).

<figure><img src="../.gitbook/assets/image (9).png" alt=""><figcaption><p>Inicia sesión aquí!</p></figcaption></figure>

Por favor, inicia sesión, lee y acepta el Acuerdo de Licencia de Usuario Final (EULA) y estaremos listos para continuar.&#x20;

Necesitamos realizar algunos cambios en la red, para ello, dirígete a Configuración > Configuración de Red.

<figure><img src="../.gitbook/assets/image (4) (2).png" alt=""><figcaption></figcaption></figure>

#### Paso 5.1) - Cambiar el puerto del tráfico VPN.

Por favor, encuentra la sección "Multi-Daemon Mode" y cambia ambos puertos de los valores predeterminados. Esto se hace por motivos de seguridad. Los puertos pueden tener el mismo número. Yo elegí el 9514, pero esto es solo un ejemplo, te recomiendo que elijas tus propios puertos.

<figure><img src="../.gitbook/assets/image (8) (2).png" alt=""><figcaption><p>"9514" es solamente un ejemplo de puerto. </p></figcaption></figure>

#### Paso 5.2) - Agregando nuestra IP pública

Por favor, no navegues lejos de la página de "Configuración de red" por ahora. Pero necesitarás abrir la siguiente URL en una nueva pestaña.

{% embed url="https://www.whatismyip.com/" %}
En esta página podrás consultar tu IP pública.&#x20;
{% endembed %}

Copia tu dirección IP de este sitio web y pégala en el campo "Hostname or IP Address" ubicado en la parte superior de la página de "Network Settings". Este campo ya estará completado con tu dirección IP privada, debes sobrescribirla con tu dirección _IP pública_.

<figure><img src="../.gitbook/assets/image (3).png" alt=""><figcaption><p>Si no tienes una dirección IP estática, necesitarás un DNS para tu red doméstica.</p></figcaption></figure>

#### Paso 5.3) Opcional - Configurar la interfaz de administración y la interfaz de cliente para que se ejecuten en puertos diferentes.&#x20;

Este paso es opcional, pero por motivos de seguridad, lo recomiendo fuertemente.

&#x20;Vamos a configurar la interfaz de administración y la interfaz de cliente para que se ejecuten en puertos diferentes, ya que solo necesitamos acceder públicamente a la interfaz de cliente.&#x20;

En la misma página "Configuración de red", desplázate hacia abajo hasta la parte inferior y busca "Servidor web del cliente". Activa la opción "Usar una dirección IP o puerto diferente".

<figure><img src="../.gitbook/assets/image (17) (3).png" alt=""><figcaption><p>Importante que actives la opción, debe de quedar en Si!</p></figcaption></figure>

Ahora podemos cambiar en qué puerto queremos que se ejecute el servidor web del cliente. Puedes elegir cualquier puerto que desees. En este caso, seleccioné el puerto 9515.

<figure><img src="../.gitbook/assets/image (47).png" alt=""><figcaption><p>"9515" es un ejemplo de puerto.</p></figcaption></figure>

A partir de aquí, por favor haz clic en "Guardar configuración" y luego en "Actualizar servidor en ejecución".

<figure><img src="../.gitbook/assets/image (99).png" alt=""><figcaption><p>Importante que presione esté botón</p></figcaption></figure>

<figure><img src="../.gitbook/assets/image (2) (4).png" alt=""><figcaption><p>Y también este botón.</p></figcaption></figure>

Una vez que el servidor en ejecución se haya actualizado, es posible que debas actualizar tu navegador y volver a iniciar sesión en la interfaz de administración.

#### Paso 5.4) Solo para usuarios avanzados: Agregar una ruta estática.

**Si eres un usuario avanzado**, es posible que hayas configurado tu servidor OpenVPN en una subred diferente a la de tus nodos/validadores de Ethereum.&#x20;

Si ese es el caso, deberás navegar a "Configuración > Configuración de VPN" y agregar una ruta estática para tu red de validadores. Si no están en subredes separadas, continúa con el paso 6.

<figure><img src="../.gitbook/assets/image (96).png" alt=""><figcaption><p>SOLO para usuarios avanzados</p></figcaption></figure>

<figure><img src="../.gitbook/assets/image (34).png" alt=""><figcaption><p>Para usuarios avanzados - Activa la opción "Sí, utilizar enrutamiento" y agrega la subred en la que se encuentran tus nodos/validadores de Ethereum. </p></figcaption></figure>

### Paso 6) Agregar cuentas de usuario.&#x20;

Paso 6.1) - Crear un nuevo usuario y establecer una contraseña&#x20;

Por favor, dirígete a "Gestión de usuarios" > "Permisos de usuario".&#x20;

Desde aquí, puedes agregar un nuevo usuario. Escribe un nombre de usuario y marca la casilla "Permitir inicio de sesión automático", luego selecciona la opción "Más configuraciones".

<figure><img src="../.gitbook/assets/image (55).png" alt=""><figcaption><p>"Permitir inicio de sesión automático y luego en "más opciones"</p></figcaption></figure>

Ahora puedes establecer una contraseña para la cuenta en las nuevas opciones que aparecen cuando haces clic en "Más configuraciones".

<figure><img src="../.gitbook/assets/image (87).png" alt=""><figcaption><p>Asegurate de que sea una contraseña compleja. </p></figcaption></figure>

Una vez hecho esto, por favor, guarda la configuración haciendo clic en "Guardar configuración" y luego actualiza el servidor en ejecución haciendo clic en "Actualizar servidor en ejecución" nuevamente.

#### Paso 6.2) Solo para usuarios avanzados: Permitir acceso a otra red.

Si eres uno de los afortunados que tuvieron que realizar el [paso 5.4](setting-up-home-vpn-access.md#paso-5.4-solo-para-usuarios-avanzados-agregar-una-ruta-estatica.), es posible que también necesites agregar la subred de tus nodos/validadores de Ethereum a la cuenta de usuario.

<figure><img src="../.gitbook/assets/image (7) (2) (2).png" alt=""><figcaption></figcaption></figure>

### Paso 7) Desbloquear los puertos locales.

Si estás utilizando un firewall local (lo cual se recomienda), es posible que necesites desbloquear los puertos locales según cómo lo hayas configurado.&#x20;

Estos son los puertos que configuraste en el [paso 5.1](setting-up-home-vpn-access.md#paso-5.1-cambiar-el-puerto-del-trafico-vpn.) y [el paso 5.3](setting-up-home-vpn-access.md#paso-5.3-opcional-configurar-la-interfaz-de-administracion-y-la-interfaz-de-cliente-para-que-se-ejec), además del puerto 943 (el puerto de administración predeterminado). Puedes cambiar el  puerto de la interfaz de administración si lo deseas, pero como no tiene acceso externo, no es realmente necesario.



```
sudo ufw allow 943
sudo ufw allow 9514 <Change to your "Multi-Daemon Mode" port>
sudo ufw allow 9515 <Change to your "Client Web Server" port>
sudo ufw enable
sudo ufw status numbered
```

Ya casi terminamos!

### Paso 8) Reenvío de puertos..

Para este paso, deberás iniciar sesión en tu enrutador y reenviar los puertos a la máquina donde se ejecuta el servidor de acceso OpenVPN. El flujo de trabajo exacto depende del enrutador, así que te recomiendo buscar instrucciones en línea que sean específicas para el fabricante y modelo de tu enrutador.

Deberás reenviar dos puertos, tanto TCP como UDP.&#x20;



You will need to forward two ports, both TCP/UDP.

* El/los puerto(s) que ingresaste para "Multi-Daemon Mode" (yo utilicé el 9514).
* El puerto que ingresaste para "Client Web Server" (yo utilicé el 9515).

&#x20;Una vez completado, por favor, accede al siguiente sitio web y introduce tus puertos para verificar si se han reenviado correctamente.

{% embed url="https://www.yougetsignal.com/tools/open-ports/" %}
En esta página podrás encontrar si los puertos fueron abiertos correctamente.
{% endembed %}

<figure><img src="../.gitbook/assets/image (79).png" alt=""><figcaption><p>(IP Address ocultada) - Mi puerto de tráfico VPN está abierto.</p></figcaption></figure>

<figure><img src="../.gitbook/assets/image (24).png" alt=""><figcaption><p>(IP Address ocultada) - Mi puerto de interfaz de usuario web para clientes está abierto.</p></figcaption></figure>

### Paso 9) - Configurar un dispositivo para el acceso VPN.&#x20;

\
Si has llegado hasta aquí, ¡felicidades! Te alegrará saber que lo más difícil ya está hecho.&#x20;

Por favor, completa este paso en el dispositivo en el que deseas configurar el acceso remoto.&#x20;

Abre la interfaz de usuario web para clientes: Puedes utilizar tanto tu IP pública como tu IP privada para este paso. En mi caso, accedí a [https://192.168.3.111:9515](https://192.168.3.111:9515/).

Una vez dentro, inicia sesión utilizando la cuenta de usuario que creaste en el [paso 6](setting-up-home-vpn-access.md#paso-6-agregar-cuentas-de-usuario.). Si tienes éxito, verás la siguiente pantalla.

#### Paso 9.1) - Instalar el cliente de OpenVPN&#x20;

Selecciona el sistema operativo que estás utilizando.

<figure><img src="../.gitbook/assets/image (39).png" alt=""><figcaption></figcaption></figure>

Desde aquí puedes seleccionar un cliente para tu dispositivo.

* Si estás en Windows o Mac, se descargará automáticamente el software cliente de OpenVPN y te guiará a través del resto del proceso.
* Si estás en Linux, Android o iOS, te llevará a una página externa con instrucciones adicionales.

#### Paso 9.2) Descarga el perfil de usuario del cliente&#x20;

Por favor, descarga el perfil de usuario "autologin".

<figure><img src="../.gitbook/assets/image (61).png" alt=""><figcaption></figcaption></figure>

Una vez hecho esto, deberás importar el perfil en el software de OpenVPN. El propio software (Windows o Mac) o las páginas externas (Linux, Android o iOS) te mostrarán cómo hacerlo.

### Paso 10) - Conectarse a la VPN&#x20;

¡Tienes suerte, este paso final es el más fácil!&#x20;

* Si estás usando una computadora portátil o de escritorio, por favor conéctate a otra red como un punto de acceso móvil.&#x20;
* Si estás usando un teléfono, por favor desconéctate de tu WiFi y asegúrate de estar conectado a Internet a través de tu proveedor de telefonía móvil.

Ahora verifica tu dirección IP en > [https://www.whatismyip.com/](https://www.whatismyip.com/)

Regresa al software de OpenVPN y presiona "Conectar", y estarás conectado en cuestión de segundos.

Luego verifica tu dirección IP nuevamente en > [https://www.whatismyip.com/](https://www.whatismyip.com/)

Si la conexión fue exitosa, verás que ahora coincide con tu dirección IP de casa, ya que estás conectado a tu conexión de Internet doméstica. Desde aquí, puedes acceder de forma segura a tus nodos/validadores de Ethereum a través de SSH.

Si puedes conectarte a tu red doméstica pero no puedes acceder por SSH a tus servidores, es posible que debas ajustar el firewall en tu nodo de Ethereum para aceptar conexiones SSH entrantes desde la dirección IP de tu servidor de OpenVPN.

## FAQ

Más adelante se añadirá la sección de preguntas frecuentes.
