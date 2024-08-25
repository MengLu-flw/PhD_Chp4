#########------4_Geum_cf_info.sh------#########

#!/bin/bash
#SBATCH --job-name="4_Geum_cf_info"
#SBATCH --output="/home/mlu/scratch/2_gimble/2024_May/Geum_cf_sym/Slurm/4_Geum_cf_info.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/2024_May/Geum_cf_sym/Slurm/4_Geum_cf_info.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=medium
#SBATCH --mem=80G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

##-1- Move to the correct working directory
cd /home/mlu/scratch/2_gimble/2024_May/Geum_cf_sym

##-2- Run gimble
# example: gimble windows -z analysis.z -w 30000 -s 6000

time gimble info -z Geum_cf_Gstore.z