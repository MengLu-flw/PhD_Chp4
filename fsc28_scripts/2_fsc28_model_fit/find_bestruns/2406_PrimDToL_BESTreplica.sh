srun --partition=short --cpus-per-task=1 --mem=1G --pty bash


##-0- Define working directory
#wDIR=/home/mlu/scratch/3_fsc28/2_ModelFit/1_replica_NoM/Geum
#wDIR=/home/mlu/scratch/3_fsc28/2_ModelFit/1_replica_NoM/Geum_cf
#wDIR=/home/mlu/scratch/3_fsc28/2_ModelFit/1_replica_NoM/Lina
#wDIR=/home/mlu/scratch/3_fsc28/2_ModelFit/1_replica_NoM/Prim
wDIR=/home/mlu/scratch/3_fsc28/2_ModelFit/1_replica_NoM/Prim_DToL
# wDIR=/home/mlu/scratch/3_fsc28/2_ModelFit/1_replica_NoM/Verb
# wDIR=/home/mlu/scratch/3_fsc28/2_ModelFit/1_replica_NoM/Viol

##-1- View one file, to see the column number of your Max.Est.Lhood


##-2- Screen print Max.Est.Lhood vales of all 100 replica, in descending order

#-----------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------
cd $wDIR
PREFIX="Prim_DToL_NoM_DIV"
cat ${PREFIX}_run100/${PREFIX}/${PREFIX}.bestlhoods # count the column number of the MaxEst

time cat ${PREFIX}_run{1..100}/${PREFIX}/${PREFIX}.bestlhoods | grep -v MaxObsLhood | awk '{print NR,$6}' | sort -k 2

# 1 -3350987.249
# 22 -3351354.035
# 66 -3351858.434
# 73 -3352219.692
# 42 -3352296.128
# ......
# Now you can see that run?? is the best run
##-3- Put this best run into a new folder called 'bestruns'
cp -r $wDIR/${PREFIX}_run1/${PREFIX} /home/mlu/scratch/3_fsc28/2_ModelFit/3_bestruns/${PREFIX}

cd /home/mlu/scratch/3_fsc28/2_ModelFit/3_bestruns/${PREFIX}
cat *bestlhoods




#-----------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------
cd $wDIR
PREFIX="Prim_DToL_NoM_IM"
cat ${PREFIX}_run100/${PREFIX}/${PREFIX}.bestlhoods # count the column number of the MaxEst

time cat ${PREFIX}_run{1..100}/${PREFIX}/${PREFIX}.bestlhoods | grep -v MaxObsLhood | awk '{print NR,$8}' | sort -k 2

# 27 -3319468.162
# 23 -3324982.423
# 30 -3325089.417
# 19 -3325131.443
# 75 -3325324.898
# ......
# Now you can see that run?? is the best run
##-3- Put this best run into a new folder called 'bestruns'
cp -r $wDIR/${PREFIX}_run27/${PREFIX} /home/mlu/scratch/3_fsc28/2_ModelFit/3_bestruns/${PREFIX}

cd /home/mlu/scratch/3_fsc28/2_ModelFit/3_bestruns/${PREFIX}
cat *bestlhoods




#-----------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------
cd $wDIR
PREFIX="Prim_DToL_NoM_SC"
cat ${PREFIX}_run100/${PREFIX}/${PREFIX}.bestlhoods # count the column number of the MaxEst

time cat ${PREFIX}_run{1..100}/${PREFIX}/${PREFIX}.bestlhoods | grep -v MaxObsLhood | awk '{print NR,$10}' | sort -k 2

# 44 -3325159.653
# 74 -3325241.310
# 72 -3325316.796
# 13 -3325319.642
# 66 -3325361.407
#......
# Now you can see that run?? is the best run
##-3- Put this best run into a new folder called 'bestruns'
cp -r $wDIR/${PREFIX}_run44/${PREFIX} /home/mlu/scratch/3_fsc28/2_ModelFit/3_bestruns/${PREFIX}

cd /home/mlu/scratch/3_fsc28/2_ModelFit/3_bestruns/${PREFIX}
cat *bestlhoods




#-----------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------
cd $wDIR
PREFIX="Prim_DToL_NoM_AM"
cat ${PREFIX}_run100/${PREFIX}/${PREFIX}.bestlhoods # count the column number of the MaxEst

time cat ${PREFIX}_run{1..100}/${PREFIX}/${PREFIX}.bestlhoods | grep -v MaxObsLhood | awk '{print NR,$10}' | sort -k 2

# 15 -3336702.480
# 91 -3337205.270
# 53 -3337441.412
# 17 -3340097.521
# 75 -3347133.593
# ......
# Now you can see that run?? is the best run
##-3- Put this best run into a new folder called 'bestruns'
cp -r $wDIR/${PREFIX}_run15/${PREFIX} /home/mlu/scratch/3_fsc28/2_ModelFit/3_bestruns/${PREFIX}

cd /home/mlu/scratch/3_fsc28/2_ModelFit/3_bestruns/${PREFIX}
cat *bestlhoods

