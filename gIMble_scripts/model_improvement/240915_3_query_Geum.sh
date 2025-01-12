srun --partition=medium --cpus-per-task=1 --mem=8G --pty bash

wDIR=/mnt/destiny/sandbox/rbge_mlu/Chp4/gIMble/4_improve_fit
cd $wDIR

source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310



############------------------------Inspect outputs------------------------###############
##-- Define file path
gDIR=/home/mlu/scratch/2_gimble/2024_May/Geum

##-- To inspect the result based on simulated data
time gimble query -z $gDIR/Geum_Gstore.z -l optimize/DIV_240822.windowsum/DIV_fit_DIV_240826
time gimble query -z $gDIR/Geum_Gstore.z -l optimize/DIV_240822.windowsum/DIV_fit_IMba_240826



##-- Tidy the folder
mkdir Geum_DIV_fit_IMba Geum_DIV_fit_DIV
mv *DIV_fit_IMba*tsv Geum_DIV_fit_IMba/
mv *DIV_fit_DIV*tsv Geum_DIV_fit_DIV/



##-- Extract replica number and the lnCL
time for file in Geum_DIV_fit_DIV/*.tsv; do
    # Extract the 1st and 7th columns and append to the output file
    awk -F'\t' '{print $1 "\t" $7}' "$file" >>  Geum_DIV_fit_DIV_ALLreplica.txt
done

time grep -v '# gimble v1.0.3' Geum_DIV_fit_DIV_ALLreplica.txt > Geum_DIVfDIV_ALLreplica_tmp.txt

time grep -v 'replicate_idx' Geum_DIVfDIV_ALLreplica_tmp.txt > Geum_DIVfDIV_ALLreplica.txt
# Use nano to add the header "replicate_idx	lnCL"


time for file in Geum_DIV_fit_IMba/*.tsv; do
    # Extract the 1st and 7th columns and append to the output file
    awk -F'\t' '{print $1 "\t" $7}' "$file" >>  Geum_DIV_fit_IMba_ALLreplica.txt
done

time grep -v '# gimble v1.0.3' Geum_DIV_fit_IMba_ALLreplica.txt > Geum_DIVfIMba_ALLreplica_tmp.txt

time grep -v 'replicate_idx' Geum_DIVfIMba_ALLreplica_tmp.txt > Geum_DIVfIMba_ALLreplica.txt
# Use nano to add the header "replicate_idx	lnCL"




