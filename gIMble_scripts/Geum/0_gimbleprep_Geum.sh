#!/bin/bash
#SBATCH --job-name="0_Geum_gimbleprep"
#SBATCH --output="/home/mlu/scratch/2_gimble/2024_May/Geum/Slurm/0_Geum_gimbleprep.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/2024_May/Geum/Slurm/0_Geum_gimbleprep.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=long
#SBATCH --mem=40G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk

cd /home/mlu/scratch/2_gimble/2024_May/Geum


##-1- Define variables
REF=/home/mlu/scratch/0_ref_Geno/Geum/GeuUrba.fasta #the absolute path to find the reference genome

BAMDIR=/home/mlu/scratch/1_VCFs/2_precalling_bam/Geum #directory for the input bam files

# Make sure that the VCF file has been indexed!!
VCF=/home/mlu/scratch/1_VCFs/3_raw_SNPs/BCFtools/Geum/231206_Geum_all.vcf.gz #directory for raw-indexed VCF
# If indexed with 'bcftools index 231206_Geum_all.vcf.gz', the file ends with .csi
# If indexed with 'tabix -p vcf 231206_Geum_all.vcf.gz', the file ends with .tbi (in the gimble GitHub example)


##-2- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

##-3- Run gimbleprep

time gimbleprep -f $REF -b $BAMDIR/ -v $VCF -k --snpgap 2 --min_qual 20 --min_depth 8 --max_depth 1.5 --threads 8