#!/bin/bash
#SBATCH --job-name="9_Prim_Grid_me"
#SBATCH --output="/home/mlu/scratch/2_gimble/2024_May/Prim/Slurm/9_Prim_Grid_me.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/2024_May/Prim/Slurm/9_Prim_Grid_me.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=medium
#SBATCH --mem=16G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

##-1- Move to the correct working directory
cd /home/mlu/scratch/2_gimble/2024_May/Prim


##-2- Run gimble makegrid
# Population ID of reference population used for scaling:
# A or B or A_B (for models DIV, IM_AB, IM_BA)
# A or B (for models MIG_AB, MIG_BA)


##-2.1- model DIV

##-2.2- model IM_AB
# To specify the grid search prior range for T, C, A, B under your best selected model
# Fix 'T' as your global estimated value
# Prior_min_Ne = global_estimate/5
# Prior_max_Ne = global_estimate*4

# For Me,
# Prior_min = 0
# Prior_max = global_estimate*4

time gimble makegrid -z Prim_Gstore.z \
                -m IM_AB -l IM_AB_grid_240528 \
                -e 42 -p 50 \
                -b 64 -k 2,2,2,2 \
                -r A -u 7e-09 \
                -T 271_744 \
                -C 95_000,2_500_000,12,lin \
                -A 9_700,260_000,12,lin \
                -B 10_000,290_000,12,lin \
                -M 0,3e-10,16,lin
#               -f

##-2.3- model IM_BA
##-2.4- model MIG_AB
##-2.5- model MIG_BA



##-3- Run gimble gridsearch
## model IM_AB
time gimble gridsearch -z Prim_Gstore.z -p 50 \
					   -g makegrid/IM_AB_grid_240528 \
					   -d tally/windows_kmax2

##-4- Query gimble grids
time gimble query -z Prim_Gstore.z -l gridsearch/windows_kmax2/IM_AB_grid_240528


##-5- Use awk to separate each chromosome

# mkdir queryGrid
# mv Prim_Gstore.gridsearch_windows_kmax2_IM_AB_grid_240528_0.best.bed queryGrid/

# sed -i 's/lcl|//' Prim_Gstore.gridsearch_windows_kmax2_IM_AB_grid_240528_0.best.bed
# -i flag: modify the file in place (i.e., overwrite the original file)

# awk -v n=1 '
#     FNR == 1 {empty_holder=$0; next}
#     FNR == 2 {header = $0; next}
#     a != $1 {a = $1; name="Chr_"n"_"a""; n++;
#     print header > name}
#     {print $0 > name}
# ' Prim_Gstore.gridsearch_windows_kmax2_IM_AB_grid_240528_0.best.bed


