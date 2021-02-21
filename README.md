# Weta_mtDNA_assembly
Assembling a wētā mitochondrial genome from raw Illumina short-read paired end data.
First, following initial QC of the raw reads, we use run_array_subsamp.sl to take a random subsample of the raw data, as the complete data set is very large, and unnecessary to use in its entirety.
We then use run_trimmomatic.sl to perform quality trimming and adapter removal of the subsampled data.
We then pass the processed data to NOVOPlasty for mitogenome assembly. I originally performed this assembly as two batches, using a different reference seed for each. Here I just show the scripts used for a subsequent assembly using the assembled mitogenome as the reference seed.
We then map a subsample of the processed subsample to the assembled mitogenome to check for errors. This is done using the SLURM wrapper run_fastq_pipeline_loop_mtmodern.sl to run fastq_pipeline_loop_modern_WGS.2.5.sh, which requires make_coverage_plots2.0.R. 
