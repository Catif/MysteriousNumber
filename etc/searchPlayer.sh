#!/bin/bash
clear

. ./ini.config

regexUser="^[a-zA-Z0-9]{3,${nbrCaractName}}$"


if [ -n "$name" ]; then
    if [[ $name =~ $regexUser ]]; then
        echo "Pseudo choisi : ${name}"
        echo -e "{n°Place - Nom / Essais}\n"
        if ! [ -e ./etc/scoreboard.txt ]; then
            touch ./etc/scoreboard.txt
            echo "Le tableau des scores est vide..."
        else
            nLine=1
            find=0
            while read -a line; do
                if [[ ${name} == ${line[0]} ]]; then
                    echo "n°${nLine} - ${line[0]} / ${line[1]}"
                    find=1
                fi
                nLine=$((${nLine}+1))
            done  < './etc/scoreboard.txt'
            
            if [ ${find} -eq 0 ]; then
                echo "Le joueur entré n'est pas enregistré dans le scoreboard."
            fi
        fi
    else
        echo "Le pseudonyme recherché ne rentre pas dans nos critères... (ex: Joe; Joe11; 54joE)"
    fi
else
    echo "Vous n'avez chercher aucun joueur, veuillez essayer en écrivant :"
    echo "make score-by name=nomDuJoueur"
fi

