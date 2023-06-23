# ExpensiveOS (ExOS)

![Etat actuel de l'os](/imgs/expensive_os.png)

### Présentation
Salut tout le monde, je vous présente mon premier système d'exploitation (OS) ! Je le développe sur mon temps libre, donc je ne peux pas garantir des mises à jour régulières, mais je ferai de mon mieux quand même :wink: Pour le moment et officiellement, ce projet n'a pas pour but de révolutionner le domaine. Je suis juste un développeur "débutant" qui s'intéresse énormément aux OS et à leur conception. N'hésitez pas à me faire un maximum de retour en ouvrant une `issue` ou sur Discord (Alex.R#5752).

### OBJECTIFS
Les objectifs sont pour le moment très basique et fortement (si ce n'est essentiellement) inspiré de [ce document](https://github.com/cfenollosa/os-tutorial)

:x: Pas commencé | :white_check_mark: : En cours | :heavy_check_mark: : Terminé
- Démarer en 16 bits (mode réel) de zéro sans GRUB :x:
- Imprimer un message de démarrage :x:
- Configuration des registres de segments 16 bits et de la pile :x:
- Informer le BIOS du mode du processeur cible :x:
- Activer et confirmer l'activation de la ligne A20 :x:
- Obtenir la carte mémoire du BIOS :x:
- Localiser le noyau dans le système de fichiers :x:
- Allouer de la mémoire pour charger l'image du noyau :x:
- Chargement de l'image du noyau dans la mémoire tampon :x:
- Vérifier les en-têtes ELF de l'image du noyau :x:
- Chargement GDTR :x:
- Activer le mode graphique :x:
- Activer le mode long, 64 bits :x:
- Allocation et mappage de la mémoire pour les segments du noyau :x:
  [...]
- Passage du C au RUST :x:

### OBJECTIFS (TRES TRES...) LONG TERME
Concevoir un OS basé sur la sécurité, la performance et la compatibilité avec les programmes d'autres plateformes (ne vous attendez pas à voir ça d'ici 1 an xD)

### Démarrage
Télécharger la derniere release et lancez :
```shell
> bochs
> 6 (Begin simulation)
```
