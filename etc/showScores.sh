#!/bin/bash
clear

if ! [ -e ./etc/scoreboard.txt ]; then
    touch ./etc/scoreboard.txt
    echo "Le fichier n'existait pas, en tant que robot, je viens de le créer pour les prochaines parties !"
elif [[ -z `head -n1 ./etc/scoreboard.txt` ]]; then
    echo " Le tableau des scores est vide."
else
    echo "Voici le tableau des scores :"
    echo -e "{n°Place - Nom / Essais}\n"

    nLine=1
    while read -a line; do
        echo "n°${nLine} - ${line[0]} / ${line[1]}"
        nLine=$((nLine+1))
    done  < './etc/scoreboard.txt'
fi