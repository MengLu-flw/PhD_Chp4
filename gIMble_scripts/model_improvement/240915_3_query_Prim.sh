srun --partition=medium --cpus-per-task=1 --mem=8G --pty bash

wDIR=/mnt/destiny/sandbox/rbge_mlu/Chp4/gIMble/4_improve_fit
cd $wDIR

source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310



############------------------------Inspect outputs------------------------###############
##-- Define file path
gDIR=/home/mlu/scratch/2_gimble/2024_May/Prim_DToL

##-- To inspect the result based on simulated data
time gimble query -z $gDIR/PrimDToL_Gstore.z -l optimize/DIV_240821.windowsum/DIV_fit_DIV_240825
time gimble query -z $gDIR/PrimDToL_Gstore.z -l optimize/DIV_240821.windowsum/DIV_fit_IMab_240825



##-- Tidy the folder
mkdir Prim_DIV_fit_IMab Prim_DIV_fit_DIV
mv *DIV_fit_IMab*tsv Prim_DIV_fit_IMab/
mv *DIV_fit_DIV*tsv Prim_DIV_fit_DIV/



##-- Extract replica number and the lnCL
time for file in Prim_DIV_fit_DIV/*.tsv; do
    # Extract the 1st and 7th columns and append to the output file
    awk -F'\t' '{print $1 "\t" $7}' "$file" >>  Prim_DIV_fit_DIV_ALLreplica.txt
done

time grep -v '# gimble v1.0.3' Prim_DIV_fit_DIV_ALLreplica.txt > Prim_DIVfDIV_ALLreplica_tmp.txt

time grep -v 'replicate_idx' Prim_DIVfDIV_ALLreplica_tmp.txt > Prim_DIVfDIV_ALLreplica.txt
# Use nano to add the header "replicate_idx	lnCL"


time for file in Prim_DIV_fit_IMab/*.tsv; do
    # Extract the 1st and 7th columns and append to the output file
    awk -F'\t' '{print $1 "\t" $7}' "$file" >>  Prim_DIV_fit_IMab_ALLreplica.txt
done

time grep -v '# gimble v1.0.3' Prim_DIV_fit_IMab_ALLreplica.txt > Prim_DIVfIMab_ALLreplica_tmp.txt

time grep -v 'replicate_idx' Prim_DIVfIMab_ALLreplica_tmp.txt > Prim_DIVfIMab_ALLreplica.txt
# Use nano to add the header "replicate_idx	lnCL"

rm Prim_DIVfDIV_ALLreplica_tmp.txt Prim_DIVfIMab_ALLreplica_tmp.txt Prim_DIV_fit_DIV_ALLreplica.txt Prim_DIV_fit_IMab_ALLreplica.txt




