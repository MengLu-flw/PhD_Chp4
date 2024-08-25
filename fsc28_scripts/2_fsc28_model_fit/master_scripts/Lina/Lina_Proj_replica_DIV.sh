#!/bin/bash

# Lina_proj_100replica_run

##-1- Define variables
DIR=/home/mlu/scratch/3_fsc28/2_ModelFit/2_replica_Proj/Lina # working directory
cd $DIR

preF1="Lina_Proj_DIV"

inDIR=/home/mlu/scratch/3_fsc28/1_SFS/Lina/output_masked_15miss/fastsimcoal2

##-2- Prepare input SFS, needs to be the same prefix as .tpl and .est
ln -s $inDIR/Lina_15M_masked_jointMAFpop1_0.obs $DIR/"$preF1"_jointMAFpop1_0.obs


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

