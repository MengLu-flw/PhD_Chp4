## Prepare input files for the runs
parDIR=/home/mlu/scratch/3_fsc28/2_ModelFit/3_bestruns
obsDIR=/home/mlu/scratch/3_fsc28/2_ModelFit/1_replica_NoM
wDIR=/home/mlu/scratch/3_fsc28/3_ModelSelect
cd $wDIR

#	cp $parDIR/Viol_NoM_AM/*maxL.par $wDIR/
#	cp $parDIR/Viol_NoM_DIV/*maxL.par $wDIR/
cp $parDIR/Viol_NoM_IM/new_240612/*maxL.par $wDIR/
#	cp $parDIR/Viol_NoM_SC/*maxL.par $wDIR/


cp $obsDIR/Viol/Viol_NoM_IM*.obs $wDIR/


#	mv Prim_DToL_NoM_AM_jointMAFpop1_0.obs PrimDToL_NoM_AM_maxL_jointMAFpop1_0.obs
#	mv Prim_DToL_NoM_DIV_jointMAFpop1_0.obs PrimDToL_NoM_DIV_maxL_jointMAFpop1_0.obs
#	mv Prim_DToL_NoM_IM_jointMAFpop1_0.obs PrimDToL_NoM_IM_maxL_jointMAFpop1_0.obs
#	mv Prim_DToL_NoM_SC_jointMAFpop1_0.obs PrimDToL_NoM_SC_maxL_jointMAFpop1_0.obs

#	mv Viol_NoM_AM_jointMAFpop1_0.obs Viol_NoM_AM_maxL_jointMAFpop1_0.obs
#	mv Viol_NoM_DIV_jointMAFpop1_0.obs Viol_NoM_DIV_maxL_jointMAFpop1_0.obs
mv Viol_NoM_IM_jointMAFpop1_0.obs Viol_NoM_IM_maxL_jointMAFpop1_0.obs
#	mv Viol_NoM_SC_jointMAFpop1_0.obs Viol_NoM_SC_maxL_jointMAFpop1_0.obs

##-- "PARprefix_list2.txt" --##

# PrimDToL_NoM_DIV
# PrimDToL_NoM_IM
# PrimDToL_NoM_SC
# PrimDToL_NoM_AM
# Viol_NoM_DIV
# Viol_NoM_IM
# Viol_NoM_SC
# Viol_NoM_AM



####--------------------------------------------------------------------------------------
####--------------------------------------------------------------------------------------


#!/bin/bash
#SBATCH --job-name="240711fsc.par_LhoodRange"
#SBATCH --output="/home/mlu/scratch/3_fsc28/3_ModelSelect/Slurm/240711fsc.par_LhoodRange_%A-%a.out"
#SBATCH --error="/home/mlu/scratch/3_fsc28/3_ModelSelect/Slurm/240711fsc.par_LhoodRange_%A-%a.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=short
#SBATCH --mem=200M
#SBATCH --array=1-8
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk

##-0- Define variables
wDIR=/home/mlu/scratch/3_fsc28/3_ModelSelect
appDIR=/home/mlu/scratch/apps/fsc28_linux64
cd $wDIR

##-1- Setup arrays
echo $SLURM_ARRAY_TASK_ID
preFix=$(awk -v lineid=$SLURM_ARRAY_TASK_ID 'NR==lineid{print;exit}' $wDIR/PARprefix_list2.txt)


##-2- Run 100 replicates
for i in {1..100}
do
# prepare a run folder for each replicate
mkdir "$preFix"_$i
cp "$preFix"_maxL.par "$preFix"_maxL_jointMAFpop1_0.obs "$preFix"_$i"/"
cd "$preFix"_$i

# run the core command
time $appDIR/fsc28 -i "$preFix"_maxL.par -c 8 -B 8 -n 1000000 -m -q

# collect the likelihood output
sed -n '2,3p' "$preFix"_maxL/"$preFix"_maxL.lhoods  >> $wDIR/"$preFix".lhoods

# jump out of the replicate run folder & delete this folder (as the likelihood collection has completed)
cd $wDIR
rm -rf "$preFix"_$i

done
