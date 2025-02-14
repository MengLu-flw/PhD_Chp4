#!/bin/bash
#SBATCH --job-name="Lina_DIVmodelCompare"
#SBATCH --output="/home/mlu/scratch/2_gimble/Linaria/Lina_DIVmodelCompare.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/Linaria/Lina_DIVmodelCompare.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=long
#SBATCH --mem=40G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

##-1- Move to the correct working directory
cd /home/mlu/scratch/2_gimble/Linaria


##-2- Run gimble
# Use the data simulated under the DIV scenario to fit DIV model
gimble optimize -z Lina_Gstore.z -d simulate/DIV_294w -w \
                -g CRS2 -e 38 -i 10000 \
                -r A -u 7e-09 \
                -A 20_000,1_500_000 -B 20_000,1_500_000 \
                -C 200_000,3_000_000 -T 100_000,5_000_000 \
                -m DIV -l DIV_DIVmodelCompare # if you want to rerun, use -f




############----------------------------------------------------------################

#!/bin/bash
#SBATCH --job-name="Lina_IMBA_DIVmodelCompare"
#SBATCH --output="/home/mlu/scratch/2_gimble/Linaria/Lina_IMBA_DIVmodelCompare.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/Linaria/Lina_IMBA_DIVmodelCompare.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=long
#SBATCH --mem=24G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

##-1- Move to the correct working directory
cd /home/mlu/scratch/2_gimble/Linaria


##-2- Run gimble
# Use the data simulated under the DIV scenario to fit IM_BA model
gimble optimize -z Lina_Gstore.z -d simulate/DIV_294w -w \ # here specify DIV simulated dataset
                -g CRS2 -e 52 -i 1000 \ #when specify -i 1000, run complete in 3hrs with about 18G mem; however, if -i 10000, 18 hrs only completes 18 runs with 47+G mem recorded
                -r A -u 7e-09 \
                -A 20_000,1_500_000 -B 20_000,1_500_000 \
                -C 200_000,3_000_000 -T 100_000,5_000_000 \
                -M 0,5e-05 -m IM_BA -l DIV_IMBAmodelCompare -f # here define IM_BA model


############------------------------Inspect outputs------------------------###############
#!/bin/bash
#SBATCH --job-name="Lina_SIMquery"
#SBATCH --output="/home/mlu/scratch/2_gimble/Linaria/Lina_SIMquery.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/Linaria/Lina_SIMquery.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=medium
#SBATCH --mem=2G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

##-1- Move to the correct working directory
cd /home/mlu/scratch/2_gimble/Linaria

##-2- To inspect the result based on simulated data
time gimble query -z Lina_Gstore.z -l optimize/DIV_294w.windowsum/DIV_DIVmodelCompare


time gimble query -z Lina_Gstore.z -l optimize/DIV_294w.windowsum/DIV_IMBAmodelCompare


############------------------------Don't use this------------------------################

#!/bin/bash
#SBATCH --job-name="Lina_IMBAmodelCompare"
#SBATCH --output="/home/mlu/scratch/2_gimble/Linaria/Lina_IMBAmodelCompare.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/Linaria/Lina_IMBAmodelCompare.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=long
#SBATCH --mem=4G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

##-1- Move to the correct working directory
cd /home/mlu/scratch/2_gimble/Linaria


##-2- Run gimble
# Use the data simulated under the IM_BA scenario to fit DIV model
gimble optimize -z Lina_Gstore.z -d simulate/IM_BA_294w -w \ # here specify IM_BA dataset
                -g CRS2 -e 54 -i 10000 \
                -r A -u 7e-09 \
                -A 20_000,1_500_000 -B 20_000,1_500_000 \
                -C 200_000,3_000_000 -T 100_000,5_000_000 \
                -m DIV -l IM_BA_DIVmodelCompare # here define DIV model




