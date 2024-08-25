srun --partition=short --cpus-per-task=1 --mem=2G --pty bash

wDIR=/mnt/destiny/sandbox/rbge_mlu/Chp4/gIMble
cd $wDIR


##-0- Enter the conda env
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310

# -------------------------------------------------------------------------------------- #
##-1.1- Get all window summaries
# -------------------------------------------------------------------------------------- #

cd $wDIR/1_window_stats

time gimble query -z /home/mlu/scratch/2_gimble/2024_May/Geum/Geum_Gstore.z -l windows # BY default, it will output to your current directory
#	[+] Writing BED file 'Geum_Gstore.windows.popgen.bed' ...
#	[*] Total runtime was 00h:00m:37.089s
#	real	0m38.737s
#	user	0m2.259s

time gimble query -z /home/mlu/scratch/2_gimble/2024_May/Lina/Lina_Gstore.z -l windows
#	[+] Writing BED file 'Lina_Gstore.windows.popgen.bed' ...
#	[*] Total runtime was 00h:00m:19.664s
#	real	0m21.012s
#	user	0m1.998s

time gimble query -z /home/mlu/scratch/2_gimble/2024_May/Prim_DToL/PrimDToL_Gstore.z -l windows
#	[+] Writing BED file 'PrimDToL_Gstore.windows.popgen.bed' ...
#	[*] Total runtime was 00h:00m:21.771s
#	real	0m23.663s
#	user	0m2.089s

time gimble query -z /home/mlu/scratch/2_gimble/2024_May/Verb/Verb_Gstore.z -l windows
#	[+] Writing BED file 'Verb_Gstore.windows.popgen.bed' ...
#	[*] Total runtime was 00h:00m:17.095s
#	real	0m18.199s
#	user	0m1.873s

time gimble query -z /home/mlu/scratch/2_gimble/2024_May/Viol/Viol_Gstore.z -l windows
#	[+] Writing BED file 'Viol_Gstore.windows.popgen.bed' ...
#	[*] Total runtime was 00h:00m:11.784s
#	real	0m12.818s
#	user	0m1.704s


##-1.2- Extract window position only
cut -f2-3 Geum_Gstore.windows.popgen.txt > Geum_wind_pos.txt
cut -f2-3 Lina_Gstore.windows.popgen.txt > Lina_wind_pos.txt
cut -f2-3 PrimDToL_Gstore.windows.popgen.txt > Prim_wind_pos.txt
cut -f2-3 Verb_Gstore.windows.popgen.txt > Verb_wind_pos.txt
cut -f2-3 Viol_Gstore.windows.popgen.txt > Viol_wind_pos.txt


# -------------------------------------------------------------------------------------- #
##-2- Get per window parameter estimates
# -------------------------------------------------------------------------------------- #
srun --partition=short --cpus-per-task=1 --mem=6G --pty bash

wDIR=/mnt/destiny/sandbox/rbge_mlu/Chp4/gIMble
cd $wDIR/2_per_wind_parameter
source activate /mnt/shared/scratch/mlu/apps/conda/envs/gimble_py310


time gimble query -z /home/mlu/scratch/2_gimble/2024_May/Geum/Geum_Gstore.z -l gridsearch/windows_kmax2/IM_BA_grid_240527
#	cp /home/mlu/scratch/2_gimble/2024_May/Geum/queryGrid/Geum_Gstore.gridsearch_windows_kmax2_IM_BA_grid_240527_0.best.bed ./

time gimble query -z /home/mlu/scratch/2_gimble/2024_May/Lina/Lina_Gstore.z -l gridsearch/windows_kmax2/IM_AB_grid_240528
#	[+] Wrote 'Lina_Gstore.gridsearch_windows_kmax2_IM_AB_grid_240528_0.best.bed'
#	[*] Total runtime was 00h:00m:24.470s
#	real	0m25.420s
#	user	0m2.504s

time gimble query -z /home/mlu/scratch/2_gimble/2024_May/Prim_DToL/PrimDToL_Gstore.z -l gridsearch/windows_kmax2/IM_AB_grid_240528
#	[+] Wrote 'PrimDToL_Gstore.gridsearch_windows_kmax2_IM_AB_grid_240528_0.best.bed'
#	[*] Total runtime was 00h:00m:33.575s
#	real	0m34.531s
#	user	0m2.901s

time gimble query -z /home/mlu/scratch/2_gimble/2024_May/Viol/Viol_Gstore.z -l gridsearch/windows_kmax2/IM_AB_grid_240815
#	[+] Wrote 'Viol_Gstore.gridsearch_windows_kmax2_IM_AB_grid_240815_0.best.bed'
#	[*] Total runtime was 00h:00m:26.549s
#	real	0m27.373s
#	user	0m2.674s

time gimble query -z /home/mlu/scratch/2_gimble/2024_May/Verb/Verb_Gstore.z -l gridsearch/windows_kmax2/IM_AB_grid_240815
#	[+] Wrote 'Verb_Gstore.gridsearch_windows_kmax2_IM_AB_grid_240815_0.best.bed'
#	[*] Total runtime was 00h:00m:22.100s
#	real	0m23.237s
#	user	0m2.281s


##-2.2- Extract parameter variations only
cut -f5-9 Geum_Gstore.gridsearch_windows_kmax2_IM_BA_grid_240527_0.best.bed > Geum_local_para.txt
cut -f5-9 Lina_Gstore.gridsearch_windows_kmax2_IM_AB_grid_240528_0.best.bed > Lina_local_para.txt
cut -f5-9 PrimDToL_Gstore.gridsearch_windows_kmax2_IM_AB_grid_240528_0.best.bed > Prim_local_para.txt
cut -f5-9 Viol_Gstore.gridsearch_windows_kmax2_IM_AB_grid_240815_0.best.bed > Viol_local_para.txt
cut -f5-9 Verb_Gstore.gridsearch_windows_kmax2_IM_AB_grid_240815_0.best.bed > Verb_local_para.txt

