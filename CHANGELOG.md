# Changelog
## [0.0.4a] - (14.04.2023)
### Ajouts
- Fichier `disk.inc`
- Ajout d'une fonction `load_disk`
### Changements
- `boot.s` charge maintenant le second secteur du disque dur
- la fonction `print_hex` affiche un retour chariot à la fin du nombre hexadecimal

## [0.0.3a] - (13.03.2023)
### Ajouts
- Fichier `print.inc`
- Ajout d'une fonction `print`
- Ajout d'une fonction `println`
- Ajout d'une fonction `print_hex`
### Changements
- `boot.s` démarre maintenant a partir de l'adresse `0x7c00`
### Fix
- Nom du fichier `.gitignore` modifier (.gitgore -> .gitignore)

## [0.0.2a] - (12.03.2023)
### Ajouts
- Affiche "Hello" lors du démarrage
- Ajout de la session `Complation` dans le README.md
### Fix
- Nom du binaire changé dans le `.bochsrc`

## [0.0.1a] - (12.03.2023)
### Ajouts
- Fichier `Makefile`
- Fichier `.bochsrc`
- Fichier `.gitignore`
- Démarre sur les 512 premiers octets