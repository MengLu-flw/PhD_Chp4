#!/bin/bash
#SBATCH --job-name="9_Verb_Grid_me"
#SBATCH --output="/home/mlu/scratch/2_gimble/2024_May/Verb/Slurm/9_Verb_Grid_me.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/2024_May/Verb/Slurm/9_Verb_Grid_me.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=medium
#SBATCH --mem=16G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

##-1- Move to the correct working directory
cd /home/mlu/scratch/2_gimble/2024_May/Verb



##-2- Run gimble makegrid
# Population ID of reference population used for scaling:
# A or B or A_B (for models DIV, IM_AB, IM_BA)
# A or B (for models MIG_AB, MIG_BA)


##-2.1- model DIV
##-2.2- model IM_AB

##-2.3- model IM_BA
# To specify the grid search prior range for T, C, A, B under your best selected model
# Fix 'T' as your global estimated value
# Prior_min_Ne = global_estimate/5
# Prior_max_Ne = global_estimate*4

# For Me,
# Prior_min = 0
# Prior_max = global_estimate*4

time gimble makegrid -z Verb_Gstore.z \
                -m IM_BA -l IM_AB_grid_240815 \
                -e 42 -p 50 \
                -b 64 -k 2,2,2,2 \
                -r A -u 7e-09 \
                -T 113_081 \
                -C 180_000,3_700_000,12,lin \
                -A 7_700,160_000,12,lin \
                -B 200,5_000,12,lin \
                -M 0,2e-6,16,lin
#               -f

##-2.4- model MIG_AB
##-2.5- model MIG_BA



##-3- Run gimble gridsearch
## model IM_AB
time gimble gridsearch -z Verb_Gstore.z -p 50 \
					   -g makegrid/IM_AB_grid_240815 \
					   -d tally/windows_kmax2

##-4- Query gimble grids
#	time gimble query -z Verb_Gstore.z -l gridsearch/windows_kmax2/IM_AB_grid_240815


##-5- Use awk to separate each chromosome

# mkdir queryGrid
# mv Verb_Gstore.gridsearch_windows_kmax2_IM_AB_grid_240528_0.best.bed queryGrid/

# awk -v n=1 '
#     FNR == 1 {empty_holder=$0; next}
#     FNR == 2 {header = $0; next}
#     a != $1 {a = $1; name="Chr_"n"_"a""; n++;
#     print header > name}
#     {print $0 > name}
# ' Verb_Gstore.gridsearch_windows_kmax2_IM_AB_grid_240528_0.best.bed





