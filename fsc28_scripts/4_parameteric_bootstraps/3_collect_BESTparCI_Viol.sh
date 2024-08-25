srun --partition=short --cpus-per-task=1 --mem=100M --pty bash

##- The file path pattern
#	/home/mlu/scratch/3_fsc28/4_ParaCIs/Viol_NoM_AM/
#		Viol_NoM_AM_100/Run40/Viol_NoM_AM/Viol_NoM_AM.bestlhoods


##- Define variables
wDIR=/home/mlu/scratch/3_fsc28/4_ParaCIs/Viol_NoM_AM
PREFIX="Viol_NoM_AM"

cd $wDIR


##----------------------------------------------------------------------------------------
##- Step 1, within each run (40 runs in total) for a simulated SFS (100 SFSs in total)
##----------------------------------------------------------------------------------------

##- Find the bestrun
# For AM model, the MaxEstLhood is at column 10th
time for i in {1..100}; do
cd $wDIR/Viol_NoM_AM_$i
cat Run{1..40}/${PREFIX}/${PREFIX}.bestlhoods | grep -v MaxObsLhood | awk '{print NR,$10}' | sort -k 2 | head -n 1 >> $wDIR/${PREFIX}.bestruns
cd $wDIR
done


# Manually edit $wDIR/${PREFIX}.bestruns to make it useful for the wihle-loop
cat $wDIR/Viol_NoM_AM.bestruns #then, edit it in Excel

nano $wDIR/Viol_NoM_AM.bestruns.txt
wc $wDIR/Viol_NoM_AM.bestruns.txt

head -n 5 $wDIR/Viol_NoM_AM.bestruns.txt
#	14	1
#	10	2
#	11	3
#	36	4
#	27	5


##----------------------------------------------------------------------------------------
##- Step 2, use while-loop to collect the best runs from each simulated SFS
##----------------------------------------------------------------------------------------

time while IFS=$'\t' read -r bestrun SFS
do
cat ${PREFIX}_"$SFS"/Run"$bestrun"/${PREFIX}/${PREFIX}.bestlhoods >> $wDIR/${PREFIX}.raw.bestPARA
done < $wDIR/"Viol_NoM_AM.bestruns.txt"



##----------------------------------------------------------------------------------------
##- Step 3, make the format clean for R to plot
##----------------------------------------------------------------------------------------

cp $wDIR/${PREFIX}.raw.bestPARA $wDIR/Viol_NoM_AM.bestPARA

head -n 1  Viol_NoM_AM.bestPARA # Save this first line as title
#	$pop0_Viol_hirta$	$pop1_Viol_odorata$	$NANC$	$TR$	$TMIG$	$mig01$	$mig10$	$RESIZE$	$TDIV$	MaxEstLhood	MaxObsLhood

sed -i '1~2d' Viol_NoM_AM.bestPARA # modify the original file, delete all the odd lines (replicated titles)

nano Viol_NoM_AM.bestPARA # add back that printed title line

# the resulting file should be 101 lines in total













Viol_NoM_AM_1