#!/bin/bash
#SBATCH --job-name="0_Geum_cf_gimbleprep"
#SBATCH --output="/home/mlu/scratch/2_gimble/2024_May/Geum_cf_sym/Slurm/0_Geum_cf_gimbleprep.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/2024_May/Geum_cf_sym/Slurm/0_Geum_cf_gimbleprep.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=long
#SBATCH --mem=40G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk

cd /home/mlu/scratch/2_gimble/2024_May/Geum_cf_sym

##-0- Prepare BAMs separately as you only need a subset of sympatric Geum samples
#parallel 'ln -s /home/mlu/projects/rbge/mlu/2_BAMs/1_dedup_BAM/Geum_sym/{}_sort_dedup_RG.bam /home/mlu/scratch/2_gimble/Geum_cf_sym/dedup_bams/' :::: /home/mlu/scratch/2_gimble/Geum_cf_sym/dedup_bams/cfGeumList.txt
#parallel 'ln -s /home/mlu/projects/rbge/mlu/2_BAMs/1_dedup_BAM/Geum_sym/{}_sort_dedup_RG.bai /home/mlu/scratch/2_gimble/Geum_cf_sym/dedup_bams/' :::: /home/mlu/scratch/2_gimble/Geum_cf_sym/dedup_bams/cfGeumList.txt


##-1- Define variables
REF=/home/mlu/scratch/0_ref_Geno/Geum/GeuUrba.fasta #the absolute path to find the reference genome

BAMDIR=/home/mlu/scratch/2_gimble/2023_Dec/Geum_cf_sym/dedup_bams #directory for the input bam files
# This is a specific list of bam as you only want to include Geum cf.
# ls /home/mlu/scratch/2_gimble/2023_Dec/Geum_cf_sym/dedup_bams/* > BAMname.txt

# Make sure that the VCF file has been indexed!!
VCF=/home/mlu/scratch/1_VCFs/3_raw_SNPs/BCFtools/Geum_sym/231208_cfGeum_refine.vcf.gz #directory for raw-indexed VCF
# If indexed with 'tabix -p vcf 231117_Geum_all.vcf.gz', the file ends with .tbi (in the gimble GitHub example)
# time bcftools query -l /home/mlu/scratch/1_VCFs/3_raw_SNPs/BCFtools/Geum_sym/231208_cfGeum_refine.vcf.gz|wc -l



##-2- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

##-3- Run gimbleprep

time gimbleprep -f $REF -b $BAMDIR/ -v $VCF -k --snpgap 2 --min_qual 20 --min_depth 8 --max_depth 1.5 --threads 8
