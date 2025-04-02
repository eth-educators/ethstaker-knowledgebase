# Firewalls y subredes

Un firewall es un mecanismo de seguridad que supervisa las conexiones de red entrantes y salientes y puede aceptar o rechazar el tráfico basándose en un conjunto de reglas configurables. Se recomienda fuertemente tener uno configurado para mejorar la seguridad de la configuración de su nodo validador.&#x20;

Existen dos tipos de firewalls:

### Software firewalls

Los software firewalls se ejecutan en la máquina individual y la protegen de otros dispositivos dentro de la red local en la que se encuentra.&#x20;

Se recomienda descartar todo el tráfico por defecto y establecer reglas individuales que lo permitan cuando sea necesario, de forma que el tráfico sólo pueda entrar en la máquina en la que está _explícitamente_ permitido.

Por ejemplo, si ejecutas tu cliente de ejecución y cliente de consenso en máquinas diferentes, puedes configurar una regla de firewall en tu nodo de ejecución para que sólo permita el tráfico en el puerto 8551 desde la dirección IP de tu nodo de consenso. Si estás ejecutando Ubuntu Server, un firewall ya estará instalado por defecto bajo [el paquete ufw](https://manpages.ubuntu.com/manpages/trusty/man8/ufw.8.html) (inglés), sólo tendrás que configurarlo y habilitarlo. Si estás ejecutando Geth y Prysm y tienes el software funcionando en diferentes máquinas, podrías establecer la siguiente configuración.

**Ejecución (Asumiendo Geth con IP 192.168.1.50)**

<pre><code><strong>sudo ufw default deny incoming
</strong>sudo ufw default allow outgoing
sudo ufw allow from 192.168.1.51 to any port 8551 proto tcp
sudo ufw allow 30303
<strong>sudo ufw enable
</strong></code></pre>

**Consenso (Asumiendo Prysm con IP 192.168.1.51)**

```
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 12000/udp
sudo ufw allow 13000/tcp
sudo ufw enable
```

Esta muy seguro! No hay tráfico de entrada o salida a menos que esté estrictamente relacionado con Ethereum. Una lista completa de puertos externos por ejecución y cliente de consenso se puede encontrar [aquí](/es/networking/port-forwarding).&#x20;

Desde aquí se pueden desbloquear puertos adicionales como SSH, la API HTTP de consenso (si también está ejecutando su validador en otra máquina) o la API RPC de ejecución (si desea interactuar con la red Ethereum utilizando su propio nodo).

### Hardware firewalls

Hardware firewalls are run on dedicated devices (Usually your router) and can manage traffic both within networks and between networks.

One way to really fortify your setup is to configure a dedicated subnet on your router solely for your nodes/validators and have the firewall drop traffic from any other subnet from reaching this subnet (Also known as blocking all RFC 1918 traffic)

Should your regular everyday computer (Or any other device on your network) become compromised, the infiltrator won't even know about your nodes as they are sitting on another subnet that is completely blocked off.\


Los hardware firewalls se ejecutan en dispositivos dedicados (normalmente el router) y pueden gestionar el tráfico tanto dentro de las redes como entre ellas.&#x20;

Una forma de fortalecer su configuración es configurar una subred dedicada en su router únicamente para sus nodos/validadores y hacer que el cortafuegos impida que el tráfico de cualquier otra subred llegue a esta subred (también conocido como bloqueo de todo el tráfico RFC 1918).&#x20;

Si su ordenador (o cualquier otro dispositivo de su red) se ve comprometido, el infiltrado ni siquiera sabrá de la existencia de sus nodos, ya que éstos se encuentran en otra subred que está completamente bloqueada.
