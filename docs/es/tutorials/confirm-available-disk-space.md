# Usa Todo el Espacio de Disco Disponible

Aunque tengas un disco SSD grande instalado, hay casos en los que Ubuntu solo reporta 200GB de espacio disponible, causando que el sistema se quede sin espacio de disco cuando está sincronizando.&#x20;

El mensaje de error es similar a:

`Fatal: Failed to register the Ethereum service: write /var/lib/goethereum/geth/chaindata/383234.ldb: no space left on device`

Para corregir este asunto, asumiendo que tienes un SSD con mayor capacidad de 200GB, expande la asignación de espacio a la LVM siguiendo los siguientes pasos:

```bash
sudo lvdisplay # Check your logical volume size

sudo lvm # Attach the lvm console
lvextend -l +100%FREE /dev/ubuntu-vg/ubuntu-lv
lvextend -l +100%FREE -r /dev/ubuntu-vg/ubuntu-lv
exit

sudo resize2fs /dev/ubuntu-vg/ubuntu-lv
df -h # Check results
```

¡Enhorabuena! Ahora estás usando todo el espacio disponible en el disco para tu maquina de staking. 🥳
