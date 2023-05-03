# Requerimentos de hardware



Un **full node** es uno que se ejecute tanto en el  [Execution Client](../validator-clients/execution-clients.md) como en el [Consensus Client](../validator-clients/consensus-clients.md).

Aquí puedes ver de forma sencilla que es lo que se requiere para ejecutar un full node en la red de Ethereum:&#x20;

* Una **conexión a Internet estable**. Cuanto más tiempo permanezca en línea, mejores serán sus recompensas. Una conexión a Internet irregular llega a perjudicar sus ganancias.
* Al menos **10 Mbps de ancho de banda** tanto de subida como de bajada. Un **full node** suele requerir alrededor de 8 Mbps a 10 Mbps de tráfico de red, dependiendo de su configuración.
* Que **no haya un límite de datos por parte de su proveedor de internet**. Ejecutar un nodo completo consumirá muchos datos, hasta más de 2 TB por mes de solo datos de cadena! Esto se puede mitigar en cierta forma con algunos ajustes de configuración en los clientes ETH, pero como regla general, no es recomendable ejecutar un nodo completo si su plan de Internet tiene un límite de datos mensual.
* **Servicio de electricidad estable**. Por la misma razón que se necesita una conexión a Internet estable, también es necesario tener energía confiable. Esto se puede mitigar con una gran UPS (batería de respaldo) para manejar cortes de energía breves.
* **Una computadora que cumpla con los requerimentos suficientes**. Esto es bastante flexible porque realmente depende del cliente de ejecución y consenso que use y de las configuraciones que configure. La computadora puede ser una máquina local o puede ser un Servidor Privado Virtual (VPS) alojado en la nube. A continuación podrá encontrar información al respecto:

Algunos de los requísitos que son considerados como **mínimos** para ejecutar un full node son:&#x20;

* Sistema operativo Linux o macOS
* CPU de cuatro núcleos (o doble núcleo hiperprocesado); se admiten tanto x64 como arm64&#x20;
* 16 GB de RAM (preferiblemente DDR4)&#x20;
* 2 TB de espacio libre en disco SSD.&#x20;
  * Un disco duro de plato giratorio no es lo _suficientemente rápido_ para manejar las constantes lecturas y escrituras aleatorias que requiere la actividad de la cadena de bloques. Es **obligatorio el uso** de una unidad de estado sólido.

{% hint style="info" %}
Generalmente las configuraciones tienden a usar entre 16GB y 32GB de RAM para lograr retornos a largo plazo.&#x20;
{% endhint %}

