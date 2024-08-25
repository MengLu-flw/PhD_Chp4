#!/bin/bash
#SBATCH --job-name="6_Geum_cf_tally64"
#SBATCH --output="/home/mlu/scratch/2_gimble/2024_May/Geum_cf_sym/Slurm/6_Geum_cf_tally64.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/2024_May/Geum_cf_sym/Slurm/6_Geum_cf_tally64.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=himem
#SBATCH --mem=500G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310


##-1- Move to the correct working directory
cd /home/mlu/scratch/2_gimble/2024_May/Geum_cf_sym

##-2- Run gimble

time gimble tally -z Geum_cf_Gstore.z -k 2,2,2,2 -l blocks_kmax2 -t blocks

time gimble tally -z Geum_cf_Gstore.z -k 2,2,2,2 -l windows_kmax2 -t windows