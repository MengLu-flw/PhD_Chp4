#!/bin/bash
#SBATCH --job-name="11_Geum_DIVfitDIV"
#SBATCH --output="/home/mlu/scratch/2_gimble/2024_May/Geum/Slurm/11_Geum_DIVfitDIV.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/2024_May/Geum/Slurm/11_Geum_DIVfitDIV.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=long
#SBATCH --mem=40G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

##-1- Move to the correct working directory
cd /home/mlu/scratch/2_gimble/2024_May/Geum


##-2- Run gimble
# Use the data simulated under the DIV scenario to fit DIV model

gimble optimize -z Geum_Gstore.z \
                -g CRS2 -e 29 -i 10000 \
                -r A -u 7e-09 \
                -A 10_000,1_000_000 -B 1_000,200_000 \
                -C 100_000,5_000_000 -T 1_000,10_000_000 \
                -m DIV \
                -d simulate/DIV_240822 -w \
                -l DIV_fit_DIV_240826


############----------------------------------------------------------################

#!/bin/bash
#SBATCH --job-name="11_Geum_DIVfitIMba_himem"
#SBATCH --output="/home/mlu/scratch/2_gimble/2024_May/Geum/Slurm/11_Geum_DIVfitIMba_himem.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/2024_May/Geum/Slurm/11_Geum_DIVfitIMba_himem.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=himem
#SBATCH --mem=250G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

##-1- Move to the correct working directory
cd /home/mlu/scratch/2_gimble/2024_May/Geum


##-2- Run gimble
# Use the data simulated under the DIV scenario to fit IM_AB model

gimble optimize -z Geum_Gstore.z \
                -g CRS2 -e 44 -i 1000 \
                -r A -u 7e-09 \
                -A 10_000,1_000_000 -B 1_000,200_000 \
                -C 100_000,5_000_000 -T 100_000,2_000_000 \
                -M 0,5e-05 -m IM_BA \
                -d simulate/DIV_240822 -w \
                -l DIV_fit_IMba_240826 \
                -f



############------------------------Inspect outputs------------------------###############
#!/bin/bash
#SBATCH --job-name="12_Geum_SIMquery"
#SBATCH --output="/home/mlu/scratch/2_gimble/2024_May/Lina/Slurm/12_Geum_SIMquery.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/2024_May/Lina/Slurm/12_Geum_SIMquery.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=medium
#SBATCH --mem=2G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

##-1- Move to the correct working directory
cd /home/mlu/scratch/2_gimble/2024_May/Geum



##-2- To inspect the result based on simulated data
time gimble query -z Geum_Gstore.z -l optimize/"??DIV_294w.windowsum??"/DIV_fit_DIV_240826


time gimble query -z Geum_Gstore.z -l optimize/"??DIV_294w.windowsum??"/DIV_fit_IMba_240826