* La configuración ideal y lo más práctico es tener una computadora dedicada para el staking. Intenta limitar los procesos adicionales que se ejecutan en tu equipo de staking, especialmente si se trata de algo que se conecta con el mundo exterior. Cada proceso adicional y cada archivo descargado es otra oportunidad.
* Tus ETH estarán bloqueados en la [Beacon Chain](../staking-glossary.md#beacon-chain) hasta mediados de 2023, [posiblemente más](../faq.md#can-i-withdraw-my-eth-at-any-time). Por lo que tiene sentido comprar hardware de buena calidad. Pero no te alarmes, esto no es como la minería que tiene márgenes ajustados, aquí la inversión se recuperará rápidamente.
* ¡Usa Linux, es fácil! En un futuro previsible, Linux recibirá un mejor soporte tanto de los equipos de clientes como de la comunidad en general. Si eliges Linux, tendrás acceso a más guías y más soporte técnico de la comunidad en general. Linux es ligero, estable, seguro y no te obliga a reiniciar para las actualizaciones frecuentemente.
* ¡Usa un [cliente minoritario](../validator-clients/validator-clients-explained.md)! Es bueno tanto para la salud de Ethereum como para la salud de tu bolsillo.
* ¡Se recomienda fuertemente un respaldo con una UPS! En el deben de estar conectados tanto el módem como el router. Muchos proveedores de servicios de internet tienen generadores para respaldar las comunicaciones de servicios de emergencia, lo que significa que el Internet sigue funcionando durante un corte de energía siempre que tu equipo esté alimentado. Tu proveedor de servicios de Internet puede ser el mismo. Aparte de los cortes de energía, no tener que apagar tu computadora cada vez que la alimentación eléctrica falle es algo que se agradece bastante cuando haces staking desde casa.&#x20;
* Todo lo que se mencionó aquí aplica tanto para los que hacen staking solos y también para los que son operadores de nodos de una minipool de 16 ETH. con [Rocket Pool ↗](https://rocketpool.net/).

## Ejemplos de hardware

Aquí puedes echar un vistazo a algunos [ejemplos de equipo](hardware-examples/)  y sus explicaciones detalladas con las que se puede staking desde la casa

## Opciones de Hardware

* [**Raspberry Pi**](hardware-requirements.md#raspberry-pi)
* [**Laptop vieja/ escritorio**](hardware-requirements.md#old-laptopdesktop)
* [**Laptop nueva**](hardware-requirements.md#new-laptop)
* [**De escritorio pre-fabricado** ](hardware-requirements.md#new-pre-built-desktop)
* [**De escritorio personalidad**](hardware-requirements.md#custom-built-desktop)
* [**Intel NUC**](hardware-requirements.md#intel-nuc)
* [**Servidor**](hardware-requirements.md#server)
* [**DAppNode**](hardware-requirements.md#dappnode)
* [**Avado**](hardware-requirements.md#avado)
* [**M1 Mac Mini**](hardware-requirements.md#m1-mac-mini)
* [**Virtual Private Server**](hardware-requirements.md#virtual-private-server)

### **Raspberry Pi**

**Precio:** Bajo costo.

**Rendimiento:** Es posible ejecutar un nodo de ejecución y consenso en una Raspberry Pi, específicamente, **Nimbus**, que fue diseñado para ejecutarse en dispositivos como una Raspberry Pi. Poder ejecutar nodos de Ethereum en hardware de baja potencia es excelente para la descentralización y un objetivo honorable, sin embargo, ejecutar un validador es diferente.

Es importante considerar, que la falta de potencia de procesamiento y memoria del Pi es un riesgo en algunas situaciones, como un período sin finalización. La recompensa de ahorrar unos pocos cientos de dólares en comparación con hardware más potente no se acerca siquiera a compensar el riesgo de un tiempo de inactividad prolongado debido a la falta de potencia de procesamiento o memoria.

**Consumo energético:** aproximadamente 8 watts.

### **Computadora portátil o de escritorio vieja**

**Precio:** Bajo costo.

**CPU**: Para hacer stake en la red principal, se recomienda fuertemente una CPU que obtenga una puntuación de al menos 6000 o mejor en Passmark. Para los tiempos de sincronización inicial, el rendimiento de un solo hilo es mejor que tener muchos núcleos.&#x20;

**Memoria**: A menos de que utilice un sistema operativo extremadamente básico, se recomienda un mínimo de 16 GB de RAM para la red principal.&#x20;

**Almacenamiento**: Se requiere un SSD. No es necesario preocuparse por SATA vs NVMe, ambos serán lo suficientemente rápidos. Comprar uno con una especificación alta de terabytes escritos ayudará con la longevidad. La capa de ejecución y consenso de Ethereum se acerca a 1 TB de tamaño, por lo que se recomienda un disco de 2 TB o más.&#x20;

**Advertencias**: La estabilidad y el tiempo de actividad son esenciales para maximizar las ganancias. Si utiliza una computadora de escritorio antigua, considere reemplazar la PSU y los ventiladores. Comprar una PSU de clasificación titanio o platino también ayudará a ahorrar en la factura mensual de electricidad. Si planea hacer stake con una computadora portátil antigua, tenga en cuenta que tienen una capacidad reducida para manejar el calor debido a su factor de forma, y en casos poco frecuentes, ejecutarse mientras está enchufada las 24 horas del día, los 7 días de la semana, puede causar problemas con la batería.

### **Laptop nueva**

Si piensas en adquirir una computadora portátil nueva no es necesario que inviertas en una de muy alta gama, ya que aspectos como la pantalla, el teclado o el trackpad no son necesario una vez que tengas configurada tu máquina de staking. Simplemente puedes conectarte a la máquina de staking de forma remota desde tu ordenador normal. La configuración de perfil bajo en realidad sería una desventaja al tener en cuenta el rendimiento térmico. Por otro lado, los portátiles típicamente no incluyen un puerto ethernet lo que significa que estarás confiando en el WiFi. Esto no debería de representar algún problema, ya que el WiFi es muy confiable ahora, pero no hay nada como la simplicidad y confiabilidad de una conexión directa.

### **Computadora de escritorio prefabricada.**

Esta es probablemente la opción más simple y tiene la ventaja de que se puede ir mejorando en el futuro.

**Precio:** Mediano costo.

**Consumo energético:** alrededor de 30 watts.

### **Computadora de escritorio personalizada**

Esto es básicamente lo mismo que usar una preconstruida. Sin embargo, construir su propia computadora de escritorio le da la opción de elegir aspectos aún más personalizables, como un case que le guste y comprar componentes de mayor calidad. Para aquellos de ustedes que nunca han construido una computadora, es más fácil que Lego, porque solo se pueden ensamblar de una manera. Además, no obtendrá piezas extrañas que serán difíciles de reemplazar en caso de que alguna vez fallen. Desafortunadamente, en las computadoras preconstruidas, a veces se hacen concesiones con componentes como la fuente de alimentación para calmar a los contadores y aumentar los márgenes. ¡Puntos de estilo por agregar una tarjeta RAID!

### **Intel NUC**

**Precio:** Mediano costo.

**Consumo energético:** 20-25 watts.



Los NUC son muy lindos, y su pequeño factor de forma les da un factor de aprobación significativamente alto. Desafortunadamente, esto viene con un precio un poco más alto y un rendimiento ligeramente inferior que la opción de escritorio más grande. Sin embargo, estas son pequeñas desventajas. Probablemente esta es la mejor opción para la mayoría de las personas.

### **Servidor**

**Precio :** Alto costo.

**Consumo energético:** Es bastante considerable, un servidor moderno consume alrededor de 100 watts, uno más antiguo, puede estar alrededor de 150 watts.

Los servidores empresariales están repletos de características y están diseñados específicamente para hacer exactamente lo que un validador intenta hacer: funcionar las 24 horas del día, los 7 días de la semana, los 365 días del año. Tienen fuentes de alimentación redundantes en caso de que una se rompa, en su mayoría tienen 2 CPUs, por lo que en el improbable caso de que una falle, puedes sacarla y reiniciar con solo una.

Por otro lado, tienen tarjetas RAID incorporadas para que puedas tener almacenamiento redundante. Tienen bandejas de unidades intercambiables en caliente, por lo que si una de tus unidades falla, ni siquiera necesitas apagarlo. Todos los componentes son de alta calidad y están diseñados para durar. También obtienes herramientas de monitoreo y mantenimiento que no se incluyen en el equipo de consumo como iDRAC e iLo.

Definitivamente, señalaría que, si bien los servidores son excelentes para el staking, es mejor que optes por adentrarte adentrarse un poco en el tema y geek out. Se requiere cierta investigación para saber lo que estás buscando antes de salir a comprar un servidor y existe la posibilidad de que te encuentres con un problema técnico extraño que tendrás que solucionar.

### [**DAppNode**](https://dappnode.io/)

**Precio:** Mediano costo

**Rendimiento:** El DAppNodeXtreme es una buena opción si buscas un sistema operativo personalizado con una UX fácil. Un DAppNode box es solo un NUC preconfigurado con su software. Si tienes suficiente confianza para instalar un sistema operativo por ti mismo, puedes ahorrar un poco de dinero comprando un NUC normal e instalando DAppNode tú mismo. También puedes instalar el sistema operativo DAppNode en cualquier computadora. Si no quieres lidiar con la instalación de sistemas operativos y buscas una UX fácil, comprar un DAppNode box es una forma conveniente y simple de comenzar.

**Consumo energético:** 20-25watts.

### [**Avado**](https://ava.do/shop)

Avado es una solución fácil para realizar staking desde casa para personas con conocimientos técnicos limitados o poco tiempo. Los dispositivos Avado vienen preconfigurados con una interfaz de usuario amigable que permite usar y administrar el dispositivo desde cualquier parte del mundo.&#x20;

Usar un Avado es conveniente, seguro y **fiel al espíritu de la descentralización**.



### [**M1 Mac Mini**](https://www.apple.com/shop/buy-mac/mac-mini)

**Precio:** Mediano costo.

**Rendimiento:** Definitivamente actualiza a 16GB de memoria. La CPU será más que suficientemente rápida con una puntuación de 15.108 en PassMark. Asegúrate de obtener 2TB o más de almacenamiento, ya que la memoria y el almacenamiento interno están integrados en la placa base y requieren soldadura y conocimientos técnicos avanzados para actualizarlos.

Definitivamente actualice a 16GB de memoria. La CPU será lo suficientemente rápida con una puntuación de aprobación de 15,108. Asegúrese de tener un plan para obtener al menos 2TB o más de almacenamiento, la memoria interna y el almacenamiento están integrados en la placa base y requieren soldadura y avanzados conocimientos técnicos para actualizarlos.

**Consumo energético:** Ligeramente menor que el  NUC, pero no lo suficiente para marca alguna diferencia real.

Importante! No es posible ejecutar Linux en la nueva arquitectura ARM que utiliza. Es más caro que el NUC y también carece de actualizabilidad y facilidad de servicio, pero para los fanáticos de Mac OS, esta es una gran opción que funcionará muy bien.

### **Servidor virtual privado (VPS)**&#x20;

**Precio:** Alrededor de entre $20 - $50 por mes.

**Rendimiento:** Es directamente proporcional a la cantidad que puedas permitirte adquirir.&#x20;

Si vives en algún lugar propenso a desastres naturales o tienes una red eléctrica o conexión a internet inestable pero aún quieres hacer solo staking, esta es una buena opción. Si tienes un servicio electricidad e internet estables, ejecutar tu propio hardware sería una solución más barata y rentable a largo plazo. Debes evaluar los pros y los contras de esto para tu propia situación. Recuerda que si uno de los proveedores de VPS falla, significará que todas las personas que usan ese servicio de VPS también se verán afectadas, y las penalizaciones por inactividad serán mucho mayores que si tienes tiempos de inactividad no correlacionados por ti mismo.

