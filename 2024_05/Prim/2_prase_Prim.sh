#!/bin/bash
#SBATCH --job-name="2_Prim_ex_parse"
#SBATCH --output="/home/mlu/scratch/2_gimble/2024_May/Prim/Slurm/2_Prim_ex_parse.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/2024_May/Prim/Slurm/2_Prim_ex_parse.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=himem
#SBATCH --mem=160G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

##-1- Move to the correct working directory
cd /home/mlu/scratch/2_gimble/2024_May/Prim

##-2- Manually prepare some files for parse

#-2.1- gimble.genomefile:
#[Optional] remove sequence IDs (i.e., scaffold IDs) to ignore them in the analyses
# Here is your chance to throw away non-chromosome level scaffolds

#cp /home/mlu/projects/rbge/mlu/4_gimble_v2/Primula/gimble.nucl.genomefile ./

#-2.2- gimble.samples.csv
#[Required] add population IDs the second column. Must be exactly 2 populations
#[Optional] remove sample IDs to ignore them in the analyses

#cp /home/mlu/projects/rbge/mlu/4_gimble_v2/Primula/gimble.popID.samples.csv ./

#-2.3- gimble.bed
#[Recommended] intersect with BED regions of interest to analyse particular genomic regions, e.g:
# symlink the intergenic.bed that you obtained with bedtools intersect -v

#ln -s /home/mlu/scratch/0_ref_Geno/2_genicBED/PriVeri_intergenic_gimble.bed ./


##-3- Run gimble
# example: gimble parse -v gimble.vcf.gz -b gimble.intergenic.bed -g gimble.genomefile -s gimble.samples.csv -z analysis
time gimble parse -v gimble.vcf.gz -b gimble_PriVeri_masked.bed -g gimble.nucl.genomefile -s gimble.popID_ex.samples.csv -z Prim_POP

# Three manual changes that you adopted here:
#-1- gimble.nucl.genomefile >>> which is a cleaner version of genome, only focusing on nuclear + chromosome level
#-2- gimble.popID.samples.csv >>> which has population specified & drop pseudo-replicates
#-3- intergenic_gimble.bed >>> which used original gimble.bed to intersect -v with masked.bed and then with gff.gene.bed



