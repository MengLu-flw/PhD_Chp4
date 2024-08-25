#!/bin/bash
#SBATCH --job-name="12_Geum_deltaB_grid"
#SBATCH --output="/home/mlu/scratch/2_gimble/2024_May/Geum/Slurm/12_Geum_deltaB_grid.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/2024_May/Geum/Slurm/12_Geum_deltaB_grid.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=medium
#SBATCH --mem=14G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

##-1- Move to the correct working directory
cd /home/mlu/scratch/2_gimble/2024_May/Geum



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

time gimble makegrid -z Geum_Gstore.z \
                -m IM_BA -l IM_BA_deltaB_240528 \
                -e 42 -p 50 \
                -b 64 -k 2,2,2,2 \
                -r A -u 7e-09 \
                -T 890_866 \
                -C 75_000,1_600_000,12,lin \
                -A 39_000,800_000,12,lin \
                -B 500,8_000,12,lin \
                -M 1.70246105060872E-06
#               -f
# constraint the me and run the same best model again

##-2.3- model IM_BA
##-2.4- model MIG_AB
##-2.5- model MIG_BA


##-3- Run gimble gridsearch
## model IM_AB
time gimble gridsearch -z Geum_Gstore.z -p 50 \
					   -g makegrid/IM_BA_deltaB_240528 \
					   -d tally/windows_kmax2

##-4- Query gimble grids
time gimble query -z Geum_Gstore.z -l gridsearch/windows_kmax2/IM_BA_deltaB_240528


##-5- Use awk to separate each chromosome

mv Geum_Gstore.gridsearch_windows_kmax2_IM_BA_deltaB_240528_0.best.bed queryGrid/Geum_Gstore.gridsearch_windows_kmax2_IM_BA_deltaB_240528.best.bed

awk -v n=1 '
    FNR == 1 {empty_holder=$0; next}
    FNR == 2 {header = $0; next}
    a != $1 {a = $1; name="Chr_"n"_"a"_deltaB"; n++;
    print header > name}
    {print $0 > name}
' Geum_Gstore.gridsearch_windows_kmax2_IM_BA_deltaB_240528.best.bed

#-6- Extract the 10th column where lnCL is deposit
cp Geum_Gstore.gridsearch_windows_kmax2_IM_BA_grid_240527_0.best.bed IM_BA_grid_240527.best.bed
cp Geum_Gstore.gridsearch_windows_kmax2_IM_BA_deltaB_240528.best.bed IM_BA_deltaB_240528.best.bed

data1=IM_BA_grid_240527.best.bed
data2=IM_BA_deltaB_240528.best.bed

paste <(cut -f 1-4,10 $data1) <(cut -f 10 $data2) > lnCL_all_deltaB.bed

# Use 'nano lnCL_all_deltaB.bed' to change the first line
rm IM_BA_grid_240527.best.bed
rm IM_BA_deltaB_240528.best.bed

#-7- Separate lnCL file as per chromosome

awk -v n=1 '
    FNR == 1 {header = $0; next}
    a != $1 {a = $1; name="Chr_"n"_"a"_lnCL"; n++;
    print header > name}
    {print $0 > name}
' lnCL_all_deltaB.bed


