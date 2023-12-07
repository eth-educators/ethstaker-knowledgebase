# Comment mon validateur gagne-t-il des ETH ?

Les validateurs, qui participent à la sécurisation de la [Chaine Balise](../staking-glossary.md#beacon-chain) et exécutent des "tâches", sont récompensés par la nouvelle émission d'ETH. De plus, les validateurs reçoivent des frais de  priorité payés par les utilisateurs, et éventuellement de la [MEV](../staking-glossary.md#MEV). Les validateurs sont récompensés pour l'exécution de ces tâches par une nouvelle émission d'ETH sur le "solde du validateur". Le rendement annuel actuel peut être consulté sur la plateforme de [démarrage officielle ↗](https://launchpad.ethereum.org/).

| Type                                                               | Couche                                              | Fréquence                                                                                                              | Quantité                                             |
| ------------------------------------------------------------------ | --------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------- |
| [Attestation](../staking-glossary.md#attestation)                  | [Consensus](../staking-glossary.md#consensus-layer) | Une fois par [Epoque](../staking-glossary.md#epoch) (toutes les 6,4 minutes en moyenne)                                | 0,000014 ETH\*                                       |
| [Proposition d'un bloc](../staking-glossary.md#block-proposer)     | [Consensus](../staking-glossary.md#consensus-layer) | [Tous les 2 mois en moyenne](proposal-frequency.md)                                                                    | 0,02403 ETH\*                                        |
| [Comité de Synchronisation](../staking-glossary.md#sync-committee) | [Consensus](../staking-glossary.md#consensus-layer) | Tous les 2 ans en moyenne\*\*                                                                                          | 0,11008 ETH\*                                        |
| [Récompense d'exclusion](../staking-glossary.md#slasher-node)      | [Consensus](../staking-glossary.md#consensus-layer) | Très rarement inclus dans les Propositions de Bloc                                                                     | Jusqu'à 0,0625 ETH                                   |
| [Frais de Priorités](../staking-glossary.md#priority-fees)         | [Exécution](../staking-glossary.md#execution-layer) | Inclus dans chaque Proposition de Bloc contenant des transactions                                                      | Typiquement de 0,01 à 0,1 ETH ; très rarement 1+ ETH |
| [Récompense MEV](../staking-glossary.md#mev)                       | [Exécution](../staking-glossary.md#execution-layer) | Également inclus dans les Propositions de Bloc lors de l'utilisation de [MEV-boost](../validator-clients/mev-boost.md) | Typiquement de 0,01 à 0,1 ETH ; très rarement 1+ ETH |

\*_Varie en fonction du nombre total de validateurs dans le réseau. Estimation approximative pour 435 000 validateurs actifs._

\*\*_Cela est soumis à l'aléatoire ; il peut y avoir des "périodes creuses" sans en recevoir une beaucoup plus longues que la moyenne._

Les récompenses reçues sur la couche de [Consensus](../staking-glossary.md#consensus-layer) ne sont actuellement pas liquides. Elles sont bloquées sur la chaîne jusqu'à ce que les [retraits](../faq.md#can-i-withdraw-my-eth-at-any-time) soient implémentés. Les récompenses fournies sur la couche d'[Execution](../staking-glossary.md#execution-layer), cependant, sont liquides et peuvent être accédées instantanément.

[Source ↗](https://docs.rocketpool.net/guides/node/responsibilities.html#how-ethereum-staking-works)

## Pénalités pour les validateurs

Si le validateur est hors ligne et n'exécute pas ses devoirs, il sera pénalisé à un taux légèrement inférieur aux récompenses pour la même période de temps.

Les validateurs sont pénalisés pour de petites quantités d'ETH s'ils sont hors ligne et ne parviennent pas à exécuter leurs devoirs assignés. Cela est appelé la [**fuite**](../staking-glossary.md#inactivity-leak). Si un validateur viole l'une des règles fondamentales de la chaîne Balise et semble attaquer le réseau, il peut être [**exclu**](../staking-glossary.md#slashable-offenses). L'exclusion est une sortie forcée de votre validateur sans votre permission, accompagnée d'une amende relativement importante qui retire une partie du solde en ETH de votre validateur.

En réalité, la seule condition qui peut entraîner une exclusion est si vous faites fonctionner les clés de votre validateur sur deux nœuds en même temps (comme dans une configuration de secours / redondance, où votre nœud de sauvegarde se met en marche accidentellement alors que votre nœud principal est encore en fonctionnement). Ne laissez pas cela arriver, et **vous ne serez pas exclu**. L'exclusion _ne peut pas se produire_ en étant hors ligne pour maintenance.

Ci-dessous se trouve un tableau qui montre les pénalités qui peuvent arriver à un validateur :

| Type                                                                      | Couche                                              | Quantité                                                                                                     |
| ------------------------------------------------------------------------- | --------------------------------------------------- | ------------------------------------------------------------------------------------------------------------ |
| [Attestation](../staking-glossary.md#attestation) manquée                 | [Consensus](../staking-glossary.md#consensus-layer) | -0,000011 ETH\* par attestation (-9/10 de la valeur d'une récompense d'attestation normale)                  |
| [Proposition de bloc](../staking-glossary.md#block-proposer) manquée      | [Consensus](../staking-glossary.md#consensus-layer) | 0                                                                                                            |
| [Comité de Synchronisation](../staking-glossary.md#sync-committee) manqué | [Consensus](../staking-glossary.md#consensus-layer) | -0,00047 ETH\* par époque (-0,1 ETH total si hors ligne pendant toute la durée du comité de synchronisation) |
| [Exclusion](../staking-glossary.md#slashable-offenses)                    | [Consensus](../staking-glossary.md#consensus-layer) | Au moins 1/32 de votre solde, jusqu'à la totalité de votre solde dans des circonstances extrêmes             |

\*_Varie en fonction du nombre total de validateurs dans le réseau. Estimation approximative pour 435 000 validateurs actifs._

{% hint style="info" %}
En règle générale, si vous êtes hors ligne pendant X heures (et que vous n'êtes pas dans un [comité de synchronisation](../staking-glossary.md#sync-committee)), alors vous récupérerez tout votre ETH perdu après X heures une fois que vous serez de nouveau en ligne et que vous attesterez.
{% endhint %}

[Source ↗](https://docs.rocketpool.net/guides/node/responsibilities.html#penalties)
