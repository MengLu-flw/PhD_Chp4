## -------------------------------------------------------------------------------------------- ##
## --- Use the 100 SFSs that you simulated in the last step to perform parametric bootstrap --- ##
## -------------------------------------------------------------------------------------------- ##

#!/bin/bash
#SBATCH --job-name="Lina_parCI"
#SBATCH --output="/home/mlu/scratch/3_fsc28/4_ParaCIs/Slurm/Lina_parCI_%A-%a.out"
#SBATCH --error="/home/mlu/scratch/3_fsc28/4_ParaCIs/Slurm/Lina_parCI_%A-%a.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=long
#SBATCH --mem=1G
#SBATCH --array=1-100%10
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Define variables
wDIR=/home/mlu/scratch/3_fsc28/4_ParaCIs
appDIR=/home/mlu/scratch/apps/fsc28_linux64

fDIR=/home/mlu/scratch/3_fsc28/2_ModelFit/1_replica_NoM/Lina

cd $wDIR

##-1- File prep
# ls -d /home/mlu/scratch/3_fsc28/4_ParaCIs/Lina_NoM_SC/Lina_NoM_SC* > $wDIR/DIRlist_Lina.txt
# & use 'wc' to check there are just 100 directories


##-2- Set up array job input
echo $SLURM_ARRAY_TASK_ID
nDIR=$(awk -v lineid=$SLURM_ARRAY_TASK_ID 'NR==lineid{print;exit}' $wDIR/DIRlist_Lina.txt)

##-3- Run scripts
#CORE CODE:fsc28 -t $preF1.tpl -e $preF1.est -m -M -c 8 -B 8 -L 50 -n 1000000
cd "$nDIR"

for i in {1..40}
do
mkdir Run$i
cp $fDIR/Lina_NoM_SC.tpl $fDIR/Lina_NoM_SC.est Run$i"/"
cp Lina_NoM_SC_jointMAFpop1_0.obs Run$i"/"
cd Run$i
time $appDIR/fsc28 -t Lina_NoM_SC.tpl -e Lina_NoM_SC.est -m -M -c 8 -B 8 -L 50 -n 1000000
cd ..
done


