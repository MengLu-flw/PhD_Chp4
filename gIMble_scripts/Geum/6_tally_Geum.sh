#!/bin/bash
#SBATCH --job-name="6_Geum_tally64"
#SBATCH --output="/home/mlu/scratch/2_gimble/2024_May/Geum/Slurm/6_Geum_tally64.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/2024_May/Geum/Slurm/6_Geum_tally64.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=himem
#SBATCH --mem=1100G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

##-1- Move to the correct working directory
cd /home/mlu/scratch/2_gimble/2024_May/Geum


##-2- Run gimble

time gimble tally -z Geum_Gstore.z -k 2,2,2,2 -l blocks_kmax2 -t blocks

time gimble tally -z Geum_Gstore.z -k 2,2,2,2 -l windows_kmax2 -t windows


####----------------------------------------------------------------------------------####
####----------------------------------------------------------------------------------####
#!/bin/bash
#SBATCH --job-name="Geum_Gtally128"
#SBATCH --output="/home/mlu/scratch/2_gimble/2024_Jan/Geum/Slurm/Geum_Gtally128.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/2024_Jan/Geum/Slurm/Geum_Gtally128.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=himem
#SBATCH --mem=1000G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

##-1- Move to the correct working directory
cd /home/mlu/scratch/2_gimble/2024_Jan/Geum


##-2- Run gimble

time gimble tally -z Geum_Gstore_128b.z -k 2,2,2,2 -l blocks_kmax2 -t blocks

time gimble tally -z Geum_Gstore_128b.z -k 2,2,2,2 -l windows_kmax2 -t windows

