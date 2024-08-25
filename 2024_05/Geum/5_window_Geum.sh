#!/bin/bash
#SBATCH --job-name="5_Geum_window64"
#SBATCH --output="/home/mlu/scratch/2_gimble/2024_May/Geum/Slurm/5_Geum_window64.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/2024_May/Geum/Slurm/5_Geum_window64.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=himem
#SBATCH --mem=1500G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

##-1- Move to the correct working directory
cd /home/mlu/scratch/2_gimble/2024_May/Geum

##-2- Run gimble
# example: gimble windows -z analysis.z -w 30000 -s 6000

time gimble windows -z Geum_Gstore.z -w 610935 -s 122187
# if you are rerunning this, use '--force' to force overwrite of existing data

# If the window span is 100 Kb, step size is 20% overlap
# 100,000 = (64 * w)/391
# w = 610,937.5
# s = 122,187.5
# Quotient of '--blocks' and '--steps' must be an integer.

# If the window span is 50 Kb
# w = 305,468.75
# s = 16,093.75


####----------------------------------------------------------------------------------####
####----------------------------------------------------------------------------------####
#!/bin/bash
#SBATCH --job-name="Geum_Gwindow128"
#SBATCH --output="/home/mlu/scratch/2_gimble/2024_Jan/Geum/Slurm/Geum_Gwindow128.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/2024_Jan/Geum/Slurm/Geum_Gwindow128.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=himem
#SBATCH --mem=800G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

##-1- Move to the correct working directory
cd /home/mlu/scratch/2_gimble/2024_Jan/Geum

##-2- Run gimble
time gimble windows -z Geum_Gstore_128b.z -w 305470 -s 61094
# if you are rerunning this, use '--force' to force overwrite of existing data


# If the window span is 200 Kb, step size is 20% overlap
# 100,000 = (128 * w)/391
# w = 610,937.5
# s = 122,187.5
# Quotient of '--blocks' and '--steps' must be an integer.

# If the window span is 100 Kb
# w = 305,468.75
# s = 61,093.75












