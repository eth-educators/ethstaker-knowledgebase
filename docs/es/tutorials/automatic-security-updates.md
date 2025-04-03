# Actualizaciones de seguridad automáticas

!!! info "Info"
    Si tienes varias máquinas, asegúrate de espaciar el comando `Unattended-Upgrade::Automatic-Reboot-Time` para que no se reinicien todas al mismo tiempo.

Las actualizaciones de seguridad automáticas son útiles cuando no puedes acceder a tu máquina pero deseas que las actualizaciones de seguridad críticas se apliquen automáticamente.

```bash
sudo apt-get update -y
sudo apt-get install -y unattended-upgrades update-notifier-common

sudo vim /etc/apt/apt.conf.d/20auto-upgrades
```

```bash title="/etc/apt/apt.conf.d/20auto-upgrades"
APT::Periodic::Update-Package-Lists "1";
APT::Periodic::Unattended-Upgrade "1"
APT::Periodic::AutocleanInterval "7";
Unattended-Upgrade::Remove-Unused-Dependencies "true";
Unattended-Upgrade::Remove-New-Unused-Dependencies "true";

# Esta es la opción más importante: el reinicio automático.
# Esto debería estar bien, ya que todos los servicios deberían 
# iniciarse automáticamente al reiniciar.
Unattended-Upgrade::Automatic-Reboot "true";
Unattended-Upgrade::Automatic-Reboot-Time "02:00";
```

```bash
sudo systemctl enable unattended-upgrades
sudo systemctl restart unattended-upgrades
```

Actualizar los paquetes del sistema nuevamente.

```bash
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
```

Reiniciar la máquina.

```bash
sudo shutdown -r now
```

¡Felicitaciones! Has habilitado correctamente las actualizaciones automáticas en tu máquina de staking 🥳
