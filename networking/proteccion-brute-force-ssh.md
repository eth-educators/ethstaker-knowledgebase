# Protección Brute-force SSH

Para proteger tu servidor de intentos de conexión brute-force en SSH, puedes instalar `fail2ban`.

Este programa supervisará las conexiones entrantes y bloqueará las direcciones IP que intenten iniciar sesión repetidamente con credenciales incorrectas.

```bash
sudo apt-get install -y fail2ban

sudo vim /etc/fail2ban/jail.d/ssh.local
```

```bash
/etc/fail2ban/jail.d/ssh.local

[sshd]
enabled = true
banaction = ufw
port = 22
filter = sshd
logpath = %(sshd_log)s
maxretry = 5
```

{% hint style="info" %}
Si estás utilizando un puerto SSH no estándar que no sea el 22, deberás cambiarlo en el archivo de configuración anterior.
{% endhint %}

Puedes modificar la configuración de `maxretry` que es el número de intentos permitidos antes de bloquear la dirección ofensiva.

Guarda el archivo y reinicia el servicio.

```bash
sudo systemctl restart fail2ban
```

¡Felicitaciones! Has mejorado con éxito la seguridad de tu nodo 🥳
