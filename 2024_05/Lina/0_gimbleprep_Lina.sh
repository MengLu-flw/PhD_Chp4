#!/bin/bash
#SBATCH --job-name="0_Lina_gimbleprep"
#SBATCH --output="/home/mlu/scratch/2_gimble/2024_May/Lina/Slurm/0_Lina_gimbleprep.out"
#SBATCH --error="/home/mlu/scratch/2_gimble/2024_May/Lina/Slurm/0_Lina_gimbleprep.err"
#SBATCH --cpus-per-task=12
#SBATCH --partition=medium
#SBATCH --mem=20G
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk

cd /home/mlu/scratch/2_gimble/2024_May/Lina


##-1- Define variables
REF=/home/mlu/scratch/0_ref_Geno/Linaria/LinVulg.fasta #the absolute path to find the reference genome

BAMDIR=/home/mlu/scratch/1_VCFs/2_precalling_bam/Linaria #directory for the input bam files

# Make sure that the VCF file has been indexed!!
VCF=/home/mlu/scratch/1_VCFs/3_raw_SNPs/BCFtools/Linaria/231121_Lina_all.vcf.gz #directory for raw-indexed VCF
# If indexed with 'bcftools index 231121_Lina_all.vcf.gz', the file ends with .csi
# If indexed with 'tabix -p vcf 231121_Lina_all.vcf.gz', the file ends with .tbi (in the gimble GitHub example)


##-2- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

##-3- Run gimbleprep

time gimbleprep -f $REF -b $BAMDIR/ -v $VCF -k --snpgap 2 --min_qual 20 --min_depth 8 --max_depth 1.5 --threads 8
