#!/bin/bash
#SBATCH --job-name="5_PrimDToL_ex_window"
#SBATCH --output="/home/mlu/scratch/2_gimble/2024_May/Prim_DToL/Slurm/5_PrimDToL_ex_window.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/2024_May/Prim_DToL/Slurm/5_PrimDToL_ex_window.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=himem
#SBATCH --mem=300G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

##-1- Move to the correct working directory
cd /home/mlu/scratch/2_gimble/2024_May/Prim_DToL

##-2- Run gimble
# example: gimble windows -z analysis.z -w 30000 -s 6000

time gimble windows -z PrimDToL_POP.z -w 223440 -s 44688
#-f # if you are rerunning this, use '--force' to force overwrite of existing data

# If the window span is 100 Kb, step size is 20% overlap
# 100,000 = (64 * w)/143
# w = 223,440
# s = 44,688
# Quotient of '--blocks' and '--steps' must be an integer.