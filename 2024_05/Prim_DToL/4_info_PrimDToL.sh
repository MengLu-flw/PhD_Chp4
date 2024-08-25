#!/bin/bash
#SBATCH --job-name="4_PrimDToL_ex_info"
#SBATCH --output="/home/mlu/scratch/2_gimble/2024_May/Prim_DToL/Slurm/4_PrimDToL_ex_info.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/2024_May/Prim_DToL/Slurm/4_PrimDToL_ex_info.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=medium
#SBATCH --mem=50G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

##-1- Move to the correct working directory
cd /home/mlu/scratch/2_gimble/2024_May/Prim_DToL

##-2- Run gimble
time gimble info -z PrimDToL_POP.z

