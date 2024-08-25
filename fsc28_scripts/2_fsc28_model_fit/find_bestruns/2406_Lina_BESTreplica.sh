srun --partition=short --cpus-per-task=1 --mem=1G --pty bash


##-0- Define working directory
#wDIR=/home/mlu/scratch/3_fsc28/2_ModelFit/1_replica_NoM/Geum
#wDIR=/home/mlu/scratch/3_fsc28/2_ModelFit/1_replica_NoM/Lina_cf
wDIR=/home/mlu/scratch/3_fsc28/2_ModelFit/1_replica_NoM/Lina
# wDIR=/home/mlu/scratch/3_fsc28/2_ModelFit/1_replica_NoM/Prim
# wDIR=/home/mlu/scratch/3_fsc28/2_ModelFit/1_replica_NoM/Prim_DToL
# wDIR=/home/mlu/scratch/3_fsc28/2_ModelFit/1_replica_NoM/Verb
# wDIR=/home/mlu/scratch/3_fsc28/2_ModelFit/1_replica_NoM/Viol

##-1- View one file, to see the column number of your Max.Est.Lhood


##-2- Screen print Max.Est.Lhood vales of all 100 replica, in descending order

#-----------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------
cd $wDIR
PREFIX="Lina_NoM_DIV"
cat ${PREFIX}_run99/${PREFIX}/${PREFIX}.bestlhoods # count the column number of the MaxEst

time cat ${PREFIX}_run{1..100}/${PREFIX}/${PREFIX}.bestlhoods | grep -v MaxObsLhood | awk '{print NR,$6}' | sort -k 2

# 88 -4626185.942
# 10 -4626267.269
# 92 -4626310.223
# 95 -4626317.762
# 49 -4626359.445
# ......
# Now you can see that run?? is the best run
##-3- Put this best run into a new folder called 'bestruns'
cp -r $wDIR/${PREFIX}_run88/${PREFIX} /home/mlu/scratch/3_fsc28/2_ModelFit/3_bestruns/${PREFIX}

cd /home/mlu/scratch/3_fsc28/2_ModelFit/3_bestruns/${PREFIX}
cat *bestlhoods




#-----------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------
cd $wDIR
PREFIX="Lina_NoM_IM"
cat ${PREFIX}_run99/${PREFIX}/${PREFIX}.bestlhoods # count the column number of the MaxEst

time cat ${PREFIX}_run{1..100}/${PREFIX}/${PREFIX}.bestlhoods | grep -v MaxObsLhood | awk '{print NR,$8}' | sort -k 2

# 36 -4610696.931
# 96 -4610712.405
# 12 -4610771.205
# 49 -4610786.781
# 40 -4610819.903
# ......
# Now you can see that run?? is the best run
##-3- Put this best run into a new folder called 'bestruns'
cp -r $wDIR/${PREFIX}_run36/${PREFIX} /home/mlu/scratch/3_fsc28/2_ModelFit/3_bestruns/${PREFIX}

cd /home/mlu/scratch/3_fsc28/2_ModelFit/3_bestruns/${PREFIX}
cat *bestlhoods




#-----------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------
cd $wDIR
PREFIX="Lina_NoM_SC"
cat ${PREFIX}_run99/${PREFIX}/${PREFIX}.bestlhoods # count the column number of the MaxEst

time cat ${PREFIX}_run{1..100}/${PREFIX}/${PREFIX}.bestlhoods | grep -v MaxObsLhood | awk '{print NR,$10}' | sort -k 2

# 24 -4610408.855
# 10 -4610412.650
# 88 -4610424.100
# 100 -4610487.164
# 66 -4610487.383
#......
# Now you can see that run?? is the best run
##-3- Put this best run into a new folder called 'bestruns'
cp -r $wDIR/${PREFIX}_run24/${PREFIX} /home/mlu/scratch/3_fsc28/2_ModelFit/3_bestruns/${PREFIX}

cd /home/mlu/scratch/3_fsc28/2_ModelFit/3_bestruns/${PREFIX}
cat *bestlhoods




#-----------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------
cd $wDIR
PREFIX="Lina_NoM_AM"
cat ${PREFIX}_run99/${PREFIX}/${PREFIX}.bestlhoods # count the column number of the MaxEst

time cat ${PREFIX}_run{1..100}/${PREFIX}/${PREFIX}.bestlhoods | grep -v MaxObsLhood | awk '{print NR,$10}' | sort -k 2

# 85 -4613016.031
# 22 -4613025.231
# 42 -4613048.016
# 7 -4613110.207
# 9 -4613142.881
# ......
# Now you can see that run?? is the best run
##-3- Put this best run into a new folder called 'bestruns'
cp -r $wDIR/${PREFIX}_run85/${PREFIX} /home/mlu/scratch/3_fsc28/2_ModelFit/3_bestruns/${PREFIX}

cd /home/mlu/scratch/3_fsc28/2_ModelFit/3_bestruns/${PREFIX}
cat *bestlhoods

