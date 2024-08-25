#!/bin/bash
#SBATCH --job-name="7_Lina_optimize64"
#SBATCH --output="/home/mlu/scratch/2_gimble/2024_May/Lina/Slurm/7_Lina_optimize64.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/2024_May/Lina/Slurm/7_Lina_optimize64.err"
#SBATCH --cpus-per-task=1
#SBATCH --partition=medium
#SBATCH --mem=2G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310


##-1- Move to the correct working directory
cd /home/mlu/scratch/2_gimble/2024_May/Lina


##-2-define variables
#A=Lina_repens
#B=Lina_vulgaris


##-3- Run gimble
# Population ID of reference population used for scaling:
# A or B or A_B (for models DIV, IM_AB, IM_BA)
# A or B (for models MIG_AB, MIG_BA)


##-3.1-  model DIV
# Example:
# gimble optimize -z heliconius.v1.z -d tally/windows -w \
# 				  -r A -u 2.9e-9 -g CRS2 -p 1 -s midpoint -i 10000 \
# 				  -A =100_000,3_000_000 -B =100_000,3_000_000 \
# 				  -C =100_000,3_000_000 -T=0,5_000_000 -m DIV -l DIV

gimble optimize -z Lina_Gstore.z -d tally/windows_kmax2 -w \
                -g CRS2 -e 88 -i 10000 \
                -r A -u 7e-09 \
                -A 100_000,1_000_000 -B 100_000,1_000_000 \
                -C 200_000,3_000_000 -T 500_000,2_000_000 \
                -m DIV \
                -l DIV_wkmax2 -f
                #-f # if you want to rerun, use -f



##-3.2-  model IM_AB
# Example:
# gimble optimize -z heliconius .v1.z -d tally / windows -w \
#                 -g CRS2 -p 1 -s midpoint -i 10000 \
#                 -r A -u 2.9e-9 \
#                 -A =100_000 ,3_000_000 -B =100_000,3_000_000 \
#                 -C =100_000 ,3_000_000 -T=0,5_000_000 \
#                 -M =0,2.21e-6 -m IM_AB -l IM_AB

gimble optimize -z Lina_Gstore.z -d tally/windows_kmax2 -w \
                -g CRS2 -e 53 -i 10000 \
                -r A -u 7e-09 \
                -A 100_000,1_000_000 -B 100_000,1_000_000 \
                -C 200_000,3_000_000 -T 934_000,2_000_000 \
                -M 0,5e-10 -m IM_AB \
                -l IM_AB_wkmax2 -f
                #-f



##-3.3-  model IM_BA
# Example:
# gimble optimize -z analysis.z  -d tally/windows_kmax2 -w \
#                 -g CRS2 -e 19 -i 10_000 \
#                 -r A -u 2.9e-09 \
#                 -A 10_000,2_500_000 -B 10_000,1_000_000 \
#                 -C 1_000_000,5_000_000  -T 0,5_000_000 \
#                 -M 0,1e-5 -m IM_BA -l IM_BA_optimize

gimble optimize -z Lina_Gstore.z -d tally/windows_kmax2 -w \
                -g CRS2 -e 21 -i 10000 \
                -r A -u 7e-09 \
                -A 100_000,1_000_000 -B 100_000,1_000_000 \
                -C 200_000,3_000_000 -T 934_000,2_000_000 \
                -M 0,5e-10 -m IM_BA \
                -l IM_BA_wkmax2 -f
                #-f



##-3.4-  model MIG_AB
# Example:
# gimble optimize -z heliconius .v1.z -d tally / windows -w \
#                 -g CRS2 -p 1 -s midpoint -i 10000 \
#                 -r A -u 2.9e-9 \
#                 -A =100_000,3_000_000 -B =100_000,3_000_000 \
#                 -M=1e-10,2.21e-06 -m MIG_AB -l MIG_AB

gimble optimize -z Lina_Gstore.z -d tally/windows_kmax2 -w \
                -g CRS2 -e 33 -i 10000 \
                -r A -u 7e-09 \
                -A 100_000,1_000_000 -B 100_000,1_000_000 \
                -M 1e-10,5e-05 -m MIG_AB \
                -l MIG_AB_wkmax2 -f
                #-f


##-3.5- model MIG_BA
# Example:
# gimble optimize -z heliconius .v1.z -d tally / windows -w \
#                 -g CRS2 -p 1 -s midpoint -i 10000 \
#                 -r A -u 2.9e -9  \
#                 -A =100_000,3_000_000 -B =100_000,3_000_000 \
#                 -M=1e-10 ,2.21e-06 -m MIG_BA -l MIG_BA

gimble optimize -z Lina_Gstore.z -d tally/windows_kmax2 -w \
                -g CRS2 -e 31 -i 10000 \
                -r A -u 7e-09 \
                -A 100_000,1_000_000 -B 100_000,1_000_000 \
                -M 1e-10,5e-05 -m MIG_BA \
                -l MIG_BA_wkmax2 -f
                #-f


##-4- Inspect results
# use gimble query


