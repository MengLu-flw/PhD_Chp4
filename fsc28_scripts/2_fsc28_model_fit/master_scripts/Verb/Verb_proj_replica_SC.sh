#!/bin/bash

# Verb_proj_100replica_run

##-1- Define variables
DIR=/home/mlu/scratch/3_fsc28/2_ModelFit/2_replica_Proj/Verb # working directory
cd $DIR

preF3="Verb_Proj_SC"

inDIR=/home/mlu/scratch/3_fsc28/1_SFS/Verb/output_masked_15miss/fastsimcoal2

##-2- Prepare input SFS, needs to be the same prefix as .tpl and .est
ln -s $inDIR/Verb_15M_masked_jointMAFpop1_0.obs $DIR/"$preF3"_jointMAFpop1_0.obs


##-- SC model
#time /home/mlu/scratch/apps/fsc28_linux64/fsc28 -t $preF3.tpl -e $preF3.est -m -M -c 8 -B 8 -L 50 -n 1000000
for i in {1..100}
do
mkdir ${preF3}_run$i
cp ${preF3}.tpl ${preF3}.est ${preF3}_jointMAFpop1_0.obs ${preF3}_run$i"/"
cd ${preF3}_run$i
time /home/mlu/scratch/apps/fsc28_linux64/fsc28 -t ${preF3}.tpl -e ${preF3}.est -m -M -c 8 -B 8 -L 50 -n 1000000
cd ..
done

