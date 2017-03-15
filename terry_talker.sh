#!/bin/bash

INFILE=raw-data.txt
BARTLIB_DATADIR=bart-data
MKDATADIR="mkdir '$BARTLIB_DATADIR'"
eval $MKDATADIR

source terry_says.sh
source bartlib.sh

. ./terry_says.sh > bart-data/__START

clear

[[ -d $BARTLIB_DATADIR ]] || mkdata $INFILE

NUM_OF_SENTENCES=$(shuf -i4-15 -n1)

START=0
END=$NUM_OF_SENTENCES

for ((index=$START; index<$END; index++)) 
do
NUM_OF_WORDS[index]=$(shuf -i12-18 -n1)

done


TERRY_SAYS=""
CURRENT_SENTENCE=""
PERIOD=". "

STARTi=0
ENDi=$NUM_OF_SENTENCES
STARTj=0

for ((indexi=$STARTi; indexi<$ENDi; indexi++)) 
do
    randomline 
    for((indexj=$STARTj; indexj<NUM_OF_WORDS[indexi]; indexj++)) 
    do 
	OUT=$(linefromwords $LINE) 
        CURRENT_SENTENCE="$CURRENT_SENTENCE $OUT"
    done
    TERRY_SAYS=$TERRY_SAYS$CURRENT_SENTENCE$PERIOD
    CURRENT_SENTENCE=""
done

EXE_TERRY_SAYS="echo '$TERRY_SAYS'"

clear

printf "\n\n"
echo "Terry says..."
eval $EXE_TERRY_SAYS
printf "\n\n\n"

#echo "$TERRY_SAYS"
