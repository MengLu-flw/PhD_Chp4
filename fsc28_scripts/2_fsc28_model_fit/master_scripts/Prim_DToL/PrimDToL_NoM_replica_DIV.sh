#!/bin/bash

# Prim_DToL_NoM_100replica_run

##-1- Define variables
DIR=/home/mlu/scratch/3_fsc28/2_ModelFit/1_replica_NoM/Prim_DToL # working directory
cd $DIR

preF1="Prim_DToL_NoM_DIV"

inDIR=/home/mlu/scratch/3_fsc28/1_SFS/PrimDToL/output_masked_NOmiss/fastsimcoal2

##-2- Prepare input SFS, needs to be the same prefix as .tpl and .est
ln -s $inDIR/PrimDToL_NoM_masked_jointMAFpop1_0.obs $DIR/"$preF1"_jointMAFpop1_0.obs


##-- DIV model
#time /home/mlu/scratch/apps/fsc28_linux64/fsc28 -t $preF1.tpl -e $preF1.est -m -M -c 8 -B 8 -L 50 -n 1000000
for i in {1..100}
do
mkdir ${preF1}_run$i
cp ${preF1}.tpl ${preF1}.est ${preF1}_jointMAFpop1_0.obs ${preF1}_run$i"/"
cd ${preF1}_run$i
time /home/mlu/scratch/apps/fsc28_linux64/fsc28 -t ${preF1}.tpl -e ${preF1}.est -m -M -c 8 -B 8 -L 50 -n 1000000
cd ..
done
