#########------Prim_Ginfo64.sh------#########

#!/bin/bash
#SBATCH --job-name="4_Prim_ex_info"
#SBATCH --output="/home/mlu/scratch/2_gimble/2024_May/Prim/Slurm/4_Prim_ex_info.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/2024_May/Prim/Slurm/4_Prim_ex_info.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=short
#SBATCH --mem=50G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

##-1- Move to the correct working directory
cd /home/mlu/scratch/2_gimble/2024_May/Prim

##-2- Run gimble
time gimble info -z Prim_POP.z



#########------Prim_Ginfo128.sh------#########

#!/bin/bash
#SBATCH --job-name="Prim_Ginfo128"
#SBATCH --output="/home/mlu/scratch/2_gimble/Primula/Prim_Ginfo128.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/Primula/Prim_Ginfo128.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=himem
#SBATCH --mem=128G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

##-1- Move to the correct working directory
cd /home/mlu/scratch/2_gimble/Primula

##-2- Run gimble
# example: gimble info -z analysis.z

time gimble info -z Prim_POP_b128.z 



