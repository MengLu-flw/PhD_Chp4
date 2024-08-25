#!/bin/bash
#SBATCH --job-name="3_Geum_block64"
#SBATCH --output="/home/mlu/scratch/2_gimble/2024_May/Geum/Slurm/3_Geum_block64.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/2024_May/Geum/Slurm/3_Geum_block64.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=himem
#SBATCH --mem=200G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

##-1- Move to the correct working directory
cd /home/mlu/scratch/2_gimble/2024_May/Geum

##-2- Run gimble
# example: gimble blocks -z analysis.z -l 64

time gimble blocks -z Geum_Gstore.z -l 64
# if you are rerunning this, use '--force' to force overwrite of existing data


####----------------------------------------------------------------------------------####
####----------------------------------------------------------------------------------####
#!/bin/bash
#SBATCH --job-name="Geum_Gblock128"
#SBATCH --output="/home/mlu/scratch/2_gimble/2024_Jan/Geum/Slurm/Geum_Gblock128.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/2024_Jan/Geum/Slurm/Geum_Gblock128.err"
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
time gimble parse -v gimble.vcf.gz -b GeuUrba_masked_gimble.bed -g gimble.nucl.genomefile -s gimble.popID.samples.csv -z Geum_Gstore_128b
#-f

time gimble blocks -z Geum_Gstore_128b.z -l 128
# if you are rerunning this, use '--force' to force overwrite of existing data


