# Migrando de forma segura las llaves de validadores

> Cuando migres llaves de validadores, tomate tu tiempo ¡Sin prisas!

Hay una variedad de escenarios donde necesitas mudar las llaves de validadores de una máquina a otra, aquí algunos ejemplos:

* ⬆️ Actualizando hardware.
* 🔧 Recuperándose de una falla de hardware.
* ☁️ Migrando de un servicio de hosting en la nube a una máquina casera de staking

En cualquiera de estos casos, el procedimiento debe ser el mismo. La cosa más importante a recordar es que la penalidad por estar offline es **muy baja**, así que no es urgencia optimizar el tiempo de inactividad. Un evento de slashing causado por una migración incorrecta de llaves incurrirá una penalidad equivalente a **MESES** de simplemente estar offline.

🚨 _No vayas con prisa_ 🚨

## Definiciones

**Origen**: De donde vienen las llaves.\
**Destino**: Hacia donde las llaves serán migradas

## Pasos

1. Detén cliente de validación en la máquina origen.
2. Detén cliente de validación en la máquina destino.
3. Espera un **MÍNIMO** de dos [epochs](/es/staking-glossary#epoch) finalizados antes de continuar.
4. Copia las llaves de los validadores a la máquina destino por medio de almacenamiento (Por ejemplo USB) o directamente de la máquina origen a la destino (Por ejemplo `scp`, `rsync`, etc...) Sí las llaves de los validadores se pierden durante un fallo de hardware [genéralas de vuelta](/es/validator-keys/secure-key-generation).
5. Borra las llaves de la máquina origen. Esto asegura que incluso sí la máquina origen reinicia inesperadamente, las llaves para firmar de los validadores no existirán y no podrán ser usadas por el cliente validador
6. De estar disponible, exporta cualquier [protección contra slashing](/es/validator-keys/slashing-protection) de la máquina origen e importala en la máquina destino.
7. Apaga la máquina origen y asegúrate al 100% que no se pueda reiniciar.
8. Arranca el cliente validador en la máquina destino.
9. Importa las llaves de validación.
10. Check the validator client logs to confirm everything is working correctly. Verifica los logs del cliente validador para confirmar que todo está funcionando correctamente.

¡Felicitaciones! Has migrado con éxito tus llaves de validación entre dos máquinas 🥳
