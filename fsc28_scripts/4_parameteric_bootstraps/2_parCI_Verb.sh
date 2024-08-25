## -------------------------------------------------------------------------------------------- ##
## --- Use the 100 SFSs that you simulated in the last step to perform parametric bootstrap --- ##
## -------------------------------------------------------------------------------------------- ##

#!/bin/bash
#SBATCH --job-name="Verb_parCI"
#SBATCH --output="/home/mlu/scratch/3_fsc28/4_ParaCIs/Slurm/Verb_parCI_%A-%a.out"
#SBATCH --error="/home/mlu/scratch/3_fsc28/4_ParaCIs/Slurm/Verb_parCI_%A-%a.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=long
#SBATCH --mem=1G
#SBATCH --array=1-100%10
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Define variables
wDIR=/home/mlu/scratch/3_fsc28/4_ParaCIs
appDIR=/home/mlu/scratch/apps/fsc28_linux64

fDIR=/home/mlu/scratch/3_fsc28/2_ModelFit/1_replica_NoM/Verb

cd $wDIR

##-1- File prep
# ls -d /home/mlu/scratch/3_fsc28/4_ParaCIs/Verb_NoM_DIV/Verb_NoM_DIV* > $wDIR/DIRlist_Verb.txt
# & use 'wc' to check there are just 100 directories


##-2- Set up array job input
echo $SLURM_ARRAY_TASK_ID
nDIR=$(awk -v lineid=$SLURM_ARRAY_TASK_ID 'NR==lineid{print;exit}' $wDIR/DIRlist_Verb.txt)

##-3- Run scripts
#CORE CODE:fsc28 -t $preF1.tpl -e $preF1.est -m -M -c 8 -B 8 -L 50 -n 1000000
cd "$nDIR"

for i in {1..40}
do
mkdir Run$i
cp $fDIR/Verb_NoM_DIV.tpl $fDIR/Verb_NoM_DIV.est Run$i"/"
cp Verb_NoM_DIV_jointMAFpop1_0.obs Run$i"/"
cd Run$i
time $appDIR/fsc28 -t Verb_NoM_DIV.tpl -e Verb_NoM_DIV.est -m -M -c 8 -B 8 -L 50 -n 1000000
cd ..
done


