#!/bin/bash
#Finding Users Home
ANIMATION=true
cd $HOME
HOMEE="$(pwd)"
OUTPUTDIRNAME=KDAFatihKoyuncu,SelimDemirci,FatihIstek
#Making directory for files

mkdir $HOMEE/Desktop/$OUTPUTDIRNAME
OUTPUTDIRPATH=$HOMEE/Desktop/$OUTPUTDIRNAME
#Downloading weka.jar
wget -O $OUTPUTDIRPATH/weka.jar "https://raw.githubusercontent.com/SaWLeaDeR/AppliedMachineLearning/master/weka-3.7.0.jar"

WEKAJAR=$OUTPUTDIRPATH/weka.jar


wget -O $OUTPUTDIRPATH/Whowins4kda.arff "https://github.com/SaWLeaDeR/AppliedMachineLearning/raw/master/Whowins4kda.arff"

echo Please 'wait for a while' this may takes some time.

#while $ANIMATION; do for X in '-' '/' '|' '\'; do echo -en "\b$X" ; sleep 0.5; done; done &

FILE=$OUTPUTDIRPATH/Whowins4kda.arff
 
java -cp $WEKAJAR weka.filters.unsupervised.attribute.Remove -R 1,2,3,5,6,7,8,10-15,16,19,21,27,29,32,37,38,39,42-46,53,54,55,58 -i $FILE -o $OUTPUTDIRPATH/WhowinsSampled2.arff

WhowinsSampled2=$OUTPUTDIRPATH/WhowinsSampled2.arff

java -cp  $WEKAJAR weka.filters.unsupervised.attribute.NumericToNominal -R 31,30,9 -i $WhowinsSampled2 -o $OUTPUTDIRPATH/WhowinsSampled3.arff


WhowinsSampled3=$OUTPUTDIRPATH/WhowinsSampled3.arff

java -cp  $WEKAJAR weka.filters.unsupervised.attribute.StringToNominal -R 3 -i $WhowinsSampled3 -o $OUTPUTDIRPATH/WhowinsSampled4.arff

WhowinsSampled4=$OUTPUTDIRPATH/WhowinsSampled4.arff
#file for default results
mkdir $OUTPUTDIRPATH/DefaultResults
DefaultResults=$OUTPUTDIRPATH/DefaultResults

java -cp $WEKAJAR weka.classifiers.bayes.NaiveBayes -c 31 -x 10 -D -t $WhowinsSampled4 > $DefaultResults/Win.NaiveBayes.txt

java -cp $WEKAJAR weka.classifiers.bayes.NaiveBayes -c 9 -x 10 -D -t $WhowinsSampled4 > $DefaultResults/PentaKill.NaiveBayes.txt

java -cp $WEKAJAR weka.classifiers.bayes.NaiveBayes -c 30 -x 10 -D -t $WhowinsSampled4 > $DefaultResults/FirstBlood.NaiveBayes.txt

java -cp $WEKAJAR weka.classifiers.trees.J48 -c 31 -M 2 -x 5 -t $WhowinsSampled4 > $DefaultResults/Win.J48.txt

java -cp $WEKAJAR weka.classifiers.trees.J48 -c 9 -M 2 -x 5 -t $WhowinsSampled4 > $DefaultResults/PentaKill.J48.txt

java -cp $WEKAJAR weka.classifiers.trees.J48 -c 30 -M 2 -x 5 -t $WhowinsSampled4 > $DefaultResults/FirstBlood.J48.txt

java -Xmx4g -cp $WEKAJAR weka.classifiers.functions.Logistic -R 1.0E-8 -M -1 -c 31 -x 5 -t $WhowinsSampled4 > $DefaultResults/win.Logistic.txt

java -Xmx4g -cp $WEKAJAR weka.classifiers.functions.Logistic -R 1.0E-8 -M -1 -c 9 -x 5 -t $WhowinsSampled4 > $DefaultResults/PentaKill.Logistic.txt

java -Xmx4g -cp $WEKAJAR weka.classifiers.functions.Logistic -R 1.0E-8 -M -1 -c 30 -x 5 -t $WhowinsSampled4 > $DefaultResults/FirstBlood.Logistic.txt


java -cp  $WEKAJAR weka.filters.unsupervised.attribute.NumericToNominal -R 6,7,8,9,22,23,30 -i $WhowinsSampled4 -o $OUTPUTDIRPATH/WhowinsSampled5.arff

WhowinsSampled5=$OUTPUTDIRPATH/WhowinsSampled5.arff

java -cp $WEKAJAR weka.filters.unsupervised.instance.RemoveWithValues -S 41.0 -C 28 -L 0-41 -V -i $WhowinsSampled5 -o $OUTPUTDIRPATH/WhowinsSampled6.arff

WhowinsSampled6=$OUTPUTDIRPATH/WhowinsSampled6.arff



java -cp  $WEKAJAR weka.filters.unsupervised.attribute.NumericToNominal -R 28 -i $WhowinsSampled6 -o $OUTPUTDIRPATH/WhowinsSampled7.arff

WhowinsSampled7=$OUTPUTDIRPATH/WhowinsSampled7.arff

#new file for new results
mkdir $OUTPUTDIRPATH/ImprovedResults
ImprovedResults=$OUTPUTDIRPATH/ImprovedResults

java -Xmx4g -cp  $WEKAJAR weka.filters.unsupervised.attribute.Discretize -B 10 -M -1.0 -R 14-16 -i $WhowinsSampled7 -o $OUTPUTDIRPATH/WhowinsSampled8.arff

