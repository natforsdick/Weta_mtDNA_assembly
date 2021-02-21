#!/bin/bash -e 
#SBATCH -A ga03048
#SBATCH -J trimmomatic
#SBATCH -c 8
#SBATCH --mem=12G
#SBATCH --partition=large 
#SBATCH --array=3
#SBATCH --time=03:00:00 #Walltime (HH:MM:SS) 
#SBATCH --output=%x.%j.out
#SBATCH --output=%x.%j.err
#SBATCH --mail-user=forsdickn@landcareresearch.co.nz
#SBATCH --mail-type=END,FAIL

#############
# run_trimmomatic.sl
# Nat Forsdick, 2020-01-15
#############

# This script is to run adapter removal of illumina data with Trimmomatic.
# No quality trimming or filtering is included in this process.

#############
# MODULES
module purge
module load Trimmomatic/0.39-Java-1.8.0_144
#############

#############
# PARAMS
INDIR=/nesi/nobackup/ga03048/data/illumina/subsamp/ 

PREFIX=subsamp_H07456-L1_S1_L00


#############

cd $INDIR 

echo "Trimming adapters round ${SLURM_ARRAY_TASK_ID}" 


trimmomatic PE -threads 8 ${PREFIX}${SLURM_ARRAY_TASK_ID}_R1_001.fastq ${PREFIX}${SLURM_ARRAY_TASK_ID}_R2_001.fastq -baseout ${PREFIX}${SLURM_ARRAY_TASK_ID}_adaptrim.fq.gz ILLUMINACLIP:/nesi/project/ga03048/weta/mtdna/weta_illumina_adapters.fa:2:30:10 MINLEN:50 
echo "trimming ${SLURM_ARRAY_TASK_ID} complete" 
