# Je suis inquiet d'être exclu🔪

L'exclusion est un terme effrayant. Mais qu'est-ce que c'est exactement, comment cela peut-il se produire et à quel point devriez-vous vous inquiéter ?

!!! info "Info"
    TLDR : En réalité, la seule condition pouvant entraîner [une exclusion](../../staking-glossary#slashable-offenses) est si vous faites fonctionner les clés de votre validateur sur deux nœuds en même temps (comme dans une configuration de basculement / redondance, où votre nœud de secours s'active accidentellement pendant que votre nœud principal fonctionne encore). Ne laissez pas cela se produire, et vous ne serez pas sanctionné.

    **Il n'y a pas d'exclusion pour avoir été hors ligne pour maintenance.**


### Qu'est ce que cette exclusion ?

L'exclusion ("slashing" en anglais) est un terme utilisé pour décrire la réaction du réseau Ethereum face à un validateur agissant contre les règles du réseau. Les validateurs exécutent un certain nombre de devoirs (par exemple, [attestations](../../staking-glossary#attestation) et [proposer blocs](../../staking-glossary#block-proposer)).

Si quelqu'un voulait attaquer le réseau Ethereum, il pourrait proposer plusieurs blocs ou attester de plusieurs blocs conflictuels. Pour décourager les attaques sur le réseau, dans un système de [Preuve d'enjeu (PoS)](../../staking-glossary#proof-of-stake-pos), les validateurs ont quelque chose en jeu, qui est actuellement de 32 ETH par validateur. Lorsqu'un validateur enfreint les règles du réseau, deux choses se produiront :

1. Le validateur se voit retirer une certaine quantité d'ETH de ce solde initial de 32 ETH mis en jeu.
2. Le validateur est forcé de sortir et est retiré du [groupe des validateurs](../../staking-glossary#validator-pool).

La quantité d'ETH prise en tant que pénalité varie en fonction de l'état du réseau. Si un petit nombre de validateurs sont sanctionnés simultanément, alors une estimation approximative de la pénalité est de 1 ou 2 ETH. Dans un événement extrêmement rare de type "Cygne Noir", lorsque une grande partie du réseau est simultanément hors ligne ou enfreint les règles (par exemple, lors d'une attaque coordonnée), la pénalité peut aller jusqu'à 100% de la mise, voire la totalité.

Lorsque votre validateur est forcé de sortir et que la mise est retirée, vous pouvez remettre en jeu votre ETH restant (si vous avez toujours les 32 requis), après avoir à nouveau passé la [file d'attente de sortie](../../staking-glossary#validator-queue) et [la file d'attente d'activation](../../staking-glossary#validator-queue).
