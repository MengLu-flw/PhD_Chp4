#----------------------------------------------------------------------------------------#
#------------- Step II. fix T_split to be the same as the allopatric ones ---------------#

# ** Reason to do so: biologically, two specie pair should just have one T_split (or one
# ** period of T_split). We know that the estimation of T_split and me are interlinked/
# ** confounded - that's why you see the me in sympatry is less than the me in allopatry,
# ** because the model contribute that part of the information into the  T_split (and this
# ** also explains why the T_split in the sympatry is more recent).

# ** There are two ways to distinguish/minimise the confounding effect between me and T:
# ** (1) Fix your sympatry T to be the same value as the allopatry one. Having seen the
# ** results from your Step I "gimble optimize", you know that the estimated values of T
# ** are not a HUGE difference between allo- vs. sym- datasets. Therefore, you can totally
# ** do this.
# ** (2) Compute the parameter range for each model estimation and to show the overlaps
# ** between allo-T and sym-T.

# ** Here for the simplicity and making more biological sense, you are using the (1).
#----------------------------------------------------------------------------------------#

#!/bin/bash
#SBATCH --job-name="7_Geumcf_optimize_fixT"
#SBATCH --output="/home/mlu/scratch/2_gimble/2024_May/Geum_cf_sym/Slurm/7_Geumcf_optimize_fixT.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/2024_May/Geum_cf_sym/Slurm/7_Geumcf_optimize_fixT.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=medium
#SBATCH --mem=2G
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

##-2.1-  model DIV

##-2.2-  model IM_AB
gimble optimize -z Geum_cf_Gstore.z -d tally/windows_kmax2 -w \
                -g CRS2 -e 22 -i 10000 \
                -r A -u 7e-09 \
                -A 10_000,1_000_000 -B 1_000,200_000 \
                -C 100_000,5_000_000 -T 890866.046088418 \
                -M 0,5e-05 -m IM_AB \
                -l IM_AB_wkmax2_fixT
#                -f


##-2.3-  model IM_BA
gimble optimize -z Geum_cf_Gstore.z -d tally/windows_kmax2 -w \
                -g CRS2 -e 54 -i 10000 \
                -r A -u 7e-09 \
                -A 10_000,1_000_000 -B 1_000,200_000 \
                -C 100_000,5_000_000 -T 890866.046088418 \
                -M 0,5e-05 -m IM_BA \
                -l IM_BA_wkmax2_fixT
#                -f



##-2.4-  model MIG_AB

##-2.5- model MIG_BA



##-4- Inspect results
time gimble query -z Geum_cf_Gstore.z -l optimize/windows_kmax2.windowsum/IM_AB_wkmax2_fixT
time gimble query -z Geum_cf_Gstore.z -l optimize/windows_kmax2.windowsum/IM_BA_wkmax2_fixT


#----------------------------------------------------------------------------------------#
#------------- Step I. give prior bounds & let all para estimated freely ----------------#
#----------------------------------------------------------------------------------------#

#!/bin/bash
#SBATCH --job-name="7_Geumcf_optimize64"
#SBATCH --output="/home/mlu/scratch/2_gimble/2024_May/Geum_cf_sym/Slurm/7_Geumcf_optimize64.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/2024_May/Geum_cf_sym/Slurm/7_Geumcf_optimize64.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=medium
#SBATCH --mem=2G
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


##-2.1-  model DIV
# Example:
# gimble optimize -z heliconius.v1.z -d tally/windows -w \
# 				  -r A -u 2.9e-9 -g CRS2 -p 1 -s midpoint -i 10000 \
# 				  -A =100_000,3_000_000 -B =100_000,3_000_000 \
# 				  -C =100_000,3_000_000 -T=0,5_000_000 -m DIV -l DIV

gimble optimize -z Geum_cf_Gstore.z -d tally/windows_kmax2 -w \
                -g CRS2 -e 39 -i 10000 \
                -r A -u 7e-09 \
                -A 10_000,1_000_000 -B 1_000,200_000 \
                -C 100_000,5_000_000 -T 1_000,10_000_000 \
                -m DIV \
                -l DIV_wkmax2
#                -f



##-2.2-  model IM_AB
# Example:
# gimble optimize -z heliconius .v1.z -d tally / windows -w \
#                 -g CRS2 -p 1 -s midpoint -i 10000 \
#                 -r A -u 2.9e-9 \
#                 -A =100_000 ,3_000_000 -B =100_000,3_000_000 \
#                 -C =100_000 ,3_000_000 -T=0,5_000_000 \
#                 -M =0,2.21e-6 -m IM_AB -l IM_AB

gimble optimize -z Geum_cf_Gstore.z -d tally/windows_kmax2 -w \
                -g CRS2 -e 22 -i 10000 \
                -r A -u 7e-09 \
                -A 10_000,1_000_000 -B 1_000,200_000 \
                -C 100_000,5_000_000 -T 100_000,2_000_000 \
                -M 0,5e-05 -m IM_AB \
                -l IM_AB_wkmax2
#                -f



##-2.3-  model IM_BA
# Example:
# gimble optimize -z analysis.z  -d tally/windows_kmax2 -w \
#                 -g CRS2 -e 19 -i 10_000 \
#                 -r A -u 2.9e-09 \
#                 -A 10_000,2_500_000 -B 10_000,1_000_000 \
#                 -C 1_000_000,5_000_000  -T 0,5_000_000 \
#                 -M 0,1e-5 -m IM_BA -l IM_BA_optimize

gimble optimize -z Geum_cf_Gstore.z -d tally/windows_kmax2 -w \
                -g CRS2 -e 54 -i 10000 \
                -r A -u 7e-09 \
                -A 10_000,1_000_000 -B 1_000,200_000 \
                -C 100_000,5_000_000 -T 100_000,2_000_000 \
                -M 0,5e-05 -m IM_BA \
                -l IM_BA_wkmax2
#                -f



##-2.4-  model MIG_AB
# Example:
# gimble optimize -z heliconius .v1.z -d tally / windows -w \
#                 -g CRS2 -p 1 -s midpoint -i 10000 \
#                 -r A -u 2.9e-9 \
#                 -A =100_000,3_000_000 -B =100_000,3_000_000 \
#                 -M=1e-10,2.21e-06 -m MIG_AB -l MIG_AB

gimble optimize -z Geum_cf_Gstore.z -d tally/windows_kmax2 -w \
                -g CRS2 -e 32 -i 10000 \
                -r A -u 7e-09 \
                -A 10_000,1_000_000 -B 1_000,200_000 \
                -M 1e-10,5e-05 -m MIG_AB \
                -l MIG_AB_wkmax2
#                -f


##-2.5- model MIG_BA
# Example:
# gimble optimize -z heliconius .v1.z -d tally / windows -w \
#                 -g CRS2 -p 1 -s midpoint -i 10000 \
#                 -r A -u 2.9e -9  \
#                 -A =100_000,3_000_000 -B =100_000,3_000_000 \
#                 -M=1e-10 ,2.21e-06 -m MIG_BA -l MIG_BA

gimble optimize -z Geum_cf_Gstore.z -d tally/windows_kmax2 -w \
                -g CRS2 -e 62 -i 10000 \
                -r A -u 7e-09 \
                -A 10_000,1_000_000 -B 1_000,200_000 \
                -M 1e-10,5e-05 -m MIG_BA \
                -l MIG_BA_wkmax2
#                -f



##-4- Inspect results
# gimble qurey