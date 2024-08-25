srun --partition=short --cpus-per-task=1 --mem=100M --pty bash

##- The file path pattern
#	/home/mlu/scratch/3_fsc28/4_ParaCIs/Prim_DToL_NoM_IM/
#		Prim_DToL_NoM_IM_100/Run40/Prim_DToL_NoM_IM/Prim_DToL_NoM_IM.bestlhoods


##- Define variables
wDIR=/home/mlu/scratch/3_fsc28/4_ParaCIs/Prim_DToL_NoM_IM
PREFIX="Prim_DToL_NoM_IM"

cd $wDIR


##----------------------------------------------------------------------------------------
##- Step 1, within each run (40 runs in total) for a simulated SFS (100 SFSs in total)
##----------------------------------------------------------------------------------------

##- Find the bestrun
# For SC model, the MaxEstLhood is at column 8th
time for i in {1..100}; do
cd $wDIR/Prim_DToL_NoM_IM_$i
cat Run{1..40}/${PREFIX}/${PREFIX}.bestlhoods | grep -v MaxObsLhood | awk '{print NR,$8}' | sort -k 2 | head -n 1 >> $wDIR/${PREFIX}.bestruns
cd $wDIR
done

# Manually edit $wDIR/${PREFIX}.bestruns to make it useful for the wihle-loop
cp $wDIR/Prim_DToL_NoM_IM.bestruns $wDIR/Prim_DToL_NoM_IM.bestruns.txt

cat $wDIR/Prim_DToL_NoM_IM.bestruns.txt
nano $wDIR/Prim_DToL_NoM_IM.bestruns.txt
wc Prim_DToL_NoM_IM.bestruns.txt

head -n 5 $wDIR/Prim_DToL_NoM_IM.bestruns.txt
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
done < $wDIR/"Prim_DToL_NoM_IM.bestruns.txt"



##----------------------------------------------------------------------------------------
##- Step 3, make the format clean for R to plot
##----------------------------------------------------------------------------------------

cp $wDIR/${PREFIX}.raw.bestPARA $wDIR/Prim_DToL_NoM_IM.bestPARA

head -n 1  Prim_DToL_NoM_IM.bestPARA # Save this first line as title
#	pop0_Prim_veris	pop1_Prim_vulgaris	NANC	TDIV	mig01	mig10	RESIZE	MaxEstLhood	MaxObsLhood

sed -i '1~2d' Prim_DToL_NoM_IM.bestPARA # modify the original file, delete all the odd lines (replicated titles)

nano Prim_DToL_NoM_IM.bestPARA # add back that printed title line

# the resulting file should be 101 lines in total













Prim_DToL_NoM_IM_1