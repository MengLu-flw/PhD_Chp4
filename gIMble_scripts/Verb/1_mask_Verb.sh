#!/bin/bash
#SBATCH --job-name="1_mask_Verb"
#SBATCH --output="/home/mlu/scratch/2_gimble/2024_May/Verb/Slurm/1_mask_Verb.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/2024_May/Verb/Slurm/1_mask_Verb.err"
#SBATCH --cpus-per-task=1
#SBATCH --partition=short
#SBATCH --mem=1G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Define variables and working dir
bedtools=/mnt/shared/scratch/mlu/apps/bedtools2/bin/bedtools # locate the app
rDIR=/home/mlu/scratch/0_ref_Geno/0_Masked # the directory to find repeat .bed files

wDIR=/home/mlu/scratch/2_gimble/2024_May/Verb
cd $wDIR

## Check if input paths are valid


oREF=$wDIR/gimble.bed
REPEAT=$rDIR/VerThap_masked.repeats.bed

mREF=$wDIR/gimble_VerThap_masked.bed

## Mask repeats from the all callable sites
time $bedtools intersect -a $oREF -b $REPEAT -v > $mREF
