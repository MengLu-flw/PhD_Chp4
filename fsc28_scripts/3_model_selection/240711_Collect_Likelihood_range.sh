cd /home/mlu/scratch/3_fsc28/3_ModelSelect

mkdir output
mv *.lhoods output/
cd output

for f in *; 
do sed -i "s/$/\t$f/" $f; #\t stands for TAB, while $ is the end of the line originally
done

cat Geum_cf_NoM* > ALLGeum_cf.lhoods.txt
cat Geum_NoM* > ALLGeum.lhoods.txt
cat Lina_NoM* > ALLLina.lhoods.txt
cat Prim_NoM* > ALLPrim.lhoods.txt
cat Verb_NoM* > ALLVerb.lhoods.txt

#-----------------------------------------------------------------------------------------
mkdir tmp
mv PrimDToL_NoM_*.lhoods tmp/
mv Viol_NoM_*.lhoods tmp/

cd tmp

for f in *; 
do sed -i "s/$/\t$f/" $f; #\t stands for TAB, while $ is the end of the line originally
done

cat PrimDToL_NoM_* > ALLPrimDToL.lhoods.txt
cat Viol_NoM_* > ALLViol.lhoods.txt


mv * /home/mlu/scratch/3_fsc28/3_ModelSelect/output/
cd ..
ls -lht


rm -fr tmp





