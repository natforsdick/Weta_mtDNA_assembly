# Wētā mitochondrial genome assembly

## Aim 
To assemble a wētā mitochondrial genome from raw Illumina short-read paired end data.

## Process

1. Perform quality assessment of raw short-read data with FastQC.  
2. Use [01_run_array_subsamp.sl](https://github.com/natforsdick/Weta_mtDNA_assembly/blob/main/01_run_array_subsamp.sl) to take a random subsample of the raw data, as the complete data set is very large, and unnecessary to use in its entirety.
3. Use [02_run_trimmomatic.sl](https://github.com/natforsdick/Weta_mtDNA_assembly/blob/main/02_run_trimmomatic.sl) to perform quality trimming and adapter removal of the subsampled data.
4. Pass the processed data to NOVOPlasty for mitogenome assembly with [03c_run_novoplasty.sl](https://github.com/natforsdick/Weta_mtDNA_assembly/blob/main/03c_run_NOVOplasty.sl). I originally performed this assembly in two batches, using a different reference seed for each. Here I just show the scripts used for a subsequent assembly using the assembled mitogenome as the reference seed.
5. Map the processed subsample to the assembled mitogenome to check for errors with [04b_run_fastq_pipeline_loop_mtmodern.sl](https://github.com/natforsdick/Weta_mtDNA_assembly/blob/main/04b_run_fastq_pipeline_loop_mtmodern.sl), a SLURM wrapper for [04a_fastq_pipeline_loop_modern_WGS.2.5.sh](https://github.com/natforsdick/Weta_mtDNA_assembly/blob/main/04a_fastq_pipeline_loop_modern_WGS.2.5.sh). This requires [05_make_coverage_plots2.0.R](https://github.com/natforsdick/Weta_mtDNA_assembly/blob/main/05_make_coverage_plots2.0.R). This part of the pipeline is based on that produced by Sophie Cameron-Christie and Edana Lord for use in the Matisoo-Smith lab at the University of Otago. 
6. Continue assessment of quality and completeness with the online tools [MITOS2](http://mitos2.bioinf.uni-leipzig.de/index.py) and [tRNAscan-SE](http://lowelab.ucsc.edu/tRNAscan-SE/).
