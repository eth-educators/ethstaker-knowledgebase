# Errores y problemas comunes

<details>
<summary>Mi Geth está arrojando errores y no se está sincronizando</summary>

Una causa común de los errores de Geth es un apagado incorrecto, por ejemplo, debido a un corte de energía, o no hay tiempo suficiente para una salida ordenada del proceso mientras geth escribe datos en el disco. Como solución permanente para este último caso, incrementa el valor de `TimeoutStopSec` de tu servicio systemd al valor 300.

Para arreglarlo, puedes [Resincronizar Geth](../../tutorials/resync-geth.md)
</details>

<details>
<summary>¿Estás ejecutando Pihole en red? Mi nodo está experimentando problemas de DNS.</summary>

Según la configuración predeterminada de Pihole, la limitación de velocidad de DNS bloquea cualquier cliente con >1000 queries por 60 segundos. Para solucionarlo, aumenta el valor del límite de queries o excluye tu nodo del DNS de Pihole.
</details>

<details>
<summary>Mi Ledger Nano Hardware Wallet no puede depositar 32ETH para un nuevo validador</summary>

Si encuentras dificultades para realizar el depósito, activa la blind signing (firma ciega) y los datos del contrato.
</details>
