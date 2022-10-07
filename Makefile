.PHONY: run scores reset-scores scores-by

run : 
	./etc/MysteriousNumber.sh

scores:
	./etc/showScores.sh

reset-scores:
	./etc/resetScores.sh

scores-by:
	./etc/searchPlayer.sh ${name}