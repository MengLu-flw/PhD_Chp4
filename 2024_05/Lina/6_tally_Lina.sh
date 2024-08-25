#########------6_Lina_tally64.sh------#########

#!/bin/bash
#SBATCH --job-name="6_Lina_tally64"
#SBATCH --output="/home/mlu/scratch/2_gimble/2024_May/Lina/Slurm/6_Lina_tally64.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/2024_May/Lina/Slurm/6_Lina_tally64.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=medium
#SBATCH --mem=50G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310


##-1- Move to the correct working directory
cd /home/mlu/scratch/2_gimble/2024_May/Lina


##-2- Run gimble

time gimble tally -z Lina_Gstore.z -k 2,2,2,2 -l blocks_kmax2 -t blocks

time gimble tally -z Lina_Gstore.z -k 2,2,2,2 -l windows_kmax2 -t windows
