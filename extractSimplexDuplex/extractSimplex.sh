#!/bin/bash
#PBS -N extractSimplex
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
conda activate /g/data/xf3/miniconda/envs/samtools



# Input files directory

INPUT_DIR="/g/data/xf3/zz3507/Output"



# Output files directory

OUTPUT_DIR="/g/data/xf3/zz3507/Output/ExtractedONT/simplex"


# Define an array of BAM files

BAM_FILES=("DoradoSup278Duplex.bam"

           "DoradoSup765Duplex.bam")


# Create the output directory if it doesn't exist

mkdir -p "${OUTPUT_DIR}"



# Loop through the BAM files and apply the samtools command

for BAM_FILE in "${BAM_FILES[@]}"

do



   # Construct the output file names

   OUTPUT_FILE_DX0="${OUTPUT_DIR}/${BAM_FILE%.bam}_dx0.bam"

   OUTPUT_FILE_DX_MINUS1="${OUTPUT_DIR}/${BAM_FILE%.bam}_dx-1.bam"

   COMBINED_OUTPUT_FILE="${OUTPUT_DIR}/${BAM_FILE%.bam}_simplex.bam"



   # for dx:i:0

   samtools view -d "dx:0" -o "${OUTPUT_FILE_DX0}" "${INPUT_DIR}/${BAM_FILE}"

   #  for dx:i:-1

   samtools view -d "dx:-1" -o "${OUTPUT_FILE_DX_MINUS1}" "${INPUT_DIR}/${BAM_FILE}"

   # Combine the results

   samtools merge "${COMBINED_OUTPUT_FILE}" "${OUTPUT_FILE_DX0}" "${OUTPUT_FILE_DX_MINUS1}"





done