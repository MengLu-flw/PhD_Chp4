#!/bin/bash
#SBATCH --job-name="11_Lina_DIVfitDIV"
#SBATCH --output="/home/mlu/scratch/2_gimble/2024_May/Lina/Slurm/11_Lina_DIVfitDIV.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/2024_May/Lina/Slurm/11_Lina_DIVfitDIV.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=long
#SBATCH --mem=40G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

##-1- Move to the correct working directory
cd /home/mlu/scratch/2_gimble/2024_May/Lina


##-2- Run gimble
# Use the data simulated under the DIV scenario to fit DIV model

gimble optimize -z Lina_Gstore.z \
                -g CRS2 -e 88 -i 10000 \
                -r A -u 7e-09 \
                -A 100_000,1_000_000 -B 100_000,1_000_000 \
                -C 200_000,3_000_000 -T 500_000,2_000_000 \
                -m DIV \
                -d simulate/DIV_240821 -w \
                -l DIV_fit_DIV_240825



############----------------------------------------------------------################
#!/bin/bash
#SBATCH --job-name="11_Lina_DIVfitIMab_himem"
#SBATCH --output="/home/mlu/scratch/2_gimble/2024_May/Lina/Slurm/11_Lina_DIVfitIMab_himem.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/2024_May/Lina/Slurm/11_Lina_DIVfitIMab_himem.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=himem
#SBATCH --mem=200G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

##-1- Move to the correct working directory
cd /home/mlu/scratch/2_gimble/2024_May/Lina


##-2- Run gimble
# Use the data simulated under the DIV scenario to fit IM_AB model
# Slurm recorded MEM around 80G
gimble optimize -z Lina_Gstore.z \
                -g CRS2 -e 53 -i 10000 \
                -r A -u 7e-09 \
                -A 100_000,1_000_000 -B 100_000,1_000_000 \
                -C 200_000,3_000_000 -T 934_000,2_000_000 \
                -M 0,5e-10 -m IM_AB \
                -d simulate/DIV_240821 -w \
                -l DIV_fit_IMab_240825 \
                -f


############------------------------Inspect outputs------------------------###############
#!/bin/bash
#SBATCH --job-name="12_Lina_SIMquery"
#SBATCH --output="/home/mlu/scratch/2_gimble/2024_May/Lina/Slurm/12_Lina_SIMquery.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/2024_May/Lina/Slurm/12_Lina_SIMquery.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=medium
#SBATCH --mem=2G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

##-1- Move to the correct working directory
cd /home/mlu/scratch/2_gimble/2024_May/Lina



##-2- To inspect the result based on simulated data
time gimble query -z Lina_Gstore.z -l optimize/DIV_240821.windowsum/DIV_fit_DIV_240825


time gimble query -z Lina_Gstore.z -l optimize/DIV_240821.windowsum/DIV_fit_IMab_240825


