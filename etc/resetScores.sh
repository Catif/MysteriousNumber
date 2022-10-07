#!/bin/bash
clear

if ! [ -e ./etc/scoreboard.txt ]; then
    touch ./etc/scoreboard.txt
    echo "Le fichier scoreboard n'existait pas, il vient d'être créer !"
else
    echo "" > ./etc/scoreboard.txt
    echo "Le fichier scoreboard a bien été remis à zéro !"
fi
