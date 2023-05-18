# Hardware Buenas Prácticas

## La importancia de usar una UPS



Es altamente recomendado el el uso de un UPS (Sistema de Alimentación Ininterrumpida) para tu nodo o validador. Al conectarlo, te aseguras de que no se apague repentinamente en caso de una pérdida de energía eléctrica inesperada.&#x20;

Una desconexión repentina puede causar varios problemas considerables, como:

* Corrupción de la base de datos
  * Esto requerirá que (dependiendo de la gravedad de la corrupción) elimines la base de datos almacenada y la vuelvas a sincronizar desde cero. Dependiendo de la velocidad de tu SSD, esto podría dejarte sin conexión por un tiempo.
* Corrupción del sistema operativo
  * Esto requerirá una reinstalación del sistema operativo. Luego, tendrás que volver a configurar la máquina, instalar un cliente de ejecución y consenso, configurar tus validadores y luego sincronizar ambos clientes.
* Fallas en el hardware
  * Si falla tu disco duro, deberás conseguir e instalar uno nuevo, luego volver a completar los pasos anteriores (instalar un sistema operativo y sincronizar los clientes).

Si ocurre un corte de energía y no se daña ningún componente físico, todavía podría hay una posibilidad de estar en peligro. Cuando se restablece la energía, es posible experimentar un aumento repentino de la misma que puede sobrecargar y quemar componentes, lo que significaría más tiempo fuera de línea mientras investiga qué componentes están dañados y luego los reemplaza.

Dependiendo del modelo de UPS y el sistema operativo que esté utilizando, puede configurar su UPS para que apague los computadores conectados de manera segura una vez que el nivel de la batería caiga por debajo de cierto punto. Esto es increíblemente poderoso para proteger sus datos y su computadora.

Mi UPS (1600VA/960W) me costó aproximadamente $200 USD y proporciona alrededor de una hora de energía a todos los dispositivos conectados. Tengo tanto mi nodo como mi router conectados, por lo que en caso de un corte de energía, el nodo seguirá en línea trabajando. ¡He tenido algunos cortes de energía breves desde que me convertí en validador, por lo que me ha sido de gran ayuda!

## Configurando el auto start

Si las cosas se apagan mientras duermes o no estás en casa, los siguientes pasos son muy útiles para hacer que las cosas se inicien automáticamente.

#### Como configurar tu computadora para que se encienda automáticamente después de una desconexión.&#x20;

En tu BIOS, es muy probable que haya una configuración de energía, allí deberías poder encontrar una opción para que tu computadora se encienda automáticamente una vez que se restablezca la energía.

Si no puedes encontrar la configuración, es posible que debas consultar la guía del usuario de tu placa madre.

NOTA - Para ingresar a tu BIOS, deberás presionar un botón específico después de encender la máquina (y antes de que se cargue el sistema operativo). Las teclas más comunes son "DEL", "F1", "F2", "F10".

Esto varía según las placas madre, y si no estás seguro de cuál es la tuya, verifica la información POST una vez que la PC se inicie, ya que puede mostrarla en la pantalla. O puedes consultar la guía del usuario de tu placa madre. O puedes hacer lo que yo hago, que es extender tus manos sobre el teclado y presionar las teclas mencionadas anteriormente todas a la vez y esperar a que una de ellas funcione.

#### Si estás en una máquina virtual, configura los servidores para iniciar&#x20;

Si estás usando un hipervisor para alojar tus nodos/validadores, entonces debes configurar las máquinas virtuales para que se enciendan automáticamente una vez que la computadora haya iniciado. Esto también te ahorrará tener que iniciarlos manualmente si reinicias la computadora principal.

#### Using services and configuring auto start (No sé como traducir esto))

Es una práctica común configurar tu nodo de ejecución, nodo de consenso y validadores de consenso como servicios y establecer su inicio automático una vez que el sistema operativo se haya iniciado. Esto se puede hacer con systemd.

Somer Esat ha escrito excelentes guías y tiene algunos ejemplos que se pueden consultar, uno de los cuales se puede encontrar aquí. En esa guía, hay tres ejemplos: "geth.service", "lighthousebeacon.service" y "lighthousevalidator.service".

Al seguir estos tres pasos, podrás minimizar el tiempo de inactividad de tu sistema.

## Abanico del NUC ruidoso&#x20;

Si estás utilizando un NUC, es posible que notes que el ventilador es bastante ruidoso y puede resultar molesto para los oídos. Esto se debe a una configuración llamada turbo boost que está habilitada de forma predeterminada.&#x20;

Para desactivar esta opción [ingresa al BIOS y desactivala](https://www.intel.com.au/content/www/au/en/support/articles/000032427/processors/intel-core-processors.html). Sin embargo, esto no es una buena práctica, entonces no es muy recomendable. En cambio, esto debería considerarse como una opción de calidad de vida si el ventilador del NUC es muy ruidoso y crees que es mejor pararlo.&#x20;
