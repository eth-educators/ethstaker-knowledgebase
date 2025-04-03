# Validator effectiveness

La efectividad de un validador se puede entender como la utilidad de una [attestation](../../staking-glossary#attestation) para la red, eniendo en cuenta tanto la [producción de bloques ](../../staking-glossary#block-proposer)como la [idistancia de inclusión](../../staking-glossary#inclusion-distance).



## Proceso de inclusión de attestations&#x20;

¿Cómo se incluyen las attestations en la red de Ethereum? En grandes rasgos el proceso es el siguiente:

> Esta es una visión simplificada de la attesting, pero puede ser un buen punto de partida.

1. Cada validador que realiza una [attestation](../../staking-glossary#attestation) genera datos sobre el estado de la cadena.
2. La attestation se propaga por la red de Ethereum hacia los agregadores [aggregators](../../staking-glossary#attestation-aggregator) relevantes.
3. Cada agregador relevante que recibe la attestation la agrega con otras attestations que tienen las mismas reclamaciones.
4. La attestation agregada se propaga por la red de Ethereum a todos los nodos.
5. Cualquier validador que esté proponiendo un bloque y aún no haya visto la attestation agregada en la cadena, la añade al bloque.

Cuando una attestation tiene una distancia de inclusión mayor que 1, es importante entender por qué. Hay varias razones posibles:

### Retraso en la generación de attestation

Un validador puede tener problemas que resulten en un retraso en la generación de la attestation. Por ejemplo, puede tener información desactualizada sobre el estado de la cadena, o el validador puede tener poca potencia y tardar un tiempo significativo en generar y firmar la attestation. Independientemente de la razón, una attestation retrasada tiene un efecto potencial en los pasos restantes del proceso.

### Retraso en la generación de la attestation agregada

Una vez que un validador ha generado una attestation, esta debe propagarse a través de la red hasta los agregadores. La naturaleza de este proceso implica que una propagación temprana es crucial para asegurar que la attestation sea recibida por un agregador a tiempo para su integración en la attestation agregada antes de su difusión. Los validadores deben asegurarse de estar conectados con suficientes pares variados para garantizar una propagación rápida hacia los agregadores.

### Retraso en la propagación de la attestation&#x20;

Un _aggregator_ puede retrasar el proceso de agregación de las attestations. Esto ocurre con mayor frecuencia cuando el nodo ya está sobrecargado debido a la generación de attestations, pero también puede deberse a la velocidad del algoritmo de agregación cuando hay un gran número de validadores que deben ser agregados.

### Retraso en la propagación de la attestation agregada&#x20;

Al igual que con el retraso en la propagación de la attestation, la attestation agregada también debe circular por la red y puede sufrir los mismos retrasos.

### Fallo en la producción de bloques

Para que una attestation se convierta en parte de la cadena, debe ser incluida en un bloque. Sin embargo, la producción de bloques no está garantizada. Un bloque puede no ser producido porque un validador está fuera de línea o está desincronizado con el resto de la red, lo que resulta en la producción de un bloque con datos inválidos que es rechazado por la cadena. Sin un bloque, no hay forma de incluir la attestation en la cadena en ese slot, lo que resulta en una distancia de inclusión mayor a la óptima.

El fallo en la producción de bloques tiene un segundo impacto, que es el aumento del número total de attestations elegibles para ser incluidas en el próximo bloque que se produce. Si hay más attestations disponibles de las que pueden caber en un bloque, es probable que el productor incluya las attestations que ofrecen la mayor recompensa, es decir, aquellas con la menor distancia de inclusión. Esto puede resultar en que las attestations que no lograron su bloque óptimo también pierdan los bloques posteriores debido a que se vuelven menos atractivas para su inclusión.

El hecho de que la producción de bloques esté fuera del control del validador (excepto en los bloques que el validador mismo produce) requiere la definición del término "earliest inclusion slot" (slot de inclusión más temprano), donde el earliest inclusion slot es el primer slot mayor que el slot de la attestation en el que se produce un bloque válido. Esto toma en cuenta el hecho de que las attestations no pueden ser incluidas en bloques que no existen y no refleja la efectividad del validador.

## Actividad maliciosa&#x20;

Es posible que una persona malintencionada se niegue a incluir cualquier attestation en sus agregados, o a incluir attestations en sus bloques. La primera situación se mitiga al tener varios agregadores para cada grupo de attestations, y la segunda se por el costo de excluir una attestation agregada. Sin embargo, en última instancia, si el costo de excluir una attestation de un bloque es compensado económicamente o se considera que tiene un valor político más alto, no hay nada que un validador que realiza attestation pueda hacer para forzar su inclusión por parte de un validador que produce bloques.

## Calculating Attestation Effectiveness

El cálculo de la efectividad de una attestation se puede entender como qué tan útil es para la red, teniendo en cuenta tanto la producción de bloques como la distancia de inclusión. Se define formalmente como:

> (earliest inclusion slot - slot de la attestation) / (slot de inclusión real - slot de la attestation)

La efectividad se representa como un valor porcentual. Una attestation que no logra ser incluida con la máxima distancia de inclusión de 32 se considera que tiene una efectividad de 0. Aquí tienes algunos ejemplos de cálculos de efectividad:

| Espacio del attestation  | Espacio de primera inclisuión | Espacio de inclusión actual | Efectividad  |
| ------------------------ | ----------------------------- | --------------------------- | ------------ |
| 5                        | 6                             | 6                           | 100%         |
| 5                        | 6                             | 7                           | 50%          |
| 5                        | 6                             | 8                           | 33.3%        |
| 5                        | 7                             | 7                           | 100%         |
| 5                        | 7                             | 8                           | 66.7%        |
| 5                        | 7                             | 9                           | 50%          |

## Efectividad de la attestation agregada

La efectividad de una única attestation es interesante pero no es muy útil por sí sola. Al calcular la efectividad agregada de múltiples attestations, tanto a lo largo del tiempo como entre múltiples validadores, se obtiene una visión más precisa de la efectividad general de un grupo de validadores. La efectividad agregada se puede calcular como un promedio simple de la efectividad individual de las attestations, por ejemplo, un promedio móvil de 7 días que abarque a todos los validadores en un grupo determinado.

[_**Source ↗**_](https://www.attestant.io/posts/defining-attestation-effectiveness/)
