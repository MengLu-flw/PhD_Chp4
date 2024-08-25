#!/bin/bash
#SBATCH --job-name="5_Geum_cf_window64"
#SBATCH --output="/home/mlu/scratch/2_gimble/2024_May/Geum_cf_sym/Slurm/5_Geum_cf_window64.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/2024_May/Geum_cf_sym/Slurm/5_Geum_cf_window64.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=himem
#SBATCH --mem=800G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

##-1- Move to the correct working directory
cd /home/mlu/scratch/2_gimble/2024_May/Geum_cf_sym

##-2- Run gimble
# example: gimble windows -z analysis.z -w 30000 -s 6000

time gimble windows -z Geum_cf_Gstore.z -w 196875 -s 39375 # if you are rerunning this, use '--force' to force overwrite of existing data

# If the window span is 100 Kb, step size is 20% overlap
# 100,000 = (64 * w)/126
# w = 196,875
# s = 39,375
# Quotient of '--blocks' and '--steps' must be an integer.

# If the window span is 50 Kb
# w = 98,437.5
# s = 19,687.5