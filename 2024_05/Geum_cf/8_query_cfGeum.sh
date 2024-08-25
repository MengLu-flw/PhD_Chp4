#!/bin/bash
#SBATCH --job-name="8_Geumcf_query"
#SBATCH --output="/home/mlu/scratch/2_gimble/2024_May/Geum_cf_sym/Slurm/8_Geumcf_query.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/2024_May/Geum_cf_sym/Slurm/8_Geumcf_query.err"
#SBATCH --cpus-per-task=1
#SBATCH --partition=short
#SBATCH --mem=1G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

##-1- Move to the correct working directory
cd /home/mlu/scratch/2_gimble/2024_May/Geum_cf_sym

##-2- Run gimble
time gimble query -z Geum_cf_Gstore.z -l optimize/windows_kmax2.windowsum/DIV_wkmax2
time gimble query -z Geum_cf_Gstore.z -l optimize/windows_kmax2.windowsum/IM_AB_wkmax2
time gimble query -z Geum_cf_Gstore.z -l optimize/windows_kmax2.windowsum/IM_BA_wkmax2
time gimble query -z Geum_cf_Gstore.z -l optimize/windows_kmax2.windowsum/MIG_AB_wkmax2
time gimble query -z Geum_cf_Gstore.z -l optimize/windows_kmax2.windowsum/MIG_BA_wkmax2

##-------------------
time gimble query -z Geum_cf_Gstore.z -l optimize/windows_kmax2.windowsum/IM_AB_wkmax2_fixT
time gimble query -z Geum_cf_Gstore.z -l optimize/windows_kmax2.windowsum/IM_BA_wkmax2_fixT
