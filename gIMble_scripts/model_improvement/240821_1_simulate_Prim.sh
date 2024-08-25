#!/bin/bash
#SBATCH --job-name="10_PrimDToL_DIVsimulate"
#SBATCH --output="/home/mlu/scratch/2_gimble/2024_May/Prim_DToL/Slurm/10_PrimDToL_DIVsimulate.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/2024_May/Prim_DToL/Slurm/10_PrimDToL_DIVsimulate.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=long
#SBATCH --mem=20G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

##-1- Move to the correct working directory
cd /home/mlu/scratch/2_gimble/2024_May/Prim_DToL


##-2- Run gimble
#	the real data --- gimble info
#	[+] windows/
#	[+] └── '-w 506250 -s 101250' ........... 8,152 windows of inter-population (X) blocks
#	-w here is the number of the block per window
#	-s is the step size 20%

time gimble simulate -z PrimDToL_Gstore.z \
    -e 79 -p 10 \
    -k 2,2,2,2 -u 7e-09 --rec_rate 1.85 \
    -m DIV -s DIV_240821 -r 100 \
    --windows 8152 --blocks 100 --block_length 64 \
    -a 18 -b 18 \
    -A 61322 -B 45497 -C 498157 -T 278233
#    -f