WhowinsSampled8=$OUTPUTDIRPATH/WhowinsSampled8.arff

java -cp $WEKAJAR weka.classifiers.bayes.NaiveBayes -c 31 -x 15 -D -t $WhowinsSampled8 > $ImprovedResults/Win.NaiveBayes.txt

java -cp $WEKAJAR weka.classifiers.bayes.NaiveBayes -c 9 -x 15 -D -t $WhowinsSampled8 > $ImprovedResults/PentaKill.NaiveBayes.txt

java -cp $WEKAJAR weka.classifiers.bayes.NaiveBayes -c 30 -x 15 -D -t $WhowinsSampled8 > $ImprovedResults/FirstBlood.NaiveBayes.txt

java -cp $WEKAJAR weka.classifiers.trees.J48 -c 31 -M 2 -x 15 -t $WhowinsSampled8 > $ImprovedResults/Win.J48.txt

java -cp $WEKAJAR weka.classifiers.trees.J48 -c 9 -M 2 -x 5 -t $WhowinsSampled8 > $ImprovedResults/PentaKill.J48.txt

java -cp $WEKAJAR weka.classifiers.trees.J48 -c 30 -M 2 -x 5 -t $WhowinsSampled8 > $ImprovedResults/FirstBlood.J48.txt

java -Xmx4g -cp $WEKAJAR weka.classifiers.functions.Logistic -R 1.0E-8 -M -1 -c 31 -x 5 -t $WhowinsSampled8 > $ImprovedResults/Win.Logistic.txt

java -Xmx4g -cp $WEKAJAR weka.classifiers.functions.Logistic -R 1.0E-8 -M -1 -c 9 -x 5 -t $WhowinsSampled8 > $ImprovedResults/PentaKill.Logistic5.txt

java -Xmx4g -cp $WEKAJAR weka.classifiers.functions.Logistic -R 1.0E-8 -M -1 -c 30 -x 5 -t $WhowinsSampled8 > $ImprovedResults/FirstBlood.Logistic5.txt

#java -Xmx5g -cp $WEKAJAR weka.classifiers.functions.SMO -x 5 -C 1.0 -L 0.001 -P 1.0E-12 -N 0 -V -1 -W 1 -K "weka.classifiers.functions.supportVector.NormalizedPolyKernel -C 250007 -E 2.0" -c 31 -t $WhowinsSampled8

mkdir $OUTPUTDIRPATH/appriori

APPRIORI=$OUTPUTDIRPATH/appriori

java -cp  $WEKAJAR weka.filters.unsupervised.attribute.NumericToNominal -R first-last -i $WhowinsSampled8 -o $OUTPUTDIRPATH/WhowinsSampled9.arff

WhowinsSampled9=$OUTPUTDIRPATH/WhowinsSampled9.arff

java -cp $WEKAJAR weka.filters.unsupervised.attribute.Remove -R 4-10 -i $WhowinsSampled9 -o $OUTPUTDIRPATH/WhowinsSampled10.arff

WhowinsSampled10=$OUTPUTDIRPATH/WhowinsSampled10.arff

java -Xmx4g -cp $WEKAJAR weka.associations.Apriori -N 25 -T 0 -C 0.5 -D 0.05 -U 1.0 -M 0.1 -S -1.0 -c -1 -t $WhowinsSampled10 > $APPRIORI/Appriori.Confidence.txt

java -Xmx4g -cp $WEKAJAR weka.associations.Apriori -N 25 -T 1 -C 0.5 -D 0.05 -U 1.0 -M 0.1 -S -1.0 -c -1 -t $WhowinsSampled10 > $APPRIORI/Appriori.Lift.txt

java -Xmx4g -cp $WEKAJAR weka.associations.Apriori -N 25 -T 2 -C 0.1 -D 0.05 -U 1.0 -M 0.1 -S -1.0 -c -1 -t $WhowinsSampled10 > $APPRIORI/Appriori.Leverage.txt

java -Xmx4g -cp $WEKAJAR weka.associations.Apriori -N 25 -T 3 -C 1.1 -D 0.05 -U 1.5 -M 0.1 -S -1.0 -c -1 -t $WhowinsSampled10 > $APPRIORI/Apriori.Conviction.txt

mkdir $OUTPUTDIRPATH/correlation

CORRELATION=$OUTPUTDIRPATH/correlation

wget -O $OUTPUTDIRPATH/weka.jar "https://raw.githubusercontent.com/SaWLeaDeR/AppliedMachineLearning/master/weka(1).jar"

#java -Xmx4g -cp $WEKAJAR weka.attributeSelection.CorrelationAttributeEval -i $WhowinsSampled10 -s "weka.attributeSelection.Ranker -T -1.7976931348623157E308 -N -1" -c 31  > $CORRELATION/Win.Correlation.txt

#java -Xmx4g -cp $WEKAJAR weka.attributeSelection.CorrelationAttributeEval -i $WhowinsSampled10 -s "weka.attributeSelection.Ranker -T -1.7976931348623157E308 -N -1" -c 30  > $CORRELATION/FirstBlood.Correlation.txt

#java -Xmx4g -cp $WEKAJAR weka.attributeSelection.CorrelationAttributeEval -i $WhowinsSampled10 -s "weka.attributeSelection.Ranker -T -1.7976931348623157E308 -N -1" -c 9   > $CORRELATION/PentaKill.Correlation.txt

ANIMATION=false
