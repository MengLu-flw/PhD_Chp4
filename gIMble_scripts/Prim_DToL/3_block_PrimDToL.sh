#########------PrimDToL_ex_Gblock.sh------#########

#!/bin/bash
#SBATCH --job-name="3_PrimDToL_ex_block"
#SBATCH --output="/home/mlu/scratch/2_gimble/2024_May/Prim_DToL/Slurm/3_PrimDToL_ex_block.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/2024_May/Prim_DToL/Slurm/3_PrimDToL_ex_block.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=medium
#SBATCH --mem=80G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

##-1- Move to the correct working directory
cd /home/mlu/scratch/2_gimble/2024_May/Prim_DToL


##-2- Run gimble
# example: gimble blocks -z analysis.z -l 64

time gimble blocks -z PrimDToL_POP.z -l 64 # if you are rerunning this, use '--force' to force overwrite of existing data



#########------PrimDToL_Gblock128.sh------#########

#!/bin/bash
#SBATCH --job-name="Prim_Gblock128"
#SBATCH --output="/home/mlu/scratch/2_gimble/Primula/Prim_Gblock128.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/Primula/Prim_Gblock128.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=himem
#SBATCH --mem=256G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

##-1- Move to the correct working directory
cd /home/mlu/scratch/2_gimble/Primula

##-2- Run gimble
# example: gimble blocks -z analysis.z -l 64
# NOTE: if you want to test with a different block size 

time gimble blocks -z Prim_POP_b128.z -l 128 # if you are rerunning this, use '--force' to force overwrite of existing data


