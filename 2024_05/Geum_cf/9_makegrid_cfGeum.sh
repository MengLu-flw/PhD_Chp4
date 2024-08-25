#!/bin/bash
#SBATCH --job-name="9_Geumcf_makeGrid"
#SBATCH --output="/home/mlu/scratch/2_gimble/2024_May/Geum_cf_sym/Slurm/9_Geumcf_makeGrid.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/2024_May/Geum_cf_sym/Slurm/9_Geumcf_makeGrid.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=medium
#SBATCH --mem=16G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

##-1- Move to the correct working directory
cd /home/mlu/scratch/2_gimble/2024_May/Geum_cf_sym



##-2- Run gimble
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

time gimble makegrid -z Geum_cf_Gstore.z \
                -m IM_BA -l IM_BA_grid_240527 \
                -e 42 -p 50 \
                -b 64 -k 2,2,2,2 \
                -r A -u 7e-09 \
                -T 877_404 \
                -C 74_000,1_500_000,12,lin \
                -A 40_000,900_000,12,lin \
                -B 700,15_000,12,lin \
                -M 0,7e-06,16,lin
#               -f


##-2.4- model MIG_AB

##-2.5- model MIG_BA








