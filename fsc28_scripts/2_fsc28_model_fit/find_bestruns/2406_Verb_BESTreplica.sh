srun --partition=short --cpus-per-task=1 --mem=1G --pty bash


##-0- Define working directory
#wDIR=/home/mlu/scratch/3_fsc28/2_ModelFit/1_replica_NoM/Geum
#wDIR=/home/mlu/scratch/3_fsc28/2_ModelFit/1_replica_NoM/Geum_cf
#wDIR=/home/mlu/scratch/3_fsc28/2_ModelFit/1_replica_NoM/Lina
#wDIR=/home/mlu/scratch/3_fsc28/2_ModelFit/1_replica_NoM/Prim
#wDIR=/home/mlu/scratch/3_fsc28/2_ModelFit/1_replica_NoM/Prim_DToL
wDIR=/home/mlu/scratch/3_fsc28/2_ModelFit/1_replica_NoM/Verb
# wDIR=/home/mlu/scratch/3_fsc28/2_ModelFit/1_replica_NoM/Viol

##-1- View one file, to see the column number of your Max.Est.Lhood


##-2- Screen print Max.Est.Lhood vales of all 100 replica, in descending order

#-----------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------
cd $wDIR
PREFIX="Verb_NoM_DIV"
cat ${PREFIX}_run100/${PREFIX}/${PREFIX}.bestlhoods # count the column number of the MaxEst

time cat ${PREFIX}_run{1..100}/${PREFIX}/${PREFIX}.bestlhoods | grep -v MaxObsLhood | awk '{print NR,$6}' | sort -k 2

# 3 -6549986.425
# 57 -6550787.343
# 29 -6552399.127
# 56 -6552498.655
# 84 -6552960.939
# ......
# Now you can see that run?? is the best run
##-3- Put this best run into a new folder called 'bestruns'
cp -r $wDIR/${PREFIX}_run3/${PREFIX} /home/mlu/scratch/3_fsc28/2_ModelFit/3_bestruns/${PREFIX}

cd /home/mlu/scratch/3_fsc28/2_ModelFit/3_bestruns/${PREFIX}
cat *bestlhoods




#-----------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------
cd $wDIR
PREFIX="Verb_NoM_IM"
cat ${PREFIX}_run100/${PREFIX}/${PREFIX}.bestlhoods # count the column number of the MaxEst

time cat ${PREFIX}_run{1..100}/${PREFIX}/${PREFIX}.bestlhoods | grep -v MaxObsLhood | awk '{print NR,$8}' | sort -k 2

# 57 -6550016.259
# 96 -6551321.207
# 14 -6553128.360
# 66 -6553608.115
# 69 -6554302.723
# ......
# Now you can see that run?? is the best run
##-3- Put this best run into a new folder called 'bestruns'
cp -r $wDIR/${PREFIX}_run57/${PREFIX} /home/mlu/scratch/3_fsc28/2_ModelFit/3_bestruns/${PREFIX}

cd /home/mlu/scratch/3_fsc28/2_ModelFit/3_bestruns/${PREFIX}
cat *bestlhoods




#-----------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------
cd $wDIR
PREFIX="Verb_NoM_SC"
cat ${PREFIX}_run100/${PREFIX}/${PREFIX}.bestlhoods # count the column number of the MaxEst

time cat ${PREFIX}_run{1..100}/${PREFIX}/${PREFIX}.bestlhoods | grep -v MaxObsLhood | awk '{print NR,$10}' | sort -k 2

# 94 -6553030.549
# 78 -6559068.401
# 45 -6562566.767
# 22 -6563873.551
# 51 -6564181.631
#......
# Now you can see that run?? is the best run
##-3- Put this best run into a new folder called 'bestruns'
cp -r $wDIR/${PREFIX}_run94/${PREFIX} /home/mlu/scratch/3_fsc28/2_ModelFit/3_bestruns/${PREFIX}

cd /home/mlu/scratch/3_fsc28/2_ModelFit/3_bestruns/${PREFIX}
cat *bestlhoods




#-----------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------
cd $wDIR
PREFIX="Verb_NoM_AM"
cat ${PREFIX}_run100/${PREFIX}/${PREFIX}.bestlhoods # count the column number of the MaxEst

time cat ${PREFIX}_run{1..100}/${PREFIX}/${PREFIX}.bestlhoods | grep -v MaxObsLhood | awk '{print NR,$10}' | sort -k 2

# 11 -6550469.505
# 86 -6553028.692
# 47 -6555064.133
# 24 -6555952.575
# 67 -6556442.547
# .....
# Now you can see that run?? is the best run
##-3- Put this best run into a new folder called 'bestruns'
cp -r $wDIR/${PREFIX}_run11/${PREFIX} /home/mlu/scratch/3_fsc28/2_ModelFit/3_bestruns/${PREFIX}

cd /home/mlu/scratch/3_fsc28/2_ModelFit/3_bestruns/${PREFIX}
cat *bestlhoods

