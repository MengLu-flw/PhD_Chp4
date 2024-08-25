#!/bin/bash
#SBATCH --job-name="4_Geum_info"
#SBATCH --output="/home/mlu/scratch/2_gimble/2024_May/Geum/Slurm/4_Geum_info.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/2024_May/Geum/Slurm/4_Geum_info.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=himem
#SBATCH --mem=180G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

##-1- Move to the correct working directory
cd /home/mlu/scratch/2_gimble/2024_May/Geum

##-2- Run gimble
time gimble info -z Geum_Gstore.z



####----------------------------------------------------------------------------------####
####----------------------------------------------------------------------------------####
#!/bin/bash
#SBATCH --job-name="Geum_Ginfo128"
#SBATCH --output="/home/mlu/scratch/2_gimble/2024_Jan/Geum/Slurm/Geum_Ginfo128.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/2024_Jan/Geum/Slurm/Geum_Ginfo128.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=himem
#SBATCH --mem=320G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

##-1- Move to the correct working directory
cd /home/mlu/scratch/2_gimble/2024_Jan/Geum

##-2- Run gimble
time gimble info -z Geum_Gstore_128b.z




