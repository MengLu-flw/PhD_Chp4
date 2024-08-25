#!/bin/bash
#SBATCH --job-name="10_Geum_DIVsimulate"
#SBATCH --output="/home/mlu/scratch/2_gimble/2024_May/Geum/Slurm/10_Geum_DIVsimulate.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/2024_May/Geum/Slurm/10_Geum_DIVsimulate.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=long
#SBATCH --mem=40G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

##-1- Move to the correct working directory
cd /home/mlu/scratch/2_gimble/2024_May/Geum


##-2- Run gimble
#	the real data --- gimble info
#	windows/
#	[+] └── '-w 76560 -s 15312' ............. 4,723 windows of inter-population (X) blocks
#	-w here is the number of the block per window
#	-s is the step size 20%

time gimble simulate -z Geum_Gstore.z \
    -e 79 -p 10 \
    -k 2,2,2,2 -u 7e-09 --rec_rate 1.85 \
    -m DIV -s DIV_240822 -r 100 \
    --windows 14250 --blocks 100 --block_length 64 \
    -a 17 -b 23 \
    -A 115316 -B 11960 -C 400368 -T 208785
#    -f


