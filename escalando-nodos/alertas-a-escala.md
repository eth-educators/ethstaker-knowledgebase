# Alertas a escala

It’s easy to just set thresholds to every possible monitored metric and add an alarm to it. But that could lead to fatigue, distractions, and also ignoring alerts, see [ ](https://www.atlassian.com/incident-management/on-call/alert-fatigue)Las alertas deben ser muy específicas. Es fácil simplemente establecer umbrales para cada métrica monitoreada posible y agregarle una alarma. Pero eso podría provocar fatiga, distracciones y también ignorar alertas, consulte [este articulo](https://www.atlassian.com/incident-management/on-call/alert-fatigue) para obtener más detalles.

Las alertas nunca deben ignorarse, incluso si cree que tiene una idea de qué las causó.

Para obtener buenos consejos sobre las alertas en general, consulte [“My Philosophy on Alerting”](https://docs.google.com/document/d/199PqyG3UsyXlwieHaqbGiWVa8eMWi8zzAn0YfcApr8Q/edit).

## Herramientas Saas

* Pager Duty
* VictorOps

## On-Call

Hay una práctica en cada servicio en la nube, llamada "estar de guardia". Eso significa que, en algún momento, hay una persona responsable de reaccionar ante las alertas, independientemente de cuándo sucedan.&#x20;

Eso significa estar listo para actuar en medio de la noche, los fines de semana, etc. Esa es una posición tediosa y agotadora, por lo que es mejor rotar a las personas con frecuencia en eso.&#x20;

Un ejemplo de la política de guardia se puede encontrar en este [GitLab On-Call Handbook](https://about.gitlab.com/handbook/on-call/).

## Respuesta al incidente

¿Qué buscar primero?

1. ¿Está el nodo en funcionamiento? ¿El cliente del validador está funcionando? ¿CPU/RAM/espacio en disco está bien?
2. Lea los registros. ¿Hay suficientes peers? ¿El número de validadores encontrado por el cliente del validador es el esperado?
3. ¿Está su nodo sincronizado/se está sincronizando? Si es así, ¿está en el fork correcto ? Tome [`/v1/beacon/headers/head` API](https://ethereum.github.io/beacon-APIs/#/Beacon/getBlockHeader) y verifíquelo con cualquier explorador de bloques público o en una comunidad.
4. ¿Se está finalizando la red? [`eth/v1/beacon/headers/finalized` API](https://ethereum.github.io/beacon-APIs/#/Beacon/getBlockHeader) -- debe moverse cada 6,2 minutos.

### Fugas de inactividad

La fuga de inactividad significa que su nodo fue elegido para realizar una determinada tarea (certificar el cabezal de la cadena o producir un bloque) y no hizo su trabajo a tiempo.

Las fugas de inactividad tienen penalizaciones relativamente pequeñas. Degradarán el rendimiento del Validador en términos de rendimiento anual. Eso significa que tiene alguna opción sobre cómo manejarlos:

1. Reaccione lo antes posible: utilícelo si tiene un equipo de DevOps adecuado y desea optimizar el rendimiento del nodo y el mejor APY posible. Asegurar rotaciones regulares en el equipo de guardia.
2. Reaccione solo durante el "horario comercial", pero los fines de semana, solo notifique, digamos, de 9:00 a 21:00 todos los días. Eso reduce en gran medida la tensión en el personal de guardia.
3. Reaccione solo durante el horario comercial, igual que (2), pero no notifique los fines de semana.

### Retrasos en las certificaciones (rendimiento subóptimo del nodo)

### Largos tiempos de procesamiento de bloques

### Incidentes de seguridad

**Posibles ataques de red**

¿A qué canales comunicarse si cree que se trata de un ataque a la red?

**Posible vulnerabilidad**

¿A qué canales comunicarse si se trata de una posible vulnerabilidad?

## TBD

* Explicación de las alertas básicas que deben incorporar (slots retrasados, baja tasa de participación, tiempos de procesamiento de bloques, etc.)&#x20;
* ¿Por cuánto tiempo almacenar los datos?&#x20;
* Recomendación genérica sobre mejores prácticas de alertas/métricas

## Respuesta al incidente

¿Qué buscar primero? ¿Cuándo da la alarma? Primeros pasos requeridos durante la respuesta a la incidencia.
