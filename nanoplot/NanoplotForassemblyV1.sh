#!/bin/bash

#PBS -N NanoplotForassemblyV1
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
INPUT_file=("/g/data/xf3/zz3507/Output/assembly30KOntHifiHicV1/AssembleResultV1fasta/Ctrap_HiFI_HiC_ONT30KB.hic.hap1.p_ctg.fasta" "/g/data/xf3/zz3507/Output/assembly30KOntHifiHicV1/AssembleResultV1fasta/Ctrap_HiFI_HiC_ONT30KB.hic.hap2.p_ctg.fasta")

# the output directory for NanoPlot results will be in the same path with input

# Run NanoPlot
for file in "${INPUT_file[@]}"
do
    NanoPlot -t 24 \
         --fasta "$file" \
         --color yellow \
         --N50 \
         --prefix "${file%.*}" \
         -o /g/data/xf3/zz3507/Output/assembly30KOntHifiHicV1/AssembleResultV1fasta/NanoplotResultAssV1Apr2

done