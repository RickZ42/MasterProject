#!/bin/bash

#PBS -N sortbam
#PBS -P xf3
#PBS -q express
#PBS -l walltime=04:00:00
#PBS -l ncpus=24
#PBS -l mem=96GB
#PBS -l jobfs=400GB
#PBS -l storage=scratch/xf3+gdata/xf3+gdata/xe2

set -xue
source /g/data/xf3/miniconda/etc/profile.d/conda.sh
conda activate /g/data/xf3/miniconda/envs/samtools

bam_dir="/g/data/xf3/rick/Output/"

# Set the path to the input BAM file
bam_files=("DoradoSup278simplex.bam"

           "DoradoSup765simplex.bam"
)

# Set the output directory for NanoPlot results
OUTPUT_DIR="/g/data/xf3/rick/Output"

for bam_file in "${bam_files[@]}"

do

   # construct the fastq file name

   sortedbam="${OUTPUT_DIR}/$(basename "${bam_file}" .bam)_sorted.bam"



   # convert bam to fastq

   samtools sort "${bam_dir}/${bam_file}" -o "${sortedbam}"



done
