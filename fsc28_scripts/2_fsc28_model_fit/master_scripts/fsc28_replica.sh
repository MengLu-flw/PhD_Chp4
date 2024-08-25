#!/bin/bash
#SBATCH --job-name="fsc28_replica_240524"
#SBATCH --output="/home/mlu/scratch/3_fsc28/2_ModelFit/Slurm/array_out/fsc28_replica_240524_%A-%a.out"
#SBATCH --error="/home/mlu/scratch/3_fsc28/2_ModelFit/Slurm/array_out/fsc28_replica_240524_%A-%a.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=long
#SBATCH --mem=1G
#SBATCH --array=1-56%30
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Define variables
wDIR=/home/mlu/scratch/3_fsc28/2_ModelFit/Slurm

cd $wDIR

##-0- Set up array job input
echo $SLURM_ARRAY_TASK_ID
JOB=$(awk -v lineid=$SLURM_ARRAY_TASK_ID 'NR==lineid{print;exit}' $wDIR/joblist.txt)


##-1- Run scripts
bash "$JOB"