srun --partition=short --cpus-per-task=1 --mem=100M --pty bash

##- The file path pattern
#	/home/mlu/scratch/3_fsc28/4_ParaCIs/Verb_NoM_DIV/
#		Verb_NoM_DIV_100/Run40/Verb_NoM_DIV/Verb_NoM_DIV.bestlhoods

/home/mlu/scratch/3_fsc28/4_ParaCIs/Verb_NoM_DIV/Verb_NoM_DIV_100/Run40/Verb_NoM_DIV/Verb_NoM_DIV.bestlhoods


##- Define variables
wDIR=/home/mlu/scratch/3_fsc28/4_ParaCIs/Verb_NoM_DIV
PREFIX="Verb_NoM_DIV"

cd $wDIR


##----------------------------------------------------------------------------------------
##- Step 1, within each run (40 runs in total) for a simulated SFS (100 SFSs in total)
##----------------------------------------------------------------------------------------

##- Find the bestrun
# For DIV model, the MaxEstLhood is at column 6th

time for i in {1..100}; do
cd $wDIR/Verb_NoM_DIV_$i
cat Run{1..40}/${PREFIX}/${PREFIX}.bestlhoods | grep -v MaxObsLhood | awk '{print NR,$6}' | sort -k 2 | head -n 1 >> $wDIR/${PREFIX}.bestruns
cd $wDIR
done

# Manually edit $wDIR/${PREFIX}.bestruns to make it useful for the wihle-loop

cat $wDIR/Verb_NoM_DIV.bestruns # Can just edit this in Excel; add the Run number

nano $wDIR/Verb_NoM_DIV.bestruns.txt # This is the edited new file
wc Verb_NoM_DIV.bestruns.txt

head -n 5 $wDIR/Verb_NoM_DIV.bestruns.txt
#	28	1
#	31	2
#	8	3
#	22	4
#	20	5


##----------------------------------------------------------------------------------------
##- Step 2, use while-loop to collect the best runs from each simulated SFS
##----------------------------------------------------------------------------------------

time while IFS=$'\t' read -r bestrun SFS
do
cat ${PREFIX}_"$SFS"/Run"$bestrun"/${PREFIX}/${PREFIX}.bestlhoods >> $wDIR/${PREFIX}.raw.bestPARA
done < $wDIR/"Verb_NoM_DIV.bestruns.txt"



##----------------------------------------------------------------------------------------
##- Step 3, make the format clean for R to plot
##----------------------------------------------------------------------------------------

cp $wDIR/${PREFIX}.raw.bestPARA $wDIR/Verb_NoM_DIV.bestPARA

head -n 1  Verb_NoM_DIV.bestPARA # Save this first line as title
#	$pop0_Verb_nigrum$	$pop1_Verb_thapsus$	$NANC$	$TDIV$	$RESIZE$	MaxEstLhood	MaxObsLhood

sed -i '1~2d' Verb_NoM_DIV.bestPARA # modify the original file, delete all the odd lines (replicated titles)

nano Verb_NoM_DIV.bestPARA # add back that printed title line

# the resulting file should be 101 lines in total













Verb_NoM_DIV_1