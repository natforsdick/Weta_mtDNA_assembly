#!/bin/bash -e 
#SBATCH -A ga03048 # CHANGE!! 
#SBATCH -J NOVOplasty # job name (shows up in the queue) 
#SBATCH -c 10
#SBATCH --mem=60G
#SBATCH --time=12:00:00 #Walltime (HH:MM:SS) 
#SBATCH --mail-type=FAIL,END 
#SBATCH --mail-user=forsdickn@landcareresearch.co.nz 
#SBATCH --output=%x.%j.out
#SBATCH --error=%x.%j.err 

###########
# Wrapper to run NOVOplasty
# Nat Forsdick, 2021-01-18
###########

# PARAMS
OUTDIR=/nesi/nobackup/ga03048/Weta_NOVO/
NOVO=/nesi/project/ga03048/modules/NOVOPlasty/NOVOPlasty4.2.1.pl
CONFIG=/nesi/project/ga03048/modules/NOVOPlasty/NOVO_config_batch_weta.txt

cd $OUTDIR

echo "Beginning NOVOPlasty in batch mode"
perl $NOVO -c $CONFIG
echo "NOVOPlasty completed"
