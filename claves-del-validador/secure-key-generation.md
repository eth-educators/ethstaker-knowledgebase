# Generación segura de claves



{% tabs %}
{% tab title="Descarga la aplicación CLI " %}
Paso 1: Descargue [la aplicación de interfaz de línea de comando de depósito↗](https://github.com/ethereum/staking-deposit-cli/releases/) para su sistema operativo.

{% hint style="info" %}
Asegúrese de descargar desde la cuenta oficial de GitHub de la Fundación Ethereum verificando la URL: https://github.com/ethereum/staking-deposit-cli/releases/
{% endhint %}

<figure><img src="../.gitbook/assets/image (22) (2).png" alt=""><figcaption></figcaption></figure>

Paso 2: Genere claves de depósito utilizando la herramienta de depósito de la Fundación Ethereum

{% hint style="info" %}
Por seguridad, le recomendamos que se desconecte de Internet para completar este paso.
{% endhint %}

* Descomprima el archivo que acaba de descargar.
* Use la terminal para moverse al directorio que contiene el ejecutable del depósito.
* Ejecute el siguiente comando para iniciar la aplicación.

`./deposit new-mnemonic --chain mainnet`

Por favor, asegúrese de haber configurado `--chain mainnet` para Mainnet, de lo contrario el depósito no será válido.

Ahora siga las instrucciones que se le presentan en la ventana del terminal para generar sus claves.
{% endtab %}

{% tab title="Descargar la aplicación  Key Gen GUI  " %}
TODO
{% endtab %}

{% tab title="Construir desde el origen" %}
TODO
{% endtab %}
{% endtabs %}

Estas herramientas se pueden utilizar como una alternativa a la [Staking Deposit CLI ↗](https://github.com/ethereum/staking-deposit-cli/)  para ayudar con la generación de claves.

| Wagyu Key Gen                                                                                                                     | ethdo                                                                                                                             | Avado                                                                                                                             |
| --------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| `Linux` `macOS` `Windows` `GUI`                                                                                                   | `Linux` `Windows` `CLI`                                                                                                           | `Browser` `GUI`                                                                                                                   |
| <p>✅ CODIGO ABIERTO</p><p>✅ AUDITADA</p><p>❌ BONO POR ERRORES</p><p>✅ BATTLE TESTED</p><p>✅ SIN PERMISO</p><p>✅ AUTO CUSTODIA</p> | <p>✅ CODIGO ABIERTO</p><p>✅ AUDITADA</p><p>❌ BONO POR ERRORES</p><p>✅ BATTLE TESTED</p><p>✅ SIN PERMISO</p><p>✅ AUTO CUSTODIA</p> | <p>✅ CODIGO ABIERTO</p><p>❌ AUDITADA</p><p>❌ BONO POR ERRORES</p><p>✅ BATTLE TESTED</p><p>✅ SIN PERMISO</p><p>✅ AUTO CUSTODIA</p> |
| [Empezar↗](https://wagyu.gg/)                                                                                                     | [Empezar↗](https://github.com/wealdtech/ethdo)                                                                                    | [Empezar↗](https://ava.do/)                                                                                                       |

&#x20; [Fuente↗](https://ethereum.org/en/staking/solo/#key-generators)
