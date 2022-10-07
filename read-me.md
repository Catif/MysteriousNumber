# Mysterious Number

Mysterious Number est un jeu permettant à l'utilisateur de chercher le nombre mYsTeRe entre 0 et 99 généré par la machine.

________

## Fonctionnement

**Pour utiliser le programme**, mettez vous dans le dossier racine, soit **MysteriousNumber/** puis utilisé les différentes commandes ci-dessous :

- **make run** : permet de lancer le jeu
- **make scores** : affiche le tableau des scores
- **make reset-scores** : vide le tableau des scores
- **make scores-by name=\<NomJoueur\>** : affiche les scores d'un utilisateur

Un fichier **ini.config** est présent dans le dossier racine, il permet de modifier les paramètres du jeu :

- **nbrTryMax** : nombre de tentatives maximum pour trouver le nombre mystère
- **nbrScoresSave** : nombre de scores à sauvegarder dans le fichier /etc/scoreboard.txt
- **nbrCaractName** : nombre de caractères maximum autorisés pour le nom du joueur

________

## Différent Niveaux de développement

### Niveau 1 ✅
- Le jeu détermine un nombre aléatoire entre 1 et 9 grâce à la fonction suivante : ${RANDOM:0:2}
- Le jeu demande à l’utilisateur un nombre entre 1 et 99.
- Le jeu retourne si le nombre saisi est plus petit ou plus grand que le nombre mystère
- Temps que ce nombre n’est pas trouvé, le jeu continue de demander un nombre à l’utilisateur
- Une fois le nombre mystère trouvé, on affiche un message à l’utilisateur pour le féliciter et le nombre de coups nécessaires à la découverte du nombre.

### Niveau 2 ✅
- Ajouter un système de high scores
- Demander le nom du joueur qui vient de gagner
- Enregistrer le nom des joueurs et les scores dans un fichier.
- Afficher la position dans les high scores de la partie terminée. (Plusieurs solutions pour l'insertion dont "sed -i "3i textToInsert")

### Niveau 3 ✅
- Ajouter un Makefile avec plusieurs commandes
- run : qui lance une partie
- scores : qui affiche les scores dans la CLI
- reset-scores : qui reset les scores
- score-by : qui recherche le score d’un joueur

### Niveau 4 ✅
- Ajouter un fichier de configuration avec les infos suivantes :
- Nombres d’essais maximums
- Nombres maximums de scores enregistrés
- Nombre maximum de caractères dans le nom du joueur

### Niveau 6 
- Gérer un système de difficultés ❌
- Sécurisez votre code en vérifiant les types d'entrées utilisateur ✅