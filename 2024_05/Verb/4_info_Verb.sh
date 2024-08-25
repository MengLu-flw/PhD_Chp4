#########------Verb_Ginfo.sh------#########

#!/bin/bash
#SBATCH --job-name="4_Verb_info"
#SBATCH --output="/home/mlu/scratch/2_gimble/2024_May/Verb/Slurm/4_Verb_info.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/2024_May/Verb/Slurm/4_Verb_info.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=medium
#SBATCH --mem=35G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

##-1- Move to the correct working directory
cd /home/mlu/scratch/2_gimble/2024_May/Verb

##-2- Run gimble

time gimble info -z Verb_Gstore.z




#########------Verb_Ginfo128.sh------#########

#!/bin/bash
#SBATCH --job-name="Verb_Ginfo128"
#SBATCH --output="/home/mlu/scratch/2_gimble/Verbascum/Verb_Ginfo128.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/Verbascum/Verb_Ginfo128.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=long
#SBATCH --mem=64G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

##-1- Move to the correct working directory
cd /home/mlu/scratch/2_gimble/Verbascum

##-2- Run gimble
# example: gimble info -z analysis.z

time gimble info -z Verb_Gstore_b128.z 