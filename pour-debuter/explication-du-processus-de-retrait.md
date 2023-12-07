# Explication du processus de retrait

### Récompenses de staking

Les paiements des récompenses sont automatiquement traités pour les comptes de validateurs actifs qui ont un solde effectif supérieur à 32 ETH.

Tout solde au-delà de 32 ETH gagné grâce aux récompenses ne contribue pas réellement au processus de validation, ni n'augmente le poids de ce validateur sur le réseau. Ce surplus est donc automatiquement retiré en tant que paiement de récompense tous les deux ou trois jours. Hormis fournir une adresse de retrait, ces récompenses ne nécessitent aucune action de la part de l'opérateur du validateur. Tout cela est initié sur la couche de consensus, aucun frais de transaction (gas) n'est donc requis à aucune étape.

### Retrait complet du staking

Fournir une adresse de retrait est nécessaire avant que des fonds puissent être transférés hors du validateur.

Les utilisateurs souhaitant arrêter complètement le staking et retirer la totalité de leur solde doivent également signer et diffuser un message de "sortie volontaire" avec les clés du validateur. Cela déclenchera le processus de sortie du staking. Ceci est effectué avec votre client de validation puis est soumis à votre nœud sur la Beaconchain, et ne nécessite pas de gas.

Le processus de sortie d'un validateur prend un temps variable, en fonction du nombre de validateurs quittant en même temps. Une fois terminé, ce validateur ne sera plus responsable de l'exécution des tâches du réseau, ne sera plus éligible aux récompenses et n'aura plus d'ETH "en jeu". À ce moment-là, le compte sera marqué comme étant entièrement "sortie".

Une fois qu'un compte est signalé comme "sortie" et que les informations d'identification de retrait ont été fournies, il n'y a plus rien à faire pour l'utilisateur, si ce n'est attendre. Les comptes sont automatiquement et continuellement balayés par les proposeurs de sortis éligibles, et le solde de votre compte sera transféré en totalité (également appelé "retrait complet") lors du prochain [balayage](https://ethereum.org/fr/staking/withdrawals/#validator-sweeping).

### Comment fonctionnent les paiements de retrait et des récompenses ?

Qu'un validateur donné soit éligible à un retrait ou non est déterminé par l'état de son compte. Aucune intervention de l'utilisateur n'est nécessaire à aucun moment pour déterminer si un compte doit ou non initier un retrait - l'ensemble du processus est effectué en boucle automatiquement par la couche de consensus.

#### Balayage des validateurs

Lorsqu'un validateur est programmé pour proposer le prochain bloc, il doit constituer une file d'attente de retrait, comprenant jusqu'à 16 retraits éligibles. Cela commence à partir de l'indice de validateur 0, en déterminant s'il y a un retrait éligible pour ce compte selon les règles du protocole, et en l'ajoutant à la file d'attente s'il y en a un. Le validateur qui doit proposer le bloc suivant reprendra là où le dernier s'est arrêté, progressant dans l'ordre indéfiniment.

{% hint style="info" %}
Pensez à une horloge analogique. L'aiguille de l'horloge pointe vers l'heure, progresse dans un sens, ne saute aucune heure et revient finalement au début après avoir atteint le dernier chiffre.\
\
Maintenant, au lieu de 1 à 12, imaginez que l'horloge ait de 0 à N (le nombre total de validateurs qui ont été enregistrés sur la Beacon Chain, plus de 500 000 en janvier 2023).\
\
L'aiguille de l'horloge pointe vers le prochain validateur qui doit être vérifié pour les retraits éligibles. Elle commence à 0 et progresse tout autour sans sauter de nombre. Lorsque le dernier validateur est atteint, le cycle recommence au début.
{% endhint %}

### Eligibilité d'un compte pour les retraits

Lorsqu'un proposeur de bloc balaie les validateurs pour d'éventuels retraits, chaque validateur vérifié est évalué en fonction d'une courte série de questions pour déterminer si un retrait doit être déclenché et, le cas échéant, combien d'ETH doivent être retirés.

1. **Une adresse de retrait a-t-elle été fournie ?** Si aucune adresse de retrait n'a été fournie, le compte est ignoré et aucun retrait n'est initié.
2. **Le validateur est-il sorti et peut-il être retiré ?** Si le validateur est complètement sorti et que nous avons atteint l'époch où son compte est considéré comme " pouvant être retiré ", alors un retrait complet sera effectué. Cela transférera le solde total à l'adresse de retrait.
3. **Le solde effectif est-il supérieur à 32 ?** Si le compte dispose d'identifiants de retrait, n'est pas déjà sorti et a un solde supérieur à 32 en attente, un retrait partiel sera effectué, transférant uniquement les récompenses supérieures à 32 à l'adresse de retrait de l'utilisateur.

Seules deux actions sont à entreprendre par les opérateurs de validateurs au cours du cycle de vie d'un validateur  :

* Fournir un justificatif de retrait pour permettre toute forme de retrait
* Sortir du réseau, ce qui déclenchera un retrait complet

#### Sans aucun frais

Cette approche des retraits de staking évite d'exiger que les stakers soumettent manuellement une transaction demandant un montant particulier d'ETH à retirer. Cela signifie également qu'**aucun frais de transaction (gas) n'est requis**, et que les retraits ne sont donc pas en concurrence pour l'espace de bloc disponible sur la couche d'exécution.

#### À quelle fréquence recevrai-je mes récompenses de staking ?

Un maximum de 16 retraits peut être traité dans un seul bloc. À ce rythme, 115 200 retraits de validateurs peuvent être traités par jour (en supposant qu'il n'y ait pas de créneaux manqués). Comme indiqué ci-dessus, les validateurs sans retraits éligibles seront ignorés, ce qui réduit le temps nécessaire pour terminer le balayage.

En développant ce calcul, nous pouvons estimer le temps qu'il faudra pour traiter un certain nombre de retraits :

| Nombre de retraits | Délai d'exécution |
| :----------------: | :---------------: |
|       400 000      |     3,5 jours     |
|       500 000      |     4,3 jours     |
|       600 000      |     5,2 jours     |
|       700 000      |     6,1 jours     |
|       800 000      |     7,0 jours     |

Comme vous pouvez le voir, le délai s’allonge à mesure que davantage de validateurs sont présents sur le réseau. Une augmentation des blocs manqués pourrait aussi ralentir cela proportionnellement, mais cette estimation représentera généralement l'estimation la plus lente possible.

**Source:** [**https://ethereum.org/fr/staking/withdrawals/**](https://ethereum.org/fr/staking/withdrawals/)
