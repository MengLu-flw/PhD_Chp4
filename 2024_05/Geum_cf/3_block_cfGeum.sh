####------3_Geum_cf_block64.sh------#########

#!/bin/bash
#SBATCH --job-name="3_Geum_cf_block64"
#SBATCH --output="/home/mlu/scratch/2_gimble/2024_May/Geum_cf_sym/Slurm/3_Geum_cf_block64.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/2024_May/Geum_cf_sym/Slurm/3_Geum_cf_block64.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=himem
#SBATCH --mem=180G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

##-1- Move to the correct working directory
cd /home/mlu/scratch/2_gimble/2024_May/Geum_cf_sym

##-2- Run gimble
time gimble blocks -z Geum_cf_Gstore.z -l 64 # if you are rerunning this, use '--force' to force overwrite of existing data

