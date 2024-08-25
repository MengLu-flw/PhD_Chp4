#!/bin/bash

# Geum_NoM_100replica_run

##-1- Define variables
DIR=/home/mlu/scratch/3_fsc28/2_ModelFit/1_replica_NoM/Geum # working directory
cd $DIR

preF2="Geum_NoM_IM"

inDIR=/home/mlu/scratch/3_fsc28/1_SFS/Geum/output_masked_NOmiss/fastsimcoal2


##-2- Prepare input SFS, needs to be the same prefix as .tpl and .est
ln -s $inDIR/Geum_NoM_masked_jointMAFpop1_0.obs $DIR/"$preF2"_jointMAFpop1_0.obs


##-- IM model
#time /home/mlu/scratch/apps/fsc28_linux64/fsc28 -t $preF2.tpl -e $preF2.est -m -M -c 8 -B 8 -L 50 -n 1000000

for i in {1..100}
do
mkdir ${preF2}_run$i
cp ${preF2}.tpl ${preF2}.est ${preF2}_jointMAFpop1_0.obs ${preF2}_run$i"/"
cd ${preF2}_run$i
time /home/mlu/scratch/apps/fsc28_linux64/fsc28 -t ${preF2}.tpl -e ${preF2}.est -m -M -c 8 -B 8 -L 50 -n 1000000
cd ..
done
