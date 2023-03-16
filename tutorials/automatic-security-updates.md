# Automatic security updates

Automatic security updates are helpful when you are not able to access your machine but want critical security updates to be applied automatically.

```
sudo apt-get update -y
sudo apt-get install -y unattended-upgrades update-notifier-common

sudo vim /etc/apt/apt.conf.d/20auto-upgrades
```

{% code title="/etc/apt/apt.conf.d/20auto-upgrades" %}
```
APT::Periodic::Update-Package-Lists "1";
APT::Periodic::Unattended-Upgrade "1";
APT::Periodic::AutocleanInterval "7";
Unattended-Upgrade::Remove-Unused-Dependencies "true";
Unattended-Upgrade::Remove-New-Unused-Dependencies "true";

# This is the most important choice: auto-reboot.
# This should be fine since all services should auto-start on reboot.
Unattended-Upgrade::Automatic-Reboot "true";
Unattended-Upgrade::Automatic-Reboot-Time "02:00";
```
{% endcode %}

```
sudo systemctl enable unattended-upgrades
sudo systemctl restart unattended-upgrades
```

Update system packages again.

```
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
```

Restart the machine.

```
shutdown -r now
```
