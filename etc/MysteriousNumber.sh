#!/bin/bash
clear

. ./ini.config

numberMystere=$((${RANDOM:0:2} + 1))
regexNumber='^[1-9][0-9]?$|^100$'
regexUser="^[a-zA-Z0-9]{3,${nbrCaractName}}$"

# echo ${numberMystere} # Show the mysterious number to debug
echo "Bienvenue sur Mysterious Number, un jeu prévu pour l'entrainement en bash."
echo "Ce jeu va générer un nombre aléatoire entre 1 et 100. Vous en tant que joueur, vous devrez écrire des nombres, le programme vous répondra en fonction de votre réponse."
echo "Le but est simple, trouver le nombre mystère en le moins d'essai possible."
echo -e "\n\t\t____Appuyer sur entrer pour commencer____"
read


clear


numberUser=0
try=0
isMaxTry=0

echo "Que la partie commence !"
while [ ${numberUser} -ne ${numberMystere} ]; do
    try=$((${try} + 1))

    if [ ${try} -eq ${nbrTryMax} ]; then
        isMaxTry=1
        break
    fi

    echo "essai n°${try}"
    read numberUser

    while ! [[ ${numberUser} =~ $regexNumber ]]; do
        echo "Le nombre n'est pas compris entre 1 et 100, veuillez réessayer"
        read numberUser
    done

    if [ ${numberUser} -gt ${numberMystere} ]; then
        echo "Le nombre mYsTeRe est plus petit !"
    elif [ ${numberUser} -lt ${numberMystere} ]; then
        echo "Le nombre mYsTeRe est plus grand !"
    fi

done


clear

if (( ${isMaxTry} == 1 )); then
    echo "Vous avez atteint le nombre maximum d'essai, vous avez perdu !"
else
    echo "Bravo ! Vous avez trouver le nombre mYsTeRe ${numberMystere}!"
    echo "Vous avez trouvé en ${try} essai(s)"
    echo -e "\nVotre pseudonyme :"
    read username

    while ! [[ ${username} =~ $regexUser ]]; do
        echo "Votre pseudonyme ne rentre pas dans nos critères... (ex: Joe; Joe11; 54joE)"
        read username
    done

    if ! [ -e ./etc/scoreboard.txt ]; then
        touch ./etc/scoreboard.txt
        echo "${username} ${try}" >> ./etc/scoreboard.txt
        echo "Vous êtes premier du classement !"

    elif [[ -z `head -n1 ./etc/scoreboard.txt` ]]; then
        echo "${username} ${try}" > './etc/scoreboard.txt'
        echo "Vous êtes premier du classement !"

    else
        nLine=1
        insert=0
        isScoreSaveMax=0
        while read -a line; do
            if [ ${line[1]} -gt ${try} ]; then
                sed -i "${nLine}i ${username} ${try}" './etc/scoreboard.txt'
                insert=1
                echo -e "\nVous êtes à la place ${nLine}." 
                if [ ${nLine} -gt 1 ]; then
                    if [ ${betterScore} -eq ${try} ]; then
                        echo "Vous êtes en égalité avec ${betterName}"
                    else
                        echo "${betterName} est devant avec ${betterScore} essais."
                    fi
                fi
                break
            else
                betterName=${line[0]}
                betterScore=${line[1]}
            fi
            nLine=$((${nLine}+1))
            if [ ${nLine} -gt ${nbrScoresSave} ]; then
                isScoreSaveMax=1
                break
            fi
        done  < './etc/scoreboard.txt'
        
        if [ ${isScoreSaveMax} -eq 1 ]; then
            echo "Votre score n'a pas été enregistré dans notre tableau des scores. Le nombre maximum de score à été atteints."
        else
            nbrLineSave=$((`wc -l ./etc/scoreboard.txt | awk '{print $1}'`))
            if [ ${nbrLineSave} -gt ${nbrScoresSave} ]; then
                head "-n${nbrScoresSave}" './etc/scoreboard.txt' > './etc/scoreboard.txt.tmp'
                head "-n${nbrScoresSave}" './etc/scoreboard.txt.tmp' > './etc/scoreboard.txt'
                rm './etc/scoreboard.txt.tmp'
            else
                if [ ${insert} -eq 0 ]; then
                    echo "${username} ${try}" >> './etc/scoreboard.txt'
                    echo "Vous êtes dernier du classement !"
                fi
            fi
        fi


    fi
fi