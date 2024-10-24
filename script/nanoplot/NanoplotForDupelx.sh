#!/bin/bash

#PBS -N NanoplotForDuplex
#PBS -P xf3
#PBS -q normal
#PBS -l walltime=24:00:00
#PBS -l ncpus=1
#PBS -l mem=96GB
#PBS -l jobfs=400GB
#PBS -l storage=scratch/xf3+gdata/xf3+gdata/xe2

set -xue
source /g/data/xf3/miniconda/etc/profile.d/conda.sh
conda activate /g/data/xf3/miniconda/envs/nanoplot

# Set the path to the input BAM file
INPUT_file=("/g/data/xf3/zz3507/Output/fastqduplex/DoradoSup278Duplex_dx:1_only.fq.gz" "/g/data/xf3/zz3507/Output/fastqduplex/DoradoSup765Duplex_dx:1_only.fq.gz")

# the output directory for NanoPlot results will be in the same path with input

# Run NanoPlot
for file in "${INPUT_file[@]}"
do
    NanoPlot -t1 \
         --fastq "$file" \
         --color yellow \
         --N50 \
         --prefix "${file%.*}" \
         -o /g/data/xf3/zz3507/Output/fastqduplex

done