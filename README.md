# meta-gei-nxpcup

Couche Yocto du projet de robot mobile NXP Cup de l'INSA Toulouse — département Génie Électrique et Informatique (GEI).

## Présentation

`meta-gei-nxpcup` est une couche Yocto développée par le département GEI de l'INSA Toulouse.

Elle permet d'adapter la plateforme [NXP Robotics Edge](https://github.com/nxp-imx/meta-robotics-edge) aux besoins du robot mobile développé pour la compétition NXP Cup, dont la carte principale est basée sur la **NXP FRDM-IMX8MP**.

Cette couche regroupe les configurations et les adaptations logicielles propres au projet. Elle complète les couches Yocto fournies par NXP et s'intègre dans l'environnement de compilation défini par le manifeste du projet.

## Plateforme et compatibilité

| Composant | Référence |
|---|---|
| Carte cible | NXP FRDM-IMX8MP |
| Plateforme de base | NXP Robotics Edge |
| Version Yocto | Walnascar |
| Couche de la plateforme NXP | [`meta-robotics-edge`](https://github.com/nxp-imx/meta-robotics-edge/tree/walnascar) |
| Couche spécifique au GEI | `meta-gei-nxpcup` |
| Dépôt d'intégration | [`gei-nxpcup-4w-mainboard`](https://github.com/INSA-GEI/gei-nxpcup-4w-mainboard/tree/walnascar-dev) |

**Important :** utiliser la branche `walnascar` de cette couche avec la version correspondante de NXP Robotics Edge. Le mélange de versions Yocto ou de révisions incompatibles entre les différentes couches peut provoquer des erreurs de configuration ou de compilation.

## Intégration dans l'environnement Yocto

Cette couche est destinée à être intégrée dans l'environnement de compilation préparé par le dépôt de la carte principale.

Le dépôt [`gei-nxpcup-4w-mainboard`](https://github.com/INSA-GEI/gei-nxpcup-4w-mainboard) contient le fichier `manifest.xml` ainsi que les scripts permettant de récupérer les dépôts nécessaires et d'initialiser l'environnement de compilation.

Pour suivre la procédure standard du projet, il est recommandé d'utiliser ces scripts plutôt que d'initialiser un environnement Yocto indépendant.

Dépôt de référence : [gei-nxpcup-4w-mainboard](https://github.com/INSA-GEI/gei-nxpcup-4w-mainboard)

## Construction de l'image Linux

La construction de l'image repose sur la plateforme NXP Robotics Edge.

Les principales étapes sont les suivantes :

1. Récupérer les dépôts décrits dans le manifeste du projet.
2. Initialiser l'environnement de compilation Yocto.
3. Configurer la compilation pour la carte cible et l'image souhaitée.
4. Construire l'image avec BitBake.

Le dépôt de la carte principale automatise ces opérations à l'aide des scripts présents dans son répertoire `yocto/`.

Pour connaître les prérequis, les options de configuration et la procédure détaillée de compilation, consulter le [README de NXP Robotics Edge pour la branche `walnascar`](https://github.com/nxp-imx/meta-robotics-edge/blob/walnascar/README.md).

## Développement et contribution

Les modifications apportées à cette couche peuvent avoir un impact sur l'image Linux générée et sur sa compatibilité avec la carte cible.

Lors de toute modification :

1. Regrouper dans ce dépôt les adaptations propres au projet NXP Cup du GEI.
2. Préserver la compatibilité avec les versions de NXP Robotics Edge et de Yocto utilisées par le projet.
3. Construire l'image afin de valider les modifications apportées aux recettes et à la configuration.
4. Tester l'image obtenue sur la carte FRDM-IMX8MP.
5. Enregistrer et publier les modifications sur la branche appropriée.

Lorsqu'une nouvelle version de cette couche est publiée, vérifier également la révision référencée dans le manifeste du dépôt de la carte principale. Cela permet de conserver un environnement de compilation reproductible pour l'ensemble du projet.

## Références

- [Plateforme NXP Robotics Edge — branche `walnascar`](https://github.com/nxp-imx/meta-robotics-edge/tree/walnascar)
- [Instructions de compilation de NXP Robotics Edge](https://github.com/nxp-imx/meta-robotics-edge/blob/walnascar/README.md)
- [Dépôt de la carte principale du robot](https://github.com/INSA-GEI/gei-nxpcup-4w-mainboard)
- [Documentation officielle du projet Yocto](https://docs.yoctoproject.org/)

