#########------4_Lina_info64.sh------#########

#!/bin/bash
#SBATCH --job-name="4_Lina_info"
#SBATCH --output="/home/mlu/scratch/2_gimble/2024_May/Lina/Slurm/4_Lina_info.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/2024_May/Lina/Slurm/4_Lina_info.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=medium
#SBATCH --mem=10G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

##-1- Move to the correct working directory
cd /home/mlu/scratch/2_gimble/2024_May/Lina

##-2- Run gimble
# example: gimble windows -z analysis.z -w 30000 -s 6000

time gimble info -z Lina_Gstore.z




#########------Lina_Ginfo128.sh------#########

#!/bin/bash
#SBATCH --job-name="Lina_Ginfo128"
#SBATCH --output="/home/mlu/scratch/2_gimble/Linaria/Lina_Ginfo128.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/Linaria/Lina_Ginfo128.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=long
#SBATCH --mem=64G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

##-1- Move to the correct working directory
cd /home/mlu/scratch/2_gimble/Linaria

##-2- Run gimble
# example: gimble info -z analysis.z

time gimble info -z Lina_Gstore_b128.z 



