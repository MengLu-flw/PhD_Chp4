srun --partition=short --cpus-per-task=1 --mem=100M --pty bash

##- The file path pattern
#	/home/mlu/scratch/3_fsc28/4_ParaCIs/Geum_NoM_SC/
#		Geum_NoM_SC_100/Run40/Geum_NoM_SC/Geum_NoM_SC.bestlhoods


##- Define variables
wDIR=/home/mlu/scratch/3_fsc28/4_ParaCIs/Geum_NoM_SC
PREFIX="Geum_NoM_SC"

cd $wDIR


##----------------------------------------------------------------------------------------
##- Step 1, within each run (40 runs in total) for a simulated SFS (100 SFSs in total)
##----------------------------------------------------------------------------------------

##- Find the bestrun
# For SC model, the MaxEstLhood is at column 10th
time for i in {1..100}; do
cd $wDIR/Geum_NoM_SC_$i
cat Run{1..40}/${PREFIX}/${PREFIX}.bestlhoods | grep -v MaxObsLhood | awk '{print NR,$10}' | sort -k 2 | head -n 1 >> $wDIR/${PREFIX}.bestruns
cd $wDIR
done


# Manually edit $wDIR/${PREFIX}.bestruns to make it useful for the wihle-loop
cat $wDIR/Geum_NoM_SC.bestruns #then, edit in Excel

nano $wDIR/Geum_NoM_SC.bestruns.txt
wc $wDIR/Geum_NoM_SC.bestruns.txt

head -n 5 $wDIR/Geum_NoM_SC.bestruns.txt
#	25	1
#	1	2
#	38	3
#	10	4
#	16	5


##----------------------------------------------------------------------------------------
##- Step 2, use while-loop to collect the best runs from each simulated SFS
##----------------------------------------------------------------------------------------

time while IFS=$'\t' read -r bestrun SFS
do
cat ${PREFIX}_"$SFS"/Run"$bestrun"/${PREFIX}/${PREFIX}.bestlhoods >> $wDIR/${PREFIX}.raw.bestPARA
done < $wDIR/"Geum_NoM_SC.bestruns.txt"



##----------------------------------------------------------------------------------------
##- Step 3, make the format clean for R to plot
##----------------------------------------------------------------------------------------

cp $wDIR/${PREFIX}.raw.bestPARA $wDIR/Geum_NoM_SC.bestPARA

head -n 1  Geum_NoM_SC.bestPARA # Save this first line as title
#	$pop0_Geum_rivale$	$pop1_Geum_urbanum$	$NANC$	$TR$	$TMIG$	$mig01$	$mig10$	$RESIZE$	$TDIV$	MaxEstLhood	MaxObsLhood

sed -i '1~2d' Geum_NoM_SC.bestPARA # modify the original file, delete all the odd lines (replicated titles)

nano Geum_NoM_SC.bestPARA # add back that printed title line

# the resulting file should be 101 lines in total













Geum_NoM_SC_1