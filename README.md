# Weta_mtDNA_assembly

## Aim 
To assemble a wētā mitochondrial genome from raw Illumina short-read paired end data.

## Process

1. Perform raw data QC with FASTQC.  
2. Use [run_array_subsamp.sl](https://github.com/natforsdick/Weta_mtDNA_assembly/blob/main/run_array_subsamp.sl) to take a random subsample of the raw data, as the complete data set is very large, and unnecessary to use in its entirety.
3. Use [run_trimmomatic.sl](https://github.com/natforsdick/Weta_mtDNA_assembly/blob/main/run_trimmomatic.sl) to perform quality trimming and adapter removal of the subsampled data.
4. Pass the processed data to NOVOPlasty for mitogenome assembly with [run_novoplasty.sl](https://github.com/natforsdick/Weta_mtDNA_assembly/blob/main/run_NOVOplasty.sl). I originally performed this assembly in two batches, using a different reference seed for each. Here I just show the scripts used for a subsequent assembly using the assembled mitogenome as the reference seed.
5. Map the processed subsample to the assembled mitogenome to check for errors with [run_fastq_pipeline_loop_mtmodern.sl](https://github.com/natforsdick/Weta_mtDNA_assembly/blob/main/run_fastq_pipeline_loop_mtmodern.sl), a SLURM wrapper for [fastq_pipeline_loop_modern_WGS.2.5.sh](https://github.com/natforsdick/Weta_mtDNA_assembly/blob/main/fastq_pipeline_loop_modern_WGS.2.5.sh). This requires [make_coverage_plots2.0.R](https://github.com/natforsdick/Weta_mtDNA_assembly/blob/main/make_coverage_plots2.0.R). 
6. Continue assessment of quality and completeness with the online tool http://lowelab.ucsc.edu/tRNAscan-SE/.
