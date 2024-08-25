#!/bin/bash

# Lina_NoM_100replica_run

##-1- Define variables
DIR=/home/mlu/scratch/3_fsc28/2_ModelFit/1_replica_NoM/Lina # working directory
cd $DIR

preF4="Lina_NoM_AM"

inDIR=/home/mlu/scratch/3_fsc28/1_SFS/Lina/output_masked_NOmiss/fastsimcoal2

##-2- Prepare input SFS, needs to be the same prefix as .tpl and .est
ln -s $inDIR/Lina_NoM_masked_jointMAFpop1_0.obs $DIR/"$preF4"_jointMAFpop1_0.obs


##-- AM model
#time /home/mlu/scratch/apps/fsc28_linux64/fsc28 -t $preF4.tpl -e $preF4.est -m -M -c 8 -B 8 -L 50 -n 1000000
for i in {1..100}
do
mkdir ${preF4}_run$i
cp ${preF4}.tpl ${preF4}.est ${preF4}_jointMAFpop1_0.obs ${preF4}_run$i"/"
cd ${preF4}_run$i
time /home/mlu/scratch/apps/fsc28_linux64/fsc28 -t ${preF4}.tpl -e ${preF4}.est -m -M -c 8 -B 8 -L 50 -n 1000000
cd ..
done
