#!/bin/bash
#SBATCH --job-name="2_Geum_cf_parse"
#SBATCH --output="/home/mlu/scratch/2_gimble/2024_May/Geum_cf_sym/Slurm/2_Geum_cf_parse.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/2024_May/Geum_cf_sym/Slurm/2_Geum_cf_parse.err"
#SBATCH --cpus-per-task=12
#SBATCH --partition=himem
#SBATCH --mem=360G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

##-1- Move to the correct working directory
cd /home/mlu/scratch/2_gimble/2024_May/Geum_cf_sym

##-2- Manually prepare some files for parse

#-2.1- gimble.genomefile:
#[Optional] remove sequence IDs (i.e., scaffold IDs) to ignore them in the analyses
# Here is your chance to throw away non-chromosome level scaffolds
# cp /home/mlu/projects/rbge/mlu/4_gimble/Geum_cf_sym/gimble.nucl.genomefile ./

#-2.2- gimble.samples.csv
#[Required] add population IDs the second column. Must be exactly 2 populations
#[Optional] remove sample IDs to ignore them in the analyses
# cp /home/mlu/projects/rbge/mlu/4_gimble/Geum_cf_sym/gimble.popID.samples.csv ./


#-2.3- gimble.bed
#[Recommended] intersect with BED regions of interest to analyse particular genomic regions, e.g:
#bedtools intersect -a gimble.bed -b my_intergenic_regions.bed > gimble.intergenic.bed


##-3- Run gimble
# example: gimble parse -v gimble.vcf.gz -b gimble.intergenic.bed -g gimble.genomefile -s gimble.samples.csv -z analysis
time gimble parse -v gimble.vcf.gz -b gimble_Geum_cf_sym_masked.bed -g gimble.nucl.genomefile -s gimble.popID.samples.csv -z Geum_cf_Gstore
# -f

