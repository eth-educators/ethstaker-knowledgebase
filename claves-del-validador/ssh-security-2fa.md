# Seguridad SSH - 2FA

La autenticación de dos factores  implica requerir una segunda medida de seguridad además de su contraseña o clave SSH, generalmente en un dispositivo separado del principal.

Por ejemplo, puede estar familiarizado con el inicio de sesión en un sitio web, como un intercambio cripto, utilizando una contraseña y un código de Google Authenticator (o un código de SMS). Este proceso de dos pasos es un ejemplo de autenticación de dos factores.

SSH también se puede configurar para requerir un código de autenticación de Google, lo que significa que un atacante que de alguna manera comprometiera su clave SSH y su frase de contraseña **aún necesitaría el dispositivo con la aplicación de autenticación (presumiblemente su teléfono).** Esto agrega una capa adicional de seguridad a su sistema.

{% hint style="warning" %}
**Se recomienda encarecidamente** que abra un segundo terminal con una conexión SSH a su nodo, en caso de que configure algo mal. De esta manera, tendrá una copia de seguridad que aún está conectada en caso de que se bloquee, para que pueda deshacer fácilmente sus errores.

**Si logra bloquearse**, deberá acceder físicamente a su nodo a través de su monitor y teclado locales para iniciar sesión y reparar la configuración incorrecta.
{% endhint %}

Comience instalando [Google Authenticator (se abre en una ventana nueva)](https://play.google.com/store/apps/details?id=com.google.android.apps.authenticator2\&hl=en\_US\&gl=US) (o un equivalente compatible) en su teléfono si aún no lo tiene. Para los usuarios de Android, considere [andOTP (se abre en una ventana nueva)](https://play.google.com/store/apps/details?id=org.shadowice.flocke.andotp\&hl=en\_US\&gl=US), que es una alternativa de código abierto que admite el bloqueo de contraseña y copias de seguridad convenientes.

A continuación, instale el módulo Google Authenticator en su nodo con este comando:

```
sudo apt install -y libpam-google-authenticator
```

Ahora dile a   `PAM` (pluggable authentication modules) para utilizar este módulo. Primero, abra el archivo de configuración:

```
sudo nano /etc/pam.d/sshd
```

Find `@include common-auth` (debe estar en la parte superior) y comentalo agregando un `#` delante de él, por lo que se ve así:

```
# Standard Un*x authentication.
#@include common-auth
```

A continuación, agregue estas líneas en la parte superior del archivo:

```
# Enable Google Authenticator
auth required pam_google_authenticator.so
```

Luego guarde y salga del archivo con `Ctrl+O`, `Enter`, y `Ctrl+X`.

Ahora que `PAM` sabe usar Google Authenticator, el siguiente paso es decirle a `sshd` que use `PAM`. Abra el archivo de configuración `sshd` :

```
sudo nano /etc/ssh/sshd_config
```

Ahora cambia la linea `KbdInteractiveAuthentication no` a `KbdInteractiveAuthentication yes` entonces deberia verse así:

```
# Change to yes to enable challenge-response passwords (beware issues with
# some PAM modules and threads)
KbdInteractiveAuthentication yes
```

(Las versiones anteriores de SSH llaman a esta opción `ChallengeResponseAuthentication` en lugar de `KbdInteractiveAuthentication`.)

Agregue la siguiente línea al final del archivo, que le indica a  `sshd`  que necesita tanto una clave SSH como el código de Google Authenticator:

```
AuthenticationMethods publickey,keyboard-interactive
```

Todas las opciones añadidas a `AuthenticationMethods` serán necesarias cuando inicie sesión. Así que puede elegir, e.g. 2FA y contraseña, o una combinación de los tres métodos.

* `publickey` (SSH llave)
* `password publickey` (contraseña)
* `keyboard-interactive` (2FA código de verificación)

Luego guarde y salga del archivo con `Ctrl+O`, `Enter`, y `Ctrl+X`.

Ahora  `sshd` esta configurado , necesitamos crear nuestros códigos 2FA. En tu terminal, ejecuta:

```
google-authenticator
```

Primero, le preguntará acerca de los tokens basados ​​en el tiempo. Decir `y` a esta pregunta:

```
Do you want authentication tokens to be time-based: y
```

Ahora verá un gran código QR en su pantalla; escanéelo con su aplicación Google Authenticator para agregarlo. También verá su llave secreta y algunos códigos de respaldo con este aspecto:

```
Your new secret key is: IRG2TALMR5U2LK5VQ5AQIG3HA4
Your verification code is 282436
Your emergency scratch codes are:
  29778030
  86888537
  50553659
  41403052
  82649596
```

{% hint style="info" %}
Registre los códigos de emergencia en un lugar seguro en caso de que necesite iniciar sesión en la máquina pero no tenga su aplicación 2FA a mano. ¡Sin la aplicación, ya no podrá usar SSH en la máquina!
{% endhint %}

Finalmente, te pedirá algunos parámetros más; los valores predeterminados recomendados son los siguientes:

```
Do you want me to update your "/<username>/.google_authenticator" file: y
Do you want to disallow multiple uses of the same authentication token: y
By default... < long story about time skew > ... Do you want to do so: n
Do you want to enable rate-limiting: y
```

Una vez que haya terminado, reinicie `sshd` para que obtenga la nueva configuración:

```
sudo systemctl restart sshd
```

Cuando intente ingresar a su servidor SSH con sus claves SSH, ahora también se le debe solicitar un código de verificación 2FA, pero no una contraseña.

[**Fuente↗**](https://docs.rocketpool.net/guides/node/securing-your-node.html#optional-enable-two-factor-authentication)
