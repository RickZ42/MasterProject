#!/bin/bash
#PBS -N extractDuplex
#PBS -P xf3
#PBS -q normal
#PBS -l walltime=24:00:00
#PBS -l ncpus=24
#PBS -l mem=96GB
#PBS -l jobfs=400GB
#PBS -l storage=scratch/xf3+gdata/xf3+gdata/xe2+scratch/xf3
#PBS -M u7457512@anu.edu.au


# Activate the conda environment

set -xue
source /g/data/xf3/miniconda/etc/profile.d/conda.sh
conda activate /g/data/xf3/miniconda/envs/Samtools

# Input files directory

INPUT_DIR="/g/data/xf3/zz3507/Output"


# Output files directory

OUTPUT_DIR="/g/data/xf3/zz3507/Output/ExtractedONT/duplex"



# Define an array of your BAM files

BAM_FILES=("DoradoSup278DuplexMar28.bam"

           "DoradoSup765DuplexMar28.bam")



# Create the output directory if it doesn't exist

mkdir -p "${OUTPUT_DIR}"



# Loop

for BAM_FILE in "${BAM_FILES[@]}"

do

   # output file name

   OUTPUT_FILE="${OUTPUT_DIR}/${BAM_FILE%.bam}_dx:1_only.bam"

   # Execute samtools command

   samtools view -d dx:1 -o "${OUTPUT_FILE}" "${INPUT_DIR}/${BAM_FILE}"

done