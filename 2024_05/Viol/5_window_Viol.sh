#########------Viol_Gwindow.sh------#########

#!/bin/bash
#SBATCH --job-name="5_Viol_window64"
#SBATCH --output="/home/mlu/scratch/2_gimble/2024_May/Viol/Slurm/5_Viol_window64.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/2024_May/Viol/Slurm/5_Viol_window64.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=medium
#SBATCH --mem=140G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

##-1- Move to the correct working directory
cd /home/mlu/scratch/2_gimble/2024_May/Viol

##-2- Run gimble
# example: gimble windows -z analysis.z -w 30000 -s 6000

time gimble windows -z Viol_Gstore.z -w 62500 -s 12500
#-f 
# if you are rerunning this, use '--force' to force overwrite of existing data

# If the window span is 100 Kb, step size is 20% overlap
# 100,000 = (64 * w)/ X # where X is the number of inter-population sample sets
# 100,000 = (64 * w)/40
# w = 62500
# s = 12500
# Quotient of '--blocks' and '--steps' must be an integer.


