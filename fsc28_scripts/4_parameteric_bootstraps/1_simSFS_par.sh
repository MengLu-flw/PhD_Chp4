## ------------------------------------------------------------------------------------ ##
## -------------- Use the modified maxL.par to simulate 100 folded SFSs --------------- ##
## ------------------------------------------------------------------------------------ ##


#!/bin/bash
#SBATCH --job-name="1_fsc.par_simSFS"
#SBATCH --output="/home/mlu/scratch/3_fsc28/4_ParaCIs/Slurm/1_fsc.par_simSFS_%A-%a.out"
#SBATCH --error="/home/mlu/scratch/3_fsc28/4_ParaCIs/Slurm/1_fsc.par_simSFS_%A-%a.err"
#SBATCH --cpus-per-task=8
#SBATCH --partition=medium
#SBATCH --mem=4G
#SBATCH --array=1-6
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=m.lu-17@sms.ed.ac.uk

##-0- Define variables
wDIR=/home/mlu/scratch/3_fsc28/4_ParaCIs
appDIR=/home/mlu/scratch/apps/fsc28_linux64
cd $wDIR

##----------- $wDIR/PARlist.txt -----------##
# /home/mlu/scratch/3_fsc28/4_ParaCIs/Geum_cf_NoM_SC.par
# /home/mlu/scratch/3_fsc28/4_ParaCIs/Geum_NoM_SC.par
# /home/mlu/scratch/3_fsc28/4_ParaCIs/Lina_NoM_SC.par
# /home/mlu/scratch/3_fsc28/4_ParaCIs/Prim_DToL_NoM_IM.par
# /home/mlu/scratch/3_fsc28/4_ParaCIs/Prim_NoM_SC.par
# /home/mlu/scratch/3_fsc28/4_ParaCIs/Verb_NoM_DIV.par


##-0- Set up array job input
echo $SLURM_ARRAY_TASK_ID
PAR=$(awk -v lineid=$SLURM_ARRAY_TASK_ID 'NR==lineid{print;exit}' $wDIR/PARlist.txt)



##-1- Run
time $appDIR/fsc28 -i "$PAR" -n100 -j -d -s0 -x –I -q -c8 -B8 -k 5000000 --foldedSFS
# -n: Number of simulations to perform per parameter file
# -j: Output per file in a separate directory
# -d: Computes the site frequency spectrum (SFS) for the derived alleles for each population sample and for all pairs of samples (joint 2D SFS). Note that this is only option when simulating DNA data.
# -s0: Output DNA as SNP data; s0 to output all SNPs in the DNA sequence(s)
# -x: Do not generate Arlequin output files (which take large space)
# -I: Generates DNA mutations according to an infinite site (IS) mutation model. Under this model, each mutation is supposed to occur at a different but random site on the DNA sequence
# -q: Quiet mode
# -c: Number of cores
# -B: Number of batches
# -k: Number of simulated polymorphic sites to keep in memory before writing them to temporary files.


# ------------------------------------------------------------- #
# --------- Note: a pervious error message without -k --------- #
# Unable to compute SFS for such a large number (4274400) of polymorphic sites.
# Try to increase the no. of sites to keep in memory (-k option = 100000, now) to match this number.
# Skipping writing of SFS files.



# 2024 Apr 24 - the monomorphic site
# 97570434 (empirial data; folded)
# 100727221 (the first simulated folded SFS)
# 100727370 (the second simulated folded SFS)
# 100731088 (the third simulated folded SFS)




