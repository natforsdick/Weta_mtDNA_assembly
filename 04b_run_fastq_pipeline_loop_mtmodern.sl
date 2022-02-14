#!/bin/bash -e
#SBATCH --account=ga03048
#SBATCH --job-name=mitomap # job name (shows up in the queue)
#SBATCH --cpus-per-task=2
#SBATCH --mem=4G
#SBATCH --partition=large
#SBATCH --time=12:00:00 #Walltime (HH:MM:SS)
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=forsdickn@landcareresearch.co.nz
#SBATCH --output %x.%j.out # CHANGE number for new run
#SBATCH --error %x.%j.err #  CHANGE number for new run

# SLURM for running mapping pipeline for modern targetted mitogenome reads to new mitogenome

module purge
#module load SAMtools/1.9-GCC-7.4.0 
#module load picard/2.1.0 
#module load BWA/0.7.17-GCC-7.4.0
#module load R/3.5.0-gimkl-2017a


module load SAMtools picard BWA R

echo "check versions"
which samtools
which picard
which bwa
which R

bash /nesi/project/ga03048/scripts/fwdsophiaspipeline/fastq_pipeline_loop_modern_WGS.2.5.sh

