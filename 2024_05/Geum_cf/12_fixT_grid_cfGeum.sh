#!/bin/bash
#SBATCH --job-name="12_Geumcf_Grid_fixT"
#SBATCH --output="/home/mlu/scratch/2_gimble/2024_May/Geum_cf_sym/Slurm/12_Geumcf_Grid_fixT.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/2024_May/Geum_cf_sym/Slurm/12_Geumcf_Grid_fixT.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=medium
#SBATCH --mem=14G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

##-1- Move to the correct working directory
cd /home/mlu/scratch/2_gimble/2024_May/Geum_cf_sym



##-2- Run gimble

##--2.1-- Make Grid: model IM_BA
# To specify the grid search prior range for T, C, A, B under your best selected model
# Fix 'T' as the ALLOPATRIC BEST global estimated value
# Prior_min_Ne = global_estimate/5
# Prior_max_Ne = global_estimate*4

# For Me,
# Prior_min = 0
# Prior_max = global_estimate*4

time gimble makegrid -z Geum_cf_Gstore.z \
                -m IM_BA -l IM_BA_grid_240610 \
                -e 62 -p 50 \
                -b 64 -k 2,2,2,2 \
                -r A -u 7e-09 \
                -T 890_866 \
                -C 74_000,1_500_000,12,lin \
                -A 40_000,900_000,12,lin \
                -B 700,15_000,12,lin \
                -M 0,7e-06,16,lin
#               -f



##--2.2-- Grid Search
time gimble gridsearch -z Geum_cf_Gstore.z -p 50 \
					   -g makegrid/IM_BA_grid_240610 \
					   -d tally/windows_kmax2


##--2.3-- Query Grid
time gimble query -z Geum_cf_Gstore.z -l gridsearch/windows_kmax2/IM_BA_grid_240610


##-3- Use awk to separate each chromosome

# awk -v n=1 '
#     FNR == 1 {empty_holder=$0; next}
#     FNR == 2 {header = $0; next}
#     a != $1 {a = $1; name="Chr_"n"_"a""; n++;
#     print header > name}
#     {print $0 > name}
# ' Geum_cf_Gstore.gridsearch_windows_kmax2_IM_BA_grid_240610_0.best.bed

# mv Chr_10_OX327006.1 Chr_10_OX327006
# mv Chr_11_OX327007.1 Chr_11_OX327007
# mv Chr_12_OX327008.1 Chr_12_OX327008
# mv Chr_13_OX327009.1 Chr_13_OX327009
# mv Chr_14_OX327010.1 Chr_14_OX327010
# mv Chr_15_OX327011.1 Chr_15_OX327011
# mv Chr_16_OX327012.1 Chr_16_OX327012
# mv Chr_17_OX327013.1 Chr_17_OX327013
# mv Chr_18_OX327014.1 Chr_18_OX327014
# mv Chr_19_OX327015.1 Chr_19_OX327015
# mv Chr_1_OX326997.1 Chr_1_OX326997
# mv Chr_20_OX327016.1 Chr_20_OX327016
# mv Chr_21_OX327017.1 Chr_21_OX327017
# mv Chr_2_OX326998.1 Chr_2_OX326998
# mv Chr_3_OX326999.1 Chr_3_OX326999
# mv Chr_4_OX327000.1 Chr_4_OX327000
# mv Chr_5_OX327001.1 Chr_5_OX327001
# mv Chr_6_OX327002.1 Chr_6_OX327002
# mv Chr_7_OX327003.1 Chr_7_OX327003
# mv Chr_8_OX327004.1 Chr_8_OX327004
# mv Chr_9_OX327005.1 Chr_9_OX327005

# mv Geum_cf_Gstore.gridsearch_windows_kmax2_IM_BA_grid_240610_0.best.bed queryGrid/
# mv Chr_* queryGrid/
