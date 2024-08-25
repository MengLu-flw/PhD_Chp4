#!/bin/bash
#SBATCH --job-name="10_Geumcf_Gridsearch"
#SBATCH --output="/home/mlu/scratch/2_gimble/2024_May/Geum_cf_sym/Slurm/10_Geumcf_Gridsearch.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/2024_May/Geum_cf_sym/Slurm/10_Geumcf_Gridsearch.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=short
#SBATCH --mem=8G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

##-1- Move to the correct working directory
cd /home/mlu/scratch/2_gimble/2024_May/Geum_cf_sym


##-2- Run gimble
## model IM_BA
time gimble gridsearch -z Geum_cf_Gstore.z -p 50 \
					   -g makegrid/IM_BA_grid_240527 \
					   -d tally/windows_kmax2