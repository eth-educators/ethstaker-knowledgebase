# Brute-force SSH protection

To protect your server from brute-force SSH connection attempts, you can install `fail2ban`.

This program will monitor incoming connections and block IP addresses that try to log in with faulty credentials repeatedly.

```bash
sudo apt-get install -y fail2ban

sudo vim /etc/fail2ban/jail.d/ssh.local
```

{% code title="/etc/fail2ban/jail.d/ssh.local" %}
```bash
[sshd]
enabled = true
banaction = ufw
port = 22
filter = sshd
logpath = %(sshd_log)s
maxretry = 5
```
{% endcode %}

{% hint style="info" %}
If you're using a non-standard SSH port that isn't `22` then you will need to change that in the cofig file above.
{% endhint %}

You can change the `maxretry` setting, which is the number of attempts it will allow before locking the offending address out.

Save the file and restart the service.

```bash
sudo systemctl restart fail2ban
```

Congratulations! You've successfully improved the security of your node 🥳
