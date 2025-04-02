# Attestations manquées ! Que puis-je faire ?

## Ne paniquez pas!

Manquer quelques [attestations](/fr/staking-glossary#attestation) est tout à fait normal et a un coût extrêmement faible. La pénalité pour avoir manqué une attestation est exactement la même que la récompense pour une attestation réussie. Ainsi, avec environ 240 attestations par jour par validateur, en manquer une ou deux représente toujours un taux d'attestation réussi de plus de 99% !

## Comprendre les attestations manquées, la faible efficacité et comment améliorer votre configuration

> Il y a deux causes possibles pour manquer une attestation ou avoir une faible efficacité avec votre validateur. Certaines causes sont sous votre contrôle en tant qu'opérateur et d'autres causes sont indépendantes de votre volonté.

Même avec une configuration parfaite, vous pourriez manquer certaines attestations ou voter incorrectement lors d'une attestation, réduisant ainsi votre [efficacité](/fr/staking-glossary#effectiveness) de temps en temps. Les causes qui échappent à votre contrôle sont souvent liées à la propagation du réseau ou au fait que certains de vos [pairs](/fr/staking-glossary#peers) soient en retard dans l'exécution de leurs propres devoirs.

Pour approfondir et tout savoir sur le devoir d'attestation, la synchronicité, l'efficacité et la propagation sur le réseau, consultez ces excellents articles.

* [Comprendre les ratés ↗](https://www.symphonious.net/2022/09/25/understanding-attestation-misses/) par Adrian Sutton
* [Explorer ETH2: Inclusion d'Attestation ↗](https://www.symphonious.net/2020/09/08/exploring-eth2-attestation-inclusion/) par Adrian Sutton
* [Définir l'Efficacité de l'Attestation ↗](https://www.attestant.io/posts/defining-attestation-effectiveness/) par Jim McDonald

En tant que validateur, vous ne pouvez pas faire grand-chose concernant les éléments qui sont hors de votre contrôle. Ce que vous pouvez faire en revanche, c'est travailler sur les éléments de votre configuration que vous contrôlez afin de maximiser vos récompenses. Même si vous aviez une configuration qui fonctionnait bien avant la fusion, il est possible qu'avec le travail supplémentaire introduit, une partie négligée de votre configuration soit la cause de manques supplémentaires ou d'une efficacité moindre depuis que la fusion a eu lieu. C'est pourquoi vous devriez vérifier à nouveau tous ces éléments.

1. Assurez-vous que vos clients sont à jour. Les mises à jour des clients incluent souvent des optimisations et des améliorations qui vous aideront à accomplir vos tâches à temps.
2. Assurez-vous que votre machine dispose constamment de ressources suffisantes (CPU, RAM, disque, etc.). L'utilisation d'une machine dédiée peut aider. Si vos clients manquent de l'une de ces ressources, cela sera probablement une cause de manques supplémentaires et d'une moindre efficacité.
3. Assurez-vous que votre horloge est correctement synchronisée. Le protocole de la chaîne de balises est très sensible au temps. "chrony" est un bon outil pour améliorer la synchronisation de votre horloge. Sur Ubuntu ou les dérivés de Debian, installer "chrony" est souvent aussi simple que `sudo apt install chrony`. Sur Windows, vous pouvez suivre ces [instructions ↗](https://www.reddit.com/r/ethstaker/comments/nfca22/an\_opiniated\_solution\_to\_improve\_time\_sync\_on/) pour améliorer la synchronisation de votre horloge.
4. Assurez-vous d'avoir une bonne latence internet, bande passante et qualité. Pour les validateurs au domicile, il n'est pas réaliste de demander une ISP dédiée ou une connexion internet pour votre validateur, mais assurez-vous que vos autres utilisations du réseau n'interfèrent pas trop avec votre validateur. En cas de doute, voyez si vous pouvez obtenir un meilleur forfait dela part votre fournisseur ou vérifiez s'il y a un fournisseur alternatif dans votre région qui pourrait améliorer votre connexion internet.
5. Assurez-vous d'avoir constamment suffisamment de pairs. Surveiller le nombre de pairs de vos clients n'est pas une mauvaise idée si vous avez la capacité technique.
6. Assurez-vous d'avoir correctement configuré des ports ouverts permettant les connexions entrantes. Cela peut non seulement améliorer la santé du réseau de votre configuration et le nombre de vos pairs, mais cela améliorera également la santé globale du réseau Ethereum. Pour tester si vos ports sont ouverts, vous pouvez utiliser le vérificateur de ports ouverts de StakeHouse. L'appel à `curl https://eth2-client-port-checker.vercel.app/api/checker?ports=30303,9000` devrait renvoyer un résultat qui inclut 30303 et 9000 dans le champ open\_ports si ces ports sont ouverts depuis Internet. 30303 est le port P2P par défaut pour Geth et 9000 est le port P2P par défaut pour de nombreux clients de consensus. Ajustez ces valeurs si vous utilisez des ports personnalisés ou si vous utilisez des clients ayant des ports par défaut différents. Consultez la documentation de votre client pour en savoir plus à ce sujet.

Une fois que vous avez mis en place tous ces éléments, il y a pas grand chose que vous puissiez faire de plus pour aider. Il pourrait y avoir quelques avantages marginaux à se connecter avec plus de pairs au coût d'une utilisation accrue des ressources, en particulier la bande passante. Dans des circonstances normales, le nombre de pairs par défaut de vos clients devrait être suffisant. La surveillance de la qualité d'internet avec des outils comme ceux de [pingman ↗](https://pingman.com/) peut aider à identifier la cause de certaines de ces attestations manquées si elles sont liées au réseau, mais cela restera probablement hors de votre contrôle.

[Source ↗](https://www.reddit.com/r/ethstaker/comments/xto0dm/understanding\_missed\_attestations\_understanding/)
