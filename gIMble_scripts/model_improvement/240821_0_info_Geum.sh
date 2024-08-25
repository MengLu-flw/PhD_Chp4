#!/bin/bash
#SBATCH --job-name="240821_gimble_info"
#SBATCH --output="/mnt/destiny/sandbox/rbge_mlu/Chp4/gIMble/Slurm/240821_gimble_info.out"
#SBATCH --error="/mnt/destiny/sandbox/rbge_mlu/Chp4/gIMble/Slurm/240821_gimble_info.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=himem
#SBATCH --mem=180G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

##-1- Move to the correct working directory
wDIR=/mnt/destiny/sandbox/rbge_mlu/Chp4/gIMble/3_info
cd $wDIR

##-2- Run gimble
time gimble info -z /home/mlu/scratch/2_gimble/2024_May/Geum/Geum_Gstore.z


# -------------------------------------------------------------------------------------- #
#!/bin/bash
#SBATCH --job-name="240821_gimble_info_Lina"
#SBATCH --output="/mnt/destiny/sandbox/rbge_mlu/Chp4/gIMble/Slurm/240821_gimble_info_Lina.out"
#SBATCH --error="/mnt/destiny/sandbox/rbge_mlu/Chp4/gIMble/Slurm/240821_gimble_info_Lina.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=long
#SBATCH --mem=10G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

##-1- Move to the correct working directory
wDIR=/mnt/destiny/sandbox/rbge_mlu/Chp4/gIMble/3_info
cd $wDIR

##-2- Run gimble
time gimble info -z /home/mlu/scratch/2_gimble/2024_May/Lina/Lina_Gstore.z




# -------------------------------------------------------------------------------------- #
#!/bin/bash
#SBATCH --job-name="240821_gimble_info_Prim"
#SBATCH --output="/mnt/destiny/sandbox/rbge_mlu/Chp4/gIMble/Slurm/240821_gimble_info_Prim.out"
#SBATCH --error="/mnt/destiny/sandbox/rbge_mlu/Chp4/gIMble/Slurm/240821_gimble_info_Prim.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=himem
#SBATCH --mem=80G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

##-1- Move to the correct working directory
wDIR=/mnt/destiny/sandbox/rbge_mlu/Chp4/gIMble/3_info
cd $wDIR

##-2- Run gimble
time gimble info -z /home/mlu/scratch/2_gimble/2024_May/Prim_DToL/PrimDToL_Gstore.z










