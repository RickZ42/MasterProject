#!/bin/bash

#PBS -N dorado_basecalling_job
#PBS -P xf3
#PBS -q gpuvolta
#PBS -l walltime=48:00:00
#PBS -l ngpus=2
#PBS -l ncpus=24
#PBS -l mem=96GB
#PBS -l jobfs=400GB
#PBS -l storage=scratch/xf3+gdata/xf3+gdata/xe2

set -xue

# Set up the path
DORADO_PATH="/g/data/xf3/rick/envs/dorado-0.5.3-linux-x64/bin/dorado"

# Set the input directories
INPUT_DIRS=(
    "/g/data/xe2/datasets/uploads_public/ctrap_ont_pod5/20231017_1600_1C_PAQ11765_257f28d4/pod5_pass/"
    "/g/data/xe2/datasets/uploads_public/ctrap_ont_pod5/20231023_1117_1G_PAQ11765_bed6eab9/pod5_pass/"
)

# Set the output file
OUTPUT_FILE="/g/data/xf3/rick/Output/DoradoSup765.bam"


# Iterate over each path
for DIRS in "${INPUT_DIRS[@]}"; do

"${DORADO_PATH}" basecaller /g/data/xf3/rick/script/dna_r10.4.1_e8.2_400bps_sup@v4.3.0 "${DIRS}" >> "${OUTPUT_FILE}"

done
# Keep the job running indefinitely (optional)
sleep infinity