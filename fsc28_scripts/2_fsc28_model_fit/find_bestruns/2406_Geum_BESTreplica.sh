srun --partition=short --cpus-per-task=1 --mem=1G --pty bash


mkdir /home/mlu/scratch/3_fsc28/2_ModelFit/3_bestruns

##-0- Define working directory
wDIR=/home/mlu/scratch/3_fsc28/2_ModelFit/1_replica_NoM/Geum
# wDIR=/home/mlu/scratch/3_fsc28/2_ModelFit/1_replica_NoM/Geum_cf
# wDIR=/home/mlu/scratch/3_fsc28/2_ModelFit/1_replica_NoM/Lina
# wDIR=/home/mlu/scratch/3_fsc28/2_ModelFit/1_replica_NoM/Prim
# wDIR=/home/mlu/scratch/3_fsc28/2_ModelFit/1_replica_NoM/Prim_DToL
# wDIR=/home/mlu/scratch/3_fsc28/2_ModelFit/1_replica_NoM/Verb
# wDIR=/home/mlu/scratch/3_fsc28/2_ModelFit/1_replica_NoM/Viol

##-1- View one file, to see the column number of your Max.Est.Lhood


##-2- Screen print Max.Est.Lhood vales of all 100 replica, in descending order

#-----------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------
cd $wDIR
PREFIX="Geum_NoM_DIV"
cat ${PREFIX}_run99/${PREFIX}/${PREFIX}.bestlhoods # count the column number of the MaxEst

time cat ${PREFIX}_run{1..100}/${PREFIX}/${PREFIX}.bestlhoods | grep -v MaxObsLhood | awk '{print NR,$6}' | sort -k 2

# 74 -4682004.490
# 11 -4682062.147
# 81 -4682072.516
# 94 -4682105.584
# 32 -4682138.641
# ......
# Now you can see that run74 is the best run
##-3- Put this best run into a new folder called 'bestruns'
cp -r $wDIR/${PREFIX}_run74/${PREFIX} /home/mlu/scratch/3_fsc28/2_ModelFit/3_bestruns/${PREFIX}

cd /home/mlu/scratch/3_fsc28/2_ModelFit/3_bestruns/${PREFIX}
cat *bestlhoods




#-----------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------
cd $wDIR
PREFIX="Geum_NoM_IM"
cat ${PREFIX}_run99/${PREFIX}/${PREFIX}.bestlhoods # count the column number of the MaxEst

time cat ${PREFIX}_run{1..100}/${PREFIX}/${PREFIX}.bestlhoods | grep -v MaxObsLhood | awk '{print NR,$8}' | sort -k 2

# 45 -4635782.120
# 63 -4635811.587
# 44 -4635812.546
# 69 -4635812.753
# 35 -4635814.216
# ......
# Now you can see that run45 is the best run
##-3- Put this best run into a new folder called 'bestruns'
cp -r $wDIR/${PREFIX}_run45/${PREFIX} /home/mlu/scratch/3_fsc28/2_ModelFit/3_bestruns/${PREFIX}

cd /home/mlu/scratch/3_fsc28/2_ModelFit/3_bestruns/${PREFIX}
cat *bestlhoods




#-----------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------
cd $wDIR
PREFIX="Geum_NoM_SC"
cat ${PREFIX}_run100/${PREFIX}/${PREFIX}.bestlhoods # count the column number of the MaxEst

time cat ${PREFIX}_run{1..100}/${PREFIX}/${PREFIX}.bestlhoods | grep -v MaxObsLhood | awk '{print NR,$10}' | sort -k 2

# 33 -4634303.834
# 71 -4634321.730
# 25 -4634326.343
# 74 -4634337.883
# 69 -4634338.095
#......
# Now you can see that run?? is the best run
##-3- Put this best run into a new folder called 'bestruns'
cp -r $wDIR/${PREFIX}_run33/${PREFIX} /home/mlu/scratch/3_fsc28/2_ModelFit/3_bestruns/${PREFIX}

cd /home/mlu/scratch/3_fsc28/2_ModelFit/3_bestruns/${PREFIX}
cat *bestlhoods




#-----------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------
cd $wDIR
PREFIX="Geum_NoM_AM"
cat ${PREFIX}_run99/${PREFIX}/${PREFIX}.bestlhoods # count the column number of the MaxEst

time cat ${PREFIX}_run{1..100}/${PREFIX}/${PREFIX}.bestlhoods | grep -v MaxObsLhood | awk '{print NR,$10}' | sort -k 2

# 93 -4650197.847
# 38 -4650223.033
# 60 -4650255.873
# 21 -4650266.390
# 16 -4650270.036
# ......
# Now you can see that run93 is the best run
##-3- Put this best run into a new folder called 'bestruns'
cp -r $wDIR/${PREFIX}_run93/${PREFIX} /home/mlu/scratch/3_fsc28/2_ModelFit/3_bestruns/${PREFIX}

cd /home/mlu/scratch/3_fsc28/2_ModelFit/3_bestruns/${PREFIX}
cat *bestlhoods

