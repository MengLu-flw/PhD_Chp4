#!/bin/bash
#SBATCH --job-name="11_Geumcf_queryGrid"
#SBATCH --output="/home/mlu/scratch/2_gimble/2024_May/Geum_cf_sym/Slurm/11_Geumcf_queryGrid.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/2024_May/Geum_cf_sym/Slurm/11_Geumcf_queryGrid.err"
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
time gimble query -z Geum_cf_Gstore.z -l gridsearch/windows_kmax2/IM_BA_grid_240527



##-3- Use awk to separate each chromosome

# awk -v n=1 '
#     FNR == 1 {empty_holder=$0; next}
#     FNR == 2 {header = $0; next}
#     a != $1 {a = $1; name="Chr_"n"_"a""; n++;
#     print header > name}
#     {print $0 > name}
# ' Geum_cf_Gstore.gridsearch_windows_kmax2_IM_BA_grid_240527_0.best.bed

# mkdir queryGrid
# mv Geum_cf_Gstore.gridsearch_windows_kmax2_IM_BA_grid_240527_0.best.bed queryGrid/
# mv Chr_* queryGrid/
