#!/bin/bash
#SBATCH --job-name="11_PrimDToL_DIVfitDIV"
#SBATCH --output="/home/mlu/scratch/2_gimble/2024_May/Prim_DToL/Slurm/11_PrimDToL_DIVfitDIV.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/2024_May/Prim_DToL/Slurm/11_PrimDToL_DIVfitDIV.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=long
#SBATCH --mem=40G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

##-1- Move to the correct working directory
cd /home/mlu/scratch/2_gimble/2024_May/Prim_DToL


##-2- Run gimble
# Use the data simulated under the DIV scenario to fit DIV model

gimble optimize -z PrimDToL_Gstore.z \
                -g CRS2 -e 88 -i 10000 \
                -r A -u 7e-09 \
                -A 10_000,100_000 -B 10_000,100_000 \
                -C 100_000,900_000 -T 100_000,800_000 \
                -m DIV \
                -d simulate/DIV_240821 -w \
                -l DIV_fit_DIV_240825



############----------------------------------------------------------################
#!/bin/bash
#SBATCH --job-name="11_PrimDToL_DIVfitIMab_himem"
#SBATCH --output="/home/mlu/scratch/2_gimble/2024_May/Prim_DToL/Slurm/11_PrimDToL_DIVfitIMab_himem.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/2024_May/Prim_DToL/Slurm/11_PrimDToL_DIVfitIMab_himem.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=himem
#SBATCH --mem=200G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

##-1- Move to the correct working directory
cd /home/mlu/scratch/2_gimble/2024_May/Prim_DToL


##-2- Run gimble
# Use the data simulated under the DIV scenario to fit IM_AB model

gimble optimize -z PrimDToL_Gstore.z \
                -g CRS2 -e 53 -i 10000 \
                -r A -u 7e-09 \
                -A 10_000,100_000 -B 10_000,100_000 \
                -C 100_000,900_000 -T 100_000,1_000_000 \
                -M 0,5e-09 -m IM_AB \
                -d simulate/DIV_240821 -w \
                -l DIV_fit_IMab_240825 \
                -f


############------------------------Inspect outputs------------------------###############
#!/bin/bash
#SBATCH --job-name="12_PrimDToL_SIMquery"
#SBATCH --output="/home/mlu/scratch/2_gimble/2024_May/Lina/Slurm/12_PrimDToL_SIMquery.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/2024_May/Lina/Slurm/12_PrimDToL_SIMquery.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=medium
#SBATCH --mem=2G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

##-1- Move to the correct working directory
cd /home/mlu/scratch/2_gimble/2024_May/Prim_DToL



##-2- To inspect the result based on simulated data
time gimble query -z PrimDToL_Gstore.z -l optimize/"??DIV_294w.windowsum??"/DIV_fit_DIV_240825


time gimble query -z PrimDToL_Gstore.z -l optimize/"??DIV_294w.windowsum??"/DIV_fit_IMab_240825


