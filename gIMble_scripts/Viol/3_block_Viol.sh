#########------Viol_Gblock64.sh------#########

#!/bin/bash
#SBATCH --job-name="3_Viol_block64"
#SBATCH --output="/home/mlu/scratch/2_gimble/2024_May/Viol/Slurm/3_Viol_block64.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/2024_May/Viol/Slurm/3_Viol_block64.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=short
#SBATCH --mem=20G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

##-1- Move to the correct working directory
cd /home/mlu/scratch/2_gimble/2024_May/Viol

##-2- Run gimble
# example: gimble blocks -z analysis.z -l 64

time gimble blocks -z Viol_Gstore.z -l 64 # if you are rerunning this, use '--force' to force overwrite of existing data



#########------Viol_Gblock128.sh------#########

#!/bin/bash
#SBATCH --job-name="Viol_Gblock128"
#SBATCH --output="/home/mlu/scratch/2_gimble/Viola/Viol_Gblock128.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/Viola/Viol_Gblock128.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=long
#SBATCH --mem=64G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

##-1- Move to the correct working directory
cd /home/mlu/scratch/2_gimble/Viola

##-2- Run gimble
# example: gimble blocks -z analysis.z -l 64

time gimble blocks -z Viol_Gstore_b128.z -l 128 # if you are rerunning this, use '--force' to force overwrite of existing data

