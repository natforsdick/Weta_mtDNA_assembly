#!/bin/bash -e
#SBATCH -A ga03048
#SBATCH -J subsampling
#SBATCH --time=02:00:00
#SBATCH -c 2
#SBATCH --mem=200M
#SBATCH --array 1-10
#SBATCH -o %x.%a.%j.out
#SBATCH -e %x.%a.%j.err
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=forsdickn@landcareresearch.co.nz

#################
# Seqtk subsampling
# Nat Forsdick, 2020-01-15
#################

#################
# MODULES
module purge
module load seqtk/1.3-gimkl-2018b
#################

#################
# PARAMS
INDIR=/nesi/nobackup/ga03048/data/illumina/
OUTDIR=/nesi/nobackup/ga03048/data/illumina/subsamp/
#################

cd $INDIR
file=$(ls *.fastq.gz | sed -n ${SLURM_ARRAY_TASK_ID}p)
echo "subsampling ${file}"
seqtk sample -s1234 ${file} 0.2 > ${OUTDIR}/subsamp_${file}

