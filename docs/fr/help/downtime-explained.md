# Je suis inquiet concernant les pannes 😔

Vous ne devriez pas trop vous inquiéter des interruptions, mais comprendre ce qui se passe lorsque votre validateur est hors ligne peut vous aider à gagner en confiance en tant qu'opérateur solo à domicile.

!!! info "Info"
    Le réseau Ethereum est conçu en pensant aux opérateurs solo à domicile. Cela signifie que le protocole est très indulgent si un validateur connaît des interruptions ou est hors ligne.

    Si un validateur est hors ligne et n'exécute pas ses devoirs, il sera pénalisé à un taux légèrement inférieur aux récompenses pour la même période de temps.

## Par exemple

* Vous lancez votre validateur solo à domicile avec 32 ETH.
* Tout se passe bien et après quelques mois, le solde de votre validateur est de 32,5 ETH.
* Puis... votre validateur est hors ligne ! 🚨
  * Si cela se produit réellement, consultez le guide "[Mon validateur est hors-ligne ! Que dois-je faire?](/fr/help/validator-offline)" .

### Pénalité d'Inactivité

* Dès que votre validateur ne participe plus au réseau, il commencera à [perdre](/fr/staking-glossary#inactivity-leak) des ETH.
  * Lorsque vous êtes hors ligne, pour chaque attestation manquée, la fuite d'inactivité serait d'environ -0,000011 ETH (la fuite d'inactivité est légèrement inférieure à une attestation réussie).
  * Pour une attestation réussie normale, vous pourriez être récompensé de 0,000014 ETH.
* Si vous avez une défaillance catastrophique et que vous ne parvenez pas à remettre votre validateur en ligne pendant 5 jours, il vous faudra environ 5 jours de connexion pour revenir au même solde qu'au moment de la défaillance.

### Propositions de Blocs Manquées

Si vous êtes hors ligne, vous ne pourrez pas produire de bloc. Mais à quelle fréquence les propositions de blocs se produisent-elles pour un seul validateur ? Actuellement, en moyenne, un validateur proposera un bloc tous les 2-3 mois.

Donc, dans cet exemple, même si vous êtes hors ligne pendant 5 jours, il y a seulement une petite chance que vous manquiez une proposition de bloc. Mais que se passe-t-il si vous manquez une proposition de bloc ?

Si vous manquez votre proposition de bloc, [l'emplacement](https://github.com/Buttaa/ethstaker/blob/main/help/staking-glossary.md#slot) qui aurait dû contenir votre bloc sera vide. Outre [les récompenses](https://github.com/Buttaa/ethstaker/blob/main/help/rewards/chain-rewards.md) perdues pour avoir manqué la proposition de bloc, il n'y a **pas de pénalités ni de sanctions** résultant d'une proposition de bloc manquée.

### Puis-je être exclu pour avoir été hors ligne ?

Non. En réalité, la seule condition pouvant entraîner une [exclusion](https://github.com/Buttaa/ethstaker/blob/main/help/staking-glossary.md#slashable-offenses) est si vous faites fonctionner les clés de votre validateur sur deux nœuds en même temps (comme dans une configuration de basculement / redondance, où votre nœud de secours s'active accidentellement pendant que votre nœud principal fonctionne encore). Ne laissez pas cela se produire, et vous ne serez pas sanctionné. **Il n'y a pas d'exclusion pour avoir été hors ligne pour maintenance.**

## Que faire si je ne peux pas récupérer mon validateur et/ou que je souhaite arrêter la mise en jeu?

Si vous ne pouvez pas récupérer votre validateur ou décidez que vous souhaitez arrêter la mise en jeu, vous avez la possibilité de sortir votre validateur du réseau. Cela signifie que, bien que vous ne puissiez pas récupérer immédiatement le solde de votre validateur, vous ne recevrez aucune pénalité pour avoir été hors ligne une fois que le validateur quitte [fil d'attente de retrait](/fr/staking-glossary#validator-queue). Actuellement, la sortie d'un validateur est un processus irréversible. Pour plus de détails sur la façon de sortir votre validateur, [cosultez notre guide](/fr/tutorials/how-to-exit-a-validator).

## Conclusion

Être un validateur solo est une responsabilité importante pour garantir la santé à long terme du réseau Ethereum. Chez EthStaker, notre objectif est d'aider autant de personnes que possible à [#stakefromhome ↗](https://twitter.com/search?q=%23stakefromhome)et cette information est fournie pour montrer que les interruptions et le fait d'être hors ligne ne sont pas des sujets de préoccupation.
