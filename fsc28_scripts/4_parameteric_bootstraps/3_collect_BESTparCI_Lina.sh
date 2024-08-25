srun --partition=short --cpus-per-task=1 --mem=100M --pty bash

##- The file path pattern
#	/home/mlu/scratch/3_fsc28/4_ParaCIs/Lina_NoM_SC/
#		Lina_NoM_SC_100/Run40/Lina_NoM_SC/Lina_NoM_SC.bestlhoods


##- Define variables
wDIR=/home/mlu/scratch/3_fsc28/4_ParaCIs/Lina_NoM_SC
PREFIX="Lina_NoM_SC"

cd $wDIR


##----------------------------------------------------------------------------------------
##- Step 1, within each run (40 runs in total) for a simulated SFS (100 SFSs in total)
##----------------------------------------------------------------------------------------

##- Find the bestrun
# For SC model, the MaxEstLhood is at column 10th
time for i in {1..100}; do
cd $wDIR/Lina_NoM_SC_$i
cat Run{1..40}/${PREFIX}/${PREFIX}.bestlhoods | grep -v MaxObsLhood | awk '{print NR,$10}' | sort -k 2 | head -n 1 >> $wDIR/${PREFIX}.bestruns
cd $wDIR
done


# Manually edit $wDIR/${PREFIX}.bestruns to make it useful for the wihle-loop
cp $wDIR/Lina_NoM_SC.bestruns $wDIR/Lina_NoM_SC.bestruns.txt

cat $wDIR/Lina_NoM_SC.bestruns.txt
nano $wDIR/Lina_NoM_SC.bestruns.txt
wc $wDIR/Lina_NoM_SC.bestruns.txt

head -n 5 $wDIR/Lina_NoM_SC.bestruns.txt
#	6	1
#	35	2
#	37	3
#	2	4
#	3	5


##----------------------------------------------------------------------------------------
##- Step 2, use while-loop to collect the best runs from each simulated SFS
##----------------------------------------------------------------------------------------

time while IFS=$'\t' read -r bestrun SFS
do
cat ${PREFIX}_"$SFS"/Run"$bestrun"/${PREFIX}/${PREFIX}.bestlhoods >> $wDIR/${PREFIX}.raw.bestPARA
done < $wDIR/"Lina_NoM_SC.bestruns.txt"



##----------------------------------------------------------------------------------------
##- Step 3, make the format clean for R to plot
##----------------------------------------------------------------------------------------

cp $wDIR/${PREFIX}.raw.bestPARA $wDIR/Lina_NoM_SC.bestPARA

head -n 1  Lina_NoM_SC.bestPARA # Save this first line as title
#	pop0_Lina_repens	pop1_Lina_vulgaris	NANC	TR	TMIG	mig01	mig10	RESIZE	TDIV	MaxEstLhood	MaxObsLhood

sed -i '1~2d' Lina_NoM_SC.bestPARA # modify the original file, delete all the odd lines (replicated titles)

nano Lina_NoM_SC.bestPARA # add back that printed title line

# the resulting file should be 101 lines in total













Lina_NoM_SC_1