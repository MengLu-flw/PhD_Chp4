#!/bin/bash
#SBATCH --job-name="1_mask_Prim"
#SBATCH --output="/home/mlu/scratch/2_gimble/2024_May/Prim/Slurm/1_mask_Prim.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/2024_May/Prim/Slurm/1_mask_Prim.err"
#SBATCH --cpus-per-task=1
#SBATCH --partition=short
#SBATCH --mem=1G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Define variables and working dir
bedtools=/mnt/shared/scratch/mlu/apps/bedtools2/bin/bedtools # locate the app
rDIR=/home/mlu/scratch/0_ref_Geno/0_Masked # the directory to find repeat .bed files
cDIR=/home/mlu/scratch/2_gimble/2024_May # the directory to the all-callable .bed file

wDIR=/home/mlu/scratch/0_ref_Geno/2_genicBED
cd $wDIR

## Inspect inputs
#less $rDIR/GeuUrba_masked.repeats.bed
#less $cDIR/Geum/gimble.bed

oREF=$cDIR/Prim/gimble.bed
REPEAT=$rDIR/PriVeri_masked.repeats.bed

mREF=$wDIR/PriVeri_masked_gimble.bed

## Mask repeats from the all callable sites
time $bedtools intersect -a $oREF -b $REPEAT -v > $mREF
