# ExpensiveOS (ExOS)

![Etat actuel de l'os](/imgs/expensive_os.png)

### Présentation
Salut tout le monde, je vous présente mon premier système d'exploitation (OS) ! Je le développe sur mon temps libre, donc je ne peux pas garantir des mises à jour régulières, mais je ferai de mon mieux quand même :wink: Pour le moment et officiellement, ce projet n'a pas pour but de révolutionner le domaine. Je suis juste un développeur "débutant" qui s'intéresse énormément aux OS et à leur conception. N'hésitez pas à me faire un maximum de retour en ouvrant une `issue` ou sur Discord (Alex.R#5752).

### OBJECTIFS
Les objectifs sont pour le moment très basique et fortement (si ce n'est essentiellement) inspiré de [ce document](https://github.com/cfenollosa/os-tutorial)

:x: Pas commencé | :white_check_mark: : En cours | :heavy_check_mark: : Terminé
- Démarer en 16 bits (mode réel) de zéro sans GRUB :heavy_check_mark:
- Entrer en mode 32 bits (mode protégé) :heavy_check_mark:
- Passage au kernel :heavy_check_mark:
- Sortie à l'ecran et saisie au clavier :white_check_mark:
- Traitement des interruptions système :x:
- Implémentation d'une `microlibc` :x:
- Passage du C au RUST :x:

### OBJECTIFS (TRES TRES...) LONG TERME
Concevoir un OS basé sur la sécurité, la performance et la compatibilité avec les programmes d'autres plateformes (ne vous attendez pas à voir ça d'ici 1 an xD)

### Démarrage
Télécharger la derniere release et lancez :
```shell
> bochs
> 6 (Begin simulation)
```
