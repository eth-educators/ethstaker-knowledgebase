# ¡Atestaciones perdidas! ¿Qué puedo hacer?

## ¡No entres en pánico!

Perder algunas [atestaciones](../staking-glossary.md#attestation) es completamente normal y extremadamente de bajo costo. La penalización por perder una atestación es exactamente la misma que la recompensa por una exitosa. Entonces, con alrededor de 240 atestaciones por día por validador, ¡perder una o dos sigue siendo una tasa de atestación exitosa de más del 99%!

## Comprendiendo las atestaciones perdidas, baja efectividad y mejorando tu configuración

> Hay dos causas de perder una atestación o tener una baja efectividad con tu validador. Algunas causas están bajo tu control como staker y algunas causas están fuera de tu control.

Incluso con una configuración perfecta, podrías perder algunas atestaciones o votar incorrectamente durante una atestación disminuyendo tu [efectividad](../staking-glossary.md#effectiveness) de vez en cuando. Las causas que están fuera de tu control a menudo están relacionadas con la propagación de la red o relacionadas con que algunos de tus [peers](../staking-glossary.md#peers) se retrasen en realizar sus propias tareas.

Para profundizar y aprender todo sobre la tarea de atestación, los tiempos, la efectividad y la propagación de la red, revisa estos excelentes artículos.

[Understanding Attestation Misses ↗](https://www.symphonious.net/2022/09/25/understanding-attestation-misses/) por Adrian Sutton

[Exploring ETH2: Attestation Inclusion ↗](https://www.symphonious.net/2020/09/08/exploring-eth2-attestation-inclusion/) por Adrian Sutton

[Defining Attestation Effectiveness ↗](https://www.attestant.io/posts/defining-attestation-effectiveness/) por Jim McDonald

Como staker, no puedes hacer mucho sobre las causas que están fuera de tu control. Lo que puedes hacer es trabajar en los elementos de tu configuración que están bajo tu control para maximizar tus recompensas. Incluso si tienes una configuración que funcionaba bien antes del merge, es posible que con el trabajo adicional que se está introduciendo, alguna parte que tu configuración pasó por alto podría ser la causa de atestaciones adicionales perdidas o una menor efectividad desde que se realizó el merge. Por eso deberías revisar todos estos elementos.



1. Asegúrate de que tus clientes estén actualizados. Las actualizaciones del cliente a menudo incluyen optimizaciones y mejoras que ayudarán a realizar tus tareas a tiempo.
2. Asegúrate de que tu máquina tenga consistentemente suficientes recursos (CPU, RAM, disco, etc). Usar una máquina dedicada puede ayudar. Si tus clientes están escasos de alguno de estos recursos, probablemente será una causa de más atestaciones perdidas y menor efectividad.
3. Asegúrate de que tu hora esté correctamente sincronizada. El protocolo del beacon chain es bastante sensible al tiempo. chrony es una buena herramienta para mejorar la sincronización de tu tiempo. En distribuciones de Ubuntu o Debian, la instalación de chrony a menudo es tan fácil como `sudo apt install chrony`. En Windows, puedes usar [estas instrucciones ↗](https://www.reddit.com/r/ethstaker/comments/nfca22/an\_opiniated\_solution\_to\_improve\_time\_sync\_on/) para mejorar la sincronización de tu tiempo.
4. Asegúrate de tener buena latencia, ancho de banda y calidad de internet. Para validadores de hogar, es poco realista pedir una ISP o conexión a internet dedicada para tu validador, pero asegúrate de que tus otros usos de la red no interfieran demasiado con tu validador. En caso de duda, verifica si puedes obtener un mejor plan de tu proveedor o verifica si hay un proveedor alternativo en tu área que pueda mejorar tu internet.
5. Asegúrate de tener consistentemente suficientes pares. Monitorear el recuento de pares de tus clientes no es una mala idea si tienes la capacidad técnica.
6. Asegúrate de tener puertos abiertos correctamente configurados que permitan conexiones entrantes. No solo puede mejorar la salud de tu configuración de networking y el recuento de tus pares, sino que también mejorará la salud de la red Ethereum en su conjunto. Para probar si tus puertos están abiertos, puedes usar el comprobador de puertos abiertos de StakeHouse. Llamando a `curl` [`https://eth2-client-port-checker.vercel.app/api/checker?ports=30303`](https://eth2-client-port-checker.vercel.app/api/checker?ports=30303)`, 9000` debería devolver un resultado que incluya 30303 y 9000 en el campo open\_ports si esos puertos están abiertos desde Internet. 30303 es el puerto P2P predeterminado para Geth y 9000 es el puerto P2P predeterminado para muchos clientes de consenso. Ajusta estos valores si usas puertos personalizados o si usas clientes que tienen puertos predeterminados diferentes. Consulta la documentación de tu cliente para encontrar más información sobre esto.

Una vez que tengas todo eso en su lugar, hay poco más que puedas hacer para ayudar. Puede haber algunos beneficios marginales al conectarse con más peers a costa de un mayor uso de recursos, especialmente de ancho de banda. Bajo circunstancias normales, el recuento predeterminado de pares de tus clientes debería ser bueno. Monitorear la calidad de Internet con herramientas como las de [pingman ↗](https://pingman.com/) puede ayudar a identificar la causa de algunas de estas atestaciones perdidas si están relacionadas con la red, pero probablemente seguirá estando fuera de tu control.

[Fuente ↗](https://www.reddit.com/r/ethstaker/comments/xto0dm/understanding\_missed\_attestations\_understanding/)
