#!/bin/bash

LC_ALL=C

sort -t, -n -k2 champs.csv > champs2.csv

awk -F ',' 'BEGIN{OFS=",";} {print $2,$1}' champs2.csv >  champs3.csv

sed -e '1s/id/championid/' champs3.csv > champs4.csv

sed 's/"//g' participants.csv | sort -t"," -k4n,4 > participants2.csv

awk -F ',' 'BEGIN{OFS=",";} {print $4,$1,$2,$3,$5,$6,$7,$8}' participants2.csv > participants3.csv

join -t, -1 1 -2 1 champs4.csv participants3.csv > chamsandpart.csv

tail -n 834518 stats2.csv > stats3.csv

paste -d "\n" stats1.csv stats3.csv > stats.csv

sed 's/"//g' stats.csv | sort -t"," -k1n,1 > stats4.csv

tail -n 1834518 stats4.csv > stats5.csv

awk -F ',' 'BEGIN{OFS=",";} {print $3,$1,$2,$4,$5,$6,$7,$8,$9}' chamsandpart.csv > chamsandpart2.csv

sort -t"," -k1n,1 chamsandpart2.csv > chamsandpart3.csv

join -t, -1 1 -2 1 chamsandpart3.csv stats5.csv > final.csv

awk -F ',' 'BEGIN{OFS=",";} {print ($1,$4,$2,$3,$5,$6,$7,$8,$9,$11,$12,$13,$14,$15,$16,$17,$18,$19,$20,$21,$22,$23,$24,$25,$26,$27,$28,$29,$30,$31,$32,$33,$34,$35,$36,$37,$38,$39,$40,$41,$42,$43,$44,$45,$46,$47,$48,$49,$50,$51,$52,$53,$54,$55,$56,$57,$58,$59,$60,$61,$62,$63,$64,$10)}' final.csv > final2.csv

awk -F ',' 'BEGIN{OFS=",";} {print ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,($17+$19)/$18,$20,$21,$22,$23,$24,$25,$26,$27,$28,$29,$30,$31,$32,$33,$34,$35,$36,$37,$38,$39,$40,$41,$42,$43,$44,$45,$46,$47,$48,$49,$50,$51,$52,$53,$54,$55,$56,$57,$58,$59,$60,$61,$62,$63,$64)}' final2.csv > final3.csv

sed -e '1s/-nan/kda/' final3.csv > RealFinal.csv

#cd $HOME
#HOMEE="$(pwd)"
#OUTPUTDIRNAME=Merging

#mkdir $HOMEE/Desktop/$OUTPUTDIRNAME

#OUTPUTDIRPATH=$HOMEE/Desktop/$OUTPUTDIRNAME

#WEKAJAR=$OUTPUTDIRPATH/weka.jar

#RealCSV=$OUTPUTDIRPATH/RealFinal.csv

#wget -O weka.jar "https://raw.githubusercontent.com/SaWLeaDeR/AppliedMachineLearning/master/weka(1).jar"



#java -cp $WEKAJAR weka.core.converters.CSVLoader $RealCSV > $OUTPUTDIRPATH/RealFinal.arff -B 8196

