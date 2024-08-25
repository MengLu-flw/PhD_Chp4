srun --partition=short --cpus-per-task=1 --mem=100M --pty bash


##-0- Define working directory
wDIR=/home/mlu/scratch/3_fsc28/2_ModelFit/Rerun_covergence240610/Viol

##-1- View one file, to see the column number of your Max.Est.Lhood


##-2- Screen print Max.Est.Lhood vales of all 100 replica, in descending order

#-----------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------
#			cd $wDIR
#			PREFIX="Viol_NoM_DIV"
#			cat ${PREFIX}_run100/${PREFIX}/${PREFIX}.bestlhoods # count the column number of the MaxEst
#			
#			time cat ${PREFIX}_run{1..100}/${PREFIX}/${PREFIX}.bestlhoods | grep -v MaxObsLhood | awk '{print NR,$6}' | sort -k 2
#			
#			# 87 -10199327.744
#			# 85 -10201467.888
#			# 57 -10203437.678
#			# 46 -10203946.787
#			# 14 -10204017.154
#			# ......
#			# Now you can see that run?? is the best run
#			##-3- Put this best run into a new folder called 'bestruns'
#			cp -r $wDIR/${PREFIX}_run87/${PREFIX} /home/mlu/scratch/3_fsc28/2_ModelFit/3_bestruns/${PREFIX}
#			
#			cd /home/mlu/scratch/3_fsc28/2_ModelFit/3_bestruns/${PREFIX}
#			cat *bestlhoods




#-----------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------
cd $wDIR
PREFIX="Viol_NoM_IM"
cat ${PREFIX}_run100/${PREFIX}/${PREFIX}.bestlhoods # count the column number of the MaxEst

time cat ${PREFIX}_run{1..100}/${PREFIX}/${PREFIX}.bestlhoods | grep -v MaxObsLhood | awk '{print NR,$8}' | sort -k 2

# 63 -10193709.146
# 89 -10194049.417
# 11 -10194122.152
# 39 -10194625.473
# 77 -10195005.275
# ......
# Now you can see that run?? is the best run
##-3- Put this best run into a new folder called 'bestruns'
cp -r $wDIR/${PREFIX}_run63/${PREFIX} /home/mlu/scratch/3_fsc28/2_ModelFit/3_bestruns/${PREFIX}

cd /home/mlu/scratch/3_fsc28/2_ModelFit/3_bestruns/${PREFIX}
cat *bestlhoods




#-----------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------
#			cd $wDIR
#			PREFIX="Viol_NoM_SC"
#			cat ${PREFIX}_run100/${PREFIX}/${PREFIX}.bestlhoods # count the column number of the MaxEst
#			
#			time cat ${PREFIX}_run{1..100}/${PREFIX}/${PREFIX}.bestlhoods | grep -v MaxObsLhood | awk '{print NR,$10}' | sort -k 2
#			
#			# 85 -10196236.062
#			# 90 -10197831.763
#			# 11 -10198980.921
#			# 100 -10200483.099
#			# 69 -10200825.365
#			#......
#			# Now you can see that run?? is the best run
#			##-3- Put this best run into a new folder called 'bestruns'
#			cp -r $wDIR/${PREFIX}_run85/${PREFIX} /home/mlu/scratch/3_fsc28/2_ModelFit/3_bestruns/${PREFIX}
#			
#			cd /home/mlu/scratch/3_fsc28/2_ModelFit/3_bestruns/${PREFIX}
#			cat *bestlhoods




#-----------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------
#			cd $wDIR
#			PREFIX="Viol_NoM_AM"
#			cat ${PREFIX}_run100/${PREFIX}/${PREFIX}.bestlhoods # count the column number of the MaxEst
#			
#			time cat ${PREFIX}_run{1..100}/${PREFIX}/${PREFIX}.bestlhoods | grep -v MaxObsLhood | awk '{print NR,$10}' | sort -k 2
#			
#			# 28 -10192231.360
#			# 56 -10192372.910
#			# 33 -10192936.343
#			# 14 -10193006.179
#			# 12 -10193047.685
#			# ......
#			# Now you can see that run?? is the best run
#			##-3- Put this best run into a new folder called 'bestruns'
#			cp -r $wDIR/${PREFIX}_run28/${PREFIX} /home/mlu/scratch/3_fsc28/2_ModelFit/3_bestruns/${PREFIX}
#			
#			cd /home/mlu/scratch/3_fsc28/2_ModelFit/3_bestruns/${PREFIX}
#			cat *bestlhoods

