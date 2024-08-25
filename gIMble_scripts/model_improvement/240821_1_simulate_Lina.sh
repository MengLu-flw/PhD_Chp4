#!/bin/bash
#SBATCH --job-name="10_Lina_DIVsimulate"
#SBATCH --output="/home/mlu/scratch/2_gimble/2024_May/Lina/Slurm/10_Lina_DIVsimulate.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/2024_May/Lina/Slurm/10_Lina_DIVsimulate.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=long
#SBATCH --mem=10G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

##-1- Move to the correct working directory
cd /home/mlu/scratch/2_gimble/2024_May/Lina


##-2- Run gimble
#	the real data --- gimble info
#	windows/
#	[+] └── '-w 76560 -s 15312' ............. 4,723 windows of inter-population (X) blocks
#	-w here is the number of the block per window
#	-s is the step size 20%

time gimble simulate -z Lina_Gstore.z \
    -e 79 -p 10 \
    -k 2,2,2,2 -u 7e-09 --rec_rate 1.85 \
    -m DIV -s DIV_240821 -r 100 \
    --windows 4723 --blocks 100 --block_length 64 \
    -a 7 -b 7 \
    -A 353341 -B 262406 -C 863703 -T 933997
#    -f


