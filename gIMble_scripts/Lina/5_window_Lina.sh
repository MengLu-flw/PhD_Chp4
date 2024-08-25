#########------5_Lina_window64.sh------#########

#!/bin/bash
#SBATCH --job-name="5_Lina_window64"
#SBATCH --output="/home/mlu/scratch/2_gimble/2024_May/Lina/Slurm/5_Lina_window64.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/2024_May/Lina/Slurm/5_Lina_window64.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=medium
#SBATCH --mem=55G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

##-1- Move to the correct working directory
cd /home/mlu/scratch/2_gimble/2024_May/Lina

##-2- Run gimble
# example: gimble windows -z analysis.z -w 30000 -s 6000

time gimble windows -z Lina_Gstore.z -w 76560 -s 15312
#-f # if you are rerunning this, use '--force' to force overwrite of existing data

# If the window span is 100 Kb, step size is 20% overlap
# 100,000 = (64 * w)/49
# w = 76,562.5
# s = 15,312.5
# Quotient of '--blocks' and '--steps' must be an integer.



#########------Lina_Gwindow128.sh------#########

#!/bin/bash
#SBATCH --job-name="Lina_Gwindow128"
#SBATCH --output="/home/mlu/scratch/2_gimble/Linaria/Lina_Gwindow128.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/Linaria/Lina_Gwindow128.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=long
#SBATCH --mem=64G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

##-1- Move to the correct working directory
cd /home/mlu/scratch/2_gimble/Linaria

##-2- Run gimble
# example: gimble windows -z analysis.z -w 30000 -s 6000

time gimble windows -z Lina_Gstore_b128.z -w 30000 -s 6000 # if you are rerunning this, use '--force' to force overwrite of existing data


