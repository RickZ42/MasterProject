#!/bin/bash

#PBS -N Nanoplot
#PBS -P xf3
#PBS -q normal
#PBS -l walltime=24:00:00
#PBS -l ncpus=24
#PBS -l mem=96GB
#PBS -l jobfs=400GB
#PBS -l storage=scratch/xf3+gdata/xf3+gdata/xe2

set -xue
source /g/data/xf3/miniconda/etc/profile.d/conda.sh
conda activate /g/data/xf3/miniconda/envs/nanoplot

# Set the path to the input BAM file
INPUT_file=("/g/data/xf3/rick/Output/chopper_output/DoradoSup765simplex.fq_30K.fq.gz")

# Set the output directory for NanoPlot results
OUTPUT_DIR="/scratch/xf3/zz3507/result/nanoplot"



# Create the output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Run NanoPlot
for file in "${INPUT_file[@]}"
do
    NanoPlot -t 24 \
         --fastq "$file" \
         -o "$OUTPUT_DIR" \
         --plots dot  \
         --maxlength 50000 \
         --N50 \
         --prefix "${file%.*}"

done